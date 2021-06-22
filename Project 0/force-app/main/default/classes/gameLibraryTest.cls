@isTest
public class gameLibraryTest {
	@testSetup
    public static void getRec(){
        //create Game Account
        Game_Account__c acc = new Game_Account__c (Name = 'myTest', Account_Password__c ='123456', Account_Type__c ='Gamer', 
                                                   Date_Of_Birth__c =Date.newInstance(1990, 04, 04), Email__c='testemail@test.com');
        insert acc;
        //get the acc Id
        Game_Account__c myAcc = [SELECT Name FROM Game_Account__c WHERE Name='myTest'];
        
        //add game
        //
        List<Game__c> tempGameList = new List<Game__c>();
        for(Integer i=0; i<10; i++){
            Game__c game = new Game__c(Name = 'Test Game'+i, Game_Description__c ='DKASJDNAKSJD', Developer__c='Dev '+i, Genre__c='Survival',
                                      Publisher__c='Publisher '+i, Release_Date__c =System.today(), ESRB_Rating__c='T (Teen)', Game_Approval__c='Accepted', Price__c=100+i);
            tempGameList.add(game);
        }
        insert tempGameList;
        
        List<Game__c> gameList = [SELECT Name, Genre__c FROM Game__c];
        //add to game library
        List<My_Games__c> myGames = new List<My_Games__c>();
        
        for(Integer i =0; i<gameList.size(); i++){
            My_Games__c temp = new My_Games__c(Name = gameList[i].Name, Game__c=gameList[i].Id, Game_Genre__c = gameList[i].Genre__c,
                                               Game_Title__c=gameList[i].Name, Game_Account__c = myAcc.Id);
            myGames.add(temp);
        }
        insert myGames;
   
    }
    
    @isTest
    public static void mytest(){
        Test.startTest();
        Game_Account__c myAcc = [SELECT Name FROM Game_Account__c WHERE Name='myTest' LIMIT 1];
        //List<My_Games__c> myGames = [SELECT Name FROM My_Games__c WHERE Game_Account__c =: myAcc.Id];
        List<Game__c> myGames = gameLibraryController.getMyGame();
        Test.stopTest();
        System.assertEquals(10, myGames.size());
        
    }
}