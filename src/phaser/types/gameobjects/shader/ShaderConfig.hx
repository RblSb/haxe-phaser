package phaser.types.gameobjects.shader;

typedef ShaderConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key of the shader to use from the shader cache, or a BaseShader instance.
	**/
	var key : ts.AnyOf2<String, phaser.display.BaseShader>;
	/**
		The width of the Game Object.
	**/
	@:optional
	var width : Float;
	/**
		The height of the Game Object.
	**/
	@:optional
	var height : Float;
};