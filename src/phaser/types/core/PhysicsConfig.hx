package phaser.types.core;

typedef PhysicsConfig = {
	/**
		The default physics system. It will be started for each scene. Phaser provides 'arcade', 'impact', and 'matter'.
	**/
	@:optional
	@:native("default")
	var default_ : String;
	/**
		Arcade Physics configuration.
	**/
	@:optional
	var arcade : phaser.types.physics.arcade.ArcadeWorldConfig;
	/**
		Matter Physics configuration.
	**/
	@:optional
	var matter : phaser.types.physics.matter.MatterWorldConfig;
};