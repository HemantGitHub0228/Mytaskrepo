public class accounthandlercreatetask {
    public static void taskcreate(list<Account> accnewlist){
    
        List<Task> taskInsert = new List<Task>();

    	for (Account acc : accnewlist) {
       
        if (!acc.Active1__c) {   // Check if the Account is added as Inactive (Active checkbox is unchecked).
            
            Task newTask = new Task();  // Create a Task record.
            newTask.Subject = 'Review Account - ' + acc.AccountNumber;
            newTask.ActivityDate = System.today().addDays(7); // Due Date is one week from now.
            newTask.OwnerId = acc.OwnerId;                 // Assign the task to the Account owner.
            newTask.Status = 'Not Started';
            newTask.WhatId = acc.Id;               // Associate the Task with the new Account.

            taskInsert.add(newTask);
        }
    }

    // Insert the Task records.
    if (!taskInsert.isEmpty()) {
        insert taskInsert;
   	 }
	}
}