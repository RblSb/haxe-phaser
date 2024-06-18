package phaser.types.tweens;

typedef NumberTweenBuilderConfig = {
	/**
		The start number.
	**/
	@:optional
	var from : Float;
	/**
		The end number.
	**/
	@:optional
	var to : Float;
	/**
		The number of milliseconds to delay before the counter will start.
	**/
	@:optional
	var delay : Float;
	/**
		The duration of the counter in milliseconds.
	**/
	@:optional
	var duration : Float;
	/**
		The easing equation to use for the counter.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		Optional easing parameters.
	**/
	@:optional
	var easeParams : Array<Dynamic>;
	/**
		The number of milliseconds to hold the counter for before yoyo'ing.
	**/
	@:optional
	var hold : Float;
	/**
		The number of times to repeat the counter.
	**/
	@:optional
	var repeat : Float;
	/**
		The number of milliseconds to pause before the counter will repeat.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Should the counter play forward to the end value and then backwards to the start? The reverse playback will also take `duration` milliseconds to complete.
	**/
	@:optional
	var yoyo : Bool;
	/**
		The time the counter will wait before the onComplete event is dispatched once it has completed, in ms.
	**/
	@:optional
	var completeDelay : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		The number of times the counter will repeat. (A value of 1 means the counter will play twice, as it repeated once.)
	**/
	@:optional
	var loop : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		The time the counter will pause before starting either a yoyo or returning to the start for a repeat.
	**/
	@:optional
	var loopDelay : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		Does the counter start in a paused state (true) or playing (false)?
	**/
	@:optional
	var paused : Bool;
	/**
		Scope (this) for the callbacks. The default scope is the counter.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		A function to call when the counter completes.
	**/
	@:optional
	dynamic function onComplete(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onComplete`.
	**/
	@:optional
	var onCompleteParams : Array<Dynamic>;
	/**
		A function to call each time the counter loops.
	**/
	@:optional
	dynamic function onLoop(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onLoop`.
	**/
	@:optional
	var onLoopParams : Array<Dynamic>;
	/**
		A function to call each time the counter repeats.
	**/
	@:optional
	dynamic function onRepeat(tween:phaser.tweens.Tween, target:Dynamic, key:String, current:Float, previous:Float, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onRepeat`.
	**/
	@:optional
	var onRepeatParams : Array<Dynamic>;
	/**
		A function to call when the counter starts.
	**/
	@:optional
	dynamic function onStart(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onStart`.
	**/
	@:optional
	var onStartParams : Array<Dynamic>;
	/**
		A function to call when the counter is stopped.
	**/
	@:optional
	dynamic function onStop(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onStop`.
	**/
	@:optional
	var onStopParams : Array<Dynamic>;
	/**
		A function to call each time the counter steps.
	**/
	@:optional
	dynamic function onUpdate(tween:phaser.tweens.Tween, target:Dynamic, key:String, current:Float, previous:Float, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onUpdate`.
	**/
	@:optional
	var onUpdateParams : Array<Dynamic>;
	/**
		A function to call each time the counter yoyos.
	**/
	@:optional
	dynamic function onYoyo(tween:phaser.tweens.Tween, target:Dynamic, key:String, current:Float, previous:Float, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onYoyo`.
	**/
	@:optional
	var onYoyoParams : Array<Dynamic>;
	/**
		A function to call when the counter is paused.
	**/
	@:optional
	dynamic function onPause(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onPause`.
	**/
	@:optional
	var onPauseParams : Array<Dynamic>;
	/**
		A function to call when the counter is resumed after being paused.
	**/
	@:optional
	dynamic function onResume(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onResume`.
	**/
	@:optional
	var onResumeParams : Array<Dynamic>;
	/**
		Will the counter be automatically destroyed on completion, or retained for future playback?
	**/
	@:optional
	var persist : Bool;
	/**
		The interpolation function to use if the `value` given is an array of numbers.
	**/
	@:optional
	var interpolation : ts.AnyOf2<String, haxe.Constraints.Function>;
};