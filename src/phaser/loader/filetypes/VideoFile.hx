package phaser.loader.filetypes;

/**
	A single Video File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#video method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#video.
**/
@:native("Phaser.Loader.FileTypes.VideoFile") extern class VideoFile extends phaser.loader.File {
	function new(loader:phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, phaser.types.loader.filetypes.VideoFileConfig>, ?urls:ts.AnyOf4<String, Array<String>, phaser.types.loader.filetypes.VideoFileURLConfig, Array<phaser.types.loader.filetypes.VideoFileURLConfig>>, ?noAudio:Bool);
	static var prototype : VideoFile;
}