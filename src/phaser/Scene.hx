package phaser;

/**
	A base Phaser.Scene class which can be extended for your own use.
	
	You can also define the optional methods {@link Phaser.Types.Scenes.SceneInitCallback init()}, {@link Phaser.Types.Scenes.ScenePreloadCallback preload()}, and {@link Phaser.Types.Scenes.SceneCreateCallback create()}.
**/
@:native("Phaser.Scene") extern class Scene {
	function new(?config:ts.AnyOf2<String, phaser.types.scenes.SettingsConfig>);
	/**
		The Scene Systems. You must never overwrite this property, or all hell will break lose.
	**/
	var sys : phaser.scenes.Systems;
	/**
		A reference to the Phaser.Game instance.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var game : Game;
	/**
		A reference to the global Animation Manager.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var anims : phaser.animations.AnimationManager;
	/**
		A reference to the global Cache.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var cache : phaser.cache.CacheManager;
	/**
		A reference to the global Data Manager.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var registry : phaser.data.DataManager;
	/**
		A reference to the Sound Manager.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var sound : ts.AnyOf3<phaser.sound.NoAudioSoundManager, phaser.sound.HTML5AudioSoundManager, phaser.sound.WebAudioSoundManager>;
	/**
		A reference to the Texture Manager.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var textures : phaser.textures.TextureManager;
	/**
		A Scene specific Event Emitter.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var events : phaser.events.EventEmitter;
	/**
		The Scene Camera Manager.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var cameras : phaser.cameras.scene2d.CameraManager;
	/**
		The Scene Game Object Factory.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var add : phaser.gameobjects.GameObjectFactory;
	/**
		The Scene Game Object Creator.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var make : phaser.gameobjects.GameObjectCreator;
	/**
		A reference to the Scene Manager Plugin.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var scene : phaser.scenes.ScenePlugin;
	/**
		The Game Object Display List belonging to this Scene.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var children : phaser.gameobjects.DisplayList;
	/**
		The Scene Lights Manager Plugin.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var lights : phaser.gameobjects.LightsManager;
	/**
		A Scene specific Data Manager Plugin.
		
		See the `registry` property for the global Data Manager.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var data : phaser.data.DataManager;
	/**
		The Scene Input Manager Plugin.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var input : phaser.input.InputPlugin;
	/**
		The Scene Loader Plugin.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var load : phaser.loader.LoaderPlugin;
	/**
		The Scene Time and Clock Plugin.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var time : phaser.time.Clock;
	/**
		The Scene Tween Manager Plugin.
		
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var tweens : phaser.tweens.TweenManager;
	/**
		The Scene Arcade Physics Plugin.
		
		This property will only be available if defined in the Scene Injection Map, the plugin is installed and configured.
	**/
	var physics : phaser.physics.arcade.ArcadePhysics;
	/**
		The Scene Matter Physics Plugin.
		
		This property will only be available if defined in the Scene Injection Map, the plugin is installed and configured.
	**/
	var matter : phaser.physics.matter.MatterPhysics;
	/**
		The Facebook Instant Games Plugin.
		
		This property will only be available if defined in the Scene Injection Map, the plugin is installed and configured.
	**/
	var facebook : FacebookInstantGamesPlugin;
	/**
		A reference to the global Scale Manager.
		
		This property will only be available if defined in the Scene Injection Map.
	**/
	var scale : phaser.scale.ScaleManager;
	/**
		A reference to the global Plugin Manager.
		
		The Plugin Manager is a global system that allows plugins to register themselves with it, and can then install
		those plugins into Scenes as required.
	**/
	var plugins : phaser.plugins.PluginManager;
	/**
		A reference to the renderer instance Phaser is using, either Canvas Renderer or WebGL Renderer.
	**/
	var renderer : ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>;
	/**
		This method should be overridden by your own Scenes.
		
		This method is called once per game step while the scene is running.
	**/
	function update(time:Float, delta:Float):Void;
	static var prototype : Scene;
}