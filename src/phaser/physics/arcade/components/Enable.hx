package phaser.physics.arcade.components;

/**
	Provides methods used for setting the enable properties of an Arcade Physics Body.
**/
typedef Enable = {
	/**
		Sets whether this Body should calculate its velocity based on its change in
		position every frame. The default, which is to not do this, means that you
		make this Body move by setting the velocity directly. However, if you are
		trying to move this Body via a Tween, or have it follow a Path, then you
		should enable this instead. This will allow it to still collide with other
		bodies, something that isn't possible if you're just changing its position directly.
	**/
	function setDirectControl(?value:Bool):Enable;
	/**
		Enables this Game Object's Body.
		If you reset the Body you must also pass `x` and `y`.
	**/
	function enableBody(?reset:Bool, ?x:Float, ?y:Float, ?enableGameObject:Bool, ?showGameObject:Bool):Enable;
	/**
		Stops and disables this Game Object's Body.
	**/
	function disableBody(?disableGameObject:Bool, ?hideGameObject:Bool):Enable;
	/**
		Syncs the Body's position and size with its parent Game Object.
		You don't need to call this for Dynamic Bodies, as it happens automatically.
		But for Static bodies it's a useful way of modifying the position of a Static Body
		in the Physics World, based on its Game Object.
	**/
	function refreshBody():Enable;
};