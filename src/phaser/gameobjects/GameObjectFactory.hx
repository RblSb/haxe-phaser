package phaser.gameobjects;

/**
	The Game Object Factory is a Scene plugin that allows you to quickly create many common
	types of Game Objects and have them automatically registered with the Scene.
	
	Game Objects directly register themselves with the Factory and inject their own creation
	methods into the class.
**/
@:native("Phaser.GameObjects.GameObjectFactory") extern class GameObjectFactory {
	function new(scene:phaser.Scene);
	/**
		Creates a new Path Object.
	**/
	function path(x:Float, y:Float):phaser.curves.Path;
	/**
		A Bitmap Mask combines the alpha (opacity) of a masked pixel with the alpha of another pixel.
		Unlike the Geometry Mask, which is a clipping path, a Bitmap Mask behaves like an alpha mask,
		not a clipping path. It is only available when using the WebGL Renderer.
		
		A Bitmap Mask can use any Game Object, or Dynamic Texture, to determine the alpha of each pixel of the masked Game Object(s).
		For any given point of a masked Game Object's texture, the pixel's alpha will be multiplied by the alpha
		of the pixel at the same position in the Bitmap Mask's Game Object. The color of the pixel from the
		Bitmap Mask doesn't matter.
		
		For example, if a pure blue pixel with an alpha of 0.95 is masked with a pure red pixel with an
		alpha of 0.5, the resulting pixel will be pure blue with an alpha of 0.475. Naturally, this means
		that a pixel in the mask with an alpha of 0 will hide the corresponding pixel in all masked Game Objects
		  A pixel with an alpha of 1 in the masked Game Object will receive the same alpha as the
		corresponding pixel in the mask.
		
		Note: You cannot combine Bitmap Masks and Blend Modes on the same Game Object. You can, however,
		combine Geometry Masks and Blend Modes together.
		
		The Bitmap Mask's location matches the location of its Game Object, not the location of the
		masked objects. Moving or transforming the underlying Game Object will change the mask
		(and affect the visibility of any masked objects), whereas moving or transforming a masked object
		will not affect the mask.
		
		The Bitmap Mask will not render its Game Object by itself. If the Game Object is not in a
		Scene's display list, it will only be used for the mask and its full texture will not be directly
		visible. Adding the underlying Game Object to a Scene will not cause any problems - it will
		render as a normal Game Object and will also serve as a mask.
	**/
	function bitmapMask(?maskObject:ts.AnyOf2<GameObject, phaser.textures.DynamicTexture>, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf3<String, Float, phaser.textures.Frame>):phaser.display.masks.BitmapMask;
	/**
		Creates a new Dynamic Bitmap Text Game Object and adds it to the Scene.
		
		BitmapText objects work by taking a texture file and an XML or JSON file that describes the font structure.
		
		During rendering for each letter of the text is rendered to the display, proportionally spaced out and aligned to
		match the font structure.
		
		Dynamic Bitmap Text objects are different from Static Bitmap Text in that they invoke a callback for each
		letter being rendered during the render pass. This callback allows you to manipulate the properties of
		each letter being rendered, such as its position, scale or tint, allowing you to create interesting effects
		like jiggling text, which can't be done with Static text. This means that Dynamic Text takes more processing
		time, so only use them if you require the callback ability they have.
		
		BitmapText objects are less flexible than Text objects, in that they have less features such as shadows, fills and the ability
		to use Web Fonts, however you trade this flexibility for rendering speed. You can also create visually compelling BitmapTexts by
		processing the font texture in an image editor, applying fills and any other effects required.
		
		To create multi-line text insert \r, \n or \r\n escape codes into the text string.
		
		To create a BitmapText data files you need a 3rd party app such as:
		
		BMFont (Windows, free): http://www.angelcode.com/products/bmfont/
		Glyph Designer (OS X, commercial): http://www.71squared.com/en/glyphdesigner
		Littera (Web-based, free): http://kvazars.com/littera/
		
		For most use cases it is recommended to use XML. If you wish to use JSON, the formatting should be equal to the result of
		converting a valid XML file through the popular X2JS library. An online tool for conversion can be found here: http://codebeautify.org/xmltojson
		
		Note: This method will only be available if the Dynamic Bitmap Text Game Object has been built into Phaser.
	**/
	function dynamicBitmapText(x:Float, y:Float, font:String, ?text:ts.AnyOf2<String, Array<String>>, ?size:Float):DynamicBitmapText;
	/**
		Creates a new Bitmap Text Game Object and adds it to the Scene.
		
		BitmapText objects work by taking a texture file and an XML or JSON file that describes the font structure.
		
		During rendering for each letter of the text is rendered to the display, proportionally spaced out and aligned to
		match the font structure.
		
		BitmapText objects are less flexible than Text objects, in that they have less features such as shadows, fills and the ability
		to use Web Fonts, however you trade this flexibility for rendering speed. You can also create visually compelling BitmapTexts by
		processing the font texture in an image editor, applying fills and any other effects required.
		
		To create multi-line text insert \r, \n or \r\n escape codes into the text string.
		
		To create a BitmapText data files you need a 3rd party app such as:
		
		BMFont (Windows, free): http://www.angelcode.com/products/bmfont/
		Glyph Designer (OS X, commercial): http://www.71squared.com/en/glyphdesigner
		Littera (Web-based, free): http://kvazars.com/littera/
		
		For most use cases it is recommended to use XML. If you wish to use JSON, the formatting should be equal to the result of
		converting a valid XML file through the popular X2JS library. An online tool for conversion can be found here: http://codebeautify.org/xmltojson
		
		Note: This method will only be available if the Bitmap Text Game Object has been built into Phaser.
	**/
	function bitmapText(x:Float, y:Float, font:String, ?text:ts.AnyOf2<String, Array<String>>, ?size:Float, ?align:Float):BitmapText;
	/**
		Creates a new Blitter Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Blitter Game Object has been built into Phaser.
	**/
	function blitter(x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):Blitter;
	/**
		Creates a new Container Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Container Game Object has been built into Phaser.
	**/
	function container(?x:Float, ?y:Float, ?children:ts.AnyOf2<GameObject, Array<GameObject>>):Container;
	/**
		DOM Element Game Objects are a way to control and manipulate HTML Elements over the top of your game.
		
		In order for DOM Elements to display you have to enable them by adding the following to your game
		configuration object:
		
		```javascript
		dom {
		   createContainer: true
		}
		```
		
		When this is added, Phaser will automatically create a DOM Container div that is positioned over the top
		of the game canvas. This div is sized to match the canvas, and if the canvas size changes, as a result of
		settings within the Scale Manager, the dom container is resized accordingly.
		
		You can create a DOM Element by either passing in DOMStrings, or by passing in a reference to an existing
		Element that you wish to be placed under the control of Phaser. For example:
		
		```javascript
		this.add.dom(x, y, 'div', 'background-color: lime; width: 220px; height: 100px; font: 48px Arial', 'Phaser');
		```
		
		The above code will insert a div element into the DOM Container at the given x/y coordinate. The DOMString in
		the 4th argument sets the initial CSS style of the div and the final argument is the inner text. In this case,
		it will create a lime colored div that is 220px by 100px in size with the text Phaser in it, in an Arial font.
		
		You should nearly always, without exception, use explicitly sized HTML Elements, in order to fully control
		alignment and positioning of the elements next to regular game content.
		
		Rather than specify the CSS and HTML directly you can use the `load.html` File Loader to load it into the
		cache and then use the `createFromCache` method instead. You can also use `createFromHTML` and various other
		methods available in this class to help construct your elements.
		
		Once the element has been created you can then control it like you would any other Game Object. You can set its
		position, scale, rotation, alpha and other properties. It will move as the main Scene Camera moves and be clipped
		at the edge of the canvas. It's important to remember some limitations of DOM Elements: The obvious one is that
		they appear above or below your game canvas. You cannot blend them into the display list, meaning you cannot have
		a DOM Element, then a Sprite, then another DOM Element behind it.
		
		They also cannot be enabled for input. To do that, you have to use the `addListener` method to add native event
		listeners directly. The final limitation is to do with cameras. The DOM Container is sized to match the game canvas
		entirely and clipped accordingly. DOM Elements respect camera scrolling and scrollFactor settings, but if you
		change the size of the camera so it no longer matches the size of the canvas, they won't be clipped accordingly.
		
		Also, all DOM Elements are inserted into the same DOM Container, regardless of which Scene they are created in.
		
		DOM Elements are a powerful way to align native HTML with your Phaser Game Objects. For example, you can insert
		a login form for a multiplayer game directly into your title screen. Or a text input box for a highscore table.
		Or a banner ad from a 3rd party service. Or perhaps you'd like to use them for high resolution text display and
		UI. The choice is up to you, just remember that you're dealing with standard HTML and CSS floating over the top
		of your game, and should treat it accordingly.
		
		Note: This method will only be available if the DOM Element Game Object has been built into Phaser.
	**/
	function dom(x:Float, y:Float, ?element:ts.AnyOf2<String, js.html.Element>, ?style:Dynamic, ?innerText:String):DOMElement;
	/**
		Creates a new Extern Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Extern Game Object has been built into Phaser.
	**/
	@:native("extern")
	function extern_():Extern;
	/**
		The Scene to which this Game Object Factory belongs.
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
		Adds an existing Game Object to this Scene.
		
		If the Game Object renders, it will be added to the Display List.
		If it has a `preUpdate` method, it will be added to the Update List.
	**/
	function existing<G>(child:G):G;
	/**
		Creates a new Graphics Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Graphics Game Object has been built into Phaser.
	**/
	function graphics(?config:phaser.types.gameobjects.graphics.Options):Graphics;
	/**
		Creates a new Group Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Group Game Object has been built into Phaser.
	**/
	function group(?children:ts.AnyOf4<Array<GameObject>, phaser.types.gameobjects.group.GroupConfig, phaser.types.gameobjects.group.GroupCreateConfig, Array<phaser.types.gameobjects.group.GroupConfig>>, ?config:ts.AnyOf2<phaser.types.gameobjects.group.GroupConfig, phaser.types.gameobjects.group.GroupCreateConfig>):Group;
	/**
		Creates a new Image Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Image Game Object has been built into Phaser.
	**/
	function image(x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):Image;
	/**
		Creates a new Layer Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Layer Game Object has been built into Phaser.
	**/
	function layer(?children:ts.AnyOf2<GameObject, Array<GameObject>>):Layer;
	/**
		Creates a new Mesh Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Mesh Game Object and WebGL support have been built into Phaser.
	**/
	function mesh(?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?vertices:Array<Float>, ?uvs:Array<Float>, ?indicies:Array<Float>, ?containsZ:Bool, ?normals:Array<Float>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):Mesh;
	/**
		A Nine Slice Game Object allows you to display a texture-based object that
		can be stretched both horizontally and vertically, but that retains
		fixed-sized corners. The dimensions of the corners are set via the
		parameters to this class.
		
		This is extremely useful for UI and button like elements, where you need
		them to expand to accommodate the content without distorting the texture.
		
		The texture you provide for this Game Object should be based on the
		following layout structure:
		
		```
		      A                          B
		    +---+----------------------+---+
		  C | 1 |          2           | 3 |
		    +---+----------------------+---+
		    |   |                      |   |
		    | 4 |          5           | 6 |
		    |   |                      |   |
		    +---+----------------------+---+
		  D | 7 |          8           | 9 |
		    +---+----------------------+---+
		```
		
		When changing this objects width and / or height:
		
		     areas 1, 3, 7 and 9 (the corners) will remain unscaled
		     areas 2 and 8 will be stretched horizontally only
		     areas 4 and 6 will be stretched vertically only
		     area 5 will be stretched both horizontally and vertically
		
		You can also create a 3 slice Game Object:
		
		This works in a similar way, except you can only stretch it horizontally.
		Therefore, it requires less configuration:
		
		```
		      A                          B
		    +---+----------------------+---+
		    |   |                      |   |
		  C | 1 |          2           | 3 |
		    |   |                      |   |
		    +---+----------------------+---+
		```
		
		When changing this objects width (you cannot change its height)
		
		     areas 1 and 3 will remain unscaled
		     area 2 will be stretched horizontally
		
		The above configuration concept is adapted from the Pixi NineSlicePlane.
		
		To specify a 3 slice object instead of a 9 slice you should only
		provide the `leftWidth` and `rightWidth` parameters. To create a 9 slice
		you must supply all parameters.
		
		The _minimum_ width this Game Object can be is the total of
		`leftWidth` + `rightWidth`.  The _minimum_ height this Game Object
		can be is the total of `topHeight` + `bottomHeight`.
		If you need to display this object at a smaller size, you can scale it.
		
		In terms of performance, using a 3 slice Game Object is the equivalent of
		having 3 Sprites in a row. Using a 9 slice Game Object is the equivalent
		of having 9 Sprites in a row. The vertices of this object are all batched
		together and can co-exist with other Sprites and graphics on the display
		list, without incurring any additional overhead.
		
		As of Phaser 3.60 this Game Object is WebGL only.
	**/
	function nineslice(x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?width:Float, ?height:Float, ?leftWidth:Float, ?rightWidth:Float, ?topHeight:Float, ?bottomHeight:Float):NineSlice;
	/**
		Creates a new Particle Emitter Game Object and adds it to the Scene.
		
		If you wish to configure the Emitter after creating it, use the `ParticleEmitter.setConfig` method.
		
		Prior to Phaser v3.60 this function would create a `ParticleEmitterManager`. These were removed
		in v3.60 and replaced with creating a `ParticleEmitter` instance directly. Please see the
		updated function parameters and class documentation for more details.
		
		Note: This method will only be available if the Particles Game Object has been built into Phaser.
	**/
	function particles(?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?config:phaser.types.gameobjects.particles.ParticleEmitterConfig):phaser.gameobjects.particles.ParticleEmitter;
	/**
		Creates a new PathFollower Game Object and adds it to the Scene.
		
		Note: This method will only be available if the PathFollower Game Object has been built into Phaser.
	**/
	function follower(path:phaser.curves.Path, x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):PathFollower;
	/**
		Creates a new Plane Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Plane Game Object has been built into Phaser.
	**/
	function plane(?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?width:Float, ?height:Float, ?tile:Bool):Plane;
	/**
		Creates a new Point Light Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Point Light Game Object has been built into Phaser.
		
		The Point Light Game Object provides a way to add a point light effect into your game,
		without the expensive shader processing requirements of the traditional Light Game Object.
		
		The difference is that the Point Light renders using a custom shader, designed to give the
		impression of a point light source, of variable radius, intensity and color, in your game.
		However, unlike the Light Game Object, it does not impact any other Game Objects, or use their
		normal maps for calcuations. This makes them extremely fast to render compared to Lights
		and perfect for special effects, such as flickering torches or muzzle flashes.
		
		For maximum performance you should batch Point Light Game Objects together. This means
		ensuring they follow each other consecutively on the display list. Ideally, use a Layer
		Game Object and then add just Point Lights to it, so that it can batch together the rendering
		of the lights. You don't _have_ to do this, and if you've only a handful of Point Lights in
		your game then it's perfectly safe to mix them into the dislay list as normal. However, if
		you're using a large number of them, please consider how they are mixed into the display list.
		
		The renderer will automatically cull Point Lights. Those with a radius that does not intersect
		with the Camera will be skipped in the rendering list. This happens automatically and the
		culled state is refreshed every frame, for every camera.
		
		The origin of a Point Light is always 0.5 and it cannot be changed.
		
		Point Lights are a WebGL only feature and do not have a Canvas counterpart.
	**/
	function pointlight(x:Float, y:Float, ?color:Float, ?radius:Float, ?intensity:Float, ?attenuation:Float):PointLight;
	/**
		Creates a new Render Texture Game Object and adds it to the Scene.
		
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
	function renderTexture(x:Float, y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		Creates a new Rope Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Rope Game Object and WebGL support have been built into Phaser.
	**/
	function rope(x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?points:Array<phaser.types.math.Vector2Like>, ?horizontal:Bool, ?colors:Array<Float>, ?alphas:Array<Float>):Rope;
	/**
		Creates a new Shader Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Shader Game Object and WebGL support have been built into Phaser.
	**/
	function shader(key:ts.AnyOf2<String, phaser.display.BaseShader>, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?textures:Array<String>, ?textureData:Dynamic):Shader;
	/**
		Creates a new Arc Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Arc Game Object has been built into Phaser.
		
		The Arc Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		When it renders it displays an arc shape. You can control the start and end angles of the arc,
		as well as if the angles are winding clockwise or anti-clockwise. With the default settings
		it renders as a complete circle. By changing the angles you can create other arc shapes,
		such as half-circles.
	**/
	function arc(?x:Float, ?y:Float, ?radius:Float, ?startAngle:Float, ?endAngle:Float, ?anticlockwise:Bool, ?fillColor:Float, ?fillAlpha:Float):Arc;
	/**
		Creates a new Circle Shape Game Object and adds it to the Scene.
		
		A Circle is an Arc with no defined start and end angle, making it render as a complete circle.
		
		Note: This method will only be available if the Arc Game Object has been built into Phaser.
	**/
	function circle(?x:Float, ?y:Float, ?radius:Float, ?fillColor:Float, ?fillAlpha:Float):Arc;
	/**
		Creates a new Curve Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Curve Game Object has been built into Phaser.
		
		The Curve Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		To render a Curve Shape you must first create a `Phaser.Curves.Curve` object, then pass it to
		the Curve Shape in the constructor.
		
		The Curve shape also has a `smoothness` property and corresponding `setSmoothness` method.
		This allows you to control how smooth the shape renders in WebGL, by controlling the number of iterations
		that take place during construction. Increase and decrease the default value for smoother, or more
		jagged, shapes.
	**/
	function curve(?x:Float, ?y:Float, ?curve:phaser.curves.Curve, ?fillColor:Float, ?fillAlpha:Float):Curve;
	/**
		Creates a new Ellipse Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Ellipse Game Object has been built into Phaser.
		
		The Ellipse Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		When it renders it displays an ellipse shape. You can control the width and height of the ellipse.
		If the width and height match it will render as a circle. If the width is less than the height,
		it will look more like an egg shape.
		
		The Ellipse shape also has a `smoothness` property and corresponding `setSmoothness` method.
		This allows you to control how smooth the shape renders in WebGL, by controlling the number of iterations
		that take place during construction. Increase and decrease the default value for smoother, or more
		jagged, shapes.
	**/
	function ellipse(?x:Float, ?y:Float, ?width:Float, ?height:Float, ?fillColor:Float, ?fillAlpha:Float):Ellipse;
	/**
		Creates a new Grid Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Grid Game Object has been built into Phaser.
		
		The Grid Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports only fill colors and cannot be stroked.
		
		A Grid Shape allows you to display a grid in your game, where you can control the size of the
		grid as well as the width and height of the grid cells. You can set a fill color for each grid
		cell as well as an alternate fill color. When the alternate fill color is set then the grid
		cells will alternate the fill colors as they render, creating a chess-board effect. You can
		also optionally have an outline fill color. If set, this draws lines between the grid cells
		in the given color. If you specify an outline color with an alpha of zero, then it will draw
		the cells spaced out, but without the lines between them.
	**/
	function grid(?x:Float, ?y:Float, ?width:Float, ?height:Float, ?cellWidth:Float, ?cellHeight:Float, ?fillColor:Float, ?fillAlpha:Float, ?outlineFillColor:Float, ?outlineFillAlpha:Float):Grid;
	/**
		Creates a new IsoBox Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the IsoBox Game Object has been built into Phaser.
		
		The IsoBox Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports only fill colors and cannot be stroked.
		
		An IsoBox is an 'isometric' rectangle. Each face of it has a different fill color. You can set
		the color of the top, left and right faces of the rectangle respectively. You can also choose
		which of the faces are rendered via the `showTop`, `showLeft` and `showRight` properties.
		
		You cannot view an IsoBox from under-neath, however you can change the 'angle' by setting
		the `projection` property.
	**/
	function isobox(?x:Float, ?y:Float, ?size:Float, ?height:Float, ?fillTop:Float, ?fillLeft:Float, ?fillRight:Float):IsoBox;
	/**
		Creates a new IsoTriangle Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the IsoTriangle Game Object has been built into Phaser.
		
		The IsoTriangle Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports only fill colors and cannot be stroked.
		
		An IsoTriangle is an 'isometric' triangle. Think of it like a pyramid. Each face has a different
		fill color. You can set the color of the top, left and right faces of the triangle respectively
		You can also choose which of the faces are rendered via the `showTop`, `showLeft` and `showRight` properties.
		
		You cannot view an IsoTriangle from under-neath, however you can change the 'angle' by setting
		the `projection` property. The `reversed` property controls if the IsoTriangle is rendered upside
		down or not.
	**/
	function isotriangle(?x:Float, ?y:Float, ?size:Float, ?height:Float, ?reversed:Bool, ?fillTop:Float, ?fillLeft:Float, ?fillRight:Float):IsoTriangle;
	/**
		Creates a new Line Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Line Game Object has been built into Phaser.
		
		The Line Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports only stroke colors and cannot be filled.
		
		A Line Shape allows you to draw a line between two points in your game. You can control the
		stroke color and thickness of the line. In WebGL only you can also specify a different
		thickness for the start and end of the line, allowing you to render lines that taper-off.
		
		If you need to draw multiple lines in a sequence you may wish to use the Polygon Shape instead.
	**/
	function line(?x:Float, ?y:Float, ?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float, ?strokeColor:Float, ?strokeAlpha:Float):Line;
	/**
		Creates a new Polygon Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Polygon Game Object has been built into Phaser.
		
		The Polygon Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		The Polygon Shape is created by providing a list of points, which are then used to create an
		internal Polygon geometry object. The points can be set from a variety of formats:
		
		- An array of Point or Vector2 objects: `[new Phaser.Math.Vector2(x1, y1), ...]`
		- An array of objects with public x/y properties: `[obj1, obj2, ...]`
		- An array of paired numbers that represent point coordinates: `[x1,y1, x2,y2, ...]`
		- An array of arrays with two elements representing x/y coordinates: `[[x1, y1], [x2, y2], ...]`
		
		By default the `x` and `y` coordinates of this Shape refer to the center of it. However, depending
		on the coordinates of the points provided, the final shape may be rendered offset from its origin.
	**/
	function polygon(?x:Float, ?y:Float, ?points:Dynamic, ?fillColor:Float, ?fillAlpha:Float):Polygon;
	/**
		Creates a new Rectangle Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Rectangle Game Object has been built into Phaser.
		
		The Rectangle Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		You can change the size of the rectangle by changing the `width` and `height` properties.
	**/
	function rectangle(?x:Float, ?y:Float, ?width:Float, ?height:Float, ?fillColor:Float, ?fillAlpha:Float):Rectangle;
	/**
		Creates a new Star Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Star Game Object has been built into Phaser.
		
		The Star Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		As the name implies, the Star shape will display a star in your game. You can control several
		aspects of it including the number of points that constitute the star. The default is 5. If
		you change it to 4 it will render as a diamond. If you increase them, you'll get a more spiky
		star shape.
		
		You can also control the inner and outer radius, which is how 'long' each point of the star is.
		Modify these values to create more interesting shapes.
	**/
	function star(?x:Float, ?y:Float, ?points:Float, ?innerRadius:Float, ?outerRadius:Float, ?fillColor:Float, ?fillAlpha:Float):Star;
	/**
		Creates a new Triangle Shape Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Triangle Game Object has been built into Phaser.
		
		The Triangle Shape is a Game Object that can be added to a Scene, Group or Container. You can
		treat it like any other Game Object in your game, such as tweening it, scaling it, or enabling
		it for input or physics. It provides a quick and easy way for you to render this shape in your
		game without using a texture, while still taking advantage of being fully batched in WebGL.
		
		This shape supports both fill and stroke colors.
		
		The Triangle consists of 3 lines, joining up to form a triangular shape. You can control the
		position of each point of these lines. The triangle is always closed and cannot have an open
		face. If you require that, consider using a Polygon instead.
	**/
	function triangle(?x:Float, ?y:Float, ?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float, ?x3:Float, ?y3:Float, ?fillColor:Float, ?fillAlpha:Float):Triangle;
	/**
		Creates a new Sprite Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Sprite Game Object has been built into Phaser.
	**/
	function sprite(x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):Sprite;
	/**
		Creates a new Text Game Object and adds it to the Scene.
		
		A Text Game Object.
		
		Text objects work by creating their own internal hidden Canvas and then renders text to it using
		the standard Canvas `fillText` API. It then creates a texture from this canvas which is rendered
		to your game during the render pass.
		
		Because it uses the Canvas API you can take advantage of all the features this offers, such as
		applying gradient fills to the text, or strokes, shadows and more. You can also use custom fonts
		loaded externally, such as Google or TypeKit Web fonts.
		
		You can only display fonts that are currently loaded and available to the browser: therefore fonts must
		be pre-loaded. Phaser does not do this for you, so you will require the use of a 3rd party font loader,
		or have the fonts ready available in the CSS on the page in which your Phaser game resides.
		
		See {@link http://www.jordanm.co.uk/tinytype this compatibility table} for the available default fonts
		across mobile browsers.
		
		A note on performance: Every time the contents of a Text object changes, i.e. changing the text being
		displayed, or the style of the text, it needs to remake the Text canvas, and if on WebGL, re-upload the
		new texture to the GPU. This can be an expensive operation if used often, or with large quantities of
		Text objects in your game. If you run into performance issues you would be better off using Bitmap Text
		instead, as it benefits from batching and avoids expensive Canvas API calls.
		
		Note: This method will only be available if the Text Game Object has been built into Phaser.
	**/
	function text(x:Float, y:Float, text:ts.AnyOf2<String, Array<String>>, ?style:phaser.types.gameobjects.text.TextStyle):Text;
	/**
		Creates a new TileSprite Game Object and adds it to the Scene.
		
		Note: This method will only be available if the TileSprite Game Object has been built into Phaser.
	**/
	function tileSprite(x:Float, y:Float, width:Float, height:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):TileSprite;
	/**
		Creates a new Video Game Object and adds it to the Scene.
		
		This Game Object is capable of handling playback of a video file, video stream or media stream.
		
		You can optionally 'preload' the video into the Phaser Video Cache:
		
		```javascript
		preload () {
		   this.load.video('ripley', 'assets/aliens.mp4');
		}
		
		create () {
		   this.add.video(400, 300, 'ripley');
		}
		```
		
		You don't have to 'preload' the video. You can also play it directly from a URL:
		
		```javascript
		create () {
		   this.add.video(400, 300).loadURL('assets/aliens.mp4');
		}
		```
		
		To all intents and purposes, a video is a standard Game Object, just like a Sprite. And as such, you can do
		all the usual things to it, such as scaling, rotating, cropping, tinting, making interactive, giving a
		physics body, etc.
		
		Transparent videos are also possible via the WebM file format. Providing the video file has was encoded with
		an alpha channel, and providing the browser supports WebM playback (not all of them do), then it will render
		in-game with full transparency.
		
		### Autoplaying Videos
		
		Videos can only autoplay if the browser has been unlocked with an interaction, or satisfies the MEI settings.
		The policies that control autoplaying are vast and vary between browser. You can, and should, read more about
		it here: https://developer.mozilla.org/en-US/docs/Web/Media/Autoplay_guide
		
		If your video doesn't contain any audio, then set the `noAudio` parameter to `true` when the video is _loaded_,
		and it will often allow the video to play immediately:
		
		```javascript
		preload () {
		   this.load.video('pixar', 'nemo.mp4', true);
		}
		```
		
		The 3rd parameter in the load call tells Phaser that the video doesn't contain any audio tracks. Video without
		audio can autoplay without requiring a user interaction. Video with audio cannot do this unless it satisfies
		the browsers MEI settings. See the MDN Autoplay Guide for further details.
		
		Or:
		
		```javascript
		create () {
		   this.add.video(400, 300).loadURL('assets/aliens.mp4', true);
		}
		```
		
		You can set the `noAudio` parameter to `true` even if the video does contain audio. It will still allow the video
		to play immediately, but the audio will not start.
		
		Note that due to a bug in IE11 you cannot play a video texture to a Sprite in WebGL. For IE11 force Canvas mode.
		
		More details about video playback and the supported media formats can be found on MDN:
		
		https://developer.mozilla.org/en-US/docs/Web/API/HTMLVideoElement
		https://developer.mozilla.org/en-US/docs/Web/Media/Formats
		
		Note: This method will only be available if the Video Game Object has been built into Phaser.
	**/
	function video(x:Float, y:Float, ?key:String):Video;
	/**
		Creates a new Zone Game Object and adds it to the Scene.
		
		Note: This method will only be available if the Zone Game Object has been built into Phaser.
	**/
	function zone(x:Float, y:Float, width:Float, height:Float):Zone;
	/**
		Creates a Tilemap from the given key or data, or creates a blank Tilemap if no key/data provided.
		When loading from CSV or a 2D array, you should specify the tileWidth & tileHeight. When parsing
		from a map from Tiled, the tileWidth, tileHeight, width & height will be pulled from the map
		data. For an empty map, you should specify tileWidth, tileHeight, width & height.
	**/
	function tilemap(?key:String, ?tileWidth:Float, ?tileHeight:Float, ?width:Float, ?height:Float, ?data:Array<Array<Float>>, ?insertNull:Bool):phaser.tilemaps.Tilemap;
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
	function timeline(config:ts.AnyOf2<phaser.types.time.TimelineEventConfig, Array<phaser.types.time.TimelineEventConfig>>):phaser.time.Timeline;
	/**
		Creates a new Tween object.
		
		Note: This method will only be available if Tweens have been built into Phaser.
	**/
	function tween(config:ts.AnyOf4<phaser.types.tweens.TweenBuilderConfig, phaser.types.tweens.TweenChainBuilderConfig, phaser.tweens.Tween, phaser.tweens.TweenChain>):phaser.tweens.Tween;
	/**
		Creates a new TweenChain object and adds it to the Tween Manager.
		
		Note: This method will only be available if Tweens have been built into Phaser.
	**/
	function tweenchain(config:ts.AnyOf2<Dynamic, phaser.types.tweens.TweenBuilderConfig>):phaser.tweens.TweenChain;
	static var prototype : GameObjectFactory;
	/**
		Static method called directly by the Game Object factory functions.
		With this method you can register a custom GameObject factory in the GameObjectFactory,
		providing a name (`factoryType`) and the constructor (`factoryFunction`) in order
		to be called when you call to Phaser.Scene.add[ factoryType ] method.
	**/
	static function register(factoryType:String, factoryFunction:haxe.Constraints.Function):Void;
	/**
		Static method called directly by the Game Object factory functions.
		With this method you can remove a custom GameObject factory registered in the GameObjectFactory,
		providing a its `factoryType`.
	**/
	static function remove(factoryType:String):Void;
}