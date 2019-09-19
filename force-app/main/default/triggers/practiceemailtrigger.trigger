trigger practiceemailtrigger on Account (before insert,after insert) {
    if(trigger.isinsert && trigger.isafter){
      // practiceemail.mailAlert(trigger.new); 
    }
    

}