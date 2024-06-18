package phaser.fx;

/**
	The Pixelate FX Controller.
	
	This FX controller manages the pixelate effect for a Game Object.
	
	The pixelate effect is a visual technique that deliberately reduces the resolution or detail of an image,
	creating a blocky or mosaic appearance composed of large, visible pixels. This effect can be used for stylistic
	purposes, as a homage to retro gaming, or as a means to obscure certain elements within the game, such as
	during a transition or to censor specific content.
	
	A Pixelate effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addPixelate();
	sprite.postFX.addPixelate();
	```
**/
@:native("Phaser.FX.Pixelate") extern class Pixelate extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?amount:Float);
	/**
		The amount of pixelation to apply.
	**/
	var amount : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Pixelate;
	static var prototype : Pixelate;
}