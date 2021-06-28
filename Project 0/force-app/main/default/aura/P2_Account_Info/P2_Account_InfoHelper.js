({
	init : function(component) {
		let action = component.get("c.getAccountIds");
        action.setCallback(this, function(response) {
           let res = response.getReturnValue("account");          
           component.set("v.recordId", res.Id);
         })
        $A.enqueueAction(action);
	},
    
    savePassword : function(component) {     	
        let oldpw = component.find("oldPass").get("v.value");
        let newpw = component.find("newPass").get("v.value");
        let action = component.get("c.setNewPassword");
        action.setParams({"oldpw": oldpw, "newpw": newpw});
        action.setCallback(this, function(response) {
        	var state = response.getState();
            console.log(state);
            if (state=== "ERROR") {
                var errors = response.getError();
                alert(errors[0].message);
            } else {
                location.reload();
            }
        })
        $A.enqueueAction(action);
    }
})