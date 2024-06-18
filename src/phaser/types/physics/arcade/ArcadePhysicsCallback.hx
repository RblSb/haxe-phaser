package phaser.types.physics.arcade;

typedef ArcadePhysicsCallback = (object1:ts.AnyOf2<GameObjectWithBody, phaser.tilemaps.Tile>, object2:ts.AnyOf2<GameObjectWithBody, phaser.tilemaps.Tile>) -> Void;