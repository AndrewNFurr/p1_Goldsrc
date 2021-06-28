public class addGameReview 
{
    @InvocableMethod(label='Add Game Review') //making action in flow
    public static void addReview(list<Game_Reviews__c> a) //only one input? x.x
    {
        Game_Reviews__c r = new Game_Reviews__c(Name = a[0].name , 
                                                Review__c = a[0].Review__c,
                                                User_Star_Rating__c = a[0].User_Star_Rating__c,
                                                My_Game__c = a[0].My_Game__c,
                                                Reviewer__c=a[0].Reviewer__c); //creating new game review
        insert r;
    }
    

}