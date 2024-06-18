package phaser.textures;

/**
	When Phaser boots it will create an instance of this Texture Manager class.
	
	It is a global manager that handles all textures in your game. You can access it from within
	a Scene via the `this.textures` property.
	
	Its role is as a manager for all textures that your game uses. It can create, update and remove
	textures globally, as well as parse texture data from external files, such as sprite sheets
	and texture atlases.
	
	Sprites and other texture-based Game Objects get their texture data directly from this class.
**/
@:native("Phaser.Textures.TextureManager") extern class TextureManager extends phaser.events.EventEmitter {
	function new(game:phaser.Game);
	/**
		The Game that the Texture Manager belongs to.
		
		A game will only ever have one instance of a Texture Manager.
	**/
	var game : phaser.Game;
	/**
		The internal name of this manager.
	**/
	final name : String;
	/**
		This object contains all Textures that belong to this Texture Manager.
		
		Textures are identified by string-based keys, which are used as the property
		within this object. Therefore, you can access any texture directly from this
		object without any iteration.
		
		You should not typically modify this object directly, but instead use the
		methods provided by the Texture Manager to add and remove entries from it.
	**/
	var list : Dynamic;
	/**
		An Image Game Object that belongs to this Texture Manager.
		
		Used as a drawing stamp within Dynamic Textures.
		
		This is not part of the display list and doesn't render.
	**/
	final stamp : phaser.gameobjects.Image;
	/**
		The crop Rectangle as used by the Stamp when it needs to crop itself.
	**/
	var stampCrop : phaser.geom.Rectangle;
	/**
		If this flag is `true` then the Texture Manager will never emit any
		warnings to the console log that report missing textures.
	**/
	var silentWarnings : Bool;
	/**
		Checks the given texture key and throws a console.warn if the key is already in use, then returns false.
		
		If you wish to avoid the console.warn then use `TextureManager.exists` instead.
	**/
	function checkKey(key:String):Bool;
	/**
		Removes a Texture from the Texture Manager and destroys it. This will immediately
		clear all references to it from the Texture Manager, and if it has one, destroy its
		WebGLTexture. This will emit a `removetexture` event.
		
		Note: If you have any Game Objects still using this texture they will start throwing
		errors the next time they try to render. Make sure that removing the texture is the final
		step when clearing down to avoid this.
	**/
	function remove(key:ts.AnyOf2<String, Texture>):TextureManager;
	/**
		Removes a key from the Texture Manager but does not destroy the Texture that was using the key.
	**/
	function removeKey(key:String):TextureManager;
	/**
		Adds a new Texture to the Texture Manager created from the given Base64 encoded data.
		
		It works by creating an `Image` DOM object, then setting the `src` attribute to
		the given base64 encoded data. As a result, the process is asynchronous by its nature,
		so be sure to listen for the events this method dispatches before using the texture.
	**/
	function addBase64(key:String, data:Dynamic):TextureManager;
	/**
		Gets an existing texture frame and converts it into a base64 encoded image and returns the base64 data.
		
		You can also provide the image type and encoder options.
		
		This will only work with bitmap based texture frames, such as those created from Texture Atlases.
		It will not work with GL Texture objects, such as Shaders, or Render Textures. For those please
		see the WebGL Snapshot function instead.
	**/
	function getBase64(key:String, ?frame:ts.AnyOf2<String, Float>, ?type:String, ?encoderOptions:Float):String;
	/**
		Adds a new Texture to the Texture Manager created from the given Image element.
	**/
	function addImage(key:String, source:js.html.ImageElement, ?dataSource:ts.AnyOf2<js.html.CanvasElement, js.html.ImageElement>):Null<Texture>;
	/**
		Takes a WebGLTextureWrapper and creates a Phaser Texture from it, which is added to the Texture Manager using the given key.
		
		This allows you to then use the Texture as a normal texture for texture based Game Objects like Sprites.
		
		This is a WebGL only feature.
		
		Prior to Phaser 3.80.0, this method took a bare `WebGLTexture`
		as the `glTexture` parameter. You must now wrap the `WebGLTexture` in a
		`WebGLTextureWrapper` instance before passing it to this method.
	**/
	function addGLTexture(key:String, glTexture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper):Null<Texture>;
	/**
		Adds a Compressed Texture to this Texture Manager.
		
		The texture should typically have been loaded via the `CompressedTextureFile` loader,
		in order to prepare the correct data object this method requires.
		
		You can optionally also pass atlas data to this method, in which case a texture atlas
		will be generated from the given compressed texture, combined with the atlas data.
	**/
	function addCompressedTexture(key:String, textureData:phaser.types.textures.CompressedTextureData, ?atlasData:Dynamic):Null<Texture>;
	/**
		Adds a Render Texture to the Texture Manager using the given key.
		This allows you to then use the Render Texture as a normal texture for texture based Game Objects like Sprites.
	**/
	function addRenderTexture(key:String, renderTexture:phaser.gameobjects.RenderTexture):Null<Texture>;
	/**
		Creates a new Texture using the given config values.
		
		Generated textures consist of a Canvas element to which the texture data is drawn.
		
		Generates a texture based on the given Create configuration object.
		
		The texture is drawn using a fixed-size indexed palette of 16 colors, where the hex value in the
		data cells map to a single color. For example, if the texture config looked like this:
		
		```javascript
		var star = [
		   '.....828.....',
		   '....72227....',
		   '....82228....',
		   '...7222227...',
		   '2222222222222',
		   '8222222222228',
		   '.72222222227.',
		   '..787777787..',
		   '..877777778..',
		   '.78778887787.',
		   '.27887.78872.',
		   '.787.....787.'
		];
		
		this.textures.generate('star', { data: star, pixelWidth: 4 });
		```
		
		Then it would generate a texture that is 52 x 48 pixels in size, because each cell of the data array
		represents 1 pixel multiplied by the `pixelWidth` value. The cell values, such as `8`, maps to color
		number 8 in the palette. If a cell contains a period character `.` then it is transparent.
		
		The default palette is Arne16, but you can specify your own using the `palette` property.
	**/
	function generate(key:String, config:phaser.types.create.GenerateTextureConfig):Null<Texture>;
	/**
		Creates a new Texture using a blank Canvas element of the size given.
		
		Canvas elements are automatically pooled and calling this method will
		extract a free canvas from the CanvasPool, or create one if none are available.
	**/
	function createCanvas(key:String, ?width:Float, ?height:Float):Null<CanvasTexture>;
	/**
		Creates a new Canvas Texture object from an existing Canvas element
		and adds it to this Texture Manager, unless `skipCache` is true.
	**/
	function addCanvas(key:String, source:js.html.CanvasElement, ?skipCache:Bool):Null<CanvasTexture>;
	/**
		Creates a Dynamic Texture instance and adds itself to this Texture Manager.
		
		A Dynamic Texture is a special texture that allows you to draw textures, frames and most kind of
		Game Objects directly to it.
		
		You can take many complex objects and draw them to this one texture, which can then be used as the
		base texture for other Game Objects, such as Sprites. Should you then update this texture, all
		Game Objects using it will instantly be updated as well, reflecting the changes immediately.
		
		It's a powerful way to generate dynamic textures at run-time that are WebGL friendly and don't invoke
		expensive GPU uploads on each change.
		
		See the methods available on the `DynamicTexture` class for more details.
		
		Optionally, you can also pass a Dynamic Texture instance to this method to have
		it added to the Texture Manager.
	**/
	function addDynamicTexture(key:ts.AnyOf2<String, DynamicTexture>, ?width:Float, ?height:Float):Null<DynamicTexture>;
	/**
		Adds a Texture Atlas to this Texture Manager.
		
		In Phaser terminology, a Texture Atlas is a combination of an atlas image and a JSON data file,
		such as those exported by applications like Texture Packer.
		
		It can accept either JSON Array or JSON Hash formats, as exported by Texture Packer and similar software.
		
		As of Phaser 3.60 you can use this method to add a atlas data to an existing Phaser Texture.
	**/
	function addAtlas(key:String, source:ts.AnyOf3<Texture, js.html.ImageElement, Array<js.html.ImageElement>>, data:ts.AnyOf2<Dynamic, Array<Dynamic>>, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Null<Texture>;
	/**
		Adds a Texture Atlas to this Texture Manager.
		
		In Phaser terminology, a Texture Atlas is a combination of an atlas image and a JSON data file,
		such as those exported by applications like Texture Packer.
		
		The frame data of the atlas must be stored in an Array within the JSON.
		
		This is known as a JSON Array in software such as Texture Packer.
		
		As of Phaser 3.60 you can use this method to add a atlas data to an existing Phaser Texture.
	**/
	function addAtlasJSONArray(key:String, source:ts.AnyOf3<Texture, js.html.ImageElement, Array<js.html.ImageElement>>, data:ts.AnyOf2<Dynamic, Array<Dynamic>>, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Null<Texture>;
	/**
		Adds a Texture Atlas to this Texture Manager.
		
		In Phaser terminology, a Texture Atlas is a combination of an atlas image and a JSON data file,
		such as those exported by applications like Texture Packer.
		
		The frame data of the atlas must be stored in an Object within the JSON.
		
		This is known as a JSON Hash in software such as Texture Packer.
		
		As of Phaser 3.60 you can use this method to add a atlas data to an existing Phaser Texture.
	**/
	function addAtlasJSONHash(key:String, source:ts.AnyOf3<Texture, js.html.ImageElement, Array<js.html.ImageElement>>, data:ts.AnyOf2<Dynamic, Array<Dynamic>>, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Null<Texture>;
	/**
		Adds a Texture Atlas to this Texture Manager.
		
		In Phaser terminology, a Texture Atlas is a combination of an atlas image and a data file,
		such as those exported by applications like Texture Packer.
		
		The frame data of the atlas must be stored in an XML file.
		
		As of Phaser 3.60 you can use this method to add a atlas data to an existing Phaser Texture.
	**/
	function addAtlasXML(key:String, source:ts.AnyOf2<Texture, js.html.ImageElement>, data:Dynamic, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Null<Texture>;
	/**
		Adds a Unity Texture Atlas to this Texture Manager.
		
		In Phaser terminology, a Texture Atlas is a combination of an atlas image and a data file,
		such as those exported by applications like Texture Packer or Unity.
		
		The frame data of the atlas must be stored in a Unity YAML file.
		
		As of Phaser 3.60 you can use this method to add a atlas data to an existing Phaser Texture.
	**/
	function addUnityAtlas(key:String, source:js.html.ImageElement, data:Dynamic, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Null<Texture>;
	/**
		Adds a Sprite Sheet to this Texture Manager.
		
		In Phaser terminology a Sprite Sheet is a texture containing different frames, but each frame is the exact
		same size and cannot be trimmed or rotated. This is different to a Texture Atlas, created by tools such as
		Texture Packer, and more akin with the fixed-frame exports you get from apps like Aseprite or old arcade
		games.
		
		As of Phaser 3.60 you can use this method to add a sprite sheet to an existing Phaser Texture.
	**/
	function addSpriteSheet(key:String, source:ts.AnyOf2<Texture, js.html.ImageElement>, config:phaser.types.textures.SpriteSheetConfig, ?dataSource:ts.AnyOf2<js.html.CanvasElement, js.html.ImageElement>):Null<Texture>;
	/**
		Adds a Sprite Sheet to this Texture Manager, where the Sprite Sheet exists as a Frame within a Texture Atlas.
		
		In Phaser terminology a Sprite Sheet is a texture containing different frames, but each frame is the exact
		same size and cannot be trimmed or rotated.
	**/
	function addSpriteSheetFromAtlas(key:String, config:phaser.types.textures.SpriteSheetFromAtlasConfig):Null<Texture>;
	/**
		Creates a texture from an array of colour data.
		
		This is only available in WebGL mode.
		
		If the dimensions provided are powers of two, the resulting texture
		will be automatically set to wrap by the WebGL Renderer.
	**/
	function addUint8Array(key:String, data:js.lib.Uint8Array, width:Float, height:Float):Null<Texture>;
	/**
		Creates a new Texture using the given source and dimensions.
	**/
	function create(key:String, source:ts.AnyOf5<js.html.CanvasElement, phaser.renderer.webgl.wrappers.WebGLTextureWrapper, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>, ?width:Float, ?height:Float):Null<Texture>;
	/**
		Checks the given key to see if a Texture using it exists within this Texture Manager.
	**/
	function exists(key:String):Bool;
	/**
		Returns a Texture from the Texture Manager that matches the given key.
		
		If the key is `undefined` it will return the `__DEFAULT` Texture.
		
		If the key is an instance of a Texture, it will return the instance.
		
		If the key is an instance of a Frame, it will return the frames parent Texture instance.
		
		Finally, if the key is given, but not found, and not a Texture or Frame instance, it will return the `__MISSING` Texture.
	**/
	function get(key:ts.AnyOf3<String, Frame, Texture>):Texture;
	/**
		Takes a Texture key and Frame name and returns a clone of that Frame if found.
	**/
	function cloneFrame(key:String, frame:ts.AnyOf2<String, Float>):Frame;
	/**
		Takes a Texture key and Frame name and returns a reference to that Frame, if found.
	**/
	function getFrame(key:String, ?frame:ts.AnyOf2<String, Float>):Frame;
	/**
		Parses the 'key' parameter and returns a Texture Frame instance.
		
		It can accept the following formats:
		
		1) A string
		2) An array where the elements are: [ key, [frame] ]
		3) An object with the properties: { key, [frame] }
		4) A Texture instance - which returns the default frame from the Texture
		5) A Frame instance - returns itself
	**/
	function parseFrame(key:ts.AnyOf5<String, Dynamic, Array<Dynamic>, Frame, Texture>):Frame;
	/**
		Returns an array with all of the keys of all Textures in this Texture Manager.
		The output array will exclude the `__DEFAULT`, `__MISSING`, `__WHITE`, and `__NORMAL` keys.
	**/
	function getTextureKeys():Array<String>;
	/**
		Given a Texture and an `x` and `y` coordinate this method will return a new
		Color object that has been populated with the color and alpha values of the pixel
		at that location in the Texture.
	**/
	function getPixel(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>):Null<phaser.display.Color>;
	/**
		Given a Texture and an `x` and `y` coordinate this method will return a value between 0 and 255
		corresponding to the alpha value of the pixel at that location in the Texture. If the coordinate
		is out of bounds it will return null.
	**/
	function getPixelAlpha(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>):Float;
	/**
		Sets the given Game Objects `texture` and `frame` properties so that it uses
		the Texture and Frame specified in the `key` and `frame` arguments to this method.
	**/
	function setTexture(gameObject:phaser.gameobjects.GameObject, key:String, ?frame:ts.AnyOf2<String, Float>):phaser.gameobjects.GameObject;
	/**
		Changes the key being used by a Texture to the new key provided.
		
		The old key is removed, allowing it to be re-used.
		
		Game Objects are linked to Textures by a reference to the Texture object, so
		all existing references will be retained.
	**/
	function renameTexture(currentKey:String, newKey:String):Bool;
	/**
		Passes all Textures to the given callback.
	**/
	function each(callback:EachTextureCallback, scope:Dynamic, args:haxe.extern.Rest<Dynamic>):Void;
	/**
		Resets the internal Stamp object, ready for drawing and returns it.
	**/
	function resetStamp(?alpha:Float, ?tint:Float):phaser.gameobjects.Image;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TextureManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TextureManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TextureManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TextureManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TextureManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):TextureManager;
	static var prototype : TextureManager;
}