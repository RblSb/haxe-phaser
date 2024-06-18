package phaser.renderer.webgl.wrappers;

/**
	Wrapper for a WebGL frame buffer,
	containing all the information that was used to create it.
	
	A WebGLFramebuffer should never be exposed outside the WebGLRenderer,
	so the WebGLRenderer can handle context loss and other events
	without other systems having to be aware of it.
	Always use WebGLFramebufferWrapper instead.
**/
@:native("Phaser.Renderer.WebGL.Wrappers.WebGLFramebufferWrapper") extern class WebGLFramebufferWrapper {
	function new(gl:js.html.webgl.RenderingContext, width:Float, height:Float, renderTexture:WebGLTextureWrapper, ?addDepthStencilBuffer:Bool);
	/**
		The WebGLFramebuffer being wrapped by this class.
		
		This property could change at any time.
		Therefore, you should never store a reference to this value.
		It should only be passed directly to the WebGL API for drawing.
	**/
	var webGLFramebuffer : Null<js.html.webgl.Framebuffer>;
	/**
		The WebGL context this WebGLFramebuffer belongs to.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		Width of the depth stencil.
	**/
	var width : Float;
	/**
		Height of the depth stencil.
	**/
	var height : Float;
	/**
		The color texture where the color pixels are written.
	**/
	var renderTexture : WebGLTextureWrapper;
	/**
		Create a Renderbuffer for the depth stencil?
	**/
	var addDepthStencilBuffer : Bool;
	/**
		Creates a WebGLFramebuffer from the given parameters.
		
		This is called automatically by the constructor. It may also be
		called again if the WebGLFramebuffer needs re-creating.
	**/
	function createResource():Void;
	/**
		Destroys this WebGLFramebufferWrapper.
	**/
	function destroy():Void;
	static var prototype : WebGLFramebufferWrapper;
}