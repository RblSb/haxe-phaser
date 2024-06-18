package phaser.types.textures;

/**
	A Mipmap Data entry for a Compressed Texture.
**/
typedef MipmapType = {
	/**
		The width of this level of the mipmap.
	**/
	var width : Float;
	/**
		The height of this level of the mipmap.
	**/
	var height : Float;
	/**
		The decoded pixel data.
	**/
	var data : js.lib.Uint8Array;
};