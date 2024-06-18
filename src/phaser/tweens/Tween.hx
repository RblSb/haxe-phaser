package phaser.tweens;

/**
	A Tween is able to manipulate the properties of one or more objects to any given value, based
	on a duration and type of ease. They are rarely instantiated directly and instead should be
	created via the TweenManager.
	
	Please note that a Tween will not manipulate any property that begins with an underscore.
**/
@:native("Phaser.Tweens.Tween") extern class Tween extends BaseTween {
	function new(parent:TweenManager, targets:Array<Dynamic>);
	/**
		An array of references to the target/s this Tween is operating on.
		
		This array should not be manipulated outside of this Tween.
	**/
	var targets : Array<Dynamic>;
	/**
		Cached target total.
		
		Used internally and should be treated as read-only.
		
		This is not necessarily the same as the data total.
	**/
	var totalTargets : Float;
	/**
		Is this Tween currently seeking?
		
		This boolean is toggled in the `Tween.seek` method.
		
		When a tween is seeking, by default it will not dispatch any events or callbacks.
	**/
	final isSeeking : Bool;
	/**
		Does this Tween loop or repeat infinitely?
	**/
	final isInfinite : Bool;
	/**
		Elapsed time in milliseconds of this run through of the Tween.
	**/
	var elapsed : Float;
	/**
		Total elapsed time in milliseconds of the entire Tween, including looping.
	**/
	var totalElapsed : Float;
	/**
		Time in milliseconds for the whole Tween to play through once, excluding loop amounts and loop delays.
		
		This value is set in the `Tween.initTweenData` method and is zero before that point.
	**/
	var duration : Float;
	/**
		Value between 0 and 1. The amount of progress through the Tween, excluding loops.
	**/
	var progress : Float;
	/**
		Time in milliseconds it takes for the Tween to complete a full playthrough (including looping)
		
		For an infinite Tween, this value is a very large integer.
	**/
	var totalDuration : Float;
	/**
		The amount of progress that has been made through the entire Tween, including looping.
		
		A value between 0 and 1.
	**/
	var totalProgress : Float;
	/**
		Adds a new TweenData to this Tween. Typically, this method is called
		automatically by the TweenBuilder, however you can also invoke it
		yourself.
	**/
	function add(targetIndex:Float, key:String, getEnd:phaser.types.tweens.GetEndCallback, getStart:phaser.types.tweens.GetStartCallback, getActive:Null<phaser.types.tweens.GetActiveCallback>, ease:haxe.Constraints.Function, delay:haxe.Constraints.Function, duration:Float, yoyo:Bool, hold:Float, repeat:Float, repeatDelay:Float, flipX:Bool, flipY:Bool, interpolation:Null<haxe.Constraints.Function>, interpolationData:Null<Array<Float>>):TweenData;
	/**
		Adds a new TweenFrameData to this Tween. Typically, this method is called
		automatically by the TweenBuilder, however you can also invoke it
		yourself.
	**/
	function addFrame(targetIndex:Float, texture:String, frame:ts.AnyOf2<String, Float>, delay:haxe.Constraints.Function, duration:Float, hold:Float, repeat:Float, repeatDelay:Float, flipX:Bool, flipY:Bool):TweenFrameData;
	/**
		Returns the current value of the specified Tween Data.
		
		If this Tween has been destroyed, it will return `null`.
	**/
	function getValue(?index:Float):Float;
	/**
		See if this Tween is currently acting upon the given target.
	**/
	function hasTarget(target:Dynamic):Bool;
	/**
		Updates the 'end' value of the given property across all matching targets, as long
		as this Tween is currently playing (either forwards or backwards).
		
		Calling this does not adjust the duration of the Tween, or the current progress.
		
		You can optionally tell it to set the 'start' value to be the current value.
		
		If this Tween is in any other state other than playing then calling this method has no effect.
		
		Additionally, if the Tween repeats, is reset, or is seeked, it will revert to the original
		starting and ending values.
	**/
	function updateTo(key:String, value:Float, ?startToCurrent:Bool):Tween;
	/**
		Restarts the Tween from the beginning.
		
		If the Tween has already finished and been destroyed, restarting it will throw an error.
		
		If you wish to restart the Tween from a specific point, use the `Tween.seek` method instead.
	**/
	function restart():Tween;
	/**
		Internal method that advances to the next state of the Tween during playback.
	**/
	function nextState():Bool;
	/**
		Starts a Tween playing.
		
		You only need to call this method if you have configured the tween to be paused on creation.
		
		If the Tween is already playing, calling this method again will have no effect. If you wish to
		restart the Tween, use `Tween.restart` instead.
		
		Calling this method after the Tween has completed will start the Tween playing again from the beginning.
		This is the same as calling `Tween.seek(0)` and then `Tween.play()`.
	**/
	function play():Tween;
	/**
		Seeks to a specific point in the Tween.
		
		The given amount is a value in milliseconds that represents how far into the Tween
		you wish to seek, based on the start of the Tween.
		
		Note that the seek amount takes the entire duration of the Tween into account, including delays, loops and repeats.
		For example, a Tween that lasts for 2 seconds, but that loops 3 times, would have a total duration of 6 seconds,
		so seeking to 3000 ms would seek to the Tweens half-way point based on its _entire_ duration.
		
		Prior to Phaser 3.60 this value was given as a number between 0 and 1 and didn't
		work for Tweens had an infinite repeat. This new method works for all Tweens.
		
		Seeking works by resetting the Tween to its initial values and then iterating through the Tween at `delta`
		jumps per step. The longer the Tween, the longer this can take. If you need more precision you can
		reduce the delta value. If you need a faster seek, you can increase it. When the Tween is
		reset it will refresh the starting and ending values. If these are coming from a dynamic function,
		or a random array, it will be called for each seek.
		
		While seeking the Tween will _not_ emit any of its events or callbacks unless
		the 3rd parameter is set to `true`.
		
		If this Tween is paused, seeking will not change this fact. It will advance the Tween
		to the desired point and then pause it again.
	**/
	function seek(?amount:Float, ?delta:Float, ?emit:Bool):Tween;
	/**
		Initialises all of the Tween Data and Tween values.
		
		This is called automatically and should not typically be invoked directly.
	**/
	function initTweenData(?isSeeking:Bool):Void;
	/**
		Resets this Tween ready for another play-through.
		
		This is called automatically from the Tween Manager, or from the parent TweenChain,
		and should not typically be invoked directly.
		
		If you wish to restart this Tween, use the `Tween.restart` or `Tween.seek` methods instead.
	**/
	function reset(?skipInit:Bool):Tween;
	/**
		Internal method that advances the Tween based on the time values.
	**/
	function update(delta:Float):Bool;
	/**
		Moves this Tween forward by the given amount of milliseconds.
		
		It will only advance through the current loop of the Tween. For example, if the
		Tween is set to repeat or yoyo, it can only fast forward through a single
		section of the sequence. Use `Tween.seek` for more complex playhead control.
		
		If the Tween is paused or has already finished, calling this will have no effect.
	**/
	function forward(ms:Float):Tween;
	/**
		Moves this Tween backward by the given amount of milliseconds.
		
		It will only rewind through the current loop of the Tween. For example, if the
		Tween is set to repeat or yoyo, it can only fast forward through a single
		section of the sequence. Use `Tween.seek` for more complex playhead control.
		
		If the Tween is paused or has already finished, calling this will have no effect.
	**/
	function rewind(ms:Float):Tween;
	/**
		Internal method that will emit a Tween based Event and invoke the given callback.
	**/
	function dispatchEvent(event:String, ?callback:phaser.types.tweens.TweenCallbackTypes):Void;
	/**
		Sets the value of the time scale applied to this Tween. A value of 1 runs in real-time.
		A value of 0.5 runs 50% slower, and so on.
		
		The value isn't used when calculating total duration of the tween, it's a run-time delta adjustment only.
		
		This value is multiplied by the `TweenManager.timeScale`.
	**/
	function setTimeScale(value:Float):Tween;
	/**
		Pauses the Tween immediately. Use `resume` to continue playback.
		
		You can also toggle the `Tween.paused` boolean property, but doing so will not trigger the PAUSE event.
	**/
	function pause():Tween;
	/**
		Resumes the playback of a previously paused Tween.
		
		You can also toggle the `Tween.paused` boolean property, but doing so will not trigger the RESUME event.
	**/
	function resume():Tween;
	/**
		Flags the Tween as being complete, whatever stage of progress it is at.
		
		If an `onComplete` callback has been defined it will automatically invoke it, unless a `delay`
		argument is provided, in which case the Tween will delay for that period of time before calling the callback.
		
		If you don't need a delay or don't have an `onComplete` callback then call `Tween.stop` instead.
	**/
	function complete(?delay:Float):Tween;
	/**
		Flags the Tween as being complete only once the current loop has finished.
		
		This is a useful way to stop an infinitely looping tween once a complete cycle is over,
		rather than abruptly.
		
		If you don't have a loop then call `Tween.stop` instead.
	**/
	function completeAfterLoop(?loops:Float):Tween;
	/**
		Immediately removes this Tween from the TweenManager and all of its internal arrays,
		no matter what stage it is at. Then sets the tween state to `REMOVED`.
		
		You should dispose of your reference to this tween after calling this method, to
		free it from memory. If you no longer require it, call `Tween.destroy()` on it.
	**/
	function remove():Tween;
	/**
		Stops the Tween immediately, whatever stage of progress it is at.
		
		If not a part of a Tween Chain it is also flagged for removal by the Tween Manager.
		
		If an `onStop` callback has been defined it will automatically invoke it.
		
		The Tween will be removed during the next game frame, but should be considered 'destroyed' from this point on.
		
		Typically, you cannot play a Tween that has been stopped. If you just wish to pause the tween, not destroy it,
		then call the `pause` method instead and use `resume` to continue playback. If you wish to restart the Tween,
		use the `restart` or `seek` methods.
	**/
	function stop():Tween;
	/**
		Sets an event based callback to be invoked during playback.
		
		Calling this method will replace a previously set callback for the given type, if any exists.
		
		The types available are:
		
		`onActive` - When the Tween is first created it moves to an 'active' state when added to the Tween Manager. 'Active' does not mean 'playing'.
		`onStart` - When the Tween starts playing after a delayed or paused state. This will happen at the same time as `onActive` if the tween has no delay and isn't paused.
		`onLoop` - When a Tween loops, if it has been set to do so. This happens _after_ the `loopDelay` expires, if set.
		`onComplete` - When the Tween finishes playback fully. Never invoked if the Tween is set to repeat infinitely.
		`onStop` - Invoked only if the `Tween.stop` method is called.
		`onPause` - Invoked only if the `Tween.pause` method is called. Not invoked if the Tween Manager is paused.
		`onResume` - Invoked only if the `Tween.resume` method is called. Not invoked if the Tween Manager is resumed.
		
		The following types are also available and are invoked on a `TweenData` level - that is per-object, per-property, being tweened.
		
		`onYoyo` - When a TweenData starts a yoyo. This happens _after_ the `hold` delay expires, if set.
		`onRepeat` - When a TweenData repeats playback. This happens _after_ the `repeatDelay` expires, if set.
		`onUpdate` - When a TweenData updates a property on a source target during playback.
	**/
	function setCallback(type:phaser.types.tweens.TweenCallbackTypes, callback:haxe.Constraints.Function, ?params:Array<Dynamic>):Tween;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Tween;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Tween;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Tween;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Tween;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Tween;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Tween;
	static var prototype : Tween;
}