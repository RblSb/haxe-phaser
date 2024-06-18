package phaser.display;

/**
	The ColorMatrix class creates a 5x4 matrix that can be used in shaders and graphics
	operations. It provides methods required to modify the color values, such as adjusting
	the brightness, setting a sepia tone, hue rotation and more.
	
	Use the method `getData` to return a Float32Array containing the current color values.
**/
@:native("Phaser.Display.ColorMatrix") extern class ColorMatrix {
	function new();
	/**
		The value that determines how much of the original color is used
		when mixing the colors. A value between 0 (all original) and 1 (all final)
	**/
	var alpha : Float;
	/**
		Sets this ColorMatrix from the given array of color values.
	**/
	function set(value:ts.AnyOf2<Array<Float>, js.lib.Float32Array>):ColorMatrix;
	/**
		Resets the ColorMatrix to default values and also resets
		the `alpha` property back to 1.
	**/
	function reset():ColorMatrix;
	/**
		Gets the ColorMatrix as a Float32Array.
		
		Can be used directly as a 1fv shader uniform value.
	**/
	function getData():js.lib.Float32Array;
	/**
		Changes the brightness of this ColorMatrix by the given amount.
	**/
	function brightness(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Changes the saturation of this ColorMatrix by the given amount.
	**/
	function saturate(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Desaturates this ColorMatrix (removes color from it).
	**/
	function saturation(?multiply:Bool):ColorMatrix;
	/**
		Rotates the hues of this ColorMatrix by the value given.
	**/
	function hue(?rotation:Float, ?multiply:Bool):ColorMatrix;
	/**
		Sets this ColorMatrix to be grayscale.
	**/
	function grayscale(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Sets this ColorMatrix to be black and white.
	**/
	function blackWhite(?multiply:Bool):ColorMatrix;
	/**
		Change the contrast of this ColorMatrix by the amount given.
	**/
	function contrast(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Converts this ColorMatrix to have negative values.
	**/
	function negative(?multiply:Bool):ColorMatrix;
	/**
		Apply a desaturated luminance to this ColorMatrix.
	**/
	function desaturateLuminance(?multiply:Bool):ColorMatrix;
	/**
		Applies a sepia tone to this ColorMatrix.
	**/
	function sepia(?multiply:Bool):ColorMatrix;
	/**
		Applies a night vision tone to this ColorMatrix.
	**/
	function night(?intensity:Float, ?multiply:Bool):ColorMatrix;
	/**
		Applies a trippy color tone to this ColorMatrix.
	**/
	function lsd(?multiply:Bool):ColorMatrix;
	/**
		Applies a brown tone to this ColorMatrix.
	**/
	function brown(?multiply:Bool):ColorMatrix;
	/**
		Applies a vintage pinhole color effect to this ColorMatrix.
	**/
	function vintagePinhole(?multiply:Bool):ColorMatrix;
	/**
		Applies a kodachrome color effect to this ColorMatrix.
	**/
	function kodachrome(?multiply:Bool):ColorMatrix;
	/**
		Applies a technicolor color effect to this ColorMatrix.
	**/
	function technicolor(?multiply:Bool):ColorMatrix;
	/**
		Applies a polaroid color effect to this ColorMatrix.
	**/
	function polaroid(?multiply:Bool):ColorMatrix;
	/**
		Shifts the values of this ColorMatrix into BGR order.
	**/
	function shiftToBGR(?multiply:Bool):ColorMatrix;
	/**
		Multiplies the two given matrices.
	**/
	function multiply(a:Array<Float>, ?multiply:Bool):ColorMatrix;
	static var prototype : ColorMatrix;
	/**
		A constant array used by the ColorMatrix class for black_white operations.
	**/
	static final BLACK_WHITE : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for negative operations.
	**/
	static final NEGATIVE : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for desatured luminance operations.
	**/
	static final DESATURATE_LUMINANCE : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for sepia operations.
	**/
	static final SEPIA : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for lsd operations.
	**/
	static final LSD : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for brown operations.
	**/
	static final BROWN : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for vintage pinhole operations.
	**/
	static final VINTAGE : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for kodachrome operations.
	**/
	static final KODACHROME : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for technicolor operations.
	**/
	static final TECHNICOLOR : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for polaroid shift operations.
	**/
	static final POLAROID : Array<Float>;
	/**
		A constant array used by the ColorMatrix class for shift BGR operations.
	**/
	static final SHIFT_BGR : Array<Float>;
}