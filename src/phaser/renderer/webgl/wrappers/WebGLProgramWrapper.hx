package phaser.renderer.webgl.wrappers;

/**
	Wrapper for a WebGL program, containing all the information that was used to create it.
	
	A WebGLProgram should never be exposed outside the WebGLRenderer, so the WebGLRenderer
	can handle context loss and other events without other systems having to be aware of it.
	Always use WebGLProgramWrapper instead.
**/
@:native("Phaser.Renderer.WebGL.Wrappers.WebGLProgramWrapper") extern class WebGLProgramWrapper {
	function new(gl:js.html.webgl.RenderingContext, vertexSource:String, fragmentShader:String);
	/**
		The WebGLProgram being wrapped by this class.
		
		This property could change at any time.
		Therefore, you should never store a reference to this value.
		It should only be passed directly to the WebGL API for drawing.
	**/
	var webGLProgram : Null<js.html.webgl.Program>;
	/**
		The WebGLRenderingContext that owns this WebGLProgram.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		The vertex shader source code as a string.
	**/
	var vertexSource : String;
	/**
		The fragment shader source code as a string.
	**/
	var fragmentSource : String;
	/**
		Creates a WebGLProgram from the given vertex and fragment shaders.
		
		This is called automatically by the constructor. It may also be
		called again if the WebGLProgram needs re-creating.
	**/
	function createResource():Void;
	/**
		Remove this WebGLProgram from the GL context.
	**/
	function destroy():Void;
	static var prototype : WebGLProgramWrapper;
}