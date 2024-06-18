package phaser.types.gameobjects.particles;

typedef EmitterOpCustomEmitConfig = {
	/**
		A callback that is invoked each time the emitter emits a particle.
	**/
	dynamic function onEmit(?particle:phaser.gameobjects.particles.Particle, ?key:String, ?value:Float):Float;
};