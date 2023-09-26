@isTest
public class CreateTaskOnAccountInsertTest {

    // Test method to cover the trigger logic when an Account is inserted as Inactive.
    @isTest
    static void testTaskCreationOnAccountInsert() {
        // Create a test user with appropriate profile and permissions.
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User testUser = new User(
            ProfileId = p.Id,
            FirstName = 'Test1',
            LastName = 'User1',
            Email = 'testuser@example.com',
            Username = 'testuser0228@example.com',
            Alias = 'tuser',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;
        
		test.startTest();
        // Create a test Account with the "Active" checkbox unchecked.
        Account testAccount = new Account(
            Name = 'Test Account',
            Active1__c = false, 
            OwnerId = testUser.Id 
        );
        insert testAccount;
        test.stopTest();
        
        // Query the inserted Task to verify if it was created.
        Task[] createdTasks = [SELECT Id FROM Task WHERE WhatId = :testAccount.Id];
        System.assertEquals(1, createdTasks.size(), 'A Task should have been created.');
    }
}