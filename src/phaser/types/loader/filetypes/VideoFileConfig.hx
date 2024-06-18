package phaser.types.loader.filetypes;

typedef VideoFileConfig = {
	/**
		The key to use for this file, or a file configuration object.
	**/
	var key : ts.AnyOf2<String, VideoFileConfig>;
	/**
		The absolute or relative URLs to load the video files from.
	**/
	@:optional
	var url : ts.AnyOf4<String, Array<String>, VideoFileURLConfig, Array<VideoFileURLConfig>>;
	/**
		Does the video have an audio track? If not you can enable auto-playing on it.
	**/
	@:optional
	var noAudio : Bool;
};