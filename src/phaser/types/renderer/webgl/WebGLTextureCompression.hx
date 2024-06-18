package phaser.types.renderer.webgl;

typedef WebGLTextureCompression = {
	/**
		Indicates if ASTC compression is supported (mostly iOS).
	**/
	var ASTC : Null<Dynamic>;
	/**
		Indicates if ATC compression is supported.
	**/
	var ATC : Null<Dynamic>;
	/**
		Indicates if BPTC compression is supported.
	**/
	var BPTC : Null<Dynamic>;
	/**
		Indicates if ETC compression is supported (mostly Android).
	**/
	var ETC : Null<Dynamic>;
	/**
		Indicates if ETC1 compression is supported (mostly Android).
	**/
	var ETC1 : Null<Dynamic>;
	/**
		Indicates the browser supports true color images (all browsers).
	**/
	var IMG : Null<Dynamic>;
	/**
		Indicates if PVRTC compression is supported (mostly iOS).
	**/
	var PVRTC : Null<Dynamic>;
	/**
		Indicates if RGTC compression is supported (mostly iOS).
	**/
	var RGTC : Null<Dynamic>;
	/**
		Indicates if S3TC compression is supported on current device (mostly Windows).
	**/
	var S3TC : Null<Dynamic>;
	/**
		Indicates if S3TCSRGB compression is supported on current device (mostly Windows).
	**/
	var S3TCSRGB : Null<Dynamic>;
};