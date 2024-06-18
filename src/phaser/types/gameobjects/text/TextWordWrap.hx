package phaser.types.gameobjects.text;

/**
	A Text Word Wrap configuration object as used by the Text Style configuration.
**/
typedef TextWordWrap = {
	/**
		The width at which text should be considered for word-wrapping.
	**/
	@:optional
	var width : Float;
	/**
		Provide a custom callback when word wrapping is enabled.
	**/
	@:optional
	dynamic function callback(text:String, textObject:phaser.gameobjects.Text):ts.AnyOf2<String, Array<String>>;
	/**
		The context in which the word wrap callback is invoked.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		Use basic or advanced word wrapping?
	**/
	@:optional
	var useAdvancedWrap : Bool;
};