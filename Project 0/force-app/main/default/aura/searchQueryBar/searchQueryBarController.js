({
	searchGames : function(component, event, helper) {
        let userInput = component.get("v.userInput");
        //console.log(userInput);
        let search = component.get("c.getGameMatch");
        search.setParams({"userInput" : userInput});
        search.setCallback(this, function(response){
            //console.log(response.getState());
            if(response.getState() === "SUCCESS"){
                
                component.set("v.search", response.getReturnValue());
                 //console.log(response.getReturnValue());  
            }
        });
        $A.enqueueAction(search);
	}
})