package phaser.scenes;

/**
	The Scene Plugin is the main interface to the Scene Manager and allows you to control
	any Scene running in your game. You should always use this plugin. By default, it is
	mapped to the Scene property `this.scene`. Meaning, from within a Scene, you can call
	methods such as `this.scene.start()`.
	
	Note that nearly all methods in this class are run on a queue-basis and not
	immediately. For example, calling `this.scene.launch('SceneB')` will try to
	launch SceneB when the Scene Manager next updates, which is at the start of the game
	step. All operations are queued and run in the order in which they are invoked here.
**/
@:native("Phaser.Scenes.ScenePlugin") extern class ScenePlugin {
	function new(scene:phaser.Scene);
	/**
		The Scene that this ScenePlugin belongs to.
	**/
	var scene : phaser.Scene;
	/**
		The Scene Systems instance of the Scene that this ScenePlugin belongs to.
	**/
	var systems : Systems;
	/**
		The settings of the Scene this ScenePlugin belongs to.
	**/
	var settings : phaser.types.scenes.SettingsObject;
	/**
		The key of the Scene this ScenePlugin belongs to.
	**/
	var key : String;
	/**
		The Game's SceneManager.
	**/
	var manager : SceneManager;
	/**
		If this Scene is currently transitioning to another, this holds
		the current percentage of the transition progress, between 0 and 1.
	**/
	var transitionProgress : Float;
	/**
		Shutdown this Scene and run the given one.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function start<T>(?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Restarts this Scene.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function restart(?data:Dynamic):ScenePlugin;
	/**
		This will start a transition from the current Scene to the target Scene given.
		
		The target Scene cannot be the same as the current Scene.
		
		The transition will last for the duration specified in milliseconds.
		
		You can have the target Scene moved above or below this one in the display list.
		
		You can specify an update callback. This callback will be invoked _every frame_ for the duration
		of the transition.
		
		This Scene can either be sent to sleep at the end of the transition, or stopped. The default is to stop.
		
		There are also 5 transition related events: This scene will emit the event `transitionout` when
		the transition begins, which is typically the frame after calling this method.
		
		The target Scene will emit the event `transitioninit` when that Scene's `init` method is called.
		It will then emit the event `transitionstart` when its `create` method is called.
		If the Scene was sleeping and has been woken up, it will emit the event `transitionwake` instead of these two,
		as the Scenes `init` and `create` methods are not invoked when a Scene wakes up.
		
		When the duration of the transition has elapsed it will emit the event `transitioncomplete`.
		These events are cleared of all listeners when the Scene shuts down, but not if it is sent to sleep.
		
		It's important to understand that the duration of the transition begins the moment you call this method.
		If the Scene you are transitioning to includes delayed processes, such as waiting for files to load, the
		time still counts down even while that is happening. If the game itself pauses, or something else causes
		this Scenes update loop to stop, then the transition will also pause for that duration. There are
		checks in place to prevent you accidentally stopping a transitioning Scene but if you've got code to
		override this understand that until the target Scene completes it might never be unlocked for input events.
	**/
	function transition(config:phaser.types.scenes.SceneTransitionConfig):Bool;
	/**
		Add the Scene into the Scene Manager and start it if 'autoStart' is true or the Scene config 'active' property is set.
	**/
	function add(key:String, sceneConfig:phaser.types.scenes.SceneType, ?autoStart:Bool, ?data:Dynamic):Null<phaser.Scene>;
	/**
		Launch the given Scene and run it in parallel with this one.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function launch<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Runs the given Scene, but does not change the state of this Scene.
		
		This will happen at the next Scene Manager update, not immediately.
		
		If the given Scene is paused, it will resume it. If sleeping, it will wake it.
		If not running at all, it will be started.
		
		Use this if you wish to open a modal Scene by calling `pause` on the current
		Scene, then `run` on the modal Scene.
	**/
	function run<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Pause the Scene - this stops the update step from happening but it still renders.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function pause<T>(?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Resume the Scene - starts the update loop again.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function resume<T>(?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Makes the Scene sleep (no update, no render) but doesn't shutdown.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function sleep<T>(?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Makes the Scene wake-up (starts update and render)
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	function wake<T>(?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Makes this Scene sleep then starts the Scene given.
		
		This will happen at the next Scene Manager update, not immediately.
	**/
	@:native("switch")
	function switch_<T>(key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Shutdown the Scene, clearing display list, timers, etc.
		
		This happens at the next Scene Manager update, not immediately.
	**/
	function stop<T>(?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Sets the active state of the given Scene.
	**/
	function setActive<T>(value:Bool, ?key:ts.AnyOf2<String, T>, ?data:Dynamic):ScenePlugin;
	/**
		Sets the visible state of the given Scene.
	**/
	function setVisible<T>(value:Bool, ?key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Checks if the given Scene is sleeping or not?
	**/
	function isSleeping<T>(?key:ts.AnyOf2<String, T>):Bool;
	/**
		Checks if the given Scene is running or not?
	**/
	function isActive<T>(?key:ts.AnyOf2<String, T>):Bool;
	/**
		Checks if the given Scene is paused or not?
	**/
	function isPaused<T>(?key:ts.AnyOf2<String, T>):Bool;
	/**
		Checks if the given Scene is visible or not?
	**/
	function isVisible<T>(?key:ts.AnyOf2<String, T>):Bool;
	/**
		Swaps the position of two scenes in the Scenes list.
		
		This controls the order in which they are rendered and updated.
	**/
	function swapPosition<T>(keyA:ts.AnyOf2<String, T>, ?keyB:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Swaps the position of two scenes in the Scenes list, so that Scene B is directly above Scene A.
		
		This controls the order in which they are rendered and updated.
	**/
	function moveAbove<T>(keyA:ts.AnyOf2<String, T>, ?keyB:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Swaps the position of two scenes in the Scenes list, so that Scene B is directly below Scene A.
		
		This controls the order in which they are rendered and updated.
	**/
	function moveBelow<T>(keyA:ts.AnyOf2<String, T>, ?keyB:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Removes a Scene from the SceneManager.
		
		The Scene is removed from the local scenes array, it's key is cleared from the keys
		cache and Scene.Systems.destroy is then called on it.
		
		If the SceneManager is processing the Scenes when this method is called it will
		queue the operation for the next update sequence.
	**/
	function remove<T>(?key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Moves a Scene up one position in the Scenes list.
	**/
	function moveUp<T>(?key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Moves a Scene down one position in the Scenes list.
	**/
	function moveDown<T>(?key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Brings a Scene to the top of the Scenes list.
		
		This means it will render above all other Scenes.
	**/
	function bringToTop<T>(?key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Sends a Scene to the back of the Scenes list.
		
		This means it will render below all other Scenes.
	**/
	function sendToBack<T>(?key:ts.AnyOf2<String, T>):ScenePlugin;
	/**
		Retrieve a Scene.
	**/
	function get<T>(key:ts.AnyOf2<String, T>):T;
	/**
		Return the status of the Scene.
	**/
	function getStatus<T>(key:ts.AnyOf2<String, T>):Float;
	/**
		Retrieves the numeric index of a Scene in the Scenes list.
	**/
	function getIndex<T>(?key:ts.AnyOf2<String, T>):Float;
	static var prototype : ScenePlugin;
}