({
	searchReviews : function(component, term) {
		let getResults = component.getEvent("searchResults");
        getResults.setParams({"term" : term});
        getResults.fire();
        component.set("v.searchTerm", '');
	}
})