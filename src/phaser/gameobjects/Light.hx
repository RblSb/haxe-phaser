package phaser.gameobjects;

/**
	A 2D Light.
	
	These are created by the {@link Phaser.GameObjects.LightsManager}, available from within a scene via `this.lights`.
	
	Any Game Objects using the Light2D pipeline will then be affected by these Lights as long as they have a normal map.
	
	They can also simply be used to represent a point light for your own purposes.
	
	Lights cannot be added to Containers. They are designed to exist in the root of a Scene.
**/
@:native("Phaser.GameObjects.Light") extern class Light extends phaser.geom.Circle {
	function new(x:Float, y:Float, radius:Float, r:Float, g:Float, b:Float, intensity:Float);
	/**
		The color of the light.
	**/
	var color : phaser.display.RGB;
	/**
		The intensity of the light.
	**/
	var intensity : Float;
	/**
		The flags that are compared against `RENDER_MASK` to determine if this Game Object will render or not.
		The bits are 0001 | 0010 | 0100 | 1000 set by the components Visible, Alpha, Transform and Texture respectively.
		If those components are not used by your custom class then you can use this bitmask as you wish.
	**/
	var renderFlags : Float;
	/**
		A bitmask that controls if this Game Object is drawn by a Camera or not.
		Not usually set directly, instead call `Camera.ignore`, however you can
		set this property directly using the Camera.id property:
	**/
	var cameraFilter : Float;
	/**
		The width of this Light Game Object. This is the same as `Light.diameter`.
	**/
	var displayWidth : Float;
	/**
		The height of this Light Game Object. This is the same as `Light.diameter`.
	**/
	var displayHeight : Float;
	/**
		The width of this Light Game Object. This is the same as `Light.diameter`.
	**/
	var width : Float;
	/**
		The height of this Light Game Object. This is the same as `Light.diameter`.
	**/
	var height : Float;
	/**
		Compares the renderMask with the renderFlags to see if this Game Object will render or not.
		Also checks the Game Object against the given Cameras exclusion list.
	**/
	function willRender(camera:phaser.cameras.scene2d.Camera):Bool;
	/**
		Set the color of the light from a single integer RGB value.
	**/
	function setColor(rgb:Float):Light;
	/**
		Set the intensity of the light.
	**/
	function setIntensity(intensity:Float):Light;
	/**
		Set the radius of the light.
	**/
	function setRadius(radius:Float):Light;
	/**
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
		Set this value with `setOrigin()`.
	**/
	final originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
		Set this value with `setOrigin()`.
	**/
	final originY : Float;
	/**
		The horizontal display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginY : Float;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):Light;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():Light;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):Light;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():Light;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):Light;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Light;
	/**
		Sets the x, y and radius of this circle.
	**/
	function setTo(?x:Float, ?y:Float, ?radius:Float):Light;
	/**
		Sets this Circle to be empty with a radius of zero.
		Does not change its position.
	**/
	function setEmpty():Light;
	/**
		Sets the position of this Circle.
	**/
	function setPosition(?x:Float, ?y:Float):Light;
	static var prototype : Light;
	/**
		The bitmask that `GameObject.renderFlags` is compared against to determine if the Game Object will render or not.
	**/
	static final RENDER_MASK : Float;
}