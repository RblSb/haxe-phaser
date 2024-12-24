package phaser.types.physics.arcade;

typedef ArcadePhysicsCallback = (object1:ts.AnyOf3<phaser.physics.arcade.Body, GameObjectWithBody, phaser.tilemaps.Tile>, object2:ts.AnyOf3<phaser.physics.arcade.Body, GameObjectWithBody, phaser.tilemaps.Tile>) -> Void;