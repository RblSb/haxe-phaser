package phaser.fx;

/**
	FX Controller is the base class that all built-in FX use.
	
	You should not normally create an instance of this class directly, but instead use one of the built-in FX that extend it.
**/
@:native("Phaser.FX.Controller") extern class Controller {
	function new(type:Float, gameObject:phaser.gameobjects.GameObject);
	/**
		The FX_CONST type of this effect.
	**/
	var type : Float;
	/**
		A reference to the Game Object that owns this effect.
	**/
	var gameObject : phaser.gameobjects.GameObject;
	/**
		Toggle this boolean to enable or disable this effect,
		without removing and adding it from the Game Object.
		
		Only works for Pre FX.
		
		Post FX are always active.
	**/
	var active : Bool;
	/**
		Sets the active state of this FX Controller.
		
		A disabled FX Controller will not be updated.
	**/
	function setActive(value:Bool):Controller;
	/**
		Destroys this FX Controller.
	**/
	function destroy():Void;
	static var prototype : Controller;
}