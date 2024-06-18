package phaser.types.gameobjects.graphics;

typedef RoundedRectRadius = {
	/**
		Top left corner radius. Draw concave arc if this radius is negative.
	**/
	@:optional
	var tl : Float;
	/**
		Top right corner radius. Draw concave arc if this radius is negative.
	**/
	@:optional
	var tr : Float;
	/**
		Bottom right corner radius. Draw concave arc if this radius is negative.
	**/
	@:optional
	var br : Float;
	/**
		Bottom left corner radius. Draw concave arc if this radius is negative.
	**/
	@:optional
	var bl : Float;
};