public with sharing class WishlistController {
    @AuraEnabled
    //Searching Wishlist for a name match
    public static List<Game__c> getWishlist(String name){
        List<Id> il = new List<Id>();
        List<Game__c> game = new List<Game__c>();
        try{
            //Searching for the wishlist entries
            List<Wishlist__c> wish = [SELECT Id, Name, Game_Account__r.Name, Game__c FROM Wishlist__c WHERE Game_Account__r.Name=:name];
            //Adding them all into an empty list based off IDs
            for(Wishlist__c w:wish){
                il.add(w.Game__c);
            }
            //Searching for the games based on the Ids in the above list
            game = [SELECT Id, Name, Genre__c, Publisher__c, Release_Date__c, Price__c FROM Game__c WHERE Id=:il];
            List<Wishlist__c> returnList = new List<Wishlist__c>();
            system.debug(game);
            return game;
            
        }catch (Exception e) {
            //If no match, display this message
            System.debug('There are no games under your wishlist');
            Return null;
        	}
    }

}