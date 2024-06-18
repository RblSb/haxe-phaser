package phaser.types.physics.matter;

typedef MatterWalls = {
	/**
		The left wall for the Matter World.
	**/
	@:optional
	var left : matterjs.BodyType;
	/**
		The right wall for the Matter World.
	**/
	@:optional
	var right : matterjs.BodyType;
	/**
		The top wall for the Matter World.
	**/
	@:optional
	var top : matterjs.BodyType;
	/**
		The bottom wall for the Matter World.
	**/
	@:optional
	var bottom : matterjs.BodyType;
};