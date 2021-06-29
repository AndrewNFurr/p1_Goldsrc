@IsTest
public class AuraControllerTests {
	@TestSetup
    public static void testCreate(){
        Game__c g = new Game__c(
            Name='Test',
            Developer__c='Test',
            Publisher__c='Test',
            Genre__c='Sandbox',
            ESRB_Rating__c='E (Everyone)',
            Release_Date__c=system.today(),
            Price__c=10.00
        );
        
        Game_Account__c ga = new Game_Account__c(
            Name='testUser',
            Account_Password__c='test123',
            Password__c='test123',
            Account_Type__c='Gamer',
            Date_of_Birth__c=system.today(),
            Email__c='test@email.com'
        );
        
        insert g;
        insert ga;
        
        Wishlist__c w = new Wishlist__c(
        	Game_Account__c=ga.Id,
            Game__c=g.Id
        );
        insert w;    
    } 
    @IsTest
    public static void testGrabAccount(){
        Test.startTest();
        	Game_Account__c gaccTest = GameAccountAuraController.grabAccount('testUser','test123');
        	Game_Account__c badTest = GameAccountAuraController.grabAccount('dugfvseu','testsdfsf123');
        	
        Test.stopTest();
        system.assertEquals('testUser',gaccTest.Name);
        
    }
    
    @IsTest
    public static void testGetWishlist(){
        
        Test.startTest();
        	List<Game__c> wishTest = WishlistController.getWishlist('testUser');
        	List<Game__c> badTest = WishlistController.getWishlist('duewhfgweiyu');
        Test.stopTest();
        system.assertEquals('Test',wishTest[0].Name);
        
        
    }
    
   
}