@isTest(SeeAllData=true)
public class GamerAccountInfoControllerTest {
    //Making sure that the get method retrieves the correct account.
    @isTest 
    public static void test() {
        Test.startTest();
        GamerAccountInfoController gc = new GamerAccountInfoController();
        Game_Account__c ga = [SELECT id FROM Game_Account__c WHERE CreatedById =: UserInfo.getUserId() limit:1];
        Test.stopTest();
        system.assertEquals(ga.id, gc.account.id);
    }
    
    //Making sure that the control can update the account info
    @isTest
    public static void saveTest() {
        Test.startTest();
        GamerAccountInfoController gc = new GamerAccountInfoController();
        gc.account.Name = 'Test';
        gc.save();
        Game_Account__c ga = [SELECT id, Name FROM Game_Account__c WHERE CreatedById =: UserInfo.getUserId() limit:1];
        Test.stopTest();
        system.assertEquals(ga.Name, gc.account.name);
    }
}