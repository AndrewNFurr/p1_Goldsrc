public class OrderGame 
{
    @InvocableMethod(label='Add Game Review') //making action in flow
    public static void OrderGame(list<Game_Orders__c> Order) //only one input? x.x
    {
        Game_Orders__c g = new Game_Orders__c(Quantity__c = 1 , 
                                                Game__c = Order[0].Game__c,//game
                                                Game_Account__c = Order[0].Game_Account__c,//game account
                                                Game_Payment__c = Order[0].Game_Payment__c,// payment
                                                Order_Date__c = Order[0].Order_Date__c,//order date
                                             	Status__c = 'Pending'); 
     
        insert g;   //inserting new game order
    }

}