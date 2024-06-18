package phaser.types.gameobjects.container;

typedef ContainerConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		An optional array of Game Objects to add to the Container.
	**/
	@:optional
	var children : Array<phaser.gameobjects.GameObject>;
};