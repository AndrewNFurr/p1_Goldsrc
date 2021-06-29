({
	init : function(component, event, helper) {
		helper.init(component);        
	},
    
    handleClick : function(component, event, helper) {
		location.reload();
	},
    handleModalCancel :  function(component, event, helper) {
	    component.set("v.show", false);
    },
    handleResetPassword:  function(component, event, helper) {
	   component.set("v.show", true);
    },
    handleModalSave:  function(component, event, helper) {
	   helper.savePassword(component)
    },
})