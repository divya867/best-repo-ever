public class DataLoadTestingClass {
public PageReference doInsert() {
        Weather_Station__c objdlt = new Weather_Station__c();
        
        objdlt.city__c=cityVal;
        objdlt.country__c=countryVal;
        
        insert objdlt;
       
        pagereference ref = new pagereference('/apex/dataloadvfp2');
        ref.setredirect(true);
        return ref;
    }



    public String phoneVal { get; set; }

    public String countryVal { get; set; }

    public String cityVal { get; set; }

    public String nameVal { get; set; }
   
}