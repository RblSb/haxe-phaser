package phaser.gameobjects.particles;

/**
	A Particle is a simple object owned and controlled by a Particle Emitter.
	
	It encapsulates all of the properties required to move and update according
	to the Emitters operations.
**/
@:native("Phaser.GameObjects.Particles.Particle") extern class Particle {
	function new(emitter:ParticleEmitter);
	/**
		The Emitter to which this Particle belongs.
		
		A Particle can only belong to a single Emitter and is created, updated and destroyed by it.
	**/
	var emitter : ParticleEmitter;
	/**
		The texture used by this Particle when it renders.
	**/
	var texture : phaser.textures.Texture;
	/**
		The texture frame used by this Particle when it renders.
	**/
	var frame : phaser.textures.Frame;
	/**
		The x coordinate of this Particle.
	**/
	var x : Float;
	/**
		The y coordinate of this Particle.
	**/
	var y : Float;
	/**
		The coordinates of this Particle in world space.
		
		Updated as part of `computeVelocity`.
	**/
	var worldPosition : phaser.math.Vector2;
	/**
		The x velocity of this Particle.
	**/
	var velocityX : Float;
	/**
		The y velocity of this Particle.
	**/
	var velocityY : Float;
	/**
		The x acceleration of this Particle.
	**/
	var accelerationX : Float;
	/**
		The y acceleration of this Particle.
	**/
	var accelerationY : Float;
	/**
		The maximum horizontal velocity this Particle can travel at.
	**/
	var maxVelocityX : Float;
	/**
		The maximum vertical velocity this Particle can travel at.
	**/
	var maxVelocityY : Float;
	/**
		The bounciness, or restitution, of this Particle.
	**/
	var bounce : Float;
	/**
		The horizontal scale of this Particle.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Particle.
	**/
	var scaleY : Float;
	/**
		The alpha value of this Particle.
	**/
	var alpha : Float;
	/**
		The angle of this Particle in degrees.
	**/
	var angle : Float;
	/**
		The angle of this Particle in radians.
	**/
	var rotation : Float;
	/**
		The tint applied to this Particle.
	**/
	var tint : Float;
	/**
		The lifespan of this Particle in ms.
	**/
	var life : Float;
	/**
		The current life of this Particle in ms.
	**/
	var lifeCurrent : Float;
	/**
		The delay applied to this Particle upon emission, in ms.
	**/
	var delayCurrent : Float;
	/**
		The hold applied to this Particle before it expires, in ms.
	**/
	var holdCurrent : Float;
	/**
		The normalized lifespan T value, where 0 is the start and 1 is the end.
	**/
	var lifeT : Float;
	/**
		The data used by the ease equation.
	**/
	var data : phaser.types.gameobjects.particles.ParticleData;
	/**
		A reference to the Scene to which this Game Object belongs.
		
		Game Objects can only belong to one Scene.
		
		You should consider this property as being read-only. You cannot move a
		Game Object to another Scene by simply changing it.
	**/
	var scene : phaser.Scene;
	/**
		The Animation State component of this Particle.
		
		This component provides features to apply animations to this Particle.
		It is responsible for playing, loading, queuing animations for later playback,
		mixing between animations and setting the current animation frame to this Particle.
	**/
	var anims : phaser.animations.AnimationState;
	/**
		A rectangle that holds the bounds of this Particle after a call to
		the `Particle.getBounds` method has been made.
	**/
	var bounds : phaser.geom.Rectangle;
	/**
		The Event Emitter proxy.
		
		Passes on all parameters to the `ParticleEmitter` to emit directly.
	**/
	function emit(event:ts.AnyOf2<String, js.lib.Symbol>, ?a1:Dynamic, ?a2:Dynamic, ?a3:Dynamic, ?a4:Dynamic, ?a5:Dynamic):Bool;
	/**
		Checks to see if this Particle is alive and updating.
	**/
	function isAlive():Bool;
	/**
		Kills this particle. This sets the `lifeCurrent` value to 0, which forces
		the Particle to be removed the next time its parent Emitter runs an update.
	**/
	function kill():Void;
	/**
		Sets the position of this particle to the given x/y coordinates.
		
		If the parameters are left undefined, it resets the particle back to 0x0.
	**/
	function setPosition(?x:Float, ?y:Float):Void;
	/**
		Starts this Particle from the given coordinates.
	**/
	function fire(?x:Float, ?y:Float):Bool;
	/**
		The main update method for this Particle.
		
		Updates its life values, computes the velocity and repositions the Particle.
	**/
	function update(delta:Float, step:Float, processors:Array<ParticleProcessor>):Bool;
	/**
		An internal method that calculates the velocity of the Particle and
		its world position. It also runs it against any active Processors
		that are set on the Emitter.
	**/
	function computeVelocity(emitter:ParticleEmitter, delta:Float, step:Float, processors:Array<ParticleProcessor>, t:Float):Void;
	/**
		This is a NOOP method and does nothing when called.
	**/
	function setSizeToFrame():Void;
	/**
		Gets the bounds of this particle as a Geometry Rectangle, factoring in any
		transforms of the parent emitter and anything else above it in the display list.
		
		Once calculated the bounds can be accessed via the `Particle.bounds` property.
	**/
	function getBounds(?matrix:phaser.gameobjects.components.TransformMatrix):phaser.geom.Rectangle;
	/**
		Destroys this Particle.
	**/
	function destroy():Void;
	static var prototype : Particle;
}