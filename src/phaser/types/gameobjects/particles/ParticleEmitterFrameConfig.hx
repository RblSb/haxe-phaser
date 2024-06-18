package phaser.types.gameobjects.particles;

typedef ParticleEmitterFrameConfig = {
	/**
		Array of texture frames.
	**/
	@:optional
	var frames : ts.AnyOf3<Array<String>, Array<Float>, Array<phaser.textures.Frame>>;
	/**
		Whether texture frames will be assigned consecutively (true) or at random (false).
	**/
	@:optional
	var cycle : Bool;
	/**
		The number of consecutive particles receiving each texture frame, when `cycle` is true.
	**/
	@:optional
	var quantity : Float;
};