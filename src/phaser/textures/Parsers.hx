package phaser.textures;

@:native("Phaser.Textures.Parsers") @valueModuleOnly extern class Parsers {
	/**
		Parses a KTX format Compressed Texture file and generates texture data suitable for WebGL from it.
	**/
	static function KTXParser(data:js.lib.ArrayBuffer):phaser.types.textures.CompressedTextureData;
	/**
		Parses a PVR format Compressed Texture file and generates texture data suitable for WebGL from it.
	**/
	static function PVRParser(data:js.lib.ArrayBuffer):phaser.types.textures.CompressedTextureData;
	/**
		Verify whether the given compressed texture data is valid.
		
		Compare the dimensions of each mip layer to the rules for that
		specific format.
		
		Mip layer size is assumed to have been calculated correctly during parsing.
	**/
	static function verifyCompressedTexture(data:phaser.types.textures.CompressedTextureData):Bool;
}