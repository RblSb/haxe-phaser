package phaser.types.renderer.webgl;

typedef WebGLPipelineBatchEntry = {
	/**
		The vertext count this batch entry starts from.
	**/
	var start : Float;
	/**
		The total number of vertices in this batch entry.
	**/
	var count : Float;
	/**
		The current texture unit of the batch entry.
	**/
	var unit : Float;
	/**
		The maximum number of texture units in this batch entry.
	**/
	var maxUnit : Float;
	/**
		An array of WebGLTextureWrapper references used in this batch entry.
	**/
	var texture : Array<phaser.renderer.webgl.wrappers.WebGLTextureWrapper>;
};