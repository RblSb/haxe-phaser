package phaser.gameobjects;

/**
	The Game Object Creator is a Scene plugin that allows you to quickly create many common
	types of Game Objects and return them using a configuration object, rather than
	having to specify a limited set of parameters such as with the GameObjectFactory.
	
	Game Objects made via this class are automatically added to the Scene and Update List
	unless you explicitly set the `add` property in the configuration object to `false`.
**/
@:native("Phaser.GameObjects.GameObjectCreator") extern class GameObjectCreator {
	function new(scene:phaser.Scene);
	/**
		Creates a new Dynamic Bitmap Text Game Object and returns it.
		
		Note: This method will only be available if the Dynamic Bitmap Text Game Object has been built into Phaser.
	**/
	function dynamicBitmapText(config:phaser.types.gameobjects.bitmaptext.BitmapTextConfig, ?addToScene:Bool):DynamicBitmapText;
	/**
		Creates a new Bitmap Text Game Object and returns it.
		
		Note: This method will only be available if the Bitmap Text Game Object has been built into Phaser.
	**/
	function bitmapText(config:phaser.types.gameobjects.bitmaptext.BitmapTextConfig, ?addToScene:Bool):BitmapText;
	/**
		Creates a new Blitter Game Object and returns it.
		
		Note: This method will only be available if the Blitter Game Object has been built into Phaser.
	**/
	function blitter(config:phaser.types.gameobjects.sprite.SpriteConfig, ?addToScene:Bool):Blitter;
	/**
		Creates a new Container Game Object and returns it.
		
		Note: This method will only be available if the Container Game Object has been built into Phaser.
	**/
	function container(config:phaser.types.gameobjects.container.ContainerConfig, ?addToScene:Bool):Container;
	/**
		The Scene to which this Game Object Creator belongs.
	**/
	private var scene : phaser.Scene;
	/**
		A reference to the Scene.Systems.
	**/
	private var systems : phaser.scenes.Systems;
	/**
		A reference to the Scene Event Emitter.
	**/
	private var events : phaser.events.EventEmitter;
	/**
		A reference to the Scene Display List.
	**/
	private var displayList : DisplayList;
	/**
		A reference to the Scene Update List.
	**/
	private var updateList : UpdateList;
	/**
		Creates a new Graphics Game Object and returns it.
		
		Note: This method will only be available if the Graphics Game Object has been built into Phaser.
	**/
	function graphics(?config:phaser.types.gameobjects.graphics.Options, ?addToScene:Bool):Graphics;
	/**
		Creates a new Group Game Object and returns it.
		
		Note: This method will only be available if the Group Game Object has been built into Phaser.
	**/
	function group(config:ts.AnyOf2<phaser.types.gameobjects.group.GroupConfig, phaser.types.gameobjects.group.GroupCreateConfig>):Group;
	/**
		Creates a new Image Game Object and returns it.
		
		Note: This method will only be available if the Image Game Object has been built into Phaser.
	**/
	function image(config:phaser.types.gameobjects.sprite.SpriteConfig, ?addToScene:Bool):Image;
	/**
		Creates a new Layer Game Object and returns it.
		
		Note: This method will only be available if the Layer Game Object has been built into Phaser.
	**/
	function layer(config:phaser.types.gameobjects.sprite.SpriteConfig, ?addToScene:Bool):Layer;
	/**
		Creates a new Mesh Game Object and returns it.
		
		Note: This method will only be available if the Mesh Game Object and WebGL support have been built into Phaser.
	**/
	function mesh(config:phaser.types.gameobjects.mesh.MeshConfig, ?addToScene:Bool):Mesh;
	/**
		Creates a new Nine Slice Game Object and returns it.
		
		Note: This method will only be available if the Nine Slice Game Object and WebGL support have been built into Phaser.
	**/
	function nineslice(config:phaser.types.gameobjects.nineslice.NineSliceConfig, ?addToScene:Bool):NineSlice;
	/**
		Creates a new Particle Emitter Game Object and returns it.
		
		Prior to Phaser v3.60 this function would create a `ParticleEmitterManager`. These were removed
		in v3.60 and replaced with creating a `ParticleEmitter` instance directly. Please see the
		updated function parameters and class documentation for more details.
		
		Note: This method will only be available if the Particles Game Object has been built into Phaser.
	**/
	function particles(config:phaser.types.gameobjects.particles.ParticleEmitterCreatorConfig, ?addToScene:Bool):phaser.gameobjects.particles.ParticleEmitter;
	/**
		Creates a new Plane Game Object and returns it.
		
		Note: This method will only be available if the Plane Game Object and WebGL support have been built into Phaser.
	**/
	function plane(config:phaser.types.gameobjects.plane.PlaneConfig, ?addToScene:Bool):Plane;
	/**
		Creates a new Point Light Game Object and returns it.
		
		Note: This method will only be available if the Point Light Game Object has been built into Phaser.
	**/
	function pointlight(config:Dynamic, ?addToScene:Bool):PointLight;
	/**
		Creates a new Render Texture Game Object and returns it.
		
		Note: This method will only be available if the Render Texture Game Object has been built into Phaser.
		
		A Render Texture is a combination of Dynamic Texture and an Image Game Object, that uses the
		Dynamic Texture to display itself with.
		
		A Dynamic Texture is a special texture that allows you to draw textures, frames and most kind of
		Game Objects directly to it.
		
		You can take many complex objects and draw them to this one texture, which can then be used as the
		base texture for other Game Objects, such as Sprites. Should you then update this texture, all
		Game Objects using it will instantly be updated as well, reflecting the changes immediately.
		
		It's a powerful way to generate dynamic textures at run-time that are WebGL friendly and don't invoke
		expensive GPU uploads on each change.
	**/
	function renderTexture(config:phaser.types.gameobjects.rendertexture.RenderTextureConfig, ?addToScene:Bool):RenderTexture;
	/**
		Creates a new Rope Game Object and returns it.
		
		Note: This method will only be available if the Rope Game Object and WebGL support have been built into Phaser.
	**/
	function rope(config:phaser.types.gameobjects.rope.RopeConfig, ?addToScene:Bool):Rope;
	/**
		Creates a new Shader Game Object and returns it.
		
		Note: This method will only be available if the Shader Game Object and WebGL support have been built into Phaser.
	**/
	function shader(config:phaser.types.gameobjects.shader.ShaderConfig, ?addToScene:Bool):Shader;
	/**
		Creates a new Sprite Game Object and returns it.
		
		Note: This method will only be available if the Sprite Game Object has been built into Phaser.
	**/
	function sprite(config:phaser.types.gameobjects.sprite.SpriteConfig, ?addToScene:Bool):Sprite;
	/**
		Creates a new Text Game Object and returns it.
		
		Note: This method will only be available if the Text Game Object has been built into Phaser.
	**/
	function text(config:phaser.types.gameobjects.text.TextConfig, ?addToScene:Bool):Text;
	/**
		Creates a new TileSprite Game Object and returns it.
		
		Note: This method will only be available if the TileSprite Game Object has been built into Phaser.
	**/
	function tileSprite(config:phaser.types.gameobjects.tilesprite.TileSpriteConfig, ?addToScene:Bool):TileSprite;
	/**
		Creates a new Video Game Object and returns it.
		
		Note: This method will only be available if the Video Game Object has been built into Phaser.
	**/
	function video(config:phaser.types.gameobjects.video.VideoConfig, ?addToScene:Bool):Video;
	/**
		Creates a new Zone Game Object and returns it.
		
		Note: This method will only be available if the Zone Game Object has been built into Phaser.
	**/
	function zone(config:phaser.types.gameobjects.zone.ZoneConfig):Zone;
	/**
		Creates a Tilemap from the given key or data, or creates a blank Tilemap if no key/data provided.
		When loading from CSV or a 2D array, you should specify the tileWidth & tileHeight. When parsing
		from a map from Tiled, the tileWidth, tileHeight, width & height will be pulled from the map
		data. For an empty map, you should specify tileWidth, tileHeight, width & height.
	**/
	function tilemap(?config:phaser.types.tilemaps.TilemapConfig):phaser.tilemaps.Tilemap;
	/**
		Creates a new Tween object and returns it.
		
		Note: This method will only be available if Tweens have been built into Phaser.
	**/
	function tween(config:ts.AnyOf4<phaser.types.tweens.TweenBuilderConfig, phaser.types.tweens.TweenChainBuilderConfig, phaser.tweens.Tween, phaser.tweens.TweenChain>):phaser.tweens.Tween;
	/**
		Creates a new TweenChain object and returns it, without adding it to the Tween Manager.
		
		Note: This method will only be available if Tweens have been built into Phaser.
	**/
	function tweenchain(config:ts.AnyOf2<Dynamic, phaser.types.tweens.TweenBuilderConfig>):phaser.tweens.TweenChain;
	static var prototype : GameObjectCreator;
	/**
		Static method called directly by the Game Object creator functions.
		With this method you can register a custom GameObject factory in the GameObjectCreator,
		providing a name (`factoryType`) and the constructor (`factoryFunction`) in order
		to be called when you invoke Phaser.Scene.make[ factoryType ] method.
	**/
	static function register(factoryType:String, factoryFunction:haxe.Constraints.Function):Void;
	/**
		Static method called directly by the Game Object Creator functions.
		
		With this method you can remove a custom Game Object Creator that has been previously
		registered in the Game Object Creator. Pass in its `factoryType` in order to remove it.
	**/
	static function remove(factoryType:String):Void;
}