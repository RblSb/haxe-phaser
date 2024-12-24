package phaser.loader.filetypes;

/**
	A single Font File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#font method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#font.
**/
@:native("Phaser.Loader.FileTypes.FontFile") extern class FontFile extends phaser.loader.File {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.FontFileConfig>, ?url:String, ?format:String, ?descriptors:Dynamic, ?xhrSettings:phaser.types.loader.XHRSettingsObject);
	static var prototype : FontFile;
}