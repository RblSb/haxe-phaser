package phaser.gameobjects.particles;

/**
	This class provides the structured required for all Particle Processors.
	
	You should extend it and add the functionality required for your processor,
	including tidying up any resources this may create in the `destroy` method.
	
	See the GravityWell for an example of a processor.
**/
@:native("Phaser.GameObjects.Particles.ParticleProcessor") extern class ParticleProcessor {
	function new(?x:Float, ?y:Float, ?active:Bool);
	/**
		A reference to the Particle Emitter that owns this Processor.
		This is set automatically when the Processor is added to an Emitter
		and nulled when removed or destroyed.
	**/
	var manager : ParticleEmitter;
	/**
		The x coordinate of the Particle Processor, in world space.
	**/
	var x : Float;
	/**
		The y coordinate of the Particle Processor, in world space.
	**/
	var y : Float;
	/**
		The active state of the Particle Processor.
		
		An inactive Particle Processor will be skipped for processing by
		its parent Emitter.
	**/
	var active : Bool;
	/**
		The Particle Processor update method should be overriden by your own
		method and handle the processing of the particles, typically modifying
		their velocityX/Y values based on the criteria of this processor.
	**/
	function update(particle:Particle, delta:Float, step:Float, t:Float):Void;
	/**
		Destroys this Particle Processor by removing all external references.
		
		This is called automatically when the owning Particle Emitter is destroyed.
	**/
	function destroy():Void;
	static var prototype : ParticleProcessor;
}