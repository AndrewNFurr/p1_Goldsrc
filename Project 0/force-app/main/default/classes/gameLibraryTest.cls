@isTest
public class gameLibraryTest {
	@testSetup
    public static void getRec(){
        //create Game Account
        Game_Account__c acc = new Game_Account__c (Name = 'myTest', Account_Password__c ='123456', Account_Type__c ='Gamer', 
                                                   Date_Of_Birth__c =Date.newInstance(1990, 04, 04), Email__c='testemail@test.com');
        //Game_Account__c acc2 = new Game_Account__c (Name = 'myTest1', Account_Password__c ='123456', Account_Type__c ='Gamer', 
                                                   //Date_Of_Birth__c =Date.newInstance(1990, 04, 04), Email__c='testemai1l@test.com');
        insert acc;
        
        
        
        
        //insert acc2;
        //get the acc Id
        Game_Account__c myAcc = [SELECT Name FROM Game_Account__c WHERE Name='myTest'];
        
        Game_Payment__c pay = new Game_Payment__c(Name='AAA', Card_Holder__c=myAcc.Id, Card_Holder_Name__c='agfasdas', Card_Number__c='1234-4569-7894-4654', 
                                                  Card_Security_Code__c='123', Card_Type__c='Credit Card', Card__c='Visa',Expiration_Month__c='05', Expiration_Year__c='2022');
        insert pay;
        
        //Game_Account__c myAcc2 = [SELECT Name FROM Game_Account__c WHERE Name='myTest1'];
        //add game
        //
        List<Game__c> tempGameList = new List<Game__c>();
        for(Integer i=0; i<10; i++){
            Game__c game = new Game__c(Name = 'Test Game'+i, Game_Description__c ='DKASJDNAKSJD', Developer__c='Dev '+i, Genre__c='Survival',
                                      Publisher__c='Publisher '+i, Release_Date__c =System.today(), ESRB_Rating__c='T (Teen)', Game_Approval__c='Accepted', Price__c=100+i);
            tempGameList.add(game);
        }
        insert tempGameList;
        Game_Payment__c payment = [SELECT Id FROM Game_Payment__c LIMIT 1];
        List<Game__c> gameList = [SELECT Name, Genre__c FROM Game__c];
        //add to game library
        List<My_Games__c> myGames = new List<My_Games__c>();
        List<Game_Orders__c> gameOr = new List<Game_Orders__c>();
        for(Integer i =0; i<gameList.size(); i++){
            My_Games__c temp = new My_Games__c(Name = gameList[i].Name, Game__c=gameList[i].Id, Game_Genre__c = gameList[i].Genre__c,
                                               Game_Title__c=gameList[i].Name, Game_Account__c = myAcc.Id);
            myGames.add(temp);
            
        }
        Game__c myG = [SELECT Name, Genre__c FROM Game__c WHERE Name='Test Game1'];
   		My_Games__c temp11 = new My_Games__c(Name = 'Test Game1', Game__c=myG.Id, Game_Genre__c = myG.Genre__c, Game_Title__c='asdasd', Game_Account__c = myAcc.Id);
        myGames.add(temp11);
        insert myGames;
        Game_Orders__c temp1 = new Game_Orders__c(Game_Account__c = myAcc.Id, Game_Payment__c = payment.Id, Game__c=myG.Id);
        insert temp1;
        
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
    
    @isTest
    public static void testMostPopular(){
       Test.startTest();
       	List<Game__c> myGames = gameLibraryController.getMostPopularGame();
        List<My_Games__c> check = [SELECT Name FROM My_Games__c];
        Test.stopTest();
        System.assertEquals('Test Game1', myGames[0].Name);
    }
    
    @isTest
    public static void testBuyGame(){
        Test.startTest();
        Game__c game = new Game__c(Name = 'Test Game 00', Game_Description__c ='DKASJDNAKSJD', Developer__c='Dev ',
                                   Genre__c='Survival', Publisher__c='Publisher ', Release_Date__c =System.today(), ESRB_Rating__c='T (Teen)', Game_Approval__c='Accepted', Price__c=100);
        insert game;
        Game__c myGame = [SELECT Name, Genre__c FROM Game__c WHERE Name='Test Game 00'];
        System.debug(myGame);
        Boolean check = gameLibraryController.buyPopularGame(myGame);
        
        System.assertNotEquals(true, check);
        Boolean fcheck = gameLibraryController.buyPopularGame(myGame);
        System.assertEquals(true, fcheck);
        Test.stopTest();
    }
}