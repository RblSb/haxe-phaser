package phaser.types.tilemaps;

typedef TiledObject = {
	/**
		The unique object ID.
	**/
	var id : Float;
	/**
		The name this object was assigned in Tiled.
	**/
	var name : String;
	/**
		The string type of this instance, as assigned in Tiled. Tiled supports inheriting instance types from tilesets; in that case, the type will be set in the tile's data, but will be `''` here; use the `gid` to fetch the tile data or properties.
	**/
	var type : String;
	/**
		The visible state of this object.
	**/
	@:optional
	var visible : Bool;
	/**
		The horizontal position of this object, in pixels, relative to the tilemap.
	**/
	@:optional
	var x : Float;
	/**
		The vertical position of this object, in pixels, relative to the tilemap.
	**/
	@:optional
	var y : Float;
	/**
		The width of this object, in pixels.
	**/
	@:optional
	var width : Float;
	/**
		The height of this object, in pixels.
	**/
	@:optional
	var height : Float;
	/**
		The rotation of the object in clockwise degrees.
	**/
	@:optional
	var rotation : Float;
	/**
		Custom properties object.
	**/
	@:optional
	var properties : Dynamic;
	/**
		Only set if of type 'tile'.
	**/
	@:optional
	var gid : Float;
	/**
		Only set if a tile object. The horizontal flip value.
	**/
	@:optional
	var flippedHorizontal : Bool;
	/**
		Only set if a tile object. The vertical flip value.
	**/
	@:optional
	var flippedVertical : Bool;
	/**
		Only set if a tile object. The diagonal flip value.
	**/
	@:optional
	var flippedAntiDiagonal : Bool;
	/**
		Only set if a polyline object. An array of objects corresponding to points, where each point has an `x` property and a `y` property.
	**/
	@:optional
	var polyline : Array<phaser.types.math.Vector2Like>;
	/**
		Only set if a polygon object. An array of objects corresponding to points, where each point has an `x` property and a `y` property.
	**/
	@:optional
	var polygon : Array<phaser.types.math.Vector2Like>;
	/**
		Only set if a text object. Contains the text objects properties.
	**/
	@:optional
	var text : Dynamic;
	/**
		Only set, and set to `true`, if a rectangle object.
	**/
	@:optional
	var rectangle : Bool;
	/**
		Only set, and set to `true`, if a ellipse object.
	**/
	@:optional
	var ellipse : Bool;
	/**
		Only set, and set to `true`, if a point object.
	**/
	@:optional
	var point : Bool;
};