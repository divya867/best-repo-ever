@istest
global class Makemockhttpresponse implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request)
    {
        System.assertEquals('https://api.openweathermap.org/data/2.5/weather',request.getEndpoint());
        System.assertEquals('GET', request.getmethod());
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('"main",{id:"id"}');
        response.setStatusCode(200);
        String expectedresult = 'response';
        System.assertEquals(expectedresult,request.getEndpoint());
        return response;
    }

}