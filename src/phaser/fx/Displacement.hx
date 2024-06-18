package phaser.fx;

/**
	The Displacement FX Controller.
	
	This FX controller manages the displacement effect for a Game Object.
	
	The displacement effect is a visual technique that alters the position of pixels in an image
	or texture based on the values of a displacement map. This effect is used to create the illusion
	of depth, surface irregularities, or distortion in otherwise flat elements. It can be applied to
	characters, objects, or backgrounds to enhance realism, convey movement, or achieve various
	stylistic appearances.
	
	A Displacement effect is added to a Game Object via the FX component:
	
	```js
	const sprite = this.add.sprite();
	
	sprite.preFX.addDisplacement();
	sprite.postFX.addDisplacement();
	```
**/
@:native("Phaser.FX.Displacement") extern class Displacement extends Controller {
	function new(gameObject:phaser.gameobjects.GameObject, ?texture:String, ?x:Float, ?y:Float);
	/**
		The amount of horizontal displacement to apply.
	**/
	var x : Float;
	/**
		The amount of vertical displacement to apply.
	**/
	var y : Float;
	/**
		The underlying texture used for displacement.
	**/
	var glTexture : phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Sets the Texture to be used for the displacement effect.
		
		You can only use a whole texture, not a frame from a texture atlas or sprite sheet.
	**/
	function setTexture(?texture:String):Displacement;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Displacement;
	static var prototype : Displacement;
}