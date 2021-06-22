public with sharing class gameLibraryController {
    @AuraEnabled
    public static List<Game__c> getMyGame(){
        Game_Account__c myUser = [SELECT Id, Name, CreatedById, OwnerId  FROM Game_Account__c WHERE  OwnerId= :UserInfo.getUserID() LIMIT 1];
        List<My_Games__c> gameList = [SELECT Name,Game_Description__c, Developer__c,Publisher__c, Game__c, Game_Title__c FROM My_Games__c WHERE Game_Account__c =: myUser.id];
        
        List<String> gameName = new List<String>();
        for(My_Games__c temp : gameList){
            gameName.add(temp.Game_Title__c);
        }
        
        List<Game__c> myGames = [SELECT Name, Genre__c FROM Game__c WHERE Name =: gameName];
        //List<Game__c> myGames = [SELECT Name, Developer__c FROM Game__c];
        //System.debug(myGames);
        //return myGames;
       return myGames; 
    }

}