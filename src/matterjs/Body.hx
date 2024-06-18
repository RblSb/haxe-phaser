package matterjs;

/**
	The `Matter.Body` module contains methods for creating and manipulating body models.
	A `Matter.Body` is a rigid body that can be simulated by a `Matter.Engine`.
	Factories for commonly used body configurations (such as rectangles, circles and other polygons) can be found in the module `Matter.Bodies`.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Body") extern class Body {
	function new();
	static var prototype : Body;
	/**
		Applies a force to a body from a given world-space position, including resulting torque.
	**/
	static function applyForce(body:BodyType, position:Vector, force:Vector):Void;
	/**
		Updates properties `body.velocity`, `body.speed`, `body.angularVelocity` and `body.angularSpeed` which are normalised in relation to `Body._baseDelta`.
	**/
	static function updateVelocities(body:BodyType):Void;
	/**
		Creates a new rigid body model. The options parameter is an object that specifies any properties you wish to override the defaults.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	static function create(options:IChamferableBodyDefinition):Body;
	/**
		Rotates a body by a given angle relative to its current angle, without imparting any angular velocity.
	**/
	static function rotate(body:BodyType, rotation:Float, ?updateVelocity:Bool):Void;
	/**
		Returns the next unique group index for which bodies will collide.
		If `isNonColliding` is `true`, returns the next unique group index for which bodies will _not_ collide.
		See `body.collisionFilter` for more information.
	**/
	static function nextGroup(isNonColliding:Bool):Float;
	/**
		Returns the next unique category bitfield (starting after the initial default category `0x0001`).
		There are 32 available. See `body.collisionFilter` for more information.
	**/
	static function nextCategory():Float;
	/**
		Given a property and a value (or map of), sets the property(s) on the body, using the appropriate setter functions if they exist.
		Prefer to use the actual setter functions in performance critical situations.
	**/
	static function set(body:BodyType, settings:Dynamic, ?value:Dynamic):Void;
	/**
		Sets the mass of the body. Inverse mass and density are automatically updated to reflect the change.
	**/
	static function setMass(body:BodyType, mass:Float):Void;
	/**
		Sets the density of the body. Mass is automatically updated to reflect the change.
	**/
	static function setDensity(body:BodyType, density:Float):Void;
	/**
		Sets the moment of inertia (i.e. second moment of area) of the body of the body.
		Inverse inertia is automatically updated to reflect the change. Mass is not changed.
	**/
	static function setInertia(body:BodyType, inertia:Float):Void;
	/**
		Sets the body's vertices and updates body properties accordingly, including inertia, area and mass (with respect to `body.density`).
		Vertices will be automatically transformed to be orientated around their centre of mass as the origin.
		They are then automatically translated to world space based on `body.position`.
		
		The `vertices` argument should be passed as an array of `Matter.Vector` points (or a `Matter.Vertices` array).
		Vertices must form a convex hull, concave hulls are not supported.
	**/
	static function setVertices(body:BodyType, vertices:Array<Vector>):Void;
	/**
		Sets the parts of the `body` and updates mass, inertia and centroid.
		Each part will have its parent set to `body`.
		By default the convex hull will be automatically computed and set on `body`, unless `autoHull` is set to `false.`
		Note that this method will ensure that the first part in `body.parts` will always be the `body`.
	**/
	static function setParts(body:BodyType, parts:Array<BodyType>, ?autoHull:Bool):Void;
	/**
		Set the centre of mass of the body.
		The `centre` is a vector in world-space unless `relative` is set, in which case it is a translation.
		The centre of mass is the point the body rotates about and can be used to simulate non-uniform density.
		This is equal to moving `body.position` but not the `body.vertices`.
		Invalid if the `centre` falls outside the body's convex hull.
	**/
	static function setCentre(body:BodyType, centre:Vector, relative:Bool):Void;
	/**
		Sets the position of the body instantly. Velocity, angle, force etc. are unchanged.
	**/
	static function setPosition(body:BodyType, position:Vector, updateVelocity:Bool):Void;
	/**
		Sets the angle of the body instantly. Angular velocity, position, force etc. are unchanged.
	**/
	static function setAngle(body:BodyType, angle:Float, updateVelocity:Bool):Void;
	/**
		Sets the linear velocity of the body instantly. Position, angle, force etc. are unchanged. See also `Body.applyForce`.
	**/
	static function setVelocity(body:BodyType, velocity:Vector):Void;
	/**
		Sets the angular velocity of the body instantly. Position, angle, force etc. are unchanged. See also `Body.applyForce`.
	**/
	static function setAngularVelocity(body:BodyType, velocity:Float):Void;
	/**
		Sets the body as static, including isStatic flag and setting mass and inertia to Infinity.
	**/
	static function setStatic(body:BodyType, isStatic:Bool):Void;
	/**
		Scales the body, including updating physical properties (mass, area, axes, inertia), from a world-space point (default is body centre).
	**/
	static function scale(body:BodyType, scaleX:Float, scaleY:Float, ?point:Vector):Void;
	/**
		Moves a body by a given vector relative to its current position, without imparting any velocity.
	**/
	static function translate(body:BodyType, translation:Vector, ?updateVelocity:Bool):Void;
	/**
		Performs a simulation step for the given `body`, including updating position and angle using Verlet integration.
	**/
	static function update(body:BodyType, deltaTime:Float):Void;
	/**
		Gets the current linear speed of the body.
		Equivalent to the magnitude of its velocity.
	**/
	static function getSpeed(body:BodyType):Float;
	/**
		Sets the current linear speed of the body.
		Direction is maintained. Affects body velocity.
	**/
	static function setSpeed(body:BodyType, speed:Float):Void;
	/**
		Gets the current rotational velocity of the body.
	**/
	static function getAngularVelocity(body:BodyType):Float;
	/**
		Gets the current rotational velocity of the body.
	**/
	static function getAngularSpeed(body:BodyType):Float;
	/**
		Sets the angular velocity of the body instantly. Position, angle, force etc. are unchanged. See also `Body.applyForce`.
	**/
	static function setAngularSpeed(body:BodyType, velocity:Float):Void;
}