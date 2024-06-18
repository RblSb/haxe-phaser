package phaser.fx;

/**
	The Blur FX Controller.
	
	This FX controller manages the blur effect for a Game Object.
	
	A Gaussian blur is the result of blurring an image by a Gaussian function. It is a widely used effect,
	typically to reduce image noise and reduce detail. The visual effect of this blurring technique is a
	smooth blur resembling that of viewing the image through a translucent screen, distinctly different
	from the bokeh effect produced by an out-of-focus lens or the shadow of an object under usual illumination.
	
	A Blur effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addBlur();
	sprite.postFX.addBlur();
	```
**/
@:native("Phaser.FX.Blur") extern class Blur extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?quality:Float, ?x:Float, ?y:Float, ?strength:Float, ?color:Float, ?steps:Float);
	/**
		The quality of the blur effect.
		
		This can be:
		
		0 for Low Quality
		1 for Medium Quality
		2 for High Quality
		
		The higher the quality, the more complex shader is used
		and the more processing time is spent on the GPU calculating
		the final blur. This value is used in conjunction with the
		`steps` value, as one has a direct impact on the other.
		
		Keep this value as low as you can, while still achieving the
		desired effect you need for your game.
	**/
	var quality : Float;
	/**
		The horizontal offset of the blur effect.
	**/
	var x : Float;
	/**
		The vertical offset of the blur effect.
	**/
	var y : Float;
	/**
		The number of steps to run the Blur effect for.
		
		This value should always be an integer.
		
		It defaults to 4. The higher the value, the smoother the blur,
		but at the cost of exponentially more gl operations.
		
		Keep this to the lowest possible number you can have it, while
		still looking correct for your game.
	**/
	var steps : Float;
	/**
		The strength of the blur effect.
	**/
	var strength : Float;
	/**
		The internal gl color array.
	**/
	var glcolor : Array<Float>;
	/**
		The color of the blur as a number value.
	**/
	var color : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Blur;
	static var prototype : Blur;
}