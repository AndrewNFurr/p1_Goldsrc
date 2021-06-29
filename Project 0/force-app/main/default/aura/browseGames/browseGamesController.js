({
	showAllGame : function(component, event, helper) {
		let gameBrowse = component.get("c.showAllGames");
        console.log(gameBrowse);
        gameBrowse.setCallback(this, function(response){
            //console.log(response.getState());
                 if(response.getState() === "SUCCESS"){
                
                component.set("v.browse", response.getReturnValue());
                 //console.log(response.getReturnValue());  
        } 
        });
    $A.enqueueAction(gameBrowse);
    }
})