package phaser.fx;

/**
	The Gradient FX Controller.
	
	This FX controller manages the gradient effect for a Game Object.
	
	The gradient overlay effect is a visual technique where a smooth color transition is applied over Game Objects,
	such as sprites or UI components. This effect is used to enhance visual appeal, emphasize depth, or create
	stylistic and atmospheric variations. It can also be utilized to convey information, such as representing
	progress or health status through color changes.
	
	A Gradient effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addGradient();
	sprite.postFX.addGradient();
	```
**/
@:native("Phaser.FX.Gradient") extern class Gradient extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?color1:Float, ?color2:Float, ?alpha:Float, ?fromX:Float, ?fromY:Float, ?toX:Float, ?toY:Float, ?size:Float);
	/**
		The alpha value of the gradient effect.
	**/
	var alpha : Float;
	/**
		Sets how many 'chunks' the gradient is divided in to, as spread over the
		entire height of the texture. Leave this at zero for a smooth gradient,
		or set to a higher number to split the gradient into that many sections, giving
		a more banded 'retro' effect.
	**/
	var size : Float;
	/**
		The horizontal position the gradient will start from. This value is normalized, between 0 and 1 and is not in pixels.
	**/
	var fromX : Float;
	/**
		The vertical position the gradient will start from. This value is normalized, between 0 and 1 and is not in pixels.
	**/
	var fromY : Float;
	/**
		The horizontal position the gradient will end. This value is normalized, between 0 and 1 and is not in pixels.
	**/
	var toX : Float;
	/**
		The vertical position the gradient will end. This value is normalized, between 0 and 1 and is not in pixels.
	**/
	var toY : Float;
	/**
		The internal gl color array for the starting color.
	**/
	var glcolor1 : Array<Float>;
	/**
		The internal gl color array for the ending color.
	**/
	var glcolor2 : Array<Float>;
	/**
		The first gradient color, given as a number value.
	**/
	var color1 : Float;
	/**
		The second gradient color, given as a number value.
	**/
	var color2 : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Gradient;
	static var prototype : Gradient;
}