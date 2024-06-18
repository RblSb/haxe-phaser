package phaser.time;

/**
	A Timeline is a way to schedule events to happen at specific times in the future.
	
	You can think of it as an event sequencer for your game, allowing you to schedule the
	running of callbacks, events and other actions at specific times in the future.
	
	A Timeline is a Scene level system, meaning you can have as many Timelines as you like, each
	belonging to a different Scene. You can also have multiple Timelines running at the same time.
	
	If the Scene is paused, the Timeline will also pause. If the Scene is destroyed, the Timeline
	will be automatically destroyed. However, you can control the Timeline directly, pausing,
	resuming and stopping it at any time.
	
	Create an instance of a Timeline via the Game Object Factory:
	
	```js
	const timeline = this.add.timeline();
	```
	
	The Timeline always starts paused. You must call `play` on it to start it running.
	
	You can also pass in a configuration object on creation, or an array of them:
	
	```js
	const timeline = this.add.timeline({
	     at: 1000,
	     run: () => {
	         this.add.sprite(400, 300, 'logo');
	     }
	});
	
	timeline.play();
	```
	
	In this example we sequence a few different events:
	
	```js
	const timeline = this.add.timeline([
	     {
	         at: 1000,
	         run: () => { this.logo = this.add.sprite(400, 300, 'logo'); },
	         sound: 'TitleMusic'
	     },
	     {
	         at: 2500,
	         tween: {
	             targets: this.logo,
	             y: 600,
	             yoyo: true
	         },
	         sound: 'Explode'
	     },
	     {
	         at: 8000,
	         event: 'HURRY_PLAYER',
	         target: this.background,
	         set: {
	             tint: 0xff0000
	         }
	     }
	]);
	
	timeline.play();
	```
	
	The Timeline can also be looped with the repeat method:
	```js
	timeline.repeat().play();
	```
	
	There are lots of options available to you via the configuration object. See the
	{@link Phaser.Types.Time.TimelineEventConfig} typedef for more details.
**/
@:native("Phaser.Time.Timeline") extern class Timeline extends phaser.events.EventEmitter {
	function new(scene:phaser.Scene, ?config:ts.AnyOf2<phaser.types.time.TimelineEventConfig, Array<phaser.types.time.TimelineEventConfig>>);
	/**
		The Scene to which this Timeline belongs.
	**/
	var scene : phaser.Scene;
	/**
		A reference to the Scene Systems.
	**/
	var systems : phaser.scenes.Systems;
	/**
		The elapsed time counter.
		
		Treat this as read-only.
	**/
	var elapsed : Float;
	/**
		Whether the Timeline is running (`true`) or active (`false`).
		
		When paused, the Timeline will not run any of its actions.
		
		By default a Timeline is always paused and should be started by
		calling the `Timeline.play` method.
		
		You can use the `Timeline.pause` and `Timeline.resume` methods to control
		this value in a chainable way.
	**/
	var paused : Bool;
	/**
		Whether the Timeline is complete (`true`) or not (`false`).
		
		A Timeline is considered complete when all of its events have been run.
		
		If you wish to reset a Timeline after it has completed, you can do so
		by calling the `Timeline.reset` method.
		
		You can also use the `Timeline.stop` method to stop a running Timeline,
		at any point, without resetting it.
	**/
	var complete : Bool;
	/**
		The total number of events that have been run.
		
		This value is reset to zero if the Timeline is restarted.
		
		Treat this as read-only.
	**/
	var totalComplete : Float;
	/**
		The number of times this timeline should loop.
		
		If this value is -1 or any negative number this Timeline will not stop.
	**/
	var loop : Float;
	/**
		The number of times this Timeline has looped.
		
		This value is incremented each loop if looping is enabled.
	**/
	var iteration : Float;
	/**
		An array of all the Timeline Events.
	**/
	var events : Array<phaser.types.time.TimelineEvent>;
	/**
		Updates the elapsed time counter, if this Timeline is not paused.
	**/
	function preUpdate(time:Float, delta:Float):Void;
	/**
		Called automatically by the Scene update step.
		
		Iterates through all of the Timeline Events and checks to see if they should be run.
		
		If they should be run, then the `TimelineEvent.action` callback is invoked.
		
		If the `TimelineEvent.once` property is `true` then the event is removed from the Timeline.
		
		If the `TimelineEvent.event` property is set then the Timeline emits that event.
		
		If the `TimelineEvent.run` property is set then the Timeline invokes that method.
		
		If the `TimelineEvent.loop` property is set then the Timeline invokes that method when repeated.
		
		If the `TimelineEvent.target` property is set then the Timeline invokes the `run` method on that target.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Starts this Timeline running.
		
		If the Timeline is already running and the `fromStart` parameter is `true`,
		then calling this method will reset the Timeline events as incomplete.
		
		If you wish to resume a paused Timeline, then use the `Timeline.resume` method instead.
	**/
	function play(?fromStart:Bool):Timeline;
	/**
		Pauses this Timeline.
		
		To resume it again, call the `Timeline.resume` method or set the `Timeline.paused` property to `false`.
		
		If the Timeline is paused while processing the current game step, then it
		will carry on with all events that are due to run during that step and pause
		from the next game step.
		
		Note that if any Tweens have been started prior to calling this method, they will **not** be paused as well.
	**/
	function pause():Timeline;
	/**
		Repeats this Timeline.
		
		If the value for `amount` is positive, the Timeline will repeat that many additional times.
		For example a value of 1 will actually run this Timeline twice.
		
		Depending on the value given, `false` is 0 and `true`, undefined and negative numbers are infinite.
		
		If this Timeline had any events set to `once` that have already been removed,
		they will **not** be repeated each loop.
	**/
	function repeat(?amount:ts.AnyOf2<Float, Bool>):Timeline;
	/**
		Resumes this Timeline from a paused state.
		
		The Timeline will carry on from where it left off.
		
		If you need to reset the Timeline to the start, then call the `Timeline.reset` method.
	**/
	function resume():Timeline;
	/**
		Stops this Timeline.
		
		This will set the `paused` and `complete` properties to `true`.
		
		If you wish to reset the Timeline to the start, then call the `Timeline.reset` method.
	**/
	function stop():Timeline;
	/**
		Resets this Timeline back to the start.
		
		This will set the elapsed time to zero and set all events to be incomplete.
		
		If the Timeline had any events that were set to `once` that have already
		been removed, they will **not** be present again after calling this method.
		
		If the Timeline isn't currently running (i.e. it's paused or complete) then
		calling this method resets those states, the same as calling `Timeline.play(true)`.
	**/
	function reset(?loop:Bool):Timeline;
	/**
		Adds one or more events to this Timeline.
		
		You can pass in a single configuration object, or an array of them:
		
		```js
		const timeline = this.add.timeline({
		     at: 1000,
		     run: () => {
		         this.add.sprite(400, 300, 'logo');
		     }
		});
		```
	**/
	function add(config:ts.AnyOf2<phaser.types.time.TimelineEventConfig, Array<phaser.types.time.TimelineEventConfig>>):Timeline;
	/**
		Removes all events from this Timeline, resets the elapsed time to zero
		and pauses the Timeline.
	**/
	function clear():Timeline;
	/**
		Returns `true` if this Timeline is currently playing.
		
		A Timeline is playing if it is not paused or not complete.
	**/
	function isPlaying():Bool;
	/**
		Returns a number between 0 and 1 representing the progress of this Timeline.
		
		A value of 0 means the Timeline has just started, 0.5 means it's half way through,
		and 1 means it's complete.
		
		If the Timeline has no events, or all events have been removed, this will return 1.
		
		If the Timeline is paused, this will return the progress value at the time it was paused.
		
		Note that the value returned is based on the number of events that have been completed,
		not the 'duration' of the events (as this is unknown to the Timeline).
	**/
	function getProgress():Float;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Timeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Timeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Timeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Timeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Timeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Timeline;
	static var prototype : Timeline;
}