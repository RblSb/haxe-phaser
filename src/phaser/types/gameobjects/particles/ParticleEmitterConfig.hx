package phaser.types.gameobjects.particles;

typedef ParticleEmitterConfig = {
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#active}. Setting this to false will stop the emitter from running at all. If you just wish to stop particles from emitting, set `emitting` property instead.
	**/
	@:optional
	var active : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#blendMode}.
	**/
	@:optional
	var blendMode : ts.AnyOf2<String, phaser.BlendModes>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallbackScope} and {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallbackScope}.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideBottom}.
	**/
	@:optional
	var collideBottom : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideLeft}.
	**/
	@:optional
	var collideLeft : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideRight}.
	**/
	@:optional
	var collideRight : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideTop}.
	**/
	@:optional
	var collideTop : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallback}.
	**/
	@:optional
	var deathCallback : haxe.Constraints.Function;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallbackScope}.
	**/
	@:optional
	var deathCallbackScope : Dynamic;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallback}.
	**/
	@:optional
	var emitCallback : haxe.Constraints.Function;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallbackScope}.
	**/
	@:optional
	var emitCallbackScope : Dynamic;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#follow}.
	**/
	@:optional
	var follow : phaser.types.math.Vector2Like;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#frequency}.
	**/
	@:optional
	var frequency : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#gravityX}.
	**/
	@:optional
	var gravityX : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#gravityY}.
	**/
	@:optional
	var gravityY : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxParticles}.
	**/
	@:optional
	var maxParticles : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxAliveParticles}.
	**/
	@:optional
	var maxAliveParticles : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#name}.
	**/
	@:optional
	var name : String;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#emitting}.
	**/
	@:optional
	var emitting : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleBringToTop}.
	**/
	@:optional
	var particleBringToTop : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleClass}.
	**/
	@:optional
	var particleClass : haxe.Constraints.Function;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#radial}.
	**/
	@:optional
	var radial : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#timeScale}.
	**/
	@:optional
	var timeScale : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#trackVisible}.
	**/
	@:optional
	var trackVisible : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#visible}.
	**/
	@:optional
	var visible : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#accelerationX}.
	**/
	@:optional
	var accelerationX : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#accelerationY}.
	**/
	@:optional
	var accelerationY : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleAlpha}.
	**/
	@:optional
	var alpha : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleAngle} (emit only).
	**/
	@:optional
	var angle : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#bounce}.
	**/
	@:optional
	var bounce : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#delay} (emit only).
	**/
	@:optional
	var delay : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#hold} (emit only).
	**/
	@:optional
	var hold : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#lifespan} (emit only).
	**/
	@:optional
	var lifespan : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxVelocityX}.
	**/
	@:optional
	var maxVelocityX : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxVelocityY}.
	**/
	@:optional
	var maxVelocityY : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#moveToX}. If set, overrides `angle` and `speed` properties.
	**/
	@:optional
	var moveToX : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#moveToY}. If set, overrides `angle` and `speed` properties.
	**/
	@:optional
	var moveToY : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#quantity} (emit only).
	**/
	@:optional
	var quantity : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleRotate}.
	**/
	@:optional
	var rotate : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setScale}.
	**/
	@:optional
	var scale : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleScaleX}.
	**/
	@:optional
	var scaleX : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleScaleY}.
	**/
	@:optional
	var scaleY : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setSpeed} (emit only).
	**/
	@:optional
	var speed : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#speedX} (emit only).
	**/
	@:optional
	var speedX : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#speedY} (emit only).
	**/
	@:optional
	var speedY : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleTint}.
	**/
	@:optional
	var tint : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		An array of color values that the Particles interpolate through during their life. If set, overrides any `tint` property.
	**/
	@:optional
	var color : Array<Float>;
	/**
		The string-based name of the Easing function to use if you have enabled Particle color interpolation via the `color` property, otherwise has no effect.
	**/
	@:optional
	var colorEase : String;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleX}.
	**/
	@:optional
	var x : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleY}.
	**/
	@:optional
	var y : ts.AnyOf11<Float, Array<Float>, EmitterOpOnEmitCallback, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpOnUpdateCallback, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig, EmitterOpInterpolationConfig>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setEmitZone}.
	**/
	@:optional
	var emitZone : ts.AnyOf5<phaser.gameobjects.particles.zones.EdgeZone, phaser.gameobjects.particles.zones.RandomZone, ParticleEmitterEdgeZoneConfig, ParticleEmitterRandomZoneConfig, Array<EmitZoneData>>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setDeathZone}.
	**/
	@:optional
	var deathZone : ts.AnyOf4<phaser.gameobjects.particles.zones.DeathZone, ParticleEmitterDeathZoneConfig, DeathZoneSource, Array<DeathZoneObject>>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setBounds}.
	**/
	@:optional
	var bounds : ts.AnyOf2<ParticleEmitterBounds, ParticleEmitterBoundsAlt>;
	/**
		Offset coordinates that assigns to {@link Phaser.GameObjects.Particles.ParticleEmitter#followOffset}.
	**/
	@:optional
	var followOffset : phaser.types.math.Vector2Like;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#anims}.
	**/
	@:optional
	var anim : ts.AnyOf3<String, Array<String>, ParticleEmitterAnimConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#frames}.
	**/
	@:optional
	var frame : ts.AnyOf7<String, Float, Array<String>, phaser.textures.Frame, Array<Float>, Array<phaser.textures.Frame>, ParticleEmitterFrameConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#texture}. Overrides any texture already set on the Emitter.
	**/
	@:optional
	var texture : ts.AnyOf2<String, phaser.textures.Texture>;
	/**
		Creates specified number of inactive particles and adds them to this emitter's pool. {@link Phaser.GameObjects.Particles.ParticleEmitter#reserve}
	**/
	@:optional
	var reserve : Float;
	/**
		If you wish to 'fast forward' the emitter in time, set this value to a number representing the amount of ms the emitter should advance. Doing so implicitly sets `emitting` to `true`.
	**/
	@:optional
	var advance : Float;
	/**
		Limit the emitter to emit particles for a maximum of `duration` ms. Default to zero, meaning 'forever'.
	**/
	@:optional
	var duration : Float;
	/**
		Limit the emitter to emit this exact number of particles and then stop. Default to zero, meaning no limit.
	**/
	@:optional
	var stopAfter : Float;
	/**
		A custom callback that sorts particles prior to rendering. Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#sortCallback}.
	**/
	@:optional
	dynamic function sortCallback(a:phaser.gameobjects.particles.Particle, b:phaser.gameobjects.particles.Particle):Void;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#sortOrderAsc}.
	**/
	@:optional
	var sortOrderAsc : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#sortProperty}.
	**/
	@:optional
	var sortProperty : String;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#tintFill}.
	**/
	@:optional
	var tintFill : Bool;
};