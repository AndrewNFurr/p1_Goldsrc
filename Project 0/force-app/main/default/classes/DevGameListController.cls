public class DevGameListController {
	@AuraEnabled
    public static List<Game__c> getGames() {
        List<Game__c> gameList = [
            SELECT Id, Name, Genre__c, Developer__c, Price__c, CreatedById, ESRB_Rating__c, Game_User_Rating__c, Publisher__c
            FROM Game__c
            WHERE CreatedById =: UserInfo.getUserId()
        ];
        system.debug(gameList);
        return gameList;
    }
    
    @AuraEnabled
    public static Game__c getSingleGame(String gameName) {
        Game__c game = [
            SELECT Id, Name, Genre__c, Developer__c, Price__c, CreatedById, ESRB_Rating__c, Game_User_Rating__c, Publisher__c
            FROM Game__c
            WHERE Name =:gameName
        ];
        system.debug(game);
        return game;
    }
}