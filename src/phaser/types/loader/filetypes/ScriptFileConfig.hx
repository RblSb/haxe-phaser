package phaser.types.loader.filetypes;

typedef ScriptFileConfig = {
	/**
		The key of the file. Must be unique within the Loader.
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
		The script type. Should be either 'script' for classic JavaScript, or 'module' if the file contains an exported module.
	**/
	@:optional
	var type : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : phaser.types.loader.XHRSettingsObject;
};