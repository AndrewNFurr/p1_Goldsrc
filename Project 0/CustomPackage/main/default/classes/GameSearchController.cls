public class GameSearchController {
    public List<Game__c> gameList {get; set;}
    public String searchQuery {get; set;}

    public void searchGames() {
        this.gameList = [SELECT Name, Genre__c, ESRB_Rating__c, Game_Description__c, Developer__c, Publisher__c, Release_Date__c, 
                        Price__c FROM Game__c WHERE Name =: this.searchQuery];
    }
}