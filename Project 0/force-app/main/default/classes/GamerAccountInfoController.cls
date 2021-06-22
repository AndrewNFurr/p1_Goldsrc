public class GamerAccountInfoController {

    public Game_Account__c account {get; set;} //create Game_account__c
       
    public GamerAccountInfoController()
    {
        //setting acct equal to the current user
        account = [SELECT Id, Name, About_ME__c, Address_1__c, Date_Of_Birth__c FROM Game_Account__c WHERE CreatedById =: UserInfo.getUserId() Limit:1];
    
    }
	
	//update the account with fields of visualforce page    
    public void save() {
        try {
            update account;
        } catch(dmlexception ex) {
            system.debug(ex);
        }
    }
}