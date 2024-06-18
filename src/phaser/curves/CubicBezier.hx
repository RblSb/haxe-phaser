package phaser.curves;

/**
	A higher-order Bézier curve constructed of four points.
**/
@:native("Phaser.Curves.CubicBezier") extern class CubicBezier extends Curve {
	function new(p0:ts.AnyOf2<phaser.math.Vector2, Array<phaser.math.Vector2>>, p1:phaser.math.Vector2, p2:phaser.math.Vector2, p3:phaser.math.Vector2);
	/**
		The start point of this curve.
	**/
	var p0 : phaser.math.Vector2;
	/**
		The first control point of this curve.
	**/
	var p1 : phaser.math.Vector2;
	/**
		The second control point of this curve.
	**/
	var p2 : phaser.math.Vector2;
	/**
		The end point of this curve.
	**/
	var p3 : phaser.math.Vector2;
	/**
		Returns the resolution of this curve.
	**/
	function getResolution(divisions:Float):Float;
	/**
		Get point at relative position in curve according to length.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Returns a JSON object that describes this curve.
	**/
	function toJSON():phaser.types.curves.JSONCurve;
	static var prototype : CubicBezier;
	/**
		Generates a curve from a JSON object.
	**/
	static function fromJSON(data:phaser.types.curves.JSONCurve):CubicBezier;
}