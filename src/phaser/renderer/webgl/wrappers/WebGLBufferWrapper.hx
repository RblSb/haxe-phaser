package phaser.renderer.webgl.wrappers;

/**
	Wrapper for a WebGL buffer, containing all the information that was used
	to create it. This can be a VertexBuffer or IndexBuffer.
	
	A WebGLBuffer should never be exposed outside the WebGLRenderer, so the
	WebGLRenderer can handle context loss and other events without other
	systems having to be aware of it. Always use WebGLBufferWrapper instead.
**/
@:native("Phaser.Renderer.WebGL.Wrappers.WebGLBufferWrapper") extern class WebGLBufferWrapper {
	function new(gl:js.html.webgl.RenderingContext, initialDataOrSize:ts.AnyOf2<Float, js.lib.ArrayBuffer>, bufferType:Float, bufferUsage:Float);
	/**
		The WebGLBuffer being wrapped by this class.
		
		This property could change at any time.
		Therefore, you should never store a reference to this value.
		It should only be passed directly to the WebGL API for drawing.
	**/
	var webGLBuffer : Null<js.html.webgl.Buffer>;
	/**
		The WebGLRenderingContext that owns this WebGLBuffer.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		The initial data or size of the buffer.
		
		Note that this will be used to recreate the buffer if the WebGL context is lost.
	**/
	var initialDataOrSize : ts.AnyOf2<Float, js.lib.ArrayBuffer>;
	/**
		The type of the buffer.
	**/
	var bufferType : Float;
	/**
		The usage of the buffer. gl.DYNAMIC_DRAW, gl.STATIC_DRAW or gl.STREAM_DRAW.
	**/
	var bufferUsage : Float;
	/**
		Creates a WebGLBuffer for this WebGLBufferWrapper.
		
		This is called automatically by the constructor. It may also be
		called again if the WebGLBuffer needs re-creating.
	**/
	function createResource():Void;
	/**
		Remove this WebGLBufferWrapper from the GL context.
	**/
	function destroy():Void;
	static var prototype : WebGLBufferWrapper;
}