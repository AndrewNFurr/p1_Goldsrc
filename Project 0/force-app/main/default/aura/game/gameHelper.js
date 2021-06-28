({
	chooseGame : function(component, chosenGame) {
		let gameChoice = $A.get("e.c:choseGame");
        console.log(chosenGame);
        gameChoice.setParams({"gameChoice" : chosenGame});
        gameChoice.fire();
	}
})