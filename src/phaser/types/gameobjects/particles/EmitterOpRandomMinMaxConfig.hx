package phaser.types.gameobjects.particles;

/**
	Defines an operation yielding a random value within a range.
**/
typedef EmitterOpRandomMinMaxConfig = {
	/**
		The minimum value.
	**/
	var min : Float;
	/**
		The maximum value.
	**/
	var max : Float;
	/**
		If true, only integers are selected from the range.
	**/
	@:optional
	var int : Bool;
};