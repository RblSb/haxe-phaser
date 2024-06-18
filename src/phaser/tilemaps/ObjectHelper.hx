package phaser.tilemaps;

/**
	The ObjectHelper helps tie objects with `gids` into the tileset
	that sits behind them.
**/
@:native("Phaser.Tilemaps.ObjectHelper") extern class ObjectHelper {
	function new(tilesets:Array<Tileset>);
	/**
		The Tile GIDs array.
	**/
	var gids : Array<Dynamic>;
	/**
		Enabled if the object helper reaches in to tilesets for data.
		Disabled if it only uses data directly on a gid object.
	**/
	var enabled : Bool;
	/**
		Gets the Tiled `type` field value from the object or the `gid` behind it.
	**/
	function getTypeIncludingTile(obj:phaser.types.tilemaps.TiledObject):Null<String>;
	/**
		Sets the sprite texture data as specified (usually in a config) or, failing that,
		as specified in the `gid` of the object being loaded (if any).
		
		This fallback will only work if the tileset was loaded as a spritesheet matching
		the geometry of sprites fed into tiled, so that, for example: "tile id #`3`"" within
		the tileset is the same as texture frame `3` from the image of the tileset.
	**/
	function setTextureAndFrame(sprite:phaser.gameobjects.GameObject, ?key:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf3<String, Float, phaser.textures.Frame>, ?obj:phaser.types.tilemaps.TiledObject):Void;
	/**
		Sets the `sprite.data` field from the tiled properties on the object and its tile (if any).
	**/
	function setPropertiesFromTiledObject(sprite:phaser.gameobjects.GameObject, obj:phaser.types.tilemaps.TiledObject):Void;
	static var prototype : ObjectHelper;
}