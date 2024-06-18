package phaser.tilemaps.parsers;

@:native("Phaser.Tilemaps.Parsers.Tiled") @valueModuleOnly extern class Tiled {
	/**
		Copy properties from tileset to tiles.
	**/
	static function AssignTileProperties(mapData:phaser.tilemaps.MapData):Void;
	/**
		Decode base-64 encoded data, for example as exported by Tiled.
	**/
	static function Base64Decode(data:Dynamic):Array<Dynamic>;
	/**
		Master list of tiles -> x, y, index in tileset.
	**/
	static function BuildTilesetIndex(mapData:ts.AnyOf2<phaser.tilemaps.Tilemap, phaser.tilemaps.MapData>):Array<Dynamic>;
	/**
		Parse a Tiled group layer and create a state object for inheriting.
	**/
	static function CreateGroupLayer(json:Dynamic, ?group:Dynamic, ?parentState:Dynamic):Dynamic;
	/**
		See Tiled documentation on tile flipping:
		http://docs.mapeditor.org/en/latest/reference/tmx-map-format/
	**/
	static function ParseGID(gid:Float):phaser.types.tilemaps.GIDData;
	/**
		Parses a Tiled JSON object into an array of objects with details about the image layers.
	**/
	static function ParseImageLayers(json:Dynamic):Array<Dynamic>;
	/**
		Parses a Tiled JSON object into a new MapData object.
	**/
	static function ParseJSONTiled(name:String, source:Dynamic, insertNull:Bool):Null<phaser.tilemaps.MapData>;
	/**
		Convert a Tiled object to an internal parsed object normalising and copying properties over, while applying optional x and y offsets. The parsed object will always have the properties `id`, `name`, `type`, `rotation`, `properties`, `visible`, `x`, `y`, `width` and `height`. Other properties will be added according to the object type (such as text, polyline, gid etc.)
	**/
	static function ParseObject(tiledObject:Dynamic, ?offsetX:Float, ?offsetY:Float):Dynamic;
	/**
		Parses a Tiled JSON object into an array of ObjectLayer objects.
	**/
	static function ParseObjectLayers(json:Dynamic):Array<Dynamic>;
	/**
		Parses all tilemap layers in a Tiled JSON object into new LayerData objects.
	**/
	static function ParseTileLayers(json:Dynamic, insertNull:Bool):Array<phaser.tilemaps.LayerData>;
	/**
		Tilesets and Image Collections.
	**/
	static function ParseTilesets(json:Dynamic):Dynamic;
	/**
		Parses out the Wangset information from Tiled 1.1.5+ map data, if present.
		
		Since a given tile can be in more than one wangset, the resulting properties
		are nested. `tile.data.wangid[someWangsetName]` will return the array-based wang id in
		this implementation.
		
		Note that we're not guaranteed that there will be any 'normal' tiles if the only
		thing in the tilset are wangtile definitions, so this has to be parsed separately.
		
		See https://doc.mapeditor.org/en/latest/manual/using-wang-tiles/ for more information.
	**/
	static function ParseWangsets(wangsets:Array<Dynamic>, datas:Dynamic):Dynamic;
}