package phaser.tweens;

/**
	The Tween Manager is a default Scene Plugin which controls and updates Tweens.
	
	A tween is a way to alter one or more properties of a target object over a defined period of time.
	
	Tweens are created by calling the `add` method and passing in the configuration object.
	
	```js
	const logo = this.add.image(100, 100, 'logo');
	
	this.tweens.add({
	   targets: logo,
	   x: 600,
	   ease: 'Power1',
	   duration: 2000
	});
	```
	
	See the `TweenBuilderConfig` for all of the options you have available.
	
	Playback will start immediately unless the tween has been configured to be paused.
	
	Please note that a Tween will not manipulate any target property that begins with an underscore.
	
	Tweens are designed to be 'fire-and-forget'. They automatically destroy themselves once playback
	is complete, to free-up memory and resources. If you wish to keep a tween after playback, i.e. to
	play it again at a later time, then you should set the `persist` property to `true` in the config.
	However, doing so means it's entirely up to _you_ to destroy the tween when you're finished with it,
	otherwise it will linger in memory forever.
	
	If you wish to chain Tweens together for sequential playback, see the `TweenManager.chain` method.
**/
@:native("Phaser.Tweens.TweenManager") extern class TweenManager {
	function new(scene:phaser.Scene);
	/**
		The Scene which owns this Tween Manager.
	**/
	var scene : phaser.Scene;
	/**
		The Scene Systems Event Emitter.
	**/
	var events : phaser.events.EventEmitter;
	/**
		The time scale of the Tween Manager.
		
		This value scales the time delta between two frames, thus influencing the speed of time for all Tweens owned by this Tween Manager.
	**/
	var timeScale : Float;
	/**
		This toggles the updating state of this Tween Manager.
		
		Setting `paused` to `true` (or calling the `pauseAll` method) will
		stop this Tween Manager from updating any of its tweens, including
		newly created ones. Set back to `false` to resume playback.
	**/
	var paused : Bool;
	/**
		Is this Tween Manager currently processing the tweens as part of
		its 'update' loop? This is set to 'true' at the start of 'update'
		and reset to 'false' at the end of the function. Allows you to trap
		Tween Manager status during tween callbacks.
	**/
	var processing : Bool;
	/**
		An array of Tweens which are actively being processed by the Tween Manager.
	**/
	var tweens : Array<Tween>;
	/**
		The time the Tween Manager was updated.
	**/
	var time : Float;
	/**
		The time the Tween Manager was started.
	**/
	var startTime : Float;
	/**
		The time the Tween Manager should next update.
	**/
	var nextTime : Float;
	/**
		The time the Tween Manager previously updated.
	**/
	var prevTime : Float;
	/**
		The maximum amount of time, in milliseconds, the browser can
		lag for, before lag smoothing is applied.
		
		See the `TweenManager.setLagSmooth` method for further details.
	**/
	var maxLag : Float;
	/**
		The amount of time, in milliseconds, that is used to set the
		delta when lag smoothing is applied.
		
		See the `TweenManager.setLagSmooth` method for further details.
	**/
	var lagSkip : Float;
	/**
		An internal value that holds the fps rate.
	**/
	var gap : Float;
	/**
		Create a Tween and return it, but does not add it to this Tween Manager.
		
		Please note that a Tween will not manipulate any target property that begins with an underscore.
		
		In order to play this tween, you'll need to add it to a Tween Manager via
		the `TweenManager.existing` method.
		
		You can optionally pass an **array** of Tween Configuration objects to this method and it will create
		one Tween per entry in the array. If an array is given, an array of tweens is returned.
	**/
	function create(config:ts.AnyOf4<Dynamic, phaser.types.tweens.TweenBuilderConfig, Array<Dynamic>, Array<phaser.types.tweens.TweenBuilderConfig>>):ts.AnyOf2<Tween, Array<Tween>>;
	/**
		Create a Tween and add it to this Tween Manager by passing a Tween Configuration object.
		
		Example, run from within a Scene:
		
		```js
		const logo = this.add.image(100, 100, 'logo');
		
		this.tweens.add({
		   targets: logo,
		   x: 600,
		   ease: 'Power1',
		   duration: 2000
		});
		```
		
		See the `TweenBuilderConfig` for all of the options you have available.
		
		Playback will start immediately unless the tween has been configured to be paused.
		
		Please note that a Tween will not manipulate any target property that begins with an underscore.
		
		Tweens are designed to be 'fire-and-forget'. They automatically destroy themselves once playback
		is complete, to free-up memory and resources. If you wish to keep a tween after playback, i.e. to
		play it again at a later time, then you should set the `persist` property to `true` in the config.
		However, doing so means it's entirely up to _you_ to destroy the tween when you're finished with it,
		otherwise it will linger in memory forever.
		
		If you wish to chain Tweens together for sequential playback, see the `TweenManager.chain` method.
	**/
	function add(config:ts.AnyOf4<phaser.types.tweens.TweenBuilderConfig, phaser.types.tweens.TweenChainBuilderConfig, Tween, TweenChain>):Tween;
	/**
		Create multiple Tweens and add them all to this Tween Manager, by passing an array of Tween Configuration objects.
		
		See the `TweenBuilderConfig` for all of the options you have available.
		
		Playback will start immediately unless the tweens have been configured to be paused.
		
		Please note that a Tween will not manipulate any target property that begins with an underscore.
		
		Tweens are designed to be 'fire-and-forget'. They automatically destroy themselves once playback
		is complete, to free-up memory and resources. If you wish to keep a tween after playback, i.e. to
		play it again at a later time, then you should set the `persist` property to `true` in the config.
		However, doing so means it's entirely up to _you_ to destroy the tween when you're finished with it,
		otherwise it will linger in memory forever.
		
		If you wish to chain Tweens together for sequential playback, see the `TweenManager.chain` method.
	**/
	function addMultiple(configs:ts.AnyOf2<Array<Dynamic>, Array<phaser.types.tweens.TweenBuilderConfig>>):Array<Tween>;
	/**
		Create a sequence of Tweens, chained to one-another, and add them to this Tween Manager.
		
		The tweens are played in order, from start to finish. You can optionally set the chain
		to repeat as many times as you like. Once the chain has finished playing, or repeating if set,
		all tweens in the chain will be destroyed automatically. To override this, set the `persist`
		argument to 'true'.
		
		Playback will start immediately unless the _first_ Tween has been configured to be paused.
		
		Please note that Tweens will not manipulate any target property that begins with an underscore.
	**/
	function chain(tweens:ts.AnyOf2<Dynamic, phaser.types.tweens.TweenChainBuilderConfig>):TweenChain;
	/**
		Returns an array containing this Tween and all Tweens chained to it,
		in the order in which they will be played.
		
		If there are no chained Tweens an empty array is returned.
	**/
	function getChainedTweens(tween:Tween):Array<Tween>;
	/**
		Check to see if the given Tween instance exists within this Tween Manager.
		
		Will return `true` as long as the Tween is being processed by this Tween Manager.
		
		Will return `false` if not present, or has a state of `REMOVED` or `DESTROYED`.
	**/
	function has(tween:Tween):Bool;
	/**
		Add an existing Tween to this Tween Manager.
		
		Playback will start immediately unless the tween has been configured to be paused.
	**/
	function existing(tween:Tween):TweenManager;
	/**
		Create a Number Tween and add it to the active Tween list.
		
		A Number Tween is a special kind of tween that doesn't have a target. Instead,
		it allows you to tween between 2 numeric values. The default values are
		`0` and `1`, but you can change them via the `from` and `to` properties.
		
		You can get the current tweened value via the `Tween.getValue()` method.
		
		Playback will start immediately unless the tween has been configured to be paused.
		
		Please note that a Tween will not manipulate any target property that begins with an underscore.
	**/
	function addCounter(config:phaser.types.tweens.NumberTweenBuilderConfig):Tween;
	/**
		Creates a Stagger function to be used by a Tween property.
		
		The stagger function will allow you to stagger changes to the value of the property across all targets of the tween.
		
		This is only worth using if the tween has multiple targets.
		
		The following will stagger the delay by 100ms across all targets of the tween, causing them to scale down to 0.2
		over the duration specified:
		
		```javascript
		this.tweens.add({
		     targets: [ ... ],
		     scale: 0.2,
		     ease: 'linear',
		     duration: 1000,
		     delay: this.tweens.stagger(100)
		});
		```
		
		The following will stagger the delay by 500ms across all targets of the tween using a 10 x 6 grid, staggering
		from the center out, using a cubic ease.
		
		```javascript
		this.tweens.add({
		     targets: [ ... ],
		     scale: 0.2,
		     ease: 'linear',
		     duration: 1000,
		     delay: this.tweens.stagger(500, { grid: [ 10, 6 ], from: 'center', ease: 'cubic.out' })
		});
		```
	**/
	function stagger(value:ts.AnyOf2<Float, Array<Float>>, config:phaser.types.tweens.StaggerConfig):haxe.Constraints.Function;
	/**
		Set the limits that are used when a browser encounters lag, or delays that cause the elapsed
		time between two frames to exceed the expected amount. If this occurs, the Tween Manager will
		act as if the 'skip' amount of times has passed, in order to maintain strict tween sequencing.
		
		This is enabled by default with the values 500ms for the lag limit and 33ms for the skip.
		
		You should not set these to low values, as it won't give time for the browser to ever
		catch-up with itself and reclaim sync.
		
		Call this method with no arguments to disable smoothing.
		
		Call it with the arguments `500` and `33` to reset to the defaults.
	**/
	function setLagSmooth(?limit:Float, ?skip:Float):TweenManager;
	/**
		Limits the Tween system to run at a particular frame rate.
		
		You should not set this _above_ the frequency of the browser,
		but instead can use it to throttle the frame rate lower, should
		you need to in certain situations.
	**/
	function setFps(?fps:Float):TweenManager;
	/**
		Internal method that calculates the delta value, along with the other timing values,
		and returns the new delta.
		
		You should not typically call this method directly.
	**/
	function getDelta(?tick:Bool):Float;
	/**
		Manually advance the Tween system by one step.
		
		This will update all Tweens even if the Tween Manager is currently
		paused.
	**/
	function tick():TweenManager;
	/**
		Internal update handler.
		
		Calls `TweenManager.step` as long as the Tween Manager has not
		been paused.
	**/
	function update():Void;
	/**
		Updates all Tweens belonging to this Tween Manager.
		
		Called automatically by `update` and `tick`.
	**/
	function step(?tick:Bool):Void;
	/**
		Removes the given Tween from this Tween Manager, even if it hasn't started
		playback yet. If this method is called while the Tween Manager is processing
		an update loop, then the tween will be flagged for removal at the start of
		the next frame. Otherwise, it is removed immediately.
		
		The removed tween is _not_ destroyed. It is just removed from this Tween Manager.
	**/
	function remove(tween:Tween):TweenManager;
	/**
		Resets the given Tween.
		
		If the Tween does not belong to this Tween Manager, it will first be added.
		
		Then it will seek to position 0 and playback will start on the next frame.
	**/
	function reset(tween:Tween):TweenManager;
	/**
		Checks if a Tween is active and adds it to the Tween Manager at the start of the frame if it isn't.
	**/
	function makeActive(tween:Tween):TweenManager;
	/**
		Passes all Tweens to the given callback.
	**/
	function each(callback:haxe.Constraints.Function, ?scope:Dynamic, args:haxe.extern.Rest<Dynamic>):TweenManager;
	/**
		Returns an array containing references to all Tweens in this Tween Manager.
		
		It is safe to mutate the returned array. However, acting upon any of the Tweens
		within it, will adjust those stored in this Tween Manager, as they are passed
		by reference and not cloned.
		
		If you wish to get tweens for a specific target, see `getTweensOf`.
	**/
	function getTweens():Array<Tween>;
	/**
		Returns an array of all Tweens in the Tween Manager which affect the given target, or array of targets.
		
		It's possible for this method to return tweens that are about to be removed from
		the Tween Manager. You should check the state of the returned tween before acting
		upon it.
	**/
	function getTweensOf(target:ts.AnyOf2<Dynamic, Array<Dynamic>>):Array<Tween>;
	/**
		Returns the scale of the time delta for all Tweens owned by this Tween Manager.
	**/
	function getGlobalTimeScale():Float;
	/**
		Sets a new scale of the time delta for this Tween Manager.
		
		The time delta is the time elapsed between two consecutive frames and influences the speed of time for this Tween Manager and all Tweens it owns. Values higher than 1 increase the speed of time, while values smaller than 1 decrease it. A value of 0 freezes time and is effectively equivalent to pausing all Tweens.
	**/
	function setGlobalTimeScale(value:Float):TweenManager;
	/**
		Checks if the given object is being affected by a _playing_ Tween.
		
		If the Tween is paused, this method will return false.
	**/
	function isTweening(target:Dynamic):Bool;
	/**
		Destroys all Tweens in this Tween Manager.
		
		The tweens will erase all references to any targets they hold
		and be stopped immediately.
		
		If this method is called while the Tween Manager is running its
		update process, then the tweens will be removed at the start of
		the next frame. Outside of this, they are removed immediately.
	**/
	function killAll():TweenManager;
	/**
		Stops all Tweens which affect the given target or array of targets.
		
		The tweens will erase all references to any targets they hold
		and be stopped immediately.
		
		If this method is called while the Tween Manager is running its
		update process, then the tweens will be removed at the start of
		the next frame. Outside of this, they are removed immediately.
	**/
	function killTweensOf(target:ts.AnyOf2<Dynamic, Array<Dynamic>>):TweenManager;
	/**
		Pauses this Tween Manager. No Tweens will update while paused.
		
		This includes tweens created after this method was called.
		
		See `TweenManager#resumeAll` to resume the playback.
		
		As of Phaser 3.60 you can also toggle the boolean property `TweenManager.paused`.
	**/
	function pauseAll():TweenManager;
	/**
		Resumes playback of this Tween Manager.
		
		All active Tweens will continue updating.
		
		See `TweenManager#pauseAll` to pause the playback.
		
		As of Phaser 3.60 you can also toggle the boolean property `TweenManager.paused`.
	**/
	function resumeAll():TweenManager;
	/**
		The Scene that owns this plugin is shutting down.
		
		We need to kill and reset all internal properties as well as stop listening to Scene events.
	**/
	function shutdown():Void;
	/**
		The Scene that owns this plugin is being destroyed.
		We need to shutdown and then kill off all external references.
	**/
	function destroy():Void;
	static var prototype : TweenManager;
}