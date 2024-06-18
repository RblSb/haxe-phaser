package matterjs;

@:native("MatterJS.Collision") extern class Collision {
	function new();
	/**
		Creates a new collision record.
	**/
	function create(bodyA:BodyType, bodyB:BodyType):Dynamic;
	/**
		Detect collision between two bodies.
	**/
	function collides(bodyA:BodyType, bodyB:BodyType, pairs:Pairs):Dynamic;
	static var prototype : Collision;
}