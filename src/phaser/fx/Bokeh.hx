package phaser.fx;

/**
	The Bokeh FX Controller.
	
	This FX controller manages the bokeh effect for a Game Object.
	
	Bokeh refers to a visual effect that mimics the photographic technique of creating a shallow depth of field.
	This effect is used to emphasize the game's main subject or action, by blurring the background or foreground
	elements, resulting in a more immersive and visually appealing experience. It is achieved through rendering
	techniques that simulate the out-of-focus areas, giving a sense of depth and realism to the game's graphics.
	
	This effect can also be used to generate a Tilt Shift effect, which is a technique used to create a miniature
	effect by blurring everything except a small area of the image. This effect is achieved by blurring the
	top and bottom elements, while keeping the center area in focus.
	
	A Bokeh effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addBokeh();
	sprite.postFX.addBokeh();
	```
**/
@:native("Phaser.FX.Bokeh") extern class Bokeh extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?radius:Float, ?amount:Float, ?contrast:Float, ?isTiltShift:Bool, ?blurX:Float, ?blurY:Float, ?strength:Float);
	/**
		The radius of the bokeh effect.
		
		This is a float value, where a radius of 0 will result in no effect being applied,
		and a radius of 1 will result in a strong bokeh. However, you can exceed this value
		for even stronger effects.
	**/
	var radius : Float;
	/**
		The amount, or strength, of the bokeh effect. Defaults to 1.
	**/
	var amount : Float;
	/**
		The color contrast, or brightness, of the bokeh effect. Defaults to 0.2.
	**/
	var contrast : Float;
	/**
		Is this a Tilt Shift effect or a standard bokeh effect?
	**/
	var isTiltShift : Bool;
	/**
		If a Tilt Shift effect this controls the strength of the blur.
		
		Setting this value on a non-Tilt Shift effect will have no effect.
	**/
	var strength : Float;
	/**
		If a Tilt Shift effect this controls the amount of horizontal blur.
		
		Setting this value on a non-Tilt Shift effect will have no effect.
	**/
	var blurX : Float;
	/**
		If a Tilt Shift effect this controls the amount of vertical blur.
		
		Setting this value on a non-Tilt Shift effect will have no effect.
	**/
	var blurY : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Bokeh;
	static var prototype : Bokeh;
}