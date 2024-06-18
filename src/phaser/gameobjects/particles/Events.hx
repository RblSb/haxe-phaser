package phaser.gameobjects.particles;

@:native("Phaser.GameObjects.Particles.Events") @valueModuleOnly extern class Events {
	/**
		The Particle Emitter Complete Event.
		
		This event is dispatched when the final particle, emitted from a Particle Emitter that
		has been stopped, dies. Upon receipt of this event you know that no particles are
		still rendering at this point in time.
		
		Listen for it on a Particle Emitter instance using `ParticleEmitter.on('complete', listener)`.
	**/
	static final COMPLETE : String;
	/**
		The Particle Emitter Death Zone Event.
		
		This event is dispatched when a Death Zone kills a Particle instance.
		
		Listen for it on a Particle Emitter instance using `ParticleEmitter.on('deathzone', listener)`.
		
		If you wish to know when the final particle is killed, see the `COMPLETE` event.
	**/
	static final DEATH_ZONE : String;
	/**
		The Particle Emitter Explode Event.
		
		This event is dispatched when a Particle Emitter explodes a set of particles.
		
		Listen for it on a Particle Emitter instance using `ParticleEmitter.on('explode', listener)`.
	**/
	static final EXPLODE : String;
	/**
		The Particle Emitter Start Event.
		
		This event is dispatched when a Particle Emitter starts emission of particles.
		
		Listen for it on a Particle Emitter instance using `ParticleEmitter.on('start', listener)`.
	**/
	static final START : String;
	/**
		The Particle Emitter Stop Event.
		
		This event is dispatched when a Particle Emitter is stopped. This can happen either
		when you directly call the `ParticleEmitter.stop` method, or if the emitter has
		been configured to stop after a set time via the `duration` property, or after a
		set number of particles via the `stopAfter` property.
		
		Listen for it on a Particle Emitter instance using `ParticleEmitter.on('stop', listener)`.
		
		Note that just because the emitter has stopped, that doesn't mean there aren't still
		particles alive and rendering. It just means the emitter has stopped emitting particles.
		
		If you wish to know when the final particle is killed, see the `COMPLETE` event.
	**/
	static final STOP : String;
}