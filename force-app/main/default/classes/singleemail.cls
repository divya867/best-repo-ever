public class singleemail extends Accountweathercontroller {
   public static list<account> ac;
    
    
    public static void myEmail(list<account> ac){
        String aw = Accountweathercontroller.temp_min;
        for(account aa:ac)
        { 
        // account  ac1 = new account();
        if(aw >= '28'){
            System.debug('asdasd');
            messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
            string[]toAdd=new string[]{'divyamadhu562@gmail.com'};
                string []ccAdd=new string[]{'divya@responseinfoinc.com'};
                    email1.setToAddresses(toAdd);
            email1.setCcAddresses(ccAdd);
            email1.setSubject('Greeting from Janbask Training');
            email1.setPlainTextBody('Janbask Training Career counselling');
            email1.setSenderDisplayName('JanaBask Training');
            messaging.Email[] emails = new messaging.Email[]{email1};
                messaging.sendEmail(emails);  
        }

    }
    
    }
}