({
	handleChoice : function(component, event, helper) {
        console.log('in deh');
        let game = event.getParam("gameChoice");
        console.log(game);
		let action = component.get("c.getSingleGame");
        action.setParams({"gameName":game});
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.game", response.getReturnValue());
                component.set("v.display", true);
            } else {
                console.log("Woah man");
            }
        });
        $A.enqueueAction(action);
	}
})