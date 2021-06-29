global with sharing class gameIdRetriever {
    public static String userInput {get; set;} //string to hold user input
    
    @auraEnabled
    public static list<Game__c> getGameMatch(String userInput){
       //check if user can view games based on ESRB, if not, throw exception message.
        if(!Schema.SObjectType.Game__c.fields.ESRB_Rating__c.isAccessible()){
            throw new AuraHandledException('You can\'t view these games! :( ');
        }
        
	//retrieve game fields
    list<Game__c> games = [SELECT Name, Genre__c, ESRB_Rating__c, Game_Description__c, Developer__c, Publisher__c, Release_Date__c, 
                        Price__c FROM Game__c WHERE Name=:userInput];
     //system.debug(games);
     return games;
  }
    
      
  @auraEnabled
    public static list<Game__c> showAllGames(){
 
     //retrieve genre fields
    list<Game__c> browseGames = [SELECT Name, Genre__c, ESRB_Rating__c, Game_Description__c, Price__c FROM Game__c];
        //system.debug(browseGames);
		return browseGames;
  } 
}