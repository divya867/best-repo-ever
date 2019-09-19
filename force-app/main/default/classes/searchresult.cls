public class searchresult
{
    
    public list<Weather_ledger_book__c> ledger {set;get;}
    public string city {set;get;}
    public id recordid {set;get;}
    
    public void serachrecords(){

      ledger=[select id,name,City__c from Weather_ledger_book__c where City__c=:city];
    }
    public pagereference redirectpage(){
      pageReference p =new pageReference('/'+recordid);
        return p;
    }
    }