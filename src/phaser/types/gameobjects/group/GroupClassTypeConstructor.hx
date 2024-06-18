package phaser.types.gameobjects.group;

typedef GroupClassTypeConstructor = ts.AnyOf2<(scene:phaser.Scene, x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>) -> Void, (scene:phaser.Scene, x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, frame:ts.AnyOf2<String, Float>) -> Void>;