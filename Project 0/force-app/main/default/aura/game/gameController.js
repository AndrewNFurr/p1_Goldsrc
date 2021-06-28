({
	clickChooseGame : function(component, event, helper) {
		let chosenGame = component.get("v.game.Name");
        helper.chooseGame(component, chosenGame);
	}
})