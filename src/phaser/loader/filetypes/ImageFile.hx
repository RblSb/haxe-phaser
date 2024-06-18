package phaser.loader.filetypes;

/**
	A single Image File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#image method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#image.
**/
@:native("Phaser.Loader.FileTypes.ImageFile") extern class ImageFile extends phaser.loader.File {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.ImageFileConfig>, ?url:ts.AnyOf2<String, Array<String>>, ?xhrSettings:phaser.types.loader.XHRSettingsObject, ?frameConfig:phaser.types.loader.filetypes.ImageFrameConfig);
	static var prototype : ImageFile;
}