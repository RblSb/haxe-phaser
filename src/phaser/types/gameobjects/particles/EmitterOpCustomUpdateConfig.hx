package phaser.types.gameobjects.particles;

typedef EmitterOpCustomUpdateConfig = {
	/**
		A callback that is invoked each time the emitter emits a particle.
	**/
	@:optional
	dynamic function onEmit(?particle:phaser.gameobjects.particles.Particle, ?key:String, ?value:Float):Float;
	/**
		A callback that is invoked each time the emitter updates.
	**/
	dynamic function onUpdate(particle:phaser.gameobjects.particles.Particle, key:String, t:Float, value:Float):Float;
};