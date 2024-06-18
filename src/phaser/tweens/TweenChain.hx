package phaser.tweens;

/**
	A TweenChain is a special type of Tween that allows you to create a sequence of Tweens, chained to one-another,
	and add them to the Tween Manager.
	
	The tweens are played in order, from start to finish. You can optionally set the chain
	to repeat as many times as you like. Once the chain has finished playing, or repeating if set,
	all tweens in the chain will be destroyed automatically. To override this, set the 'persist'
	argument to 'true'.
	
	Playback will start immediately unless the _first_ Tween has been configured to be paused.
	
	Please note that Tweens will not manipulate any target property that begins with an underscore.
**/
@:native("Phaser.Tweens.TweenChain") extern class TweenChain extends BaseTween {
	function new(parent:ts.AnyOf2<TweenChain, TweenManager>);
	/**
		A reference to the Tween that this TweenChain is currently playing.
	**/
	var currentTween : Tween;
	/**
		A reference to the data array index of the currently playing tween.
	**/
	var currentIndex : Float;
	/**
		Prepares this TweenChain for playback.
		
		Called automatically by the TweenManager. Should not be called directly.
	**/
	function init():TweenChain;
	/**
		Create a sequence of Tweens, chained to one-another, and add them to this Tween Manager.
		
		The tweens are played in order, from start to finish. You can optionally set the chain
		to repeat as many times as you like. Once the chain has finished playing, or repeating if set,
		all tweens in the chain will be destroyed automatically. To override this, set the 'persist'
		argument to 'true'.
		
		Playback will start immediately unless the _first_ Tween has been configured to be paused.
		
		Please note that Tweens will not manipulate any target property that begins with an underscore.
	**/
	function add(tweens:ts.AnyOf2<Array<Dynamic>, Array<phaser.types.tweens.TweenBuilderConfig>>):TweenChain;
	/**
		See if any of the tweens in this Tween Chain is currently acting upon the given target.
	**/
	function hasTarget(target:Dynamic):Bool;
	/**
		Restarts the TweenChain from the beginning.
		
		If this TweenChain was configured to have a loop, or start delay, those
		are reset to their initial values as well. It will also dispatch the
		`onActive` callback and event again.
	**/
	function restart():TweenChain;
	/**
		Resets the given Tween.
		
		It will seek to position 0 and playback will start on the next frame.
	**/
	function reset(tween:Tween):TweenChain;
	/**
		Internal method that advances to the next state of the TweenChain playback.
	**/
	function nextState():Bool;
	/**
		Starts this TweenChain playing.
		
		You only need to call this method if you have configured this TweenChain to be paused on creation.
		
		If the TweenChain is already playing, calling this method again will have no effect. If you wish to
		restart the chain, use `TweenChain.restart` instead.
		
		Calling this method after the TweenChain has completed will start the chain playing again from the beginning.
	**/
	function play():TweenChain;
	/**
		Internal method that resets all of the Tweens and the current index pointer.
	**/
	function resetTweens():Void;
	/**
		Internal method that advances the TweenChain based on the time values.
	**/
	function update(delta:Float):Bool;
	/**
		Immediately advances to the next Tween in the chain.
		
		This is typically called internally, but can be used if you need to
		advance playback for some reason.
	**/
	function nextTween():Bool;
	/**
		Sets the current active Tween to the given index, based on its
		entry in the TweenChain data array.
	**/
	function setCurrentTween(index:Float):Void;
	/**
		Internal method that will emit a TweenChain based Event and invoke the given callback.
	**/
	function dispatchEvent(event:String, ?callback:phaser.types.tweens.TweenCallbackTypes):Void;
	/**
		Sets the value of the time scale applied to this Tween. A value of 1 runs in real-time.
		A value of 0.5 runs 50% slower, and so on.
		
		The value isn't used when calculating total duration of the tween, it's a run-time delta adjustment only.
		
		This value is multiplied by the `TweenManager.timeScale`.
	**/
	function setTimeScale(value:Float):TweenChain;
	/**
		Pauses the Tween immediately. Use `resume` to continue playback.
		
		You can also toggle the `Tween.paused` boolean property, but doing so will not trigger the PAUSE event.
	**/
	function pause():TweenChain;
	/**
		Resumes the playback of a previously paused Tween.
		
		You can also toggle the `Tween.paused` boolean property, but doing so will not trigger the RESUME event.
	**/
	function resume():TweenChain;
	/**
		Flags the Tween as being complete, whatever stage of progress it is at.
		
		If an `onComplete` callback has been defined it will automatically invoke it, unless a `delay`
		argument is provided, in which case the Tween will delay for that period of time before calling the callback.
		
		If you don't need a delay or don't have an `onComplete` callback then call `Tween.stop` instead.
	**/
	function complete(?delay:Float):TweenChain;
	/**
		Flags the Tween as being complete only once the current loop has finished.
		
		This is a useful way to stop an infinitely looping tween once a complete cycle is over,
		rather than abruptly.
		
		If you don't have a loop then call `Tween.stop` instead.
	**/
	function completeAfterLoop(?loops:Float):TweenChain;
	/**
		Immediately removes this Tween from the TweenManager and all of its internal arrays,
		no matter what stage it is at. Then sets the tween state to `REMOVED`.
		
		You should dispose of your reference to this tween after calling this method, to
		free it from memory. If you no longer require it, call `Tween.destroy()` on it.
	**/
	function remove():TweenChain;
	/**
		Stops the Tween immediately, whatever stage of progress it is at.
		
		If not a part of a Tween Chain it is also flagged for removal by the Tween Manager.
		
		If an `onStop` callback has been defined it will automatically invoke it.
		
		The Tween will be removed during the next game frame, but should be considered 'destroyed' from this point on.
		
		Typically, you cannot play a Tween that has been stopped. If you just wish to pause the tween, not destroy it,
		then call the `pause` method instead and use `resume` to continue playback. If you wish to restart the Tween,
		use the `restart` or `seek` methods.
	**/
	function stop():TweenChain;
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
	function setCallback(type:phaser.types.tweens.TweenCallbackTypes, callback:haxe.Constraints.Function, ?params:Array<Dynamic>):TweenChain;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TweenChain;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TweenChain;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TweenChain;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TweenChain;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TweenChain;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):TweenChain;
	static var prototype : TweenChain;
}