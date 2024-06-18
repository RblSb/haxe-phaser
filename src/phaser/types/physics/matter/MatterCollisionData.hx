package phaser.types.physics.matter;

typedef MatterCollisionData = {
	/**
		Have the pair collided or not?
	**/
	var collided : Bool;
	/**
		A reference to the first body involved in the collision.
	**/
	var bodyA : matterjs.BodyType;
	/**
		A reference to the second body involved in the collision.
	**/
	var bodyB : matterjs.BodyType;
	/**
		A reference to the dominant axis body.
	**/
	var axisBody : matterjs.BodyType;
	/**
		The index of the dominant collision axis vector (edge normal)
	**/
	var axisNumber : Float;
	/**
		The depth of the collision on the minimum overlap.
	**/
	var depth : Float;
	/**
		A reference to the parent of Body A, or to Body A itself if it has no parent.
	**/
	var parentA : matterjs.BodyType;
	/**
		A reference to the parent of Body B, or to Body B itself if it has no parent.
	**/
	var parentB : matterjs.BodyType;
	/**
		The collision normal, facing away from Body A.
	**/
	var normal : matterjs.Vector;
	/**
		The tangent of the collision normal.
	**/
	var tangent : matterjs.Vector;
	/**
		The penetration distances between the two bodies.
	**/
	var penetration : matterjs.Vector;
	/**
		An array of support points, either exactly one or two points.
	**/
	var supports : Array<matterjs.Vector>;
	/**
		The resulting inverse mass from the collision.
	**/
	var inverseMass : Float;
	/**
		The resulting friction from the collision.
	**/
	var friction : Float;
	/**
		The resulting static friction from the collision.
	**/
	var frictionStatic : Float;
	/**
		The resulting restitution from the collision.
	**/
	var restitution : Float;
	/**
		The resulting slop from the collision.
	**/
	var slop : Float;
};