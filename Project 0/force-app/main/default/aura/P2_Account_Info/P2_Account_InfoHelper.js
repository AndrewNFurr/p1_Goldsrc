({
	init : function(component) {
		let action = component.get("c.getAccountIds");
        action.setCallback(this, function(response) {
           let res = response.getReturnValue("account");          
           component.set("v.recordId", res.Id);
         })
        $A.enqueueAction(action);
	}
})