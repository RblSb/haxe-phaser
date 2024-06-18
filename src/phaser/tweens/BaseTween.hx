package phaser.tweens;

/**
	As the name implies, this is the base Tween class that both the Tween and TweenChain
	inherit from. It contains shared properties and methods common to both types of Tween.
	
	Typically you would never instantiate this class directly, although you could certainly
	use it to create your own variation of Tweens from.
**/
@:native("Phaser.Tweens.BaseTween") extern class BaseTween extends phaser.events.EventEmitter {
	function new(parent:ts.AnyOf2<TweenChain, TweenManager>);
	/**
		A reference to the Tween Manager, or Tween Chain, that owns this Tween.
	**/
	var parent : ts.AnyOf2<TweenChain, TweenManager>;
	/**
		The main data array. For a Tween, this contains all of the `TweenData` objects, each
		containing a unique property and target that is being tweened.
		
		For a TweenChain, this contains an array of `Tween` instances, which are being played
		through in sequence.
	**/
	var data : ts.AnyOf2<Array<TweenData>, Array<Tween>>;
	/**
		The cached size of the data array.
	**/
	var totalData : Float;
	/**
		The time in milliseconds before the 'onStart' event fires.
		
		For a Tween, this is the shortest `delay` value across all of the TweenDatas it owns.
		For a TweenChain, it is whatever delay value was given in the configuration.
	**/
	var startDelay : Float;
	/**
		Has this Tween started playback yet?
		
		This boolean is toggled when the Tween leaves the 'start delayed' state and begins running.
	**/
	final hasStarted : Bool;
	/**
		Scales the time applied to this Tween. A value of 1 runs in real-time. A value of 0.5 runs 50% slower, and so on.
		
		The value isn't used when calculating total duration of the tween, it's a run-time delta adjustment only.
		
		This value is multiplied by the `TweenManager.timeScale`.
	**/
	var timeScale : Float;
	/**
		The number of times this Tween will loop.
		
		Can be -1 for an infinite loop, zero for none, or a positive integer.
		
		Typically this is set in the configuration object, but can also be set directly
		as long as this Tween is paused and hasn't started playback.
		
		When enabled it will play through ALL Tweens again.
		
		Use TweenData.repeat to loop a single element.
	**/
	var loop : Float;
	/**
		The time in milliseconds before the Tween loops.
		
		Only used if `loop` is > 0.
	**/
	var loopDelay : Float;
	/**
		Internal counter recording how many loops are left to run.
	**/
	var loopCounter : Float;
	/**
		The time in milliseconds before the 'onComplete' event fires.
		
		This never fires if `loop = -1` as it never completes because it has been
		set to loop forever.
	**/
	var completeDelay : Float;
	/**
		An internal countdown timer (used by loopDelay and completeDelay)
	**/
	var countdown : Float;
	/**
		The current state of the Tween.
	**/
	var state : States;
	/**
		Is the Tween currently paused?
		
		A paused Tween needs to be started with the `play` method, or resumed with the `resume` method.
		
		This property can be toggled at runtime if required.
	**/
	var paused : Bool;
	/**
		An object containing the different Tween callback functions.
		
		You can either set these in the Tween config, or by calling the `Tween.setCallback` method.
		
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
	var callbacks : phaser.types.tweens.TweenCallbacks;
	/**
		The scope (or context) in which all of the callbacks are invoked.
		
		This defaults to be this Tween, but you can override this property
		to set it to whatever object you require.
	**/
	var callbackScope : Dynamic;
	/**
		Will this Tween persist after playback? A Tween that persists will _not_ be destroyed by the
		Tween Manager, or when calling `Tween.stop`, and can be re-played as required. You can either
		set this property when creating the tween in the tween config, or set it _prior_ to playback.
		
		However, it's up to you to ensure you destroy persistent tweens when you are finished with them,
		or they will retain references you may no longer require and waste memory.
		
		By default, `Tweens` are set to _not_ persist, so they are automatically cleaned-up by
		the Tween Manager. But `TweenChains` _do_ persist by default, unless overridden in their
		config. This is because the type of situations you use a chain for is far more likely to
		need to be replayed again in the future, rather than disposed of.
	**/
	var persist : Bool;
	/**
		Sets the value of the time scale applied to this Tween. A value of 1 runs in real-time.
		A value of 0.5 runs 50% slower, and so on.
		
		The value isn't used when calculating total duration of the tween, it's a run-time delta adjustment only.
		
		This value is multiplied by the `TweenManager.timeScale`.
	**/
	function setTimeScale(value:Float):BaseTween;
	/**
		Gets the value of the time scale applied to this Tween. A value of 1 runs in real-time.
		A value of 0.5 runs 50% slower, and so on.
	**/
	function getTimeScale():Float;
	/**
		Checks if this Tween is currently playing.
		
		If this Tween is paused, or not active, this method will return false.
	**/
	function isPlaying():Bool;
	/**
		Checks if the Tween is currently paused.
		
		This is the same as inspecting the `BaseTween.paused` property directly.
	**/
	function isPaused():Bool;
	/**
		Pauses the Tween immediately. Use `resume` to continue playback.
		
		You can also toggle the `Tween.paused` boolean property, but doing so will not trigger the PAUSE event.
	**/
	function pause():BaseTween;
	/**
		Resumes the playback of a previously paused Tween.
		
		You can also toggle the `Tween.paused` boolean property, but doing so will not trigger the RESUME event.
	**/
	function resume():BaseTween;
	/**
		Internal method that makes this Tween active within the TweenManager
		and emits the onActive event and callback.
	**/
	function makeActive():Void;
	/**
		Internal method that handles this tween completing and emitting the onComplete event
		and callback.
	**/
	function onCompleteHandler():Void;
	/**
		Flags the Tween as being complete, whatever stage of progress it is at.
		
		If an `onComplete` callback has been defined it will automatically invoke it, unless a `delay`
		argument is provided, in which case the Tween will delay for that period of time before calling the callback.
		
		If you don't need a delay or don't have an `onComplete` callback then call `Tween.stop` instead.
	**/
	function complete(?delay:Float):BaseTween;
	/**
		Flags the Tween as being complete only once the current loop has finished.
		
		This is a useful way to stop an infinitely looping tween once a complete cycle is over,
		rather than abruptly.
		
		If you don't have a loop then call `Tween.stop` instead.
	**/
	function completeAfterLoop(?loops:Float):BaseTween;
	/**
		Immediately removes this Tween from the TweenManager and all of its internal arrays,
		no matter what stage it is at. Then sets the tween state to `REMOVED`.
		
		You should dispose of your reference to this tween after calling this method, to
		free it from memory. If you no longer require it, call `Tween.destroy()` on it.
	**/
	function remove():BaseTween;
	/**
		Stops the Tween immediately, whatever stage of progress it is at.
		
		If not a part of a Tween Chain it is also flagged for removal by the Tween Manager.
		
		If an `onStop` callback has been defined it will automatically invoke it.
		
		The Tween will be removed during the next game frame, but should be considered 'destroyed' from this point on.
		
		Typically, you cannot play a Tween that has been stopped. If you just wish to pause the tween, not destroy it,
		then call the `pause` method instead and use `resume` to continue playback. If you wish to restart the Tween,
		use the `restart` or `seek` methods.
	**/
	function stop():BaseTween;
	/**
		Internal method that handles the processing of the loop delay countdown timer and
		the dispatch of related events. Called automatically by `Tween.update`.
	**/
	function updateLoopCountdown(delta:Float):Void;
	/**
		Internal method that handles the processing of the start delay countdown timer and
		the dispatch of related events. Called automatically by `Tween.update`.
	**/
	function updateStartCountdown(delta:Float):Void;
	/**
		Internal method that handles the processing of the complete delay countdown timer and
		the dispatch of related events. Called automatically by `Tween.update`.
	**/
	function updateCompleteDelay(delta:Float):Void;
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
	function setCallback(type:phaser.types.tweens.TweenCallbackTypes, callback:haxe.Constraints.Function, ?params:Array<Dynamic>):BaseTween;
	/**
		Sets this Tween state to PENDING.
	**/
	function setPendingState():Void;
	/**
		Sets this Tween state to ACTIVE.
	**/
	function setActiveState():Void;
	/**
		Sets this Tween state to LOOP_DELAY.
	**/
	function setLoopDelayState():Void;
	/**
		Sets this Tween state to COMPLETE_DELAY.
	**/
	function setCompleteDelayState():Void;
	/**
		Sets this Tween state to START_DELAY.
	**/
	function setStartDelayState():Void;
	/**
		Sets this Tween state to PENDING_REMOVE.
	**/
	function setPendingRemoveState():Void;
	/**
		Sets this Tween state to REMOVED.
	**/
	function setRemovedState():Void;
	/**
		Sets this Tween state to FINISHED.
	**/
	function setFinishedState():Void;
	/**
		Sets this Tween state to DESTROYED.
	**/
	function setDestroyedState():Void;
	/**
		Returns `true` if this Tween has a _current_ state of PENDING, otherwise `false`.
	**/
	function isPending():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of ACTIVE, otherwise `false`.
	**/
	function isActive():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of LOOP_DELAY, otherwise `false`.
	**/
	function isLoopDelayed():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of COMPLETE_DELAY, otherwise `false`.
	**/
	function isCompleteDelayed():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of START_DELAY, otherwise `false`.
	**/
	function isStartDelayed():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of PENDING_REMOVE, otherwise `false`.
	**/
	function isPendingRemove():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of REMOVED, otherwise `false`.
	**/
	function isRemoved():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of FINISHED, otherwise `false`.
	**/
	function isFinished():Bool;
	/**
		Returns `true` if this Tween has a _current_ state of DESTROYED, otherwise `false`.
	**/
	function isDestroyed():Bool;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseTween;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseTween;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseTween;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BaseTween;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BaseTween;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):BaseTween;
	static var prototype : BaseTween;
}