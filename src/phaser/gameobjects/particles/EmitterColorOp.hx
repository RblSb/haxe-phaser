package phaser.gameobjects.particles;

/**
	This class is responsible for taking control over the color property
	in the Particle class and managing its emission and updating functions.
	
	See the `ParticleEmitter` class for more details on emitter op configuration.
**/
@:native("Phaser.GameObjects.Particles.EmitterColorOp") extern class EmitterColorOp extends EmitterOp {
	function new(key:String);
	/**
		An array containing the red color values.
		
		Populated during the `setMethods` method.
	**/
	var r : Array<Float>;
	/**
		An array containing the green color values.
		
		Populated during the `setMethods` method.
	**/
	var g : Array<Float>;
	/**
		An array containing the blue color values.
		
		Populated during the `setMethods` method.
	**/
	var b : Array<Float>;
	/**
		Sets the EmitterColorOp method values, if in use.
	**/
	function setMethods():EmitterColorOp;
	/**
		Sets the Ease function to use for Color interpolation.
	**/
	function setEase(ease:String):Void;
	/**
		Change the current value of the property and update its callback methods.
	**/
	function onChange(value:Float):EmitterColorOp;
	static var prototype : EmitterColorOp;
}