package phaser.types.loader;

typedef FileConfig = {
	/**
		The name of the Loader method that loads this file, e.g., 'image', 'json', 'spritesheet'.
	**/
	var type : String;
	/**
		Unique cache key (unique within its file type)
	**/
	var key : String;
	/**
		The URL of the file, not including baseURL.
	**/
	@:optional
	var url : ts.AnyOf2<String, Dynamic>;
	/**
		The path of the file, not including the baseURL.
	**/
	@:optional
	var path : String;
	/**
		The default extension this file uses.
	**/
	@:optional
	var extension : String;
	/**
		The responseType to be used by the XHR request.
	**/
	@:optional
	var responseType : js.html.XMLHttpRequestResponseType;
	/**
		Custom XHR Settings specific to this file and merged with the Loader defaults.
	**/
	@:optional
	var xhrSettings : ts.AnyOf2<Bool, XHRSettingsObject>;
	/**
		A config object that can be used by file types to store transitional data.
	**/
	@:optional
	var config : Dynamic;
	/**
		The absolute or relative URL to load the texture image file from.
	**/
	@:optional
	var textureURL : String;
	/**
		The default file extension to use for the image texture if no url is provided.
	**/
	@:optional
	var textureExtension : String;
	/**
		Extra XHR Settings specifically for the texture image file.
	**/
	@:optional
	var textureXhrSettings : XHRSettingsObject;
	/**
		The absolute or relative URL to load the atlas json file from. Or, a well formed JSON object to use instead.
	**/
	@:optional
	var atlasURL : ts.AnyOf2<String, Dynamic>;
	/**
		The default file extension to use for the atlas json if no url is provided.
	**/
	@:optional
	var atlasExtension : String;
	/**
		Extra XHR Settings specifically for the atlas json file.
	**/
	@:optional
	var atlasXhrSettings : XHRSettingsObject;
	/**
		The filename of an associated normal map. It uses the same path and url to load as the texture image.
	**/
	@:optional
	var normalMap : String;
	/**
		The optional AudioContext this file will use to process itself (only used by Sound objects).
	**/
	@:optional
	var context : js.html.audio.AudioContext;
	/**
		The absolute or relative URL to load the json file from. Or a well formed JSON object to use instead.
	**/
	@:optional
	var jsonURL : String;
	/**
		Extra XHR Settings specifically for the json file.
	**/
	@:optional
	var jsonXhrSettings : XHRSettingsObject;
	/**
		The absolute or relative URL to load the audio file from.
	**/
	@:optional
	var audioURL : Dynamic;
	/**
		The audio configuration options.
	**/
	@:optional
	var audioConfig : Dynamic;
	/**
		Extra XHR Settings specifically for the audio file.
	**/
	@:optional
	var audioXhrSettings : XHRSettingsObject;
	/**
		Optional type to cast the binary file to once loaded. For example, `Uint8Array`.
	**/
	@:optional
	var dataType : Dynamic;
	/**
		The absolute or relative URL to load the font data xml file from.
	**/
	@:optional
	var fontDataURL : String;
	/**
		The default file extension to use for the font data xml if no url is provided.
	**/
	@:optional
	var fontDataExtension : String;
	/**
		Extra XHR Settings specifically for the font data xml file.
	**/
	@:optional
	var fontDataXhrSettings : XHRSettingsObject;
	/**
		The string, or file entry object, for an ETC format texture.
	**/
	@:optional
	var ETC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an ETC1 format texture.
	**/
	@:optional
	var ETC1 : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an ATC format texture.
	**/
	@:optional
	var ATC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an ASTC format texture.
	**/
	@:optional
	var ASTC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an BPTC format texture.
	**/
	@:optional
	var BPTC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an RGTC format texture.
	**/
	@:optional
	var RGTC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an PVRTC format texture.
	**/
	@:optional
	var PVRTC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an S3TC format texture.
	**/
	@:optional
	var S3TC : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an S3TCSRGB format texture.
	**/
	@:optional
	var S3TCSRGB : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for the fallback image file.
	**/
	@:optional
	var IMG : ts.AnyOf2<String, phaser.types.loader.filetypes.CompressedTextureFileEntry>;
	/**
		The type of shader. Either `fragment` for a fragment shader, or `vertex` for a vertex shader. This is ignored if you load a shader bundle.
	**/
	@:optional
	var shaderType : String;
	/**
		The width of the texture the HTML will be rendered to.
	**/
	@:optional
	var width : Float;
	/**
		The height of the texture the HTML will be rendered to.
	**/
	@:optional
	var height : Float;
	/**
		The frame configuration object. Only provided for, and used by, Sprite Sheets.
	**/
	@:optional
	var frameConfig : phaser.types.loader.filetypes.ImageFrameConfig;
	/**
		If specified instead of the whole JSON file being parsed and added to the Cache, only the section corresponding to this property key will be added. If the property you want to extract is nested, use periods to divide it.
	**/
	@:optional
	var dataKey : String;
	/**
		Optional Base URL to use when loading the textures defined in the atlas data.
	**/
	@:optional
	var baseURL : String;
	/**
		Flip the UV coordinates stored in the model data?
	**/
	@:optional
	var flipUV : Bool;
	/**
		An optional absolute or relative URL to the object material file from. If undefined or `null`, no material file will be loaded.
	**/
	@:optional
	var matURL : String;
	/**
		The default material file extension to use if no url is provided.
	**/
	@:optional
	var matExtension : String;
	/**
		Automatically start the plugin after loading?
	**/
	@:optional
	var start : Bool;
	/**
		If this plugin is to be injected into the Scene, this is the property key used.
	**/
	@:optional
	var mapping : String;
	/**
		If this plugin is to be added to Scene.Systems, this is the property key for it.
	**/
	@:optional
	var systemKey : String;
	/**
		If this plugin is to be added to the Scene, this is the property key for it.
	**/
	@:optional
	var sceneKey : String;
	/**
		The svg size configuration object.
	**/
	@:optional
	var svgConfig : phaser.types.loader.filetypes.SVGSizeConfig;
};