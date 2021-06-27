public class AccountComponentController {
	@auraEnabled
    public static Game_Account__c getAccountIds () {
        Game_Account__C account = [SELECT Id, Name, First_Name__c, Last_Name__c, Email__c,About_ME__c, Address_1__c, Address_2__c, Date_Of_Birth__c, City__c, State__c, Country__c
                   				   FROM Game_Account__c 
                   				   WHERE CreatedById =: UserInfo.getUserId() 
                                   Limit:1 ];
        return account;
    }

}