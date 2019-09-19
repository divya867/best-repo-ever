trigger updatetemp on Account (before insert) {
   if(trigger.isinsert&&trigger.isbefore){
     //singleemail.myEmail(trigger.new);
    Accountweathercontroller aa=new Accountweathercontroller();
      // aa.sendthemail(trigger.new);
    }
}