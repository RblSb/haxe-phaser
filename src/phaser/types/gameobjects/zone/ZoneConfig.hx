package phaser.types.gameobjects.zone;

typedef ZoneConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		The width of the Game Object.
	**/
	@:optional
	var width : Float;
	/**
		The height of the Game Object.
	**/
	@:optional
	var height : Float;
};