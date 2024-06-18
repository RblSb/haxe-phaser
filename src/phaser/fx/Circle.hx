package phaser.fx;

/**
	The Circle FX Controller.
	
	This FX controller manages the circle effect for a Game Object.
	
	This effect will draw a circle around the texture of the Game Object, effectively masking off
	any area outside of the circle without the need for an actual mask. You can control the thickness
	of the circle, the color of the circle and the color of the background, should the texture be
	transparent. You can also control the feathering applied to the circle, allowing for a harsh or soft edge.
	
	Please note that adding this effect to a Game Object will not change the input area or physics body of
	the Game Object, should it have one.
	
	A Circle effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addCircle();
	sprite.postFX.addCircle();
	```
**/
@:native("Phaser.FX.Circle") extern class Circle extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?thickness:Float, ?color:Float, ?backgroundColor:Float, ?scale:Float, ?feather:Float);
	/**
		The scale of the circle. The default scale is 1, which is a circle
		the full size of the underlying texture. Reduce this value to create
		a smaller circle, or increase it to create a circle that extends off
		the edges of the texture.
	**/
	var scale : Float;
	/**
		The amount of feathering to apply to the circle from the ring,
		extending into the middle of the circle. The default is 0.005,
		which is a very low amount of feathering just making sure the ring
		has a smooth edge. Increase this amount to a value such as 0.5
		or 0.025 for larger amounts of feathering.
	**/
	var feather : Float;
	/**
		The width of the circle around the texture, in pixels. This value
		doesn't factor in the feather, which can extend the thickness
		internally depending on its value.
	**/
	var thickness : Float;
	/**
		The internal gl color array for the ring color.
	**/
	var glcolor : Array<Float>;
	/**
		The internal gl color array for the background color.
	**/
	var glcolor2 : Array<Float>;
	/**
		The color of the circular ring, given as a number value.
	**/
	var color : Float;
	/**
		The color of the background, behind the texture, given as a number value.
	**/
	var backgroundColor : Float;
	/**
		The alpha of the background, behind the texture, given as a number value.
	**/
	var backgroundAlpha : Float;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Circle;
	static var prototype : Circle;
}