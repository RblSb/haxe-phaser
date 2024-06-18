package phaser.renderer.webgl.wrappers;

/**
	Wrapper for a WebGL texture, containing all the information that was used
	to create it.
	
	A WebGLTexture should never be exposed outside the WebGLRenderer,
	so the WebGLRenderer can handle context loss and other events
	without other systems having to be aware of it.
	Always use WebGLTextureWrapper instead.
**/
@:native("Phaser.Renderer.WebGL.Wrappers.WebGLTextureWrapper") extern class WebGLTextureWrapper {
	function new(gl:js.html.webgl.RenderingContext, mipLevel:Float, minFilter:Float, magFilter:Float, wrapT:Float, wrapS:Float, format:Float, pixels:Null<Dynamic>, width:Float, height:Float, ?pma:Bool, ?forceSize:Bool, ?flipY:Bool);
	/**
		The WebGLTexture that this wrapper is wrapping.
		
		This property could change at any time.
		Therefore, you should never store a reference to this value.
		It should only be passed directly to the WebGL API for drawing.
	**/
	var webGLTexture : Null<js.html.webgl.Texture>;
	/**
		Whether this is used as a RenderTexture.
	**/
	var isRenderTexture : Bool;
	/**
		The WebGL context this WebGLTexture belongs to.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		Mip level of the texture.
	**/
	var mipLevel : Float;
	/**
		Filtering of the texture.
	**/
	var minFilter : Float;
	/**
		Filtering of the texture.
	**/
	var magFilter : Float;
	/**
		Wrapping mode of the texture.
	**/
	var wrapT : Float;
	/**
		Wrapping mode of the texture.
	**/
	var wrapS : Float;
	/**
		Which format does the texture use.
	**/
	var format : Float;
	/**
		Pixel data. This is the source data used to create the WebGLTexture.
	**/
	var pixels : Null<Dynamic>;
	/**
		Width of the texture in pixels.
	**/
	var width : Float;
	/**
		Height of the texture in pixels.
	**/
	var height : Float;
	/**
		Does the texture have premultiplied alpha?
	**/
	var pma : Bool;
	/**
		Whether to use the width and height properties, regardless of pixel dimensions.
	**/
	var forceSize : Bool;
	/**
		Sets the `UNPACK_FLIP_Y_WEBGL` flag the WebGL Texture uses during upload.
	**/
	var flipY : Bool;
	/**
		Creates a WebGLTexture from the given parameters.
		
		This is called automatically by the constructor. It may also be
		called again if the WebGLTexture needs re-creating.
	**/
	function createResource():Void;
	/**
		Updates the WebGLTexture from an updated source.
		
		This should only be used when the source is a Canvas or Video element.
	**/
	function update(source:Null<Dynamic>, width:Float, height:Float, flipY:Bool, wrapS:Float, wrapT:Float, minFilter:Float, magFilter:Float, format:Float):Void;
	/**
		The `__SPECTOR_Metadata` property of the `WebGLTexture`,
		used to add extra data to the debug SpectorJS integration.
	**/
	var spectorMetadata : Dynamic;
	/**
		Deletes the WebGLTexture from the GPU, if it has not been already.
	**/
	function destroy():Void;
	static var prototype : WebGLTextureWrapper;
}