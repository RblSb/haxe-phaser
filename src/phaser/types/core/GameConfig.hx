package phaser.types.core;

typedef GameConfig = {
	/**
		The width of the game, in game pixels.
	**/
	@:optional
	var width : ts.AnyOf2<String, Float>;
	/**
		The height of the game, in game pixels.
	**/
	@:optional
	var height : ts.AnyOf2<String, Float>;
	/**
		Simple scale applied to the game canvas. 2 is double size, 0.5 is half size, etc.
	**/
	@:optional
	var zoom : Float;
	/**
		Which renderer to use. Phaser.AUTO, Phaser.CANVAS, Phaser.HEADLESS, or Phaser.WEBGL. AUTO picks WEBGL if available, otherwise CANVAS.
	**/
	@:optional
	var type : Float;
	/**
		`true` or `1` = Use the built-in StableSort (needed for older browsers), `false` or `0` = Rely on ES2019 Array.sort being stable (modern browsers only), or `-1` = Try and determine this automatically based on browser inspection (not guaranteed to work, errs on side of caution).
	**/
	@:optional
	var stableSort : ts.AnyOf2<Float, Bool>;
	/**
		The DOM element that will contain the game canvas, or its `id`. If undefined, or if the named element doesn't exist, the game canvas is appended to the document body. If `null` no parent will be used and you are responsible for adding the canvas to the dom.
	**/
	@:optional
	var parent : ts.AnyOf2<String, js.html.Element>;
	/**
		Provide your own Canvas element for Phaser to use instead of creating one.
	**/
	@:optional
	var canvas : js.html.CanvasElement;
	/**
		CSS styles to apply to the game canvas instead of Phasers default styles.
	**/
	@:optional
	var canvasStyle : String;
	/**
		Is Phaser running under a custom (non-native web) environment? If so, set this to `true` to skip internal Feature detection. If `true` the `renderType` cannot be left as `AUTO`.
	**/
	@:optional
	var customEnvironment : Bool;
	/**
		Provide your own Canvas Context for Phaser to use, instead of creating one.
	**/
	@:optional
	var context : js.html.CanvasRenderingContext2D;
	/**
		A scene or scenes to add to the game. If several are given, the first is started; the remainder are started only if they have `{ active: true }`. See the `sceneConfig` argument in `Phaser.Scenes.SceneManager#add`.
	**/
	@:optional
	var scene : ts.AnyOf5<haxe.Constraints.Function, phaser.Scene, phaser.types.scenes.SettingsConfig, phaser.types.scenes.CreateSceneFromObjectConfig, Array<phaser.types.scenes.SceneType>>;
	/**
		Seed for the random number generator.
	**/
	@:optional
	var seed : Array<String>;
	/**
		The title of the game. Shown in the browser console.
	**/
	@:optional
	var title : String;
	/**
		The URL of the game. Shown in the browser console.
	**/
	@:optional
	var url : String;
	/**
		The version of the game. Shown in the browser console.
	**/
	@:optional
	var version : String;
	/**
		Automatically call window.focus() when the game boots. Usually necessary to capture input events if the game is in a separate frame.
	**/
	@:optional
	var autoFocus : Bool;
	/**
		Input configuration, or `false` to disable all game input.
	**/
	@:optional
	var input : ts.AnyOf2<Bool, InputConfig>;
	/**
		Disable the browser's default 'contextmenu' event (usually triggered by a right-button mouse click).
	**/
	@:optional
	var disableContextMenu : Bool;
	/**
		Configuration for the banner printed in the browser console when the game starts.
	**/
	@:optional
	var banner : ts.AnyOf2<Bool, BannerConfig>;
	/**
		The DOM Container configuration object.
	**/
	@:optional
	var dom : DOMContainerConfig;
	/**
		Game loop configuration.
	**/
	@:optional
	var fps : FPSConfig;
	/**
		Game renderer configuration.
	**/
	@:optional
	var render : RenderConfig;
	/**
		Optional callbacks to run before or after game boot.
	**/
	@:optional
	var callbacks : CallbacksConfig;
	/**
		Loader configuration.
	**/
	@:optional
	var loader : LoaderConfig;
	/**
		Images configuration.
	**/
	@:optional
	var images : ImagesConfig;
	/**
		Physics configuration.
	**/
	@:optional
	var physics : PhysicsConfig;
	/**
		Plugins to install.
	**/
	@:optional
	var plugins : ts.AnyOf2<PluginObject, Array<PluginObjectItem>>;
	/**
		The Scale Manager configuration.
	**/
	@:optional
	var scale : ScaleConfig;
	/**
		The Audio Configuration object.
	**/
	@:optional
	var audio : AudioConfig;
	/**
		A WebGL Pipeline configuration object. Can also be part of the `RenderConfig`.
	**/
	@:optional
	var pipeline : PipelineConfig;
	/**
		The background color of the game canvas. The default is black.
	**/
	@:optional
	var backgroundColor : ts.AnyOf2<String, Float>;
	/**
		When set to `true`, WebGL uses linear interpolation to draw scaled or rotated textures, giving a smooth appearance. When set to `false`, WebGL uses nearest-neighbor interpolation, giving a crisper appearance. `false` also disables antialiasing of the game canvas itself, if the browser supports it, when the game canvas is scaled.
	**/
	@:optional
	var antialias : Bool;
	/**
		Sets the `antialias` property when the WebGL context is created. Setting this value does not impact any subsequent textures that are created, or the canvas style attributes.
	**/
	@:optional
	var antialiasGL : Bool;
	/**
		When set to `true` it will create a desynchronized context for both 2D and WebGL. See https://developers.google.com/web/updates/2019/05/desynchronized for details.
	**/
	@:optional
	var desynchronized : Bool;
	/**
		Sets `antialias` to false and `roundPixels` to true. This is the best setting for pixel-art games.
	**/
	@:optional
	var pixelArt : Bool;
	/**
		Draw texture-based Game Objects at only whole-integer positions. Game Objects without textures, like Graphics, ignore this property.
	**/
	@:optional
	var roundPixels : Bool;
	/**
		Whether the game canvas will be transparent. Boolean that indicates if the canvas contains an alpha channel. If set to false, the browser now knows that the backdrop is always opaque, which can speed up drawing of transparent content and images.
	**/
	@:optional
	var transparent : Bool;
	/**
		Whether the game canvas will be cleared between each rendering frame.
	**/
	@:optional
	var clearBeforeRender : Bool;
	/**
		If the value is true the WebGL buffers will not be cleared and will preserve their values until cleared or overwritten by the author.
	**/
	@:optional
	var preserveDrawingBuffer : Bool;
	/**
		In WebGL mode, the drawing buffer contains colors with pre-multiplied alpha.
	**/
	@:optional
	var premultipliedAlpha : Bool;
	/**
		Let the browser abort creating a WebGL context if it judges performance would be unacceptable.
	**/
	@:optional
	var failIfMajorPerformanceCaveat : Bool;
	/**
		"high-performance", "low-power" or "default". A hint to the browser on how much device power the game might use.
	**/
	@:optional
	var powerPreference : String;
	/**
		The default WebGL batch size. Represents the number of _quads_ that can be added to a single batch.
	**/
	@:optional
	var batchSize : Float;
	/**
		The maximum number of lights allowed to be visible within range of a single Camera in the LightManager.
	**/
	@:optional
	var maxLights : Float;
	/**
		When in WebGL mode, this sets the maximum number of GPU Textures to use. The default, -1, will use all available units. The WebGL1 spec says all browsers should provide a minimum of 8.
	**/
	@:optional
	var maxTextures : Float;
	/**
		The mipmap magFilter to be used when creating WebGL textures.
	**/
	@:optional
	var mipmapFilter : String;
	/**
		Automatically enable the Mobile Pipeline if iOS or Android detected?
	**/
	@:optional
	var autoMobilePipeline : Bool;
	/**
		The WebGL Pipeline that Game Objects will use by default. Set to 'MultiPipeline' as standard.
	**/
	@:optional
	var defaultPipeline : String;
	/**
		Is the Scale Manager allowed to adjust the CSS height property of the parent and/or document body to be 100%?
	**/
	@:optional
	var expandParent : Bool;
	/**
		The scale mode.
	**/
	@:optional
	var mode : phaser.scale.ScaleModes;
	/**
		The minimum width and height the canvas can be scaled down to.
	**/
	@:optional
	var min : WidthHeight;
	/**
		The maximum width the canvas can be scaled up to.
	**/
	@:optional
	var max : WidthHeight;
	/**
		Automatically round the display and style sizes of the canvas. This can help with performance in lower-powered devices.
	**/
	@:optional
	var autoRound : Bool;
	/**
		Automatically center the canvas within the parent?
	**/
	@:optional
	var autoCenter : phaser.scale.Center;
	/**
		How many ms should elapse before checking if the browser size has changed?
	**/
	@:optional
	var resizeInterval : Float;
	/**
		The DOM element that will be sent into full screen mode, or its `id`. If undefined Phaser will create its own div and insert the canvas into it when entering fullscreen mode.
	**/
	@:optional
	var fullscreenTarget : ts.AnyOf2<String, js.html.Element>;
	/**
		Disables the automatic creation of the Pre FX Pipelines. If disabled, you cannot use the built-in Pre FX on Game Objects.
	**/
	@:optional
	var disablePreFX : Bool;
	/**
		Disables the automatic creation of the Post FX Pipelines. If disabled, you cannot use the built-in Post FX on Game Objects.
	**/
	@:optional
	var disablePostFX : Bool;
};