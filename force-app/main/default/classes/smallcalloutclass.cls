public class smallcalloutclass
{
    public String city {get;set;}
    public String temp {get;set;}
    public String pressure {get;set;}
    public String humidity {get;set;}
    public String temp_min {get;set;}
    public String temp_max {get;set;}
    
    public static HttpResponse getInfoFromJsonTestService()
    {
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.openweathermap.org/data/2.5/weather');
        request.setMethod('GET');
                Http http = new Http();

        // request.setHeader('apiKey', value)
        HttpResponse response = http.send(request);
        
        return response;
 
    }
}