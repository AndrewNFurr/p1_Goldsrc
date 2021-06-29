public with sharing class GameAccountAuraController {
	@AuraEnabled 
    //Pulling up an account if there is a matching name and password
    public static Game_Account__c grabAccount(String name, String password){       
        Game_Account__c accountToRetrieve;
        //Checking for username and password match, if not give message that it does not match
        try{
                    accountToRetrieve = [SELECT 
                                        Id, 
                                        Name, 
                                        About_ME__c, 
                                        Account_Password__c, 
                                        Address_1__c, 
                                        Address_2__c, 
                                        City__c, 
                                        Country__c, 
                                        Date_Of_Birth__c, 
                                        Email__c, 
                                        First_Name__c, 
                                        Game_Account_Number__c,
                                        Account_Type__c,
                                        Last_Name__c, 
                                        My_Game__c, 
                                        Phone_Number__c, 
                                        State__c, 
                                        Zip_Code__c 
                                        FROM Game_Account__c WHERE Name=:name AND Password__c=:password];
            
            
            } catch(Exception e) {
                System.debug('Username or Password does not match');
            }
        
        System.debug(accountToRetrieve);
        return accountToRetrieve;
		
    }
    
}