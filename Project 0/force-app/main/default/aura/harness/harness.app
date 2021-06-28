<aura:application extends="force:slds">
    <!--aura:attribute name="testData" type="Game__c" default="{'Name':'test', 'Developer__c': 'Test Dev', 'Publisher__c':'Test Pub', 'Genre__c':'Survival'}" />
    <c:gameItem game= "{!v.testData}" /-->
    <c:gameLibrary />
    <c:gameStore />
</aura:application>