public class Accountweathercontroller {
    
    public  list<Account> acc {get;set;}   
    public String city {get;set;}
    public String temp {get;set;}
    public String pressure {get;set;}
    public String humidity {get;set;}
    public String temp_min {get;set;}
    public String temp_max {get;set;}
    public Date Date1 {set;get;}
    public string emailCCAddress{set;get;}
    public string emailBCCAddress{set;get;}
    public list<string> CCAddress{set;get;}
    public list<string> BCCAddress{set;get;}

    public Accountweathercontroller(){
        system.debug('***********SUMA');
    }
    
    public Accountweathercontroller(ApexPages.StandardController stdController) {
        Account weather = (Account)stdController.getRecord();
        weather = [SELECT Id,City__c FROM Account WHERE Id =:weather.Id];
        acc=new list<Account>();
        String accountCity = weather.City__c;
        String apiKey = '2bd602c482b7e463c67b18af6f1ac4d6';
        
       // String requestEndpoint='callout:weatherNamed';
         String requestEndpoint='https://api.openweathermap.org/data/2.5/weather';
        requestEndpoint += '?q=' + accountCity;
        requestEndpoint += '&units=metric';
        requestEndpoint += '&APPID=' + apiKey;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        // request.setHeader('apiKey', value)
        HttpResponse response = http.send(request);
        
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            
            // Deserialize the JSON string into collections of primitive data types.
            Map<string,Object> results = (Map<string, Object>) JSON.deserializeUntyped(response.getBody());
            city = String.valueOf(results.get('name'));
            
            Map<string,Object> mainResults = (Map<string,Object>)(results.get('main'));
            temp = String.valueOf(mainResults.get('temp'));
            pressure = String.valueOf(mainResults.get('pressure'));
            humidity = String.valueOf(mainResults.get('humidity')); 
            temp_min = String.valueOf(mainResults.get('temp_min')); 
            temp_max = String.valueOf(mainResults.get('temp_max'));
            Date1=system.today();
             if(temp_min>='25'){
                system.debug(temp_min);
                list<account> ac=[select id,name,OwnerId from account];
                 list<Messaging.SingleEmailMessage> emails = new list<Messaging.SingleEmailMessage>();
                   
                for(account acc:ac){
                    
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    // List<String> sendTo = new List<String>{'sumakamatham@gmail.com,sumasfdc033@gmail.com'};
                    //  sendTo.add('sumakamatham@gmail.com,sumasfdc033@gmail.com');
                    //   email.setBccAddresses(sendTo);
                    List<string> toadd1 =new List<string>();
                    toadd1.add(userInfo.getUserEmail());
                   
                    
                    email.subject = 'weather Condition';
                    email.WhatId=acc.Id;
                    //   email.getWhatId=acc.Id;
                    email.setToAddresses(toAdd1);
                    
                    //email.setTargetObjectId(acc.id);
                    String bo='Please be aware of drastic changes in weather,<br/><br/>'+'Temparature:'+temp
                        +'<br/><br/>'+'Humidity:'+humidity+'<br/><br/>'+'pressure:'+pressure
                        +'<br/><br/>'+'Minimum Temparature:'+temp_min +'<br/><br/>'+'maximum Temparature:'+temp_max;
                    
                    email.setHtmlBody(bo);
                    email.plainTextBody = 'selling record details';
                    emails.add(email);
                  
                }   
                  Messaging.sendEmail(emails);
            }               
        
        } 
        else
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error retrieving the weather information.');
            ApexPages.addMessage(myMsg);
        }
        
        // system.debug(temp_min);
    } 
       
}