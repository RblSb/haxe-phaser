package phaser.renderer.webgl.wrappers;

/**
	Wrapper for a WebGL attribute location, containing all the information that was used to create it.
	
	A WebGLAttribLocation should never be exposed outside the WebGLRenderer,
	so the WebGLRenderer can handle context loss and other events without other systems having to be aware of it.
	Always use WebGLAttribLocationWrapper instead.
**/
@:native("Phaser.Renderer.WebGL.Wrappers.WebGLAttribLocationWrapper") extern class WebGLAttribLocationWrapper {
	function new(gl:js.html.webgl.RenderingContext, program:WebGLProgramWrapper, name:String);
	/**
		The WebGLAttribLocation being wrapped by this class.
		
		This property could change at any time.
		Therefore, you should never store a reference to this value.
		It should only be passed directly to the WebGL API for drawing.
	**/
	var webGLAttribLocation : Float;
	/**
		The WebGLRenderingContext that owns this location.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		The WebGLProgram that this location refers to.
	**/
	var program : WebGLProgramWrapper;
	/**
		The name of this location, as defined in the shader source code.
	**/
	var name : String;
	/**
		Creates the WebGLAttribLocation.
	**/
	function createResource():Void;
	/**
		Destroys this WebGLAttribLocationWrapper.
	**/
	function destroy():Void;
	static var prototype : WebGLAttribLocationWrapper;
}