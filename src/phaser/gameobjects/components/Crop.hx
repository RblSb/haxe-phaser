package phaser.gameobjects.components;

/**
	Provides methods used for getting and setting the texture of a Game Object.
**/
typedef Crop = {
	/**
		The Texture this Game Object is using to render with.
	**/
	var texture : ts.AnyOf2<phaser.textures.Texture, phaser.textures.CanvasTexture>;
	/**
		The Texture Frame this Game Object is using to render with.
	**/
	var frame : phaser.textures.Frame;
	/**
		A boolean flag indicating if this Game Object is being cropped or not.
		You can toggle this at any time after `setCrop` has been called, to turn cropping on or off.
		Equally, calling `setCrop` with no arguments will reset the crop and disable it.
	**/
	var isCropped : Bool;
	/**
		Applies a crop to a texture based Game Object, such as a Sprite or Image.
		
		The crop is a rectangle that limits the area of the texture frame that is visible during rendering.
		
		Cropping a Game Object does not change its size, dimensions, physics body or hit area, it just
		changes what is shown when rendered.
		
		The crop size as well as coordinates can not exceed the the size of the texture frame.
		
		The crop coordinates are relative to the texture frame, not the Game Object, meaning 0 x 0 is the top-left.
		
		Therefore, if you had a Game Object that had an 800x600 sized texture, and you wanted to show only the left
		half of it, you could call `setCrop(0, 0, 400, 600)`.
		
		It is also scaled to match the Game Object scale automatically. Therefore a crop rectangle of 100x50 would crop
		an area of 200x100 when applied to a Game Object that had a scale factor of 2.
		
		You can either pass in numeric values directly, or you can provide a single Rectangle object as the first argument.
		
		Call this method with no arguments at all to reset the crop, or toggle the property `isCropped` to `false`.
		
		You should do this if the crop rectangle becomes the same size as the frame itself, as it will allow
		the renderer to skip several internal calculations.
	**/
	function setCrop(?x:ts.AnyOf2<Float, phaser.geom.Rectangle>, ?y:Float, ?width:Float, ?height:Float):Crop;
};