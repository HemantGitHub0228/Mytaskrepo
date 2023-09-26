trigger CreateTaskOnAccountInsert on Account (after insert) {
    if(trigger.isInsert && trigger.isafter){
        accounthandlercreatetask.taskcreate(trigger.new);
    
    }
}