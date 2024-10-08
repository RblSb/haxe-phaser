package phaser.loader.filetypes;

/**
	A single Plugin Script File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#plugin method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#plugin.
**/
@:native("Phaser.Loader.FileTypes.PluginFile") extern class PluginFile extends phaser.loader.File {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.PluginFileConfig>, ?url:String, ?start:Bool, ?mapping:String, ?xhrSettings:phaser.types.loader.XHRSettingsObject);
	static var prototype : PluginFile;
}