package phaser.tilemaps.parsers;

@:native("Phaser.Tilemaps.Parsers.Impact") @valueModuleOnly extern class Impact {
	/**
		Parses all tilemap layers in an Impact JSON object into new LayerData objects.
	**/
	static function ParseTileLayers(json:Dynamic, insertNull:Bool):Array<phaser.tilemaps.LayerData>;
	/**
		Tilesets and Image Collections
	**/
	static function ParseTilesets(json:Dynamic):Array<Dynamic>;
	/**
		Parses a Weltmeister JSON object into a new MapData object.
	**/
	static function ParseWeltmeister(name:String, json:Dynamic, insertNull:Bool):Null<phaser.tilemaps.MapData>;
}