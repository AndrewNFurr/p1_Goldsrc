({
	clickSearchReviews : function(component, event, helper) {
		let term = component.get("v.searchTerm");
        console.log(term);
        helper.searchReviews(component, term);
	}
})