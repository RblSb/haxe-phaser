package phaser.scenes;

/**
	The Scene Manager.
	
	The Scene Manager is a Game level system, responsible for creating, processing and updating all of the
	Scenes in a Game instance.
	
	You should not usually interact directly with the Scene Manager at all. Instead, you should use
	the Scene Plugin, which is available from every Scene in your game via the `this.scene` property.
	
	Using methods in this Scene Manager directly will break queued operations and can cause runtime
	errors. Instead, go via the Scene Plugin. Every feature this Scene Manager provides is also
	available via the Scene Plugin.
**/
@:native("Phaser.Scenes.SceneManager") extern class SceneManager {
	function new(game:phaser.Game, sceneConfig:Dynamic);
	/**
		The Game that this SceneManager belongs to.
	**/
	var game : phaser.Game;
	/**
		An object that maps the keys to the scene so we can quickly get a scene from a key without iteration.
	**/
	var keys : haxe.DynamicAccess<phaser.Scene>;
	/**
		The array in which all of the scenes are kept.
	**/
	var scenes : Array<phaser.Scene>;
	/**
		Is the Scene Manager actively processing the Scenes list?
	**/
	final isProcessing : Bool;
	/**
		Has the Scene Manager properly started?
	**/
	final isBooted : Bool;
	/**
		Do any of the Cameras in any of the Scenes require a custom viewport?
		If not we can skip scissor tests.
	**/
	var customViewports : Float;
	/**
		This system Scene is created during `bootQueue` and is a default
		empty Scene that lives outside of the Scene list, but can be used
		by plugins and managers that need access to a live Scene, without
		being tied to one.
	**/
	var systemScene : phaser.Scene;
	/**
		Process the Scene operations queue.
	**/
	function processQueue():Void;
	/**
		Adds a new Scene into the SceneManager.
		You must give each Scene a unique key by which you'll identify it.
		
		The `sceneConfig` can be:
		
		* A `Phaser.Scene` object, or an object that extends it.
		* A plain JavaScript object
		* A JavaScript ES6 Class that extends `Phaser.Scene`
		* A JavaScript ES5 prototype based Class
		* A JavaScript function
		
		If a function is given then a new Scene will be created by calling it.
	**/
	function add(key:String, sceneConfig:phaser.types.scenes.SceneType, ?autoStart:Bool, ?data:Dynamic):Null<phaser.Scene>;
	/**
		Removes a Scene from the SceneManager.
		
		The Scene is removed from the local scenes array, it's key is cleared from the keys
		cache and Scene.Systems.destroy is then called on it.
		
		If the SceneManager is processing the Scenes when this method is called it will
		queue the operation for the next update sequence.
	**/
	function remove(key:String):SceneManager;
	/**
		Updates the Scenes.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Renders the Scenes.
	**/
	function render(renderer:ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>):Void;
	/**
		Returns an array of all the current Scenes being managed by this Scene Manager.
		
		You can filter the output by the active state of the Scene and choose to have
		the array returned in normal or reversed order.
	**/
	function getScenes<T>(?isActive:Bool, ?inReverse:Bool):T;
	/**
		Retrieves a Scene based on the given key.
		
		If an actual Scene is passed to this method, it can be used to check if
		its currently within the Scene Manager, or not.
	**/
	function getScene<T>(key:ts.AnyOf2<String, T>):T;
	/**
		Determines whether a Scene is running.
	**/
	function isActive<T>(key:ts.AnyOf2<String, T>):Bool;
	/**
		Determines whether a Scene is paused.
	**/
	function isPaused<T>(key:ts.AnyOf2<String, T>):Bool;
	/**
		Determines whether a Scene is visible.
	**/
	function isVisible<T>(key:ts.AnyOf2<String, T>):Bool;
	/**
		Determines whether a Scene is sleeping.
	**/
	function isSleeping<T>(key:ts.AnyOf2<String, T>):Bool;
	/**
		Pauses the given Scene.
	**/
	function pause<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Resumes the given Scene.
	**/
	function resume<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Puts the given Scene to sleep.
	**/
	function sleep<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Awakens the given Scene.
	**/
	function wake<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Runs the given Scene.
		
		If the given Scene is paused, it will resume it. If sleeping, it will wake it.
		If not running at all, it will be started.
		
		Use this if you wish to open a modal Scene by calling `pause` on the current
		Scene, then `run` on the modal Scene.
	**/
	function run<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Starts the given Scene, if it is not starting, loading, or creating.
		
		If the Scene is running, paused, or sleeping, it will be shutdown and then started.
	**/
	function start<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Stops the given Scene.
	**/
	function stop<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):SceneManager;
	/**
		Sleeps one one Scene and starts the other.
	**/
	@:native("switch")
	function switch_<T>(from:ts.AnyOf2<String, T>, to:ts.AnyOf2<String, T>):SceneManager;
	/**
		Retrieves a Scene by numeric index.
	**/
	function getAt<T>(index:Float):T;
	/**
		Retrieves the numeric index of a Scene.
	**/
	function getIndex<T>(key:ts.AnyOf2<String, T>):Float;
	/**
		Brings a Scene to the top of the Scenes list.
		
		This means it will render above all other Scenes.
	**/
	function bringToTop<T>(key:ts.AnyOf2<String, T>):SceneManager;
	/**
		Sends a Scene to the back of the Scenes list.
		
		This means it will render below all other Scenes.
	**/
	function sendToBack<T>(key:ts.AnyOf2<String, T>):SceneManager;
	/**
		Moves a Scene down one position in the Scenes list.
	**/
	function moveDown<T>(key:ts.AnyOf2<String, T>):SceneManager;
	/**
		Moves a Scene up one position in the Scenes list.
	**/
	function moveUp<T>(key:ts.AnyOf2<String, T>):SceneManager;
	/**
		Moves a Scene so it is immediately above another Scene in the Scenes list.
		
		This means it will render over the top of the other Scene.
	**/
	function moveAbove<T>(keyA:ts.AnyOf2<String, T>, keyB:ts.AnyOf2<String, T>):SceneManager;
	/**
		Moves a Scene so it is immediately below another Scene in the Scenes list.
		
		This means it will render behind the other Scene.
	**/
	function moveBelow<T>(keyA:ts.AnyOf2<String, T>, keyB:ts.AnyOf2<String, T>):SceneManager;
	/**
		Swaps the positions of two Scenes in the Scenes list.
	**/
	function swapPosition<T>(keyA:ts.AnyOf2<String, T>, keyB:ts.AnyOf2<String, T>):SceneManager;
	/**
		Dumps debug information about each Scene to the developer console.
	**/
	function dump():Void;
	/**
		Destroy this Scene Manager and all of its systems.
		
		This process cannot be reversed.
		
		This method is called automatically when a Phaser Game instance is destroyed.
	**/
	function destroy():Void;
	static var prototype : SceneManager;
}