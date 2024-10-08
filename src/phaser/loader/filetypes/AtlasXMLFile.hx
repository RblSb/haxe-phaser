package phaser.loader.filetypes;

/**
	A single XML based Texture Atlas File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#atlasXML method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#atlasXML.
**/
@:native("Phaser.Loader.FileTypes.AtlasXMLFile") extern class AtlasXMLFile extends phaser.loader.MultiFile {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.AtlasXMLFileConfig>, ?textureURL:ts.AnyOf2<String, Array<String>>, ?atlasURL:String, ?textureXhrSettings:phaser.types.loader.XHRSettingsObject, ?atlasXhrSettings:phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : AtlasXMLFile;
}