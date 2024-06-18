package phaser.types.loader.filetypes;

typedef AudioFileConfig = {
	/**
		The key of the file. Must be unique within the Loader and Audio Cache.
	**/
	var key : String;
	/**
		The absolute or relative URLs to load the audio files from.
	**/
	@:optional
	var url : ts.AnyOf4<String, Array<String>, AudioFileURLConfig, Array<AudioFileURLConfig>>;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : phaser.types.loader.XHRSettingsObject;
	/**
		The optional AudioContext this file will use to process itself.
	**/
	@:optional
	var context : js.html.audio.AudioContext;
};