package phaser.types.gameobjects.particles;

typedef ParticleEmitterCreatorConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key of the Texture this Emitter will use to render particles, as stored in the Texture Manager.
	**/
	@:optional
	var key : String;
	/**
		The Particle Emitter configuration object.
	**/
	@:optional
	var config : ParticleEmitterConfig;
};