({
	doInit : function(component, event, helper) {
        
		let myGames = component.get("c.getMostPopularGame");
        
        myGames.setCallback(this,function(response){
            if(response.getState() == "SUCCESS"){
                component.set("v.myGames", response.getReturnValue());
            }
            else{
                console.log("ERRRR");
            }
        });
        
        $A.enqueueAction(myGames);
	}
    
})