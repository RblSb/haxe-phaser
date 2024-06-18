package phaser.fx;

/**
	The Barrel FX Controller.
	
	This FX controller manages the barrel distortion effect for a Game Object.
	
	A barrel effect allows you to apply either a 'pinch' or 'expand' distortion to
	a Game Object. The amount of the effect can be modified in real-time.
	
	A Barrel effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addBarrel();
	sprite.postFX.addBarrel();
	```
**/
@:native("Phaser.FX.Barrel") extern class Barrel extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?amount:Float);
	/**
		The amount of distortion applied to the barrel effect.
		
		Typically keep this within the range 1 (no distortion) to +- 1.
	**/
	var amount : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Barrel;
	static var prototype : Barrel;
}