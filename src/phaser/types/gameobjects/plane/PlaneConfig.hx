package phaser.types.gameobjects.plane;

typedef PlaneConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key, or instance of the Texture this Game Object will use to render with, as stored in the Texture Manager.
	**/
	@:optional
	var key : ts.AnyOf2<String, phaser.textures.Texture>;
	/**
		An optional frame from the Texture this Game Object is rendering with.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
	/**
		The width of this Plane, in cells, not pixels.
	**/
	@:optional
	var width : Float;
	/**
		The height of this Plane, in cells, not pixels.
	**/
	@:optional
	var height : Float;
	/**
		Is the texture tiled? I.e. repeated across each cell.
	**/
	@:optional
	var tile : Bool;
	/**
		Plane checkerboard configuration object.
	**/
	@:optional
	var checkerboard : PlaneCheckerboardConfig;
};