package phaser.physics.matter.components;

/**
	A component to apply force to Matter.js bodies.
**/
typedef Force = {
	/**
		Applies a force to a body.
	**/
	function applyForce(force:phaser.math.Vector2):Force;
	/**
		Applies a force to a body from a given position.
	**/
	function applyForceFrom(position:phaser.math.Vector2, force:phaser.math.Vector2):Force;
	/**
		Apply thrust to the forward position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrust(speed:Float):Force;
	/**
		Apply thrust to the left position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustLeft(speed:Float):Force;
	/**
		Apply thrust to the right position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustRight(speed:Float):Force;
	/**
		Apply thrust to the back position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustBack(speed:Float):Force;
};