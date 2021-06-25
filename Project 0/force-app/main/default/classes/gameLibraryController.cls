public with sharing class gameLibraryController {
    @AuraEnabled
    public static List<Game__c> getMyGame(){
        Game_Account__c myUser = [SELECT Id, Name, CreatedById, OwnerId  FROM Game_Account__c WHERE  OwnerId= :UserInfo.getUserID() LIMIT 1];
        List<My_Games__c> tempGameList = [SELECT Name,Game_Description__c, Developer__c,Publisher__c, Game__c, Game_Title__c FROM My_Games__c WHERE Game_Account__c =: myUser.id];
        List<My_Games__c> gameList =(List<My_Games__c>) Security.stripInaccessible(AccessType.UPSERTABLE, tempGameList).getRecords();
        List<String> gameName = new List<String>();
        for(My_Games__c temp : gameList){
            gameName.add(temp.Game_Title__c);
        }

        if(gameName.size() != 0){
            List<Game__c> myGames = new List<Game__c>();
            myGames = [SELECT Name, Genre__c, Game_Description__c, Developer__c,Publisher__c FROM Game__c WHERE Name =: gameName];
        	return myGames; 
        }
        else{
            return null;
        }
    }
    
    @AuraEnabled
    public static List<Game__c> getMostPopularGame(){
        //get the game record and get their number 
        
        try{
            List<AggregateResult> gameCount = [SELECT Game__r.Name, COUNT(Id) FROM Game_Orders__c GROUP BY Game__r.Name ORDER BY COUNT(Id) DESC LIMIT 20];
            if(gameCount.size() != 0){
                List<String> gameName = new List<String>();
                for(AggregateResult temp: gameCount){
                    gameName.add(String.valueOf(temp.get('Name')));
                }
                List<Game__c> gameList=[SELECT Name, Genre__c, Game_Description__c, Developer__c,Publisher__c,Game_User_Rating__c,
                                        Price__c FROM Game__c WHERE Name=:gameName LIMIT 20];
                //re-order the game list as found in gameCount
                List<Game__c> gameOrder = new List<Game__c>();
                for(String temp:gameName){
                    for(Game__c gameTemp: gameList){
                        if(temp == gameTemp.Name){
                            gameOrder.add(gameTemp);
                        }
                    }
                }
                return gameOrder;
            }
            else{
                return null;
            }
        }
        catch(Exception e){
            System.debug('There is an Error in the MostPolular game function: '+e.getMessage());
            return null;
        }  
    }
    
    @AuraEnabled
    public static Boolean buyPopularGame(Game__c game){
        Game_Account__c myUser = [SELECT Id, Name, CreatedById, OwnerId  FROM Game_Account__c WHERE  OwnerId= :UserInfo.getUserID() LIMIT 1];
        List<My_Games__c> temp = [SELECT Name FROM My_Games__c WHERE Name=:game.Name AND Game_Account__c=:myUser.Id LIMIT 1];
        System.debug(temp);
        if(temp.isEmpty()){
            My_Games__c myGame = new My_Games__c(Name = game.Name, Game__c=game.Id, Game_Genre__c = game.Genre__c,
                                               Game_Title__c=game.Name, Game_Account__c = myUser.Id);
            insert myGame;
            return false;
        }
        else return true;
    }

}