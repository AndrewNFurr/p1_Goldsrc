({
	handleSearch : function(component, event, helper) {
        let term = event.getParam("term");
        console.log("Term 2 : " ,term);
        let action = component.get("c.getReviews");
        action.setParams({"gameName":term});
		action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                let reviews = response.getReturnValue();
                console.log(reviews);
                component.set("v.reviews", reviews);
                component.set("v.hasResults", true);
                let revs = component.get("v.reviews");
                console.log(revs);
            } else {
                console.log("error with results");
            }
        });
        $A.enqueueAction(action);
	}
    
})