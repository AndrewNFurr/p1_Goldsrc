({
	doInit : function(component, event, helper) {
		let action = component.get("c.getGames");
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.games", response.getReturnValue());
            } else {
                console.log("Issue retrieving the Games");
            }
        });
        $A.enqueueAction(action);
	}
})