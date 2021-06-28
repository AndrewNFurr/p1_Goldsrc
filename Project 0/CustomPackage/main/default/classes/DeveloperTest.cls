@isTest
public class DeveloperTest {
    
    @testSetup static void setup() {
        
        List<Game__c> testGames = new List<Game__c>();
        for(Integer i=0;i<2;i++) {
            testGames.add(new Game__c(Name = 'TestGame'+i, ESRB_Rating__c='T (Teen)', Genre__c='Fighting', Developer__c='Test',Publisher__c='Test', Price__c=1, Release_Date__c=system.today()));
        }
        insert testGames;  
        
        Game_Reviews__c testReview = new Game_Reviews__c(
        	Name='TestReview',
            User_Star_Rating__c = 1,
            Review__c='Eh',
            Game_Name__c = testGames[0].Id
        );
        system.debug(testReview);
        insert testReview;
    }
	
    @isTest static void testDevGameListController() {
        Test.startTest();
        List<Game__c> testGameList = DevGameListController.getGames();
        Game__c testGame1 = DevGameListController.getSingleGame('TestGame1');
        Test.stopTest();
        System.assertEquals(true, testGameList.size() == 2);
        System.assertEquals('TestGame1', testGame1.Name);
    }
    
    @isTest static void testReviewSearchController() {
        Test.startTest();
        List<Game_Reviews__c> testGameReviews = ReviewSearchController.getReviews('TestGame0');
        system.debug(testGameReviews);
        Test.stopTest();
        System.assertEquals('Eh', testGameReviews[0].Review__c);
    }
}