package phaser.gameobjects.components;

/**
	Provides methods used for setting the depth of a Game Object.
	Should be applied as a mixin and not used directly.
**/
typedef Depth = {
	/**
		The depth of this Game Object within the Scene. Ensure this value is only ever set to a number data-type.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):Depth;
	/**
		Sets this Game Object to be at the top of the display list, or the top of its parent container.
		
		Being at the top means it will render on-top of everything else.
		
		This method does not change this Game Objects `depth` value, it simply alters its list position.
	**/
	function setToTop():Depth;
	/**
		Sets this Game Object to the back of the display list, or the back of its parent container.
		
		Being at the back means it will render below everything else.
		
		This method does not change this Game Objects `depth` value, it simply alters its list position.
	**/
	function setToBack():Depth;
	/**
		Move this Game Object so that it appears above the given Game Object.
		
		This means it will render immediately after the other object in the display list.
		
		Both objects must belong to the same display list, or parent container.
		
		This method does not change this Game Objects `depth` value, it simply alters its list position.
	**/
	function setAbove(gameObject:phaser.gameobjects.GameObject):Depth;
	/**
		Move this Game Object so that it appears below the given Game Object.
		
		This means it will render immediately under the other object in the display list.
		
		Both objects must belong to the same display list, or parent container.
		
		This method does not change this Game Objects `depth` value, it simply alters its list position.
	**/
	function setBelow(gameObject:phaser.gameobjects.GameObject):Depth;
};