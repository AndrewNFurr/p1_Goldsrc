({
	clickSearchReviews : function(component, event, helper) {
		let term = component.get("v.searchTerm");
        helper.searchReviews(component, term);
	}
})