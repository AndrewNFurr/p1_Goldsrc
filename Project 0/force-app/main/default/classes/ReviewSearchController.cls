public class ReviewSearchController {
	@AuraEnabled
    public static List<Game_Reviews__c> getReviews(String gameName) {
        List<Game_Reviews__c> reviews = [
            SELECT ID, Name, Game_Name__c, Reviewer__c, User_Star_Rating__c, Review__c, Game__c
            FROM Game_Reviews__c
            WHERE Game_Name__r.Name =:gameName
        ];
        return reviews;
    }
  
}