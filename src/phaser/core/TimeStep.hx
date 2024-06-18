package phaser.core;

/**
	The core runner class that Phaser uses to handle the game loop. It can use either Request Animation Frame,
	or SetTimeout, based on browser support and config settings, to create a continuous loop within the browser.
	
	Each time the loop fires, `TimeStep.step` is called and this is then passed onto the core Game update loop,
	it is the core heartbeat of your game. It will fire as often as Request Animation Frame is capable of handling
	on the target device.
	
	Note that there are lots of situations where a browser will stop updating your game. Such as if the player
	switches tabs, or covers up the browser window with another application. In these cases, the 'heartbeat'
	of your game will pause, and only resume when focus is returned to it by the player. There is no way to avoid
	this situation, all you can do is use the visibility events the browser, and Phaser, provide to detect when
	it has happened and then gracefully recover.
**/
@:native("Phaser.Core.TimeStep") extern class TimeStep {
	function new(game:phaser.Game, config:phaser.types.core.FPSConfig);
	/**
		A reference to the Phaser.Game instance.
	**/
	final game : phaser.Game;
	/**
		The Request Animation Frame DOM Event handler.
	**/
	final raf : phaser.dom.RequestAnimationFrame;
	/**
		A flag that is set once the TimeStep has started running and toggled when it stops.
	**/
	final started : Bool;
	/**
		A flag that is set once the TimeStep has started running and toggled when it stops.
		The difference between this value and `started` is that `running` is toggled when
		the TimeStep is sent to sleep, where-as `started` remains `true`, only changing if
		the TimeStep is actually stopped, not just paused.
	**/
	final running : Bool;
	/**
		The minimum fps rate you want the Time Step to run at.
		
		Setting this cannot guarantee the browser runs at this rate, it merely influences
		the internal timing values to help the Timestep know when it has gone out of sync.
	**/
	var minFps : Float;
	/**
		The target fps rate for the Time Step to run at.
		
		Setting this value will not actually change the speed at which the browser runs, that is beyond
		the control of Phaser. Instead, it allows you to determine performance issues and if the Time Step
		is spiraling out of control.
	**/
	var targetFps : Float;
	/**
		Enforce a frame rate limit. This forces how often the Game step will run. By default it is zero,
		which means it will run at whatever limit the browser (via RequestAnimationFrame) can handle, which
		is the optimum rate for fast-action or responsive games.
		
		However, if you are building a non-game app, like a graphics generator, or low-intensity game that doesn't
		require 60fps, then you can lower the step rate via this Game Config value:
		
		```js
		fps: {
		   limit: 30
		}
		```
		
		Setting this _beyond_ the rate of RequestAnimationFrame will make no difference at all.
		
		Use it purely to _restrict_ updates in low-intensity situations only.
	**/
	var fpsLimit : Float;
	/**
		Is the FPS rate limited?
		
		This is set by setting the Game Config `limit` value to a value above zero.
		
		Consider this property as read-only.
	**/
	var hasFpsLimit : Bool;
	/**
		An exponential moving average of the frames per second.
	**/
	final actualFps : Float;
	/**
		The time at which the next fps rate update will take place.
		
		When an fps update happens, the `framesThisSecond` value is reset.
	**/
	final nextFpsUpdate : Float;
	/**
		The number of frames processed this second.
	**/
	final framesThisSecond : Float;
	/**
		A callback to be invoked each time the TimeStep steps.
	**/
	dynamic function callback(time:Float, average:Float):Void;
	/**
		You can force the TimeStep to use SetTimeOut instead of Request Animation Frame by setting
		the `forceSetTimeOut` property to `true` in the Game Configuration object. It cannot be changed at run-time.
	**/
	final forceSetTimeOut : Bool;
	/**
		The time, updated each step by adding the elapsed delta time to the previous value.
		
		This differs from the `TimeStep.now` value, which is the high resolution time value
		as provided by Request Animation Frame.
	**/
	var time : Float;
	/**
		The time at which the game started running.
		
		This value is adjusted if the game is then paused and resumes.
	**/
	var startTime : Float;
	/**
		The time of the previous step.
		
		This is typically a high resolution timer value, as provided by Request Animation Frame.
	**/
	var lastTime : Float;
	/**
		The current frame the game is on. This counter is incremented once every game step, regardless of how much
		time has passed and is unaffected by delta smoothing.
	**/
	final frame : Float;
	/**
		Is the browser currently considered in focus by the Page Visibility API?
		
		This value is set in the `blur` method, which is called automatically by the Game instance.
	**/
	final inFocus : Bool;
	/**
		The delta time, in ms, since the last game step. This is a clamped and smoothed average value.
	**/
	var delta : Float;
	/**
		Internal index of the delta history position.
	**/
	var deltaIndex : Float;
	/**
		Internal array holding the previous delta values, used for delta smoothing.
	**/
	var deltaHistory : Array<Float>;
	/**
		The maximum number of delta values that are retained in order to calculate a smoothed moving average.
		
		This can be changed in the Game Config via the `fps.deltaHistory` property. The default is 10.
	**/
	var deltaSmoothingMax : Float;
	/**
		The number of frames that the cooldown is set to after the browser panics over the FPS rate, usually
		as a result of switching tabs and regaining focus.
		
		This can be changed in the Game Config via the `fps.panicMax` property. The default is 120.
	**/
	var panicMax : Float;
	/**
		The actual elapsed time in ms between one update and the next.
		
		Unlike with `delta`, no smoothing, capping, or averaging is applied to this value.
		So please be careful when using this value in math calculations.
	**/
	var rawDelta : Float;
	/**
		The time, set at the start of the current step.
		
		This is typically a high resolution timer value, as provided by Request Animation Frame.
		
		This can differ from the `time` value in that it isn't calculated based on the delta value.
	**/
	var now : Float;
	/**
		Apply smoothing to the delta value used within Phasers internal calculations?
		
		This can be changed in the Game Config via the `fps.smoothStep` property. The default is `true`.
		
		Smoothing helps settle down the delta values after browser tab switches, or other situations
		which could cause significant delta spikes or dips. By default it has been enabled in Phaser 3
		since the first version, but is now exposed under this property (and the corresponding game config
		`smoothStep` value), to allow you to easily disable it, should you require.
	**/
	var smoothStep : Bool;
	/**
		Called by the Game instance when the DOM window.onBlur event triggers.
	**/
	function blur():Void;
	/**
		Called by the Game instance when the DOM window.onFocus event triggers.
	**/
	function focus():Void;
	/**
		Called when the visibility API says the game is 'hidden' (tab switch out of view, etc)
	**/
	function pause():Void;
	/**
		Called when the visibility API says the game is 'visible' again (tab switch back into view, etc)
	**/
	function resume():Void;
	/**
		Resets the time, lastTime, fps averages and delta history.
		Called automatically when a browser sleeps them resumes.
	**/
	function resetDelta():Void;
	/**
		Starts the Time Step running, if it is not already doing so.
		Called automatically by the Game Boot process.
	**/
	function start(callback:phaser.types.core.TimeStepCallback):Void;
	/**
		Takes the delta value and smooths it based on the previous frames.
		
		Called automatically as part of the step.
	**/
	function smoothDelta(delta:Float):Float;
	/**
		Update the estimate of the frame rate, `fps`. Every second, the number
		of frames that occurred in that second are included in an exponential
		moving average of all frames per second, with an alpha of 0.25. This
		means that more recent seconds affect the estimated frame rate more than
		older seconds.
		
		When a browser window is NOT minimized, but is covered up (i.e. you're using
		another app which has spawned a window over the top of the browser), then it
		will start to throttle the raf callback time. It waits for a while, and then
		starts to drop the frame rate at 1 frame per second until it's down to just over 1fps.
		So if the game was running at 60fps, and the player opens a new window, then
		after 60 seconds (+ the 'buffer time') it'll be down to 1fps, so rafin'g at 1Hz.
		
		When they make the game visible again, the frame rate is increased at a rate of
		approx. 8fps, back up to 60fps (or the max it can obtain)
		
		There is no easy way to determine if this drop in frame rate is because the
		browser is throttling raf, or because the game is struggling with performance
		because you're asking it to do too much on the device.
		
		Compute the new exponential moving average with an alpha of 0.25.
	**/
	function updateFPS(time:Float):Void;
	/**
		The main step method with an fps limiter. This is called each time the browser updates, either by Request Animation Frame,
		or by Set Timeout. It is responsible for calculating the delta values, frame totals, cool down history and more.
		You generally should never call this method directly.
	**/
	function stepLimitFPS(time:Float):Void;
	/**
		The main step method. This is called each time the browser updates, either by Request Animation Frame,
		or by Set Timeout. It is responsible for calculating the delta values, frame totals, cool down history and more.
		You generally should never call this method directly.
	**/
	function step(time:Float):Void;
	/**
		Manually calls `TimeStep.step`.
	**/
	function tick():Void;
	/**
		Sends the TimeStep to sleep, stopping Request Animation Frame (or SetTimeout) and toggling the `running` flag to false.
	**/
	function sleep():Void;
	/**
		Wakes-up the TimeStep, restarting Request Animation Frame (or SetTimeout) and toggling the `running` flag to true.
		The `seamless` argument controls if the wake-up should adjust the start time or not.
	**/
	function wake(?seamless:Bool):Void;
	/**
		Gets the duration which the game has been running, in seconds.
	**/
	function getDuration():Float;
	/**
		Gets the duration which the game has been running, in ms.
	**/
	function getDurationMS():Float;
	/**
		Stops the TimeStep running.
	**/
	function stop():TimeStep;
	/**
		Destroys the TimeStep. This will stop Request Animation Frame, stop the step, clear the callbacks and null
		any objects.
	**/
	function destroy():Void;
	static var prototype : TimeStep;
}