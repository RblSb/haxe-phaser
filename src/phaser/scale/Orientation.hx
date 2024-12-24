package phaser.scale;

/**
	Phaser Scale Manager constants for orientation.
**/
@:native("Phaser.Scale.Orientation") @:enum extern abstract Orientation(Int) from Int to Int {
	/**
		The primary landscape orientation.
	**/
	var LANDSCAPE;
	/**
		The secondary landscape orientation.
	**/
	var LANDSCAPE_SECONDARY;
	/**
		The primary portrait orientation.
	**/
	var PORTRAIT;
	/**
		The secondary portrait orientation.
	**/
	var PORTRAIT_SECONDARY;
}