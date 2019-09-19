@istest
public class samplecalloutclasstest {
@isTest static void testcallout()
{
    test.setMock(HttpCalloutMock.class,new Makemockhttpresponse());
    HttpResponse response = smallcalloutclass.getInfoFromJsonTestService();
    
    
    }
}