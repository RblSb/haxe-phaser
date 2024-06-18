package phaser.types.core;

typedef PipelineConfig = {
	/**
		The name of the pipeline. Must be unique within the Pipeline Manager.
	**/
	var name : String;
	/**
		The pipeline class. This should be a constructable object, **not** an instance of a class.
	**/
	var pipeline : phaser.renderer.webgl.WebGLPipeline;
	/**
		Sets the `PipelineManager.frameInc` value to control the dimension increase in the Render Targets.
	**/
	@:optional
	var frameInc : Float;
};