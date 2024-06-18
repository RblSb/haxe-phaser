package phaser.physics.matter.components;

/**
	Contains methods for changing the velocity of a Matter Body. Should be used as a mixin and not called directly.
**/
typedef Velocity = {
	/**
		Sets the horizontal velocity of the physics body.
	**/
	function setVelocityX(x:Float):Velocity;
	/**
		Sets vertical velocity of the physics body.
	**/
	function setVelocityY(y:Float):Velocity;
	/**
		Sets both the horizontal and vertical velocity of the physics body.
	**/
	function setVelocity(x:Float, ?y:Float):Velocity;
	/**
		Gets the current linear velocity of the physics body.
	**/
	function getVelocity():phaser.types.math.Vector2Like;
	/**
		Sets the angular velocity of the body instantly.
		Position, angle, force etc. are unchanged.
	**/
	function setAngularVelocity(velocity:Float):Velocity;
	/**
		Gets the current rotational velocity of the body.
	**/
	function getAngularVelocity():Float;
	/**
		Sets the current rotational speed of the body.
		Direction is maintained. Affects body angular velocity.
	**/
	function setAngularSpeed(speed:Float):Velocity;
	/**
		Gets the current rotational speed of the body.
		Equivalent to the magnitude of its angular velocity.
	**/
	function getAngularSpeed():Float;
};