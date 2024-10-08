package phaser.types.loader.filetypes;

typedef SceneFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Text Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from.
	**/
	@:optional
	var url : String;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : phaser.types.loader.XHRSettingsObject;
};