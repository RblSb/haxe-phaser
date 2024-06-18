package phaser.types.loader.filetypes;

typedef CompressedTextureFileEntry = {
	/**
		The texture compression base format that the browser must support in order to load this file. Can be any of: 'ETC', 'ETC1', 'ATC', 'ASTC', 'BPTC', 'RGTC', 'PVRTC', 'S3TC', 'S3TCSRGB' or the fallback format of 'IMG'.
	**/
	@:optional
	var format : String;
	/**
		The container format, either PVR or KTX. If not given it will try to extract it from the textureURL extension.
	**/
	@:optional
	var type : String;
	/**
		The URL of the compressed texture file to load.
	**/
	@:optional
	var textureURL : String;
	/**
		Optional URL of a texture atlas JSON data file. If not given, the texture will be loaded as a single image.
	**/
	@:optional
	var atlasURL : String;
	/**
		Optional URL of a multi-texture atlas JSON data file as created by Texture Packer Pro.
	**/
	@:optional
	var multiAtlasURL : String;
	/**
		Optional path to use when loading the textures defined in the multi atlas data.
	**/
	@:optional
	var multiPath : String;
	/**
		Optional Base URL to use when loading the textures defined in the multi atlas data.
	**/
	@:optional
	var multiBaseURL : String;
};