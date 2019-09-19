public class searchrecords 
{
    public list<Account> acc  {set;get;}
    public id recordid        {set;get;}
    public string city        {set;get;}
    public string country     {set;get;}
    public date todate        {set;get;}
    public date fromdate      {set;get;}
    public account ac         {set;get;}
    public searchrecords(){
        acc=new list<Account>();
        ac=new Account();
    }
    
    Public pageReference showList(){
        if(city=='' && country=='')
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter proper values'));
            acc.clear();
        }else
        {
            system.debug(todate);
            system.debug(fromdate);
            system.debug(city);
            system.debug(country);
            if(city!=null&&country!=null&& todate!=null&& fromdate!=null){
                acc = [select Id,Name,city__c,Date__c,Country__c from Account where city__c=:city and Country__c=:country
                       and date__c<=:todate and date__c>=:fromdate];
                
            }
        }
        
        return null;
    }
    
    public pagereference searchRecords()
    {
        pagereference p = new pagereference('/'+recordid);
        return p;
    }
    public void clearRecords(){
        acc.clear();
    }
}