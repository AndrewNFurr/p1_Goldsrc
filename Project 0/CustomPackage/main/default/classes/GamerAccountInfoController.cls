public class GamerAccountInfoController {

    public List<Game_Account__c> account {get; set;} //create Game_account__c
       
    public GamerAccountInfoController()
    {
        //setting acct equal to the current user
        account = [SELECT Id, Name, First_Name__c, Last_Name__c, Email__c,About_ME__c, Address_1__c, Address_2__c, Date_Of_Birth__c, City__c, State__c, Country__c
                   FROM Game_Account__c 
                   WHERE CreatedById =: UserInfo.getUserId() ];
    
    }
}