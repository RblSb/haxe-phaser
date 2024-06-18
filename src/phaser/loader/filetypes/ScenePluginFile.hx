package phaser.loader.filetypes;

/**
	A single Scene Plugin Script File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#scenePlugin method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#scenePlugin.
**/
@:native("Phaser.Loader.FileTypes.ScenePluginFile") extern class ScenePluginFile extends phaser.loader.File {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.ScenePluginFileConfig>, ?url:String, ?systemKey:String, ?sceneKey:String, ?xhrSettings:phaser.types.loader.XHRSettingsObject);
	static var prototype : ScenePluginFile;
}