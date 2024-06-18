package phaser.types.textures;

/**
	An object containing the dimensions and mipmap data for a Compressed Texture.
**/
typedef CompressedTextureData = {
	/**
		Is this a compressed texture?
	**/
	var compressed : Bool;
	/**
		Should this texture have mipmaps generated?
	**/
	var generateMipmap : Bool;
	/**
		The width of the maximum size of the texture.
	**/
	var width : Float;
	/**
		The height of the maximum size of the texture.
	**/
	var height : Float;
	/**
		The WebGL internal texture format.
	**/
	var internalFormat : Float;
	/**
		An array of MipmapType objects.
	**/
	var mipmaps : Array<MipmapType>;
};