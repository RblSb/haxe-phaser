package phaser.physics.arcade;

/**
	An Arcade Physics Static Group object.
	
	All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
	
	Its dynamic counterpart is {@link Phaser.Physics.Arcade.Group}.
**/
@:native("Phaser.Physics.Arcade.StaticGroup") extern class StaticGroup extends phaser.gameobjects.Group {
	function new(world:World, scene:phaser.Scene, ?children:ts.AnyOf3<Array<phaser.gameobjects.GameObject>, phaser.types.gameobjects.group.GroupConfig, phaser.types.gameobjects.group.GroupCreateConfig>, ?config:ts.AnyOf2<phaser.types.gameobjects.group.GroupConfig, phaser.types.gameobjects.group.GroupCreateConfig>);
	/**
		The physics simulation.
	**/
	var world : World;
	/**
		The scene this group belongs to.
	**/
	var physicsType : Float;
	/**
		The Arcade Physics Static Group Collision Category.
		
		This can be set to any valid collision bitfield value.
		
		See the `setCollisionCategory` method for more details.
	**/
	var collisionCategory : Float;
	/**
		The Arcade Physics Static Group Collision Mask.
		
		See the `setCollidesWith` method for more details.
	**/
	var collisionMask : Float;
	/**
		Adds a static physics body to the new group member (if it lacks one) and adds it to the simulation.
	**/
	function createCallbackHandler(child:phaser.gameobjects.GameObject):Void;
	/**
		Disables the group member's physics body, removing it from the simulation.
	**/
	function removeCallbackHandler(child:phaser.gameobjects.GameObject):Void;
	/**
		Refreshes the group.
	**/
	function createMultipleCallbackHandler(entries:Array<phaser.gameobjects.GameObject>):Void;
	/**
		Resets each Body to the position of its parent Game Object.
		Body sizes aren't changed (use {@link Phaser.Physics.Arcade.Components.Enable#refreshBody} for that).
	**/
	function refresh():StaticGroup;
	/**
		Sets the Collision Category that this Arcade Physics Body
		will use in order to determine what it can collide with.
		
		It can only have one single category assigned to it.
		
		If you wish to reset the collision category and mask, call
		the `resetCollisionCategory` method.
	**/
	function setCollisionCategory(category:Float):StaticGroup;
	/**
		Checks to see if the given Collision Category will collide with
		this Arcade Physics object or not.
	**/
	function willCollideWith(category:Float):Bool;
	/**
		Adds the given Collision Category to the list of those that this
		Arcade Physics Body will collide with.
	**/
	function addCollidesWith(category:Float):StaticGroup;
	/**
		Removes the given Collision Category from the list of those that this
		Arcade Physics Body will collide with.
	**/
	function removeCollidesWith(category:Float):StaticGroup;
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
	function setCollidesWith(categories:ts.AnyOf2<Float, Array<Float>>):StaticGroup;
	/**
		Resets the Collision Category and Mask back to the defaults,
		which is to collide with everything.
	**/
	function resetCollisionCategory():StaticGroup;
	/**
		Adds a Game Object to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function add(child:phaser.gameobjects.GameObject, ?addToScene:Bool):StaticGroup;
	/**
		Adds several Game Objects to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function addMultiple(children:Array<phaser.gameobjects.GameObject>, ?addToScene:Bool):StaticGroup;
	/**
		Removes a member of this Group and optionally removes it from the Scene and / or destroys it.
		
		Calls {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function remove(child:phaser.gameobjects.GameObject, ?removeFromScene:Bool, ?destroyChild:Bool):StaticGroup;
	/**
		Removes all members of this Group and optionally removes them from the Scene and / or destroys them.
		
		Does not call {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function clear(?removeFromScene:Bool, ?destroyChild:Bool):StaticGroup;
	/**
		{@link Phaser.GameObjects.Components.Animation#play Plays} an animation for all members of this group.
	**/
	function playAnimation(key:String, ?startFrame:String):StaticGroup;
	/**
		Sets the `active` property of this Group.
		When active, this Group runs its `preUpdate` method.
	**/
	function setActive(value:Bool):StaticGroup;
	/**
		Sets the `name` property of this Group.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):StaticGroup;
	/**
		Sets the property as defined in `key` of each group member to the given value.
	**/
	function propertyValueSet(key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):StaticGroup;
	/**
		Adds the given value to the property as defined in `key` of each group member.
	**/
	function propertyValueInc(key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):StaticGroup;
	/**
		Sets the x of each group member.
	**/
	function setX(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the y of each group member.
	**/
	function setY(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the x, y of each group member.
	**/
	function setXY(x:Float, ?y:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Adds the given value to the x of each group member.
	**/
	function incX(value:Float, ?step:Float):StaticGroup;
	/**
		Adds the given value to the y of each group member.
	**/
	function incY(value:Float, ?step:Float):StaticGroup;
	/**
		Adds the given value to the x, y of each group member.
	**/
	function incXY(x:Float, ?y:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Iterate through the group members changing the position of each element to be that of the element that came before
		it in the array (or after it if direction = 1)
		
		The first group member position is set to x/y.
	**/
	function shiftPosition(x:Float, y:Float, ?direction:Float):StaticGroup;
	/**
		Sets the angle of each group member.
	**/
	function angle(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the rotation of each group member.
	**/
	function rotate(value:Float, ?step:Float):StaticGroup;
	/**
		Rotates each group member around the given point by the given angle.
	**/
	function rotateAround(point:phaser.types.math.Vector2Like, angle:Float):StaticGroup;
	/**
		Rotates each group member around the given point by the given angle and distance.
	**/
	function rotateAroundDistance(point:phaser.types.math.Vector2Like, angle:Float, distance:Float):StaticGroup;
	/**
		Sets the alpha of each group member.
	**/
	function setAlpha(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the tint of each group member.
	**/
	function setTint(topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):StaticGroup;
	/**
		Sets the originX, originY of each group member.
	**/
	function setOrigin(originX:Float, ?originY:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Sets the scaleX of each group member.
	**/
	function scaleX(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the scaleY of each group member.
	**/
	function scaleY(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the scaleX, scaleY of each group member.
	**/
	function scaleXY(scaleX:Float, ?scaleY:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Sets the depth of each group member.
	**/
	function setDepth(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the blendMode of each group member.
	**/
	function setBlendMode(value:Float):StaticGroup;
	/**
		Passes all group members to the Input Manager to enable them for input with identical areas and callbacks.
	**/
	function setHitArea(hitArea:Dynamic, hitAreaCallback:phaser.types.input.HitAreaCallback):StaticGroup;
	/**
		Shuffles the group members in place.
	**/
	function shuffle():StaticGroup;
	/**
		Sets the visible of each group member.
	**/
	function setVisible(value:Bool, ?index:Float, ?direction:Float):StaticGroup;
	/**
		Toggles (flips) the visible state of each member of this group.
	**/
	function toggleVisible():StaticGroup;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):StaticGroup;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):StaticGroup;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):StaticGroup;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):StaticGroup;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):StaticGroup;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):StaticGroup;
	static var prototype : StaticGroup;
}