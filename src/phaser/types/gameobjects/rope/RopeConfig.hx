package phaser.types.gameobjects.rope;

typedef RopeConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key of the Texture this Game Object will use to render with, as stored in the Texture Manager. If not given, `__DEFAULT` is used.
	**/
	@:optional
	var key : String;
	/**
		An optional frame from the Texture this Game Object is rendering with.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
	/**
		An array containing the vertices data for this Rope, or a number that indicates how many segments to split the texture frame into. If none is provided a simple quad is created. See `setPoints` to set this post-creation.
	**/
	@:optional
	var points : ts.AnyOf2<Float, Array<phaser.types.math.Vector2Like>>;
	/**
		Should the vertices of this Rope be aligned horizontally (`true`), or vertically (`false`)?
	**/
	@:optional
	var horizontal : Bool;
	/**
		An optional array containing the color data for this Rope. You should provide one color value per pair of vertices.
	**/
	@:optional
	var colors : Array<Float>;
	/**
		An optional array containing the alpha data for this Rope. You should provide one alpha value per pair of vertices.
	**/
	@:optional
	var alphas : Array<Float>;
};