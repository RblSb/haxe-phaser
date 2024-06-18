package phaser.fx;

/**
	The Vignette FX Controller.
	
	This FX controller manages the vignette effect for a Game Object.
	
	The vignette effect is a visual technique where the edges of the screen, or a Game Object, gradually darken or blur,
	creating a frame-like appearance. This effect is used to draw the player's focus towards the central action or subject,
	enhance immersion, and provide a cinematic or artistic quality to the game's visuals.
	
	A Vignette effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addVignette();
	sprite.postFX.addVignette();
	```
**/
@:native("Phaser.FX.Vignette") extern class Vignette extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?x:Float, ?y:Float, ?radius:Float, ?strength:Float);
	/**
		The horizontal offset of the vignette effect. This value is normalized to the range 0 to 1.
	**/
	var x : Float;
	/**
		The vertical offset of the vignette effect. This value is normalized to the range 0 to 1.
	**/
	var y : Float;
	/**
		The radius of the vignette effect. This value is normalized to the range 0 to 1.
	**/
	var radius : Float;
	/**
		The strength of the vignette effect.
	**/
	var strength : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Vignette;
	static var prototype : Vignette;
}