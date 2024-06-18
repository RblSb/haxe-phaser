package matterjs;

@:native("MatterJS.ConstraintFactory") extern class ConstraintFactory {
	function new();
	/**
		Creates a new constraint.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	function create(options:IConstraintDefinition):ConstraintType;
	/**
		Returns the current length of the constraint.
		This is the distance between both of the constraint's end points.
		See `constraint.length` for the target rest length.
	**/
	function currentLength(constraint:ConstraintType):Float;
	static var prototype : ConstraintFactory;
}