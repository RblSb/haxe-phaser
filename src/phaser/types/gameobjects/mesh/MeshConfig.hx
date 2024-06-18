package phaser.types.gameobjects.mesh;

typedef MeshConfig = phaser.types.gameobjects.GameObjectConfig & {
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
		The vertices array. Either `xy` pairs, or `xyz` if the `containsZ` parameter is `true`.
	**/
	@:optional
	var vertices : Array<Float>;
	/**
		The UVs pairs array.
	**/
	@:optional
	var uvs : Array<Float>;
	/**
		Optional vertex indicies array. If you don't have one, pass `null` or an empty array.
	**/
	@:optional
	var indicies : Array<Float>;
	/**
		Does the vertices data include a `z` component?
	**/
	@:optional
	var containsZ : Bool;
	/**
		Optional vertex normals array. If you don't have one, pass `null` or an empty array.
	**/
	@:optional
	var normals : Array<Float>;
	/**
		An array of colors, one per vertex, or a single color value applied to all vertices.
	**/
	@:optional
	var colors : ts.AnyOf2<Float, Array<Float>>;
	/**
		An array of alpha values, one per vertex, or a single alpha value applied to all vertices.
	**/
	@:optional
	var alphas : ts.AnyOf2<Float, Array<Float>>;
};