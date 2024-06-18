package phaser.fx;

/**
	The Shine FX Controller.
	
	This FX controller manages the shift effect for a Game Object.
	
	The shine effect is a visual technique that simulates the appearance of reflective
	or glossy surfaces by passing a light beam across a Game Object. This effect is used to
	enhance visual appeal, emphasize certain features, and create a sense of depth or
	material properties.
	
	A Shine effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addShine();
	sprite.postFX.addShine();
	```
**/
@:native("Phaser.FX.Shine") extern class Shine extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?speed:Float, ?lineWidth:Float, ?gradient:Float, ?reveal:Bool);
	/**
		The speed of the Shine effect.
	**/
	var speed : Float;
	/**
		The line width of the Shine effect.
	**/
	var lineWidth : Float;
	/**
		The gradient of the Shine effect.
	**/
	var gradient : Float;
	/**
		Does this Shine effect reveal or get added to its target?
	**/
	var reveal : Bool;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Shine;
	static var prototype : Shine;
}