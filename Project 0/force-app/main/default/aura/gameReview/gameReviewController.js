({
	setGame : function(component, event, helper) {
        console.log('in');
		let action = component.get("c.reviewedGame");
        let review = component.get("v.review");
        console.log(review);
        action.setParams({"gameId": review.Game_Name__c});
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.gameReviewed", reponse.getReturnValue());
            } else {
                console.log("bro, what are you doing in there");
            }
        });
        $A.enqueueAction(action);
	}
})