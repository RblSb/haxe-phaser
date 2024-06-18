package phaser.types.gameobjects.particles;

typedef ParticleEmitterAnimConfig = {
	/**
		One or more animations names, or Play Animation Config objects.
	**/
	@:optional
	var anims : ts.AnyOf4<String, Array<String>, phaser.types.animations.PlayAnimationConfig, Array<phaser.types.animations.PlayAnimationConfig>>;
	/**
		Whether animations will be assigned consecutively (true) or at random (false).
	**/
	@:optional
	var cycle : Bool;
	/**
		The number of consecutive particles receiving each animation, when `cycle` is true.
	**/
	@:optional
	var quantity : Float;
};