({
	// Load items from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getWishlist");
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.products", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    //Comparing name entered with name in system
    compareName: function(component, event, helper) {
        let action = component.get("c.getWishlist");
        let name = component.get("v.name");
        action.setParams({"name":name});
        console.log(action,name);
        action.setCallback(this,function(response){
            let state = response.getState();
            //If there is a match, show Wishlist fields
            if (response.getReturnValue().length > 0 && state === "SUCCESS") {
                component.set("v.wish",response.getReturnValue());
                component.set("v.display",true);
                component.set("v.nomatch",false);
            //If there is no match, show error message and turn off Wishlist fields    
            }else{
                component.set("v.nomatch",true);
                component.set("v.display",false);
            }
        
        });
        $A.enqueueAction(action);
    }
    
    
})