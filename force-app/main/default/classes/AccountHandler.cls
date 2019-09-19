public class AccountHandler {
	
    public static void insertAccount(Integer numAccts) {
        
        List<Account> addAccounts = new List<Account>();
        
        Integer counter = 1;
        
        while(counter <= numAccts) {
            System.debug('Counter Value before Incrementing ' + counter);
            
            Account a = new Account();
            a.Name = 'Acme Inc ' + counter;
            a.AccountNumber = 'A000' + counter;
            
            addAccounts.add(a);
            System.debug(addAccounts);
            
            counter++;
            System.debug('Counter Value after incrementing ' + counter);
        }
        
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        
        insert(addAccounts);
    }
    
}