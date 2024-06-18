package phaser.fx;

/**
	The Shadow FX Controller.
	
	This FX controller manages the shadow effect for a Game Object.
	
	The shadow effect is a visual technique used to create the illusion of depth and realism by adding darker,
	offset silhouettes or shapes beneath game objects, characters, or environments. These simulated shadows
	help to enhance the visual appeal and immersion, making the 2D game world appear more dynamic and three-dimensional.
	
	A Shadow effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addShadow();
	sprite.postFX.addShadow();
	```
**/
@:native("Phaser.FX.Shadow") extern class Shadow extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?x:Float, ?y:Float, ?decay:Float, ?power:Float, ?color:Float, ?samples:Float, ?intensity:Float);
	/**
		The horizontal offset of the shadow effect.
	**/
	var x : Float;
	/**
		The vertical offset of the shadow effect.
	**/
	var y : Float;
	/**
		The amount of decay for the shadow effect.
	**/
	var decay : Float;
	/**
		The power of the shadow effect.
	**/
	var power : Float;
	/**
		The internal gl color array.
	**/
	var glcolor : Array<Float>;
	/**
		The number of samples that the shadow effect will run for.
		
		This should be an integer with a minimum value of 1 and a maximum of 12.
	**/
	var samples : Float;
	/**
		The intensity of the shadow effect.
	**/
	var intensity : Float;
	/**
		The color of the shadow.
	**/
	var color : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Shadow;
	static var prototype : Shadow;
}