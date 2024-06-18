package phaser.types.gameobjects.particles;

typedef EdgeZoneSourceCallback = ts.AnyOf2<(quantity:Float) -> Array<phaser.types.math.Vector2Like>, (quantity:Float, stepRate:Float) -> Array<phaser.types.math.Vector2Like>>;