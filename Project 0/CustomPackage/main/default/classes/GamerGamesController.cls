public class GamerGamesController 
{
    public Game_Account__c gamer; //create Game_account__c named gamer
    public List<My_Games__c> gamerGames; //create list of games from My_games__c custom object
    
    public Game_Account__c getGamer(){return gamer;} // getter for gamer
    public List<My_Games__c> getGamerGames(){return gamerGames;} // getter for list of gamer games
    
    public GamerGamesController()
    {
        //setting gamer equal to the current user
        gamer = [SELECT Id, Name, CreatedById  FROM Game_Account__c WHERE  OwnerId= :UserInfo.getUserID() ];
        
        //setting gamerGames list to the games owned by gamer
        gamerGames = [SELECT Name,Game_Description__c, Developer__c,Publisher__c FROM My_Games__c WHERE Game_Account__c =: gamer.id];
        
    }
    



}