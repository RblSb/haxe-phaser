package phaser.fx;

/**
	The Bloom FX Controller.
	
	This FX controller manages the bloom effect for a Game Object.
	
	Bloom is an effect used to reproduce an imaging artifact of real-world cameras.
	The effect produces fringes of light extending from the borders of bright areas in an image,
	contributing to the illusion of an extremely bright light overwhelming the
	camera or eye capturing the scene.
	
	A Bloom effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addBloom();
	sprite.postFX.addBloom();
	```
**/
@:native("Phaser.FX.Bloom") extern class Bloom extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?color:Float, ?offsetX:Float, ?offsetY:Float, ?blurStrength:Float, ?strength:Float, ?steps:Float);
	/**
		The number of steps to run the Bloom effect for.
		
		This value should always be an integer.
		
		It defaults to 4. The higher the value, the smoother the Bloom,
		but at the cost of exponentially more gl operations.
		
		Keep this to the lowest possible number you can have it, while
		still looking correct for your game.
	**/
	var steps : Float;
	/**
		The horizontal offset of the bloom effect.
	**/
	var offsetX : Float;
	/**
		The vertical offset of the bloom effect.
	**/
	var offsetY : Float;
	/**
		The strength of the blur process of the bloom effect.
	**/
	var blurStrength : Float;
	/**
		The strength of the blend process of the bloom effect.
	**/
	var strength : Float;
	/**
		The internal gl color array.
	**/
	var glcolor : Array<Float>;
	/**
		The color of the bloom as a number value.
	**/
	var color : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Bloom;
	static var prototype : Bloom;
}