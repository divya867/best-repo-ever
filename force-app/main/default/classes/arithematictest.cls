@isTest
public class arithematictest {
    public static testmethod void sampletest1()
    {
        arithematic a = new arithematic();
        System.assertEquals(4, a.add(2, 2));
        System.assertEquals(6, a.mul(2, 3));
        System.assertEquals(2, a.sub(4, 2));
        
        
    }
    
}