package phaser.gameobjects.particles.zones;

/**
	A zone that places particles randomly within a shapes area.
**/
@:native("Phaser.GameObjects.Particles.Zones.RandomZone") extern class RandomZone {
	function new(source:phaser.types.gameobjects.particles.RandomZoneSource);
	/**
		An object instance with a `getRandomPoint(point)` method.
	**/
	var source : phaser.types.gameobjects.particles.RandomZoneSource;
	/**
		The total number of particles this zone will emit before the Emitter
		transfers control over to the next zone in its emission zone list.
		
		By default this is -1, meaning it will never pass over from this
		zone to another one. You can call the `ParticleEmitter.setEmitZone`
		method to change it, or set this value to something else via the
		config, or directly at runtime.
		
		A value of 1 would mean the zones rotate in order, but it can
		be set to any integer value.
	**/
	var total : Float;
	/**
		Get the next point in the Zone and set its coordinates on the given Particle.
	**/
	function getPoint(particle:phaser.gameobjects.particles.Particle):Void;
	static var prototype : RandomZone;
}