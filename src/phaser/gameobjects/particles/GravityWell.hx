package phaser.gameobjects.particles;

/**
	The Gravity Well Particle Processor applies a force on the particles to draw
	them towards, or repel them from, a single point.
	
	The force applied is inversely proportional to the square of the distance
	from the particle to the point, in accordance with Newton's law of gravity.
	
	This simulates the effect of gravity over large distances (as between planets, for example).
**/
@:native("Phaser.GameObjects.Particles.GravityWell") extern class GravityWell extends ParticleProcessor {
	function new(?x:ts.AnyOf2<Float, phaser.types.gameobjects.particles.GravityWellConfig>, ?y:Float, ?power:Float, ?epsilon:Float, ?gravity:Float);
	/**
		Takes a Particle and updates it based on the properties of this Gravity Well.
	**/
	function update(particle:Particle, delta:Float, step:Float):Void;
	/**
		The minimum distance for which the gravity force is calculated.
		
		Defaults to 100.
	**/
	var epsilon : Float;
	/**
		The strength of the gravity force - larger numbers produce a stronger force.
		
		Defaults to 0.
	**/
	var power : Float;
	/**
		The gravitational force of this Gravity Well.
		
		Defaults to 50.
	**/
	var gravity : Float;
	static var prototype : GravityWell;
}