public class customWeather {
    public String city {get;set;}
    public String temp {get;set;}
    public String pressure {get;set;}
    public String humidity {get;set;}
    public String temp_min {get;set;}
    public String temp_max {get;set;}
    public Date Date1 {set;get;}
    public boolean flag {set;get;}
    public date datee{set;get;}
   // public customweather() {
        //flag=false;
        //Account account = (Account)stdController.getRecord();
        
    //}
    
    
public void go()
{
   flag=true;
        
        String apiKey = '2bd602c482b7e463c67b18af6f1ac4d6';
        
        //String requestEndpoint='callout:weatherNamed';
        String requestEndpoint='https://api.openweathermap.org/data/2.5/weather';
        requestEndpoint += '?q=' +city;
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
            } 
            else
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error retrieving the weather information.');
                ApexPages.addMessage(myMsg);
            }
        }
        
    }