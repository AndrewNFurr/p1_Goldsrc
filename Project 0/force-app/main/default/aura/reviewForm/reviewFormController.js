({
	handleChoice : function(component, event, helper) {

        let game = event.getParam("gameChoice");

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

	},
    displayFalse : function(component, event, helper) {
    	component.set("v.display", false);
	},
    submit : function(component, event, helper) {
        component.find("createReview").submit();
        component.set("v.display", false);
    }

})