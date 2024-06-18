package phaser.types.physics.arcade;

/**
	An Arcade Physics Collider Type.
**/
typedef ArcadeColliderType = ts.AnyOf13<phaser.gameobjects.GameObject, phaser.gameobjects.Group, phaser.physics.arcade.Sprite, phaser.physics.arcade.Image, phaser.physics.arcade.StaticGroup, phaser.physics.arcade.Group, phaser.tilemaps.TilemapLayer, Array<phaser.gameobjects.GameObject>, Array<phaser.physics.arcade.Sprite>, Array<phaser.physics.arcade.Image>, Array<phaser.physics.arcade.StaticGroup>, Array<phaser.physics.arcade.Group>, Array<phaser.tilemaps.TilemapLayer>>;