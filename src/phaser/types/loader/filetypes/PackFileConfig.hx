package phaser.types.loader.filetypes;

typedef PackFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the JSON Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from. Or can be a ready formed JSON object, in which case it will be directly processed.
	**/
	@:optional
	var url : Dynamic;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		If specified instead of the whole JSON file being parsed, only the section corresponding to this property key will be added. If the property you want to extract is nested, use periods to divide it.
	**/
	@:optional
	var dataKey : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : phaser.types.loader.XHRSettingsObject;
};