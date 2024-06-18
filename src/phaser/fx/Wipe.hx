package phaser.fx;

/**
	The Wipe FX Controller.
	
	This FX controller manages the wipe effect for a Game Object.
	
	The wipe or reveal effect is a visual technique that gradually uncovers or conceals elements
	in the game, such as images, text, or scene transitions. This effect is often used to create
	a sense of progression, reveal hidden content, or provide a smooth and visually appealing transition
	between game states.
	
	You can set both the direction and the axis of the wipe effect. The following combinations are possible:
	
	* left to right: direction 0, axis 0
	* right to left: direction 1, axis 0
	* top to bottom: direction 1, axis 1
	* bottom to top: direction 1, axis 0
	
	It is up to you to set the `progress` value yourself, i.e. via a Tween, in order to transition the effect.
	
	A Wipe effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addWipe();
	sprite.postFX.addWipe();
	sprite.preFX.addReveal();
	sprite.postFX.addReveal();
	```
**/
@:native("Phaser.FX.Wipe") extern class Wipe extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?wipeWidth:Float, ?direction:Float, ?axis:Float, ?reveal:Bool);
	/**
		The progress of the Wipe effect. This value is normalized to the range 0 to 1.
		
		Adjust this value to make the wipe transition (i.e. via a Tween)
	**/
	var progress : Float;
	/**
		The width of the wipe effect. This value is normalized in the range 0 to 1.
	**/
	var wipeWidth : Float;
	/**
		The direction of the wipe effect. Either 0 or 1. Set in conjunction with the axis property.
	**/
	var direction : Float;
	/**
		The axis of the wipe effect. Either 0 or 1. Set in conjunction with the direction property.
	**/
	var axis : Float;
	/**
		Is this a reveal (true) or a fade (false) effect?
	**/
	var reveal : Bool;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Wipe;
	static var prototype : Wipe;
}