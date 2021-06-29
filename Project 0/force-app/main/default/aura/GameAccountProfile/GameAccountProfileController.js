({
	//Comparing name and password with database
    compareNamePass: function(component, event, helper) {
        //grabbing attributes and Apex method
        let action = component.get("c.grabAccount");
        let name = component.get("v.name");
        let password = component.get("v.password");
        
        action.setParams({"name":name,"password":password});
        console.log(action,name,password);
        action.setCallback(this,function(response){
            let state = response.getState();
            //If username and password match
            if (response.getReturnValue() != null && state === "SUCCESS") {
                component.set("v.gacc",response.getReturnValue());
                component.set("v.display",true);
                component.set("v.nomatch",false);
            //If username and password do not match    
            }else{
                component.set("v.nomatch",true);
                component.set("v.display",false);
                
            }
        
        });
        $A.enqueueAction(action);
    }
})