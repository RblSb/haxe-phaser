package phaser.types.gameobjects.nineslice;

typedef NineSliceConfig = phaser.types.gameobjects.GameObjectConfig & {
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
		The width of the Nine Slice Game Object. You can adjust the width post-creation.
	**/
	@:optional
	var width : Float;
	/**
		The height of the Nine Slice Game Object. If this is a 3 slice object the height will be fixed to the height of the texture and cannot be changed.
	**/
	@:optional
	var height : Float;
	/**
		The size of the left vertical column (A).
	**/
	@:optional
	var leftWidth : Float;
	/**
		The size of the right vertical column (B).
	**/
	@:optional
	var rightWidth : Float;
	/**
		The size of the top horiztonal row (C). Set to zero or undefined to create a 3 slice object.
	**/
	@:optional
	var topHeight : Float;
	/**
		The size of the bottom horiztonal row (D). Set to zero or undefined to create a 3 slice object.
	**/
	@:optional
	var bottomHeight : Float;
};