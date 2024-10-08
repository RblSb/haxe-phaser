package phaser.loader.filetypes;

/**
	A single Bitmap Font based File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#bitmapFont method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#bitmapFont.
**/
@:native("Phaser.Loader.FileTypes.BitmapFontFile") extern class BitmapFontFile extends phaser.loader.MultiFile {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.BitmapFontFileConfig>, ?textureURL:ts.AnyOf2<String, Array<String>>, ?fontDataURL:String, ?textureXhrSettings:phaser.types.loader.XHRSettingsObject, ?fontDataXhrSettings:phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : BitmapFontFile;
}