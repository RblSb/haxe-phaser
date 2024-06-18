package phaser.gameobjects.particles;

/**
	This class is responsible for taking control over a single property
	in the Particle class and managing its emission and updating functions.
	
	Particles properties such as `x`, `y`, `scaleX`, `lifespan` and others all use
	EmitterOp instances to manage them, as they can be given in a variety of
	formats: from simple values, to functions, to dynamic callbacks.
	
	See the `ParticleEmitter` class for more details on emitter op configuration.
**/
@:native("Phaser.GameObjects.Particles.EmitterOp") extern class EmitterOp {
	function new(key:String, defaultValue:ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>, ?emitOnly:Bool);
	/**
		The name of this property.
	**/
	var propertyKey : String;
	/**
		The current value of this property.
		
		This can be a simple value, an array, a function or an onEmit
		configuration object.
	**/
	var propertyValue : ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>;
	/**
		The default value of this property.
		
		This can be a simple value, an array, a function or an onEmit
		configuration object.
	**/
	var defaultValue : ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>;
	/**
		The number of steps for stepped easing between {@link Phaser.GameObjects.Particles.EmitterOp#start} and
		{@link Phaser.GameObjects.Particles.EmitterOp#end} values, per emit.
	**/
	var steps : Float;
	/**
		The step counter for stepped easing, per emit.
	**/
	var counter : Float;
	/**
		When the step counter reaches it's maximum, should it then
		yoyo back to the start again, or flip over to it?
	**/
	var yoyo : Bool;
	/**
		The counter direction. 0 for up and 1 for down.
	**/
	var direction : Float;
	/**
		The start value for this property to ease between.
		
		If an interpolation this holds a reference to the number data array.
	**/
	var start : ts.AnyOf2<Float, Array<Float>>;
	/**
		The most recently calculated value. Updated every time an
		emission or update method is called. Treat as read-only.
	**/
	var current : Float;
	/**
		The end value for this property to ease between.
	**/
	var end : Float;
	/**
		The easing function to use for updating this property, if any.
	**/
	var ease : Null<haxe.Constraints.Function>;
	/**
		The interpolation function to use for updating this property, if any.
	**/
	var interpolation : Null<haxe.Constraints.Function>;
	/**
		Whether this property can only be modified when a Particle is emitted.
		
		Set to `true` to allow only {@link Phaser.GameObjects.Particles.EmitterOp#onEmit} callbacks to be set and
		affect this property.
		
		Set to `false` to allow both {@link Phaser.GameObjects.Particles.EmitterOp#onEmit} and
		{@link Phaser.GameObjects.Particles.EmitterOp#onUpdate} callbacks to be set and affect this property.
	**/
	var emitOnly : Bool;
	/**
		The callback to run for Particles when they are emitted from the Particle Emitter.
	**/
	dynamic function onEmit(?particle:Particle, ?key:String, ?value:Float):Float;
	/**
		The callback to run for Particles when they are updated.
	**/
	dynamic function onUpdate(particle:Particle, key:String, t:Float, value:Float):Float;
	/**
		Set to `false` to disable this EmitterOp.
	**/
	var active : Bool;
	/**
		The onEmit method type of this EmitterOp.
		
		Set as part of `setMethod` and cached here to avoid
		re-setting when only the value changes.
	**/
	var method : Float;
	/**
		Load the property from a Particle Emitter configuration object.
		
		Optionally accepts a new property key to use, replacing the current one.
	**/
	function loadConfig(?config:phaser.types.gameobjects.particles.ParticleEmitterConfig, ?newKey:String):Void;
	/**
		Build a JSON representation of this Particle Emitter property.
	**/
	function toJSON():Dynamic;
	/**
		Change the current value of the property and update its callback methods.
	**/
	function onChange(value:Float):EmitterOp;
	/**
		Checks the type of `EmitterOp.propertyValue` to determine which
		method is required in order to return values from this op function.
	**/
	function getMethod():Float;
	/**
		Update the {@link Phaser.GameObjects.Particles.EmitterOp#onEmit} and
		{@link Phaser.GameObjects.Particles.EmitterOp#onUpdate} callbacks based on the method returned
		from `getMethod`. The method is stored in the `EmitterOp.method` property
		and is a number between 0 and 9 inclusively.
	**/
	function setMethods():EmitterOp;
	/**
		Check whether an object has the given property.
	**/
	function has(object:Dynamic, key:String):Bool;
	/**
		Check whether an object has both of the given properties.
	**/
	function hasBoth(object:Dynamic, key1:String, key2:String):Bool;
	/**
		Check whether an object has at least one of the given properties.
	**/
	function hasEither(object:Dynamic, key1:String, key2:String):Bool;
	/**
		The returned value sets what the property will be at the START of the particles life, on emit.
	**/
	function defaultEmit(particle:Particle, key:String, ?value:Float):Float;
	/**
		The returned value updates the property for the duration of the particles life.
	**/
	function defaultUpdate(particle:Particle, key:String, t:Float, value:Float):Float;
	/**
		The returned value sets what the property will be at the START of the particles life, on emit.
		
		This method is only used when you have provided a custom emit callback.
	**/
	function proxyEmit(particle:Particle, key:String, ?value:Float):Float;
	/**
		The returned value updates the property for the duration of the particles life.
		
		This method is only used when you have provided a custom update callback.
	**/
	function proxyUpdate(particle:Particle, key:String, t:Float, value:Float):Float;
	/**
		An `onEmit` callback that returns the current value of the property.
	**/
	function staticValueEmit():Float;
	/**
		An `onUpdate` callback that returns the current value of the property.
	**/
	function staticValueUpdate():Float;
	/**
		An `onEmit` callback that returns a random value from the current value array.
	**/
	function randomStaticValueEmit():Float;
	/**
		An `onEmit` callback that returns a value between the {@link Phaser.GameObjects.Particles.EmitterOp#start} and
		{@link Phaser.GameObjects.Particles.EmitterOp#end} range.
	**/
	function randomRangedValueEmit(particle:Particle, key:String):Float;
	/**
		An `onEmit` callback that returns a value between the {@link Phaser.GameObjects.Particles.EmitterOp#start} and
		{@link Phaser.GameObjects.Particles.EmitterOp#end} range.
	**/
	function randomRangedIntEmit(particle:Particle, key:String):Float;
	/**
		An `onEmit` callback that returns a stepped value between the
		{@link Phaser.GameObjects.Particles.EmitterOp#start} and {@link Phaser.GameObjects.Particles.EmitterOp#end}
		range.
	**/
	function steppedEmit():Float;
	/**
		An `onEmit` callback for an eased property.
		
		It prepares the particle for easing by {@link Phaser.GameObjects.Particles.EmitterOp#easeValueUpdate}.
	**/
	function easedValueEmit(particle:Particle, key:String):Float;
	/**
		An `onUpdate` callback that returns an eased value between the
		{@link Phaser.GameObjects.Particles.EmitterOp#start} and {@link Phaser.GameObjects.Particles.EmitterOp#end}
		range.
	**/
	function easeValueUpdate(particle:Particle, key:String, t:Float):Float;
	/**
		Destroys this EmitterOp instance and all of its references.
		
		Called automatically when the ParticleEmitter that owns this
		EmitterOp is destroyed.
	**/
	function destroy():Void;
	static var prototype : EmitterOp;
}