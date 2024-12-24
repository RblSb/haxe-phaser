package phaser.types.core;

typedef PipelineConfig = ts.AnyOf2<Array<phaser.renderer.webgl.WebGLPipeline>, haxe.DynamicAccess<{
	var prototype : phaser.renderer.webgl.WebGLPipeline;
}>>;