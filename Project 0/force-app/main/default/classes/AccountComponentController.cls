public class AccountComponentController {
    public class MyException extends Exception {}

	@auraEnabled
    public static Game_Account__c getAccountIds () {
        Game_Account__C account = [SELECT Id, Name, First_Name__c, Last_Name__c, Email__c,About_ME__c, Address_1__c, Address_2__c, Date_Of_Birth__c, City__c, State__c, Country__c
                   				   FROM Game_Account__c 
                   				   WHERE CreatedById =: UserInfo.getUserId() 
                                   Limit:1];
        return account;
    }
    
    @auraEnabled
    public static void setNewPassword(string oldpw, string newpw) {
        Game_Account__C account = [Select Id, Account_Password__c 
                     			   FROM Game_Account__c 
                     			   WHERE CreatedById =: UserInfo.getUserId() 
                     			   Limit:1];
        String pw = account.Account_Password__c;
        if (oldpw == pw) {
            account.Account_Password__c = newPW;
            update account;
        } else {
            throw new MyException('Old Password Didnt Match.');
        }
    }

}