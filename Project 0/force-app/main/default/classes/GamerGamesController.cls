public class GamerGamesController 
{
    public Game_Account__c gamer{get; set;}//create Game_account__c named gamer
    public List<My_Games__c> gamerGames {get; set;}//create list of games from My_games__c custom object
    public Game_Reviews__c gameReview {get; set;}
   
    public GamerGamesController()
    {
        //setting gamer equal to the current user
       
        
        gamer = [SELECT Id, Name, CreatedById, OwnerId  FROM Game_Account__c WHERE  OwnerId= :UserInfo.getUserID() LIMIT 1];
         System.debug(gamer);
        //setting gamerGames list to the games owned by gamer
        gamerGames = [SELECT id,Name,Game_Description__c, Developer__c,Publisher__c FROM My_Games__c WHERE Game_Account__c =: gamer.id];
        
        gameReview = new Game_Reviews__c();
    }
    
    public void CreateReview()
    {
        system.debug('in rview');
            try
            {	                
                system.debug('in try');
            	gameReview.Reviewer__c = gamer.id;
                insert gameReview;
            }
     		catch (Exception ex) 
            {
                 system.debug(ex);
	 		}
    }
}