({
	detail : function(component, event, helper) {
        var check = component.get("v.isShow")
        check = false;
        //console.log(check);
        component.set("v.isShow", !check);
	},
    closeDetail : function(component, event, helper){
        var check = component.get("v.isShow")
        check = true;
       // console.log(check);
        component.set("v.isShow", !check);
    },
    
    buyGame : function(component, event, helper){
        event.preventDefault();
        let myGames = component.get("v.myStoreGame");
        //change the name match to the one in the controller
        let myMethod = component.get("c.buyPopularGame");
        //console.log(JSON.stringify(myMethod));
        
        myMethod.setParams({"game":myGames});
        myMethod.setCallback(this,function(response){
            
            if(response.getState() == "SUCCESS"){
                var check = response.getReturnValue();
                if(check == true){
                     component.set("v.isOwned", check);
                }
                else{
                    component.set("v.isBought", !check);
                }
                console.log(response.getReturnValue());
                 component.set("v.disableButton", true);
            }
            else{
                console.log("ERRRR");
            }
        });
        
        $A.enqueueAction(myMethod);
        
    }
    
})