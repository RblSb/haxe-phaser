package phaser.types.renderer.webgl;

typedef WebGLPipelineUniformsConfig = {
	/**
		The name of the uniform as defined in the shader.
	**/
	var name : String;
	/**
		The location of the uniform.
	**/
	var location : Float;
	/**
		The setter function called on the WebGL context to set the uniform value.
	**/
	var setter : Null<haxe.Constraints.Function>;
	/**
		The first cached value of the uniform.
	**/
	@:optional
	var value1 : Float;
	/**
		The first cached value of the uniform.
	**/
	@:optional
	var value2 : Float;
	/**
		The first cached value of the uniform.
	**/
	@:optional
	var value3 : Float;
	/**
		The first cached value of the uniform.
	**/
	@:optional
	var value4 : Float;
};