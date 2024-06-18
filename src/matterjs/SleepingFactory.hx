package matterjs;

@:native("MatterJS.SleepingFactory") extern class SleepingFactory {
	function new();
	/**
		Set a body as sleeping or awake.
	**/
	function set(body:BodyType, isSleeping:Bool):Void;
	/**
		Puts bodies to sleep or wakes them up depending on their motion.
	**/
	function update(bodies:Array<BodyType>, delta:Float):Void;
	/**
		Given a set of colliding pairs, wakes the sleeping bodies involved.
	**/
	function afterCollisions(pairs:Array<IPair>):Void;
	static var prototype : SleepingFactory;
}