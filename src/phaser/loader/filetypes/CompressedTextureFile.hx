package phaser.loader.filetypes;

/**
	A Compressed Texture File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#texture method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#texture.
**/
@:native("Phaser.Loader.FileTypes.CompressedTextureFile") extern class CompressedTextureFile extends phaser.loader.MultiFile {
	function new(loader:phaser.loader.LoaderPlugin, key:String, entry:phaser.types.loader.filetypes.CompressedTextureFileEntry, ?xhrSettings:phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	/**
		Adds all of the multi-file entties to their target caches upon successful loading and processing.
	**/
	function addMultiToCache():Void;
	static var prototype : CompressedTextureFile;
}