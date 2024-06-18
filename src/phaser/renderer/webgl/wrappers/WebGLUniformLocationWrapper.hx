package phaser.renderer.webgl.wrappers;

/**
	Wrapper for a WebGL uniform location, containing all the information that was used to create it.
	
	A WebGLUniformLocation should never be exposed outside the WebGLRenderer,
	so the WebGLRenderer can handle context loss and other events without other systems having to be aware of it.
	Always use WebGLUniformLocationWrapper instead.
**/
@:native("Phaser.Renderer.WebGL.Wrappers.WebGLUniformLocationWrapper") extern class WebGLUniformLocationWrapper {
	function new(gl:js.html.webgl.RenderingContext, program:WebGLProgramWrapper, name:String);
	/**
		The WebGLUniformLocation being wrapped by this class.
		
		This property could change at any time.
		Therefore, you should never store a reference to this value.
		It should only be passed directly to the WebGL API for drawing.
	**/
	var webGLUniformLocation : Null<js.html.webgl.UniformLocation>;
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
		Creates the WebGLUniformLocation.
	**/
	function createResource():Void;
	/**
		Destroys this WebGLUniformLocationWrapper.
	**/
	function destroy():Void;
	static var prototype : WebGLUniformLocationWrapper;
}