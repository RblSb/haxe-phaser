package phaser;

/**
	Phaser Scale Modes.
**/
@:native("Phaser.ScaleModes") extern enum abstract ScaleModes(Int) from Int to Int {
	/**
		Default Scale Mode (Linear).
	**/
	var DEFAULT;
	/**
		Linear Scale Mode.
	**/
	var LINEAR;
	/**
		Nearest Scale Mode.
	**/
	var NEAREST;
}
