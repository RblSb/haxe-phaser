package phaser.fx;

/**
	The ColorMatrix FX Controller.
	
	This FX controller manages the color matrix effect for a Game Object.
	
	The color matrix effect is a visual technique that involves manipulating the colors of an image
	or scene using a mathematical matrix. This process can adjust hue, saturation, brightness, and contrast,
	allowing developers to create various stylistic appearances or mood settings within the game.
	Common applications include simulating different lighting conditions, applying color filters,
	or achieving a specific visual style.
	
	A ColorMatrix effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addColorMatrix();
	sprite.postFX.addColorMatrix();
	```
**/
@:native("Phaser.FX.ColorMatrix") extern class ColorMatrix extends phaser.display.ColorMatrix {
	function new(gameObject:phaser.gameobjects.GameObject);
	/**
		The FX_CONST type of this effect.
	**/
	var type : Float;
	/**
		A reference to the Game Object that owns this effect.
	**/
	var gameObject : phaser.gameobjects.GameObject;
	/**
		Toggle this boolean to enable or disable this effect,
		without removing and adding it from the Game Object.
	**/
	var active : Bool;
	/**
		Sets this ColorMatrix from the given array of color values.
	**/
	function set(value:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):ColorMatrix;
	/**
		Resets the ColorMatrix to default values and also resets
		the `alpha` property back to 1.
	**/
	function reset():ColorMatrix;
	/**
		Changes the brightness of this ColorMatrix by the given amount.
	**/
	function brightness(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Changes the saturation of this ColorMatrix by the given amount.
	**/
	function saturate(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Desaturates this ColorMatrix (removes color from it).
	**/
	function saturation(?multiply:Bool):ColorMatrix;
	/**
		Rotates the hues of this ColorMatrix by the value given.
	**/
	function hue(?rotation:Float, ?multiply:Bool):ColorMatrix;
	/**
		Sets this ColorMatrix to be grayscale.
	**/
	function grayscale(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Sets this ColorMatrix to be black and white.
	**/
	function blackWhite(?multiply:Bool):ColorMatrix;
	/**
		Change the contrast of this ColorMatrix by the amount given.
	**/
	function contrast(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Converts this ColorMatrix to have negative values.
	**/
	function negative(?multiply:Bool):ColorMatrix;
	/**
		Apply a desaturated luminance to this ColorMatrix.
	**/
	function desaturateLuminance(?multiply:Bool):ColorMatrix;
	/**
		Applies a sepia tone to this ColorMatrix.
	**/
	function sepia(?multiply:Bool):ColorMatrix;
	/**
		Applies a night vision tone to this ColorMatrix.
	**/
	function night(?intensity:Float, ?multiply:Bool):ColorMatrix;
	/**
		Applies a trippy color tone to this ColorMatrix.
	**/
	function lsd(?multiply:Bool):ColorMatrix;
	/**
		Applies a brown tone to this ColorMatrix.
	**/
	function brown(?multiply:Bool):ColorMatrix;
	/**
		Applies a vintage pinhole color effect to this ColorMatrix.
	**/
	function vintagePinhole(?multiply:Bool):ColorMatrix;
	/**
		Applies a kodachrome color effect to this ColorMatrix.
	**/
	function kodachrome(?multiply:Bool):ColorMatrix;
	/**
		Applies a technicolor color effect to this ColorMatrix.
	**/
	function technicolor(?multiply:Bool):ColorMatrix;
	/**
		Applies a polaroid color effect to this ColorMatrix.
	**/
	function polaroid(?multiply:Bool):ColorMatrix;
	/**
		Shifts the values of this ColorMatrix into BGR order.
	**/
	function shiftToBGR(?multiply:Bool):ColorMatrix;
	/**
		Multiplies the two given matrices.
	**/
	function multiply(a:Array<Float>, ?multiply:Bool):ColorMatrix;
	static var prototype : ColorMatrix;
}