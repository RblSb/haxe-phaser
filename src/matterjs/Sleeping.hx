package matterjs;

/**
	The `Matter.Sleeping` module contains methods to manage the sleeping state of bodies.
**/
@:native("MatterJS.Sleeping") extern class Sleeping {
	function new();
	static var prototype : Sleeping;
	/**
		Set a body as sleeping or awake.
	**/
	static function set(body:BodyType, isSleeping:Bool):Void;
	/**
		Puts bodies to sleep or wakes them up depending on their motion.
	**/
	static function update(bodies:Array<BodyType>, delta:Float):Void;
	/**
		Given a set of colliding pairs, wakes the sleeping bodies involved.
	**/
	static function afterCollisions(pairs:Array<IPair>):Void;
}