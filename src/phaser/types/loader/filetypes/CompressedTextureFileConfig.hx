package phaser.types.loader.filetypes;

typedef CompressedTextureFileConfig = {
	/**
		The string, or file entry object, for an ETC format texture.
	**/
	@:optional
	var ETC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an ETC1 format texture.
	**/
	@:optional
	var ETC1 : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an ATC format texture.
	**/
	@:optional
	var ATC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an ASTC format texture.
	**/
	@:optional
	var ASTC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an BPTC format texture.
	**/
	@:optional
	var BPTC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an RGTC format texture.
	**/
	@:optional
	var RGTC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an PVRTC format texture.
	**/
	@:optional
	var PVRTC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an S3TC format texture.
	**/
	@:optional
	var S3TC : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for an S3TCSRGB format texture.
	**/
	@:optional
	var S3TCSRGB : ts.AnyOf2<String, CompressedTextureFileEntry>;
	/**
		The string, or file entry object, for the fallback image file.
	**/
	@:optional
	var IMG : ts.AnyOf2<String, CompressedTextureFileEntry>;
};