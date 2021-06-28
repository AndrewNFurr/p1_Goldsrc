public class createMyGame {
    public static void create(){
        List<Game__c> gameList = [SELECT Name, Genre__c FROM Game__c];
        Game_Account__c acc = [SELECT Name FROM Game_Account__c LIMIT 1];
        List<My_Games__c> myGames = new List<My_Games__c>();
        for(Integer i =1; i<3; i++){
            My_Games__c temp = new My_Games__c(Name = gameList[i-1].Name, Game__c=gameList[i-1].Id, Game_Genre__c = gameList[i-1].Genre__c,
                                               Game_Title__c=gameList[i-1].Name, Game_Account__c = acc.Id);
            myGames.add(temp);
        }
        insert myGames;
    }

}