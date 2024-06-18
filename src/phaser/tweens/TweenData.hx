package phaser.tweens;

/**
	The TweenData is a class that contains a single target and property that is being tweened.
	
	Tweens create TweenData instances when they are created, with one TweenData instance per
	target, per property. A Tween can own multiple TweenData instances, but a TweenData only
	ever belongs to a single Tween.
	
	You should not typically create these yourself, but rather use the TweenBuilder,
	or the `Tween.add` method.
	
	Prior to Phaser 3.60 the TweenData was just an object, but was refactored to a class,
	to make it responsible for its own state and updating.
**/
@:native("Phaser.Tweens.TweenData") extern class TweenData extends BaseTweenData {
	function new(tween:Tween, targetIndex:Float, key:String, getEnd:phaser.types.tweens.GetEndCallback, getStart:phaser.types.tweens.GetStartCallback, getActive:Null<phaser.types.tweens.GetActiveCallback>, ease:haxe.Constraints.Function, delay:haxe.Constraints.Function, duration:Float, yoyo:Bool, hold:Float, repeat:Float, repeatDelay:Float, flipX:Bool, flipY:Bool, interpolation:Null<haxe.Constraints.Function>, interpolationData:Null<Array<Float>>);
	/**
		The property of the target to be tweened.
	**/
	final key : String;
	/**
		A function that returns what to set the target property to,
		the moment the TweenData is invoked.
		
		This is called when this TweenData is inititalised or reset.
	**/
	@:optional
	dynamic function getActiveValue(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:Tween):Float;
	/**
		A function that returns what to set the target property to
		at the end of the tween.
		
		This is called when the tween starts playing, after any initial
		start delay, or if the tween is reset, or is set to repeat.
	**/
	dynamic function getEndValue(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:Tween):Float;
	/**
		A function that returns what to set the target property to
		at the start of the tween.
		
		This is called when the tween starts playing, after any initial
		start delay, or if the tween is reset, or is set to repeat.
	**/
	dynamic function getStartValue(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:Tween):Float;
	/**
		The ease function this Tween uses to calculate the target value.
	**/
	var ease : haxe.Constraints.Function;
	/**
		The targets starting value, as returned by `getStartValue`.
	**/
	var start : Float;
	/**
		The target value from the previous step.
	**/
	var previous : Float;
	/**
		The targets current value, as recorded in the most recent step.
	**/
	var current : Float;
	/**
		The targets ending value, as returned by `getEndValue`.
	**/
	var end : Float;
	/**
		The interpolation function to be used for arrays of data.
	**/
	var interpolation : Null<haxe.Constraints.Function>;
	/**
		The array of data to interpolate, if interpolation is being used.
	**/
	var interpolationData : Null<Array<Float>>;
	/**
		Internal method that resets this Tween Data entirely, including the progress and elapsed values.
		
		Called automatically by the parent Tween. Should not be called directly.
	**/
	function reset(?isSeeking:Bool):Void;
	/**
		Internal method that advances this TweenData based on the delta value given.
	**/
	function update(delta:Float):Bool;
	/**
		Internal method that will emit a TweenData based Event on the
		parent Tween and also invoke the given callback, if provided.
	**/
	function dispatchEvent(event:String, ?callback:phaser.types.tweens.TweenCallbackTypes):Void;
	static var prototype : TweenData;
}