package phaser.types.gameobjects.particles;

/**
	Defines an operation yielding a value incremented continuously across an interpolated data set.
**/
typedef EmitterOpInterpolationConfig = {
	/**
		The array of number values to interpolate through.
	**/
	var values : Array<Float>;
	/**
		The interpolation function to use. Typically one of `linear`, `bezier` or `catmull` or a custom function.
	**/
	@:optional
	var interpolation : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		An optional ease function to use. This can be either a string from the EaseMap, or a custom function.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		An optional array of ease parameters to go with the ease.
	**/
	@:optional
	var easeParams : Array<Float>;
};