package phaser.types.tilemaps;

typedef CreateFromObjectLayerConfig = {
	/**
		A unique Object ID to convert.
	**/
	@:optional
	var id : Float;
	/**
		An Object GID to convert.
	**/
	@:optional
	var gid : Float;
	/**
		An Object Name to convert.
	**/
	@:optional
	var name : String;
	/**
		An Object Type to convert.
	**/
	@:optional
	var type : String;
	/**
		A custom class type to convert the objects in to. The default is {@link Phaser.GameObjects.Sprite}. A custom class should resemble Sprite or Image; see {@link Phaser.Types.Tilemaps.CreateFromObjectsClassTypeConstructor}.
	**/
	@:optional
	var classType : haxe.Constraints.Function;
	/**
		By default, gid-based objects copy properties and respect the type of the tile at that gid and treat the object as an override. If this is true, they don't, and use only the fields set on the object itself.
	**/
	@:optional
	var ignoreTileset : Bool;
	/**
		A Scene reference, passed to the Game Objects constructors.
	**/
	@:optional
	var scene : phaser.Scene;
	/**
		Optional Container to which the Game Objects are added.
	**/
	@:optional
	var container : phaser.gameobjects.Container;
	/**
		Optional key of a Texture to be used, as stored in the Texture Manager, or a Texture instance. If omitted, the object's gid's tileset key is used if available.
	**/
	@:optional
	var key : ts.AnyOf2<String, phaser.textures.Texture>;
	/**
		Optional name or index of the frame within the Texture. If omitted, the tileset index is used, assuming that spritesheet frames exactly match tileset indices & geometries -- if available.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
};