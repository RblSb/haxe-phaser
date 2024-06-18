package phaser.types.textures;

/**
	An object containing the position and color data for a single pixel in a CanvasTexture.
**/
typedef StampConfig = {
	/**
		The alpha value used by the stamp.
	**/
	@:optional
	var alpha : Float;
	/**
		The tint color value used by the stamp. WebGL only.
	**/
	@:optional
	var tint : Float;
	/**
		The angle of the stamp in degrees. Rotation takes place around its origin.
	**/
	@:optional
	var angle : Float;
	/**
		The rotation of the stamp in radians. Rotation takes place around its origin.
	**/
	@:optional
	var rotation : Float;
	/**
		Sets both the horizontal and vertical scale of the stamp with a single value.
	**/
	@:optional
	var scale : Float;
	/**
		Set the horizontal scale of the stamp. Overrides the scale property, if provided.
	**/
	@:optional
	var scaleX : Float;
	/**
		Set the vertical scale of the stamp. Overrides the scale property, if provided.
	**/
	@:optional
	var scaleY : Float;
	/**
		The horizontal origin of the stamp. 0 is the left, 0.5 is the center and 1 is the right.
	**/
	@:optional
	var originX : Float;
	/**
		The vertical origin of the stamp. 0 is the top, 0.5 is the center and 1 is the bottom.
	**/
	@:optional
	var originY : Float;
	/**
		The blend mode used when drawing the stamp. Defaults to 0 (normal).
	**/
	@:optional
	var blendMode : ts.AnyOf3<String, Float, phaser.BlendModes>;
	/**
		Erase this stamp from the texture?
	**/
	@:optional
	var erase : Bool;
	/**
		Skip beginning and ending a batch with this call. Use if this is part of a bigger batched draw.
	**/
	@:optional
	var skipBatch : Bool;
};