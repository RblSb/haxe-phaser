package phaser.types.renderer.webgl;

typedef RenderTargetConfig = {
	/**
		A value between 0 and 1. Controls the size of this Render Target in relation to the Renderer. A value of 1 matches it. 0.5 makes the Render Target half the size of the renderer, etc.
	**/
	@:optional
	var scale : Float;
	/**
		The minFilter mode of the texture. 0 is `LINEAR`, 1 is `NEAREST`.
	**/
	@:optional
	var minFilter : Float;
	/**
		Controls if this Render Target is automatically cleared (via `gl.COLOR_BUFFER_BIT`) during the bind.
	**/
	@:optional
	var autoClear : Bool;
	/**
		Controls if this Render Target is automatically resized when the Renderer resizes.
	**/
	@:optional
	var autoResize : Bool;
	/**
		The width of the Render Target. This is optional. If given it overrides the `scale` property.
	**/
	@:optional
	var width : Float;
	/**
		The height of the Render Target. This is optional. If not given, it will be set to the same as the `width` value.
	**/
	@:optional
	var height : Float;
};