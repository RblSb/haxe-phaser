package phaser.gameobjects.particles;

/**
	The Particle Bounds Processor.
	
	Defines a rectangular region, in world space, within which particle movement
	is restrained.
	
	Use the properties `collideLeft`, `collideRight`, `collideTop` and
	`collideBottom` to control if a particle will rebound off the sides
	of this boundary, or not.
	
	This happens when the particles worldPosition x/y coordinate hits the boundary.
	
	The strength of the rebound is determined by the `Particle.bounce` property.
**/
@:native("Phaser.GameObjects.Particles.ParticleBounds") extern class ParticleBounds extends ParticleProcessor {
	function new(x:Float, y:Float, width:Float, height:Float, ?collideLeft:Bool, ?collideRight:Bool, ?collideTop:Bool, ?collideBottom:Bool);
	/**
		A rectangular boundary constraining particle movement. Use the Emitter properties `collideLeft`,
		`collideRight`, `collideTop` and `collideBottom` to control if a particle will rebound off
		the sides of this boundary, or not. This happens when the particles x/y coordinate hits
		the boundary.
	**/
	var bounds : phaser.geom.Rectangle;
	/**
		Whether particles interact with the left edge of the emitter {@link Phaser.GameObjects.Particles.ParticleEmitter#bounds}.
	**/
	var collideLeft : Bool;
	/**
		Whether particles interact with the right edge of the emitter {@link Phaser.GameObjects.Particles.ParticleBounds#bounds}.
	**/
	var collideRight : Bool;
	/**
		Whether particles interact with the top edge of the emitter {@link Phaser.GameObjects.Particles.ParticleBounds#bounds}.
	**/
	var collideTop : Bool;
	/**
		Whether particles interact with the bottom edge of the emitter {@link Phaser.GameObjects.Particles.ParticleBounds#bounds}.
	**/
	var collideBottom : Bool;
	/**
		Takes a Particle and updates it against the bounds.
	**/
	function update(particle:Particle):Void;
	static var prototype : ParticleBounds;
}