package phaser.physics.arcade.components;

/**
	Provides methods used for setting the collision category and mask of an Arcade Physics Body.
**/
typedef Collision = {
	/**
		Sets the Collision Category that this Arcade Physics Body
		will use in order to determine what it can collide with.
		
		It can only have one single category assigned to it.
		
		If you wish to reset the collision category and mask, call
		the `resetCollisionCategory` method.
	**/
	function setCollisionCategory(category:Float):Collision;
	/**
		Checks to see if the given Collision Category will collide with
		this Arcade Physics object or not.
	**/
	function willCollideWith(category:Float):Bool;
	/**
		Adds the given Collision Category to the list of those that this
		Arcade Physics Body will collide with.
	**/
	function addCollidesWith(category:Float):Collision;
	/**
		Removes the given Collision Category from the list of those that this
		Arcade Physics Body will collide with.
	**/
	function removeCollidesWith(category:Float):Collision;
	/**
		Sets all of the Collision Categories that this Arcade Physics Body
		will collide with. You can either pass a single category value, or
		an array of them.
		
		Calling this method will reset all of the collision categories,
		so only those passed to this method are enabled.
		
		If you wish to add a new category to the existing mask, call
		the `addCollisionCategory` method.
		
		If you wish to reset the collision category and mask, call
		the `resetCollisionCategory` method.
	**/
	function setCollidesWith(categories:ts.AnyOf2<Float, Array<Float>>):Collision;
	/**
		Resets the Collision Category and Mask back to the defaults,
		which is to collide with everything.
	**/
	function resetCollisionCategory():Collision;
};