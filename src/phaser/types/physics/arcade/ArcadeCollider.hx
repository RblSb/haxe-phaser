package phaser.types.physics.arcade;

/**
	An Arcade Physics Collider Type.
**/
typedef ArcadeCollider = ts.AnyOf5<phaser.physics.arcade.Sprite, phaser.physics.arcade.Image, phaser.physics.arcade.StaticGroup, phaser.physics.arcade.Group, phaser.tilemaps.TilemapLayer>;