@isTest
public class gameIdRetrieverTest {
		
    @testSetup
    public static void newGame(){
     //create a game, query it, and use the id as the relationship field.
     Game__c newG = new Game__c(
     		Name = 'Saladmander',
         	Game_Description__c = 'A salad salamander.',
         	Developer__c = 'MoneyBag',
         	Publisher__c = 'Zony',
         	Genre__c = 'Multiplayer',
         	ESRB_Rating__c = 'T (Teen)',
         	Release_Date__c = date.parse('06/27/2021'),
         	Price__c = 22.99
         	
     );
        
      insert newG;
        
    }
    
    
    @isTest
    public static void searchGames(){
 
        Test.startTest();
        String userInput = GameIdRetriever.userInput;
        userInput = 'Saladmander';
        list<Game__c> gameMatches = GameIdRetriever.getGameMatch(userInput);
        
        String name = gameMatches[0].Name;
        Test.stopTest();
        
        system.assertEquals('Saladmander', name);
    }
    
    @isTest
    public static void showGames(){
        Test.startTest();
        list<Game__c> showG = GameIdRetriever.showAllGames();
        String games = showG[0].Name;
        Test.stopTest();

        system.assertEquals('Saladmander', games);
    }
}