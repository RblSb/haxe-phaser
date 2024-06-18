package phaser.types.gameobjects.plane;

typedef PlaneCheckerboardConfig = {
	/**
		The odd cell color, specified as a hex value.
	**/
	@:optional
	var color1 : Float;
	/**
		The even cell color, specified as a hex value.
	**/
	@:optional
	var color2 : Float;
	/**
		The odd cell alpha value, specified as a number between 0 and 255.
	**/
	@:optional
	var alpha1 : Float;
	/**
		The even cell alpha value, specified as a number between 0 and 255.
	**/
	@:optional
	var alpha2 : Float;
	/**
		The view height of the Plane after creation, in pixels.
	**/
	@:optional
	var height : Float;
};