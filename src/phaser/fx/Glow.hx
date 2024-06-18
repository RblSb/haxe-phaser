package phaser.fx;

/**
	The Glow FX Controller.
	
	This FX controller manages the glow effect for a Game Object.
	
	The glow effect is a visual technique that creates a soft, luminous halo around game objects,
	characters, or UI elements. This effect is used to emphasize importance, enhance visual appeal,
	or convey a sense of energy, magic, or otherworldly presence. The effect can also be set on
	the inside of the Game Object. The color and strength of the glow can be modified.
	
	A Glow effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addGlow();
	sprite.postFX.addGlow();
	```
**/
@:native("Phaser.FX.Glow") extern class Glow extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?color:Float, ?outerStrength:Float, ?innerStrength:Float, ?knockout:Bool);
	/**
		The strength of the glow outward from the edge of the Sprite.
	**/
	var outerStrength : Float;
	/**
		The strength of the glow inward from the edge of the Sprite.
	**/
	var innerStrength : Float;
	/**
		If `true` only the glow is drawn, not the texture itself.
	**/
	var knockout : Float;
	/**
		A 4 element array of gl color values.
	**/
	var glcolor : Array<Float>;
	/**
		The color of the glow as a number value.
	**/
	var color : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Glow;
	static var prototype : Glow;
}