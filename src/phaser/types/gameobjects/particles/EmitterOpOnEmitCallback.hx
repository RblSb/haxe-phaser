package phaser.types.gameobjects.particles;

/**
	The returned value sets what the property will be at the START of the particle's life, on emit.
**/
typedef EmitterOpOnEmitCallback = ts.AnyOf4<() -> Float, (particle:phaser.gameobjects.particles.Particle) -> Float, (particle:phaser.gameobjects.particles.Particle, key:String) -> Float, (particle:phaser.gameobjects.particles.Particle, key:String, value:Float) -> Float>;