package phaser.gameobjects.components;

typedef FX = {
	/**
		A reference to the Game Object that owns this FX Component.
	**/
	final gameObject : phaser.gameobjects.GameObject;
	/**
		Is this a Post FX Controller? or a Pre FX Controller?
	**/
	final isPost : Bool;
	/**
		Has this FX Component been enabled?
		
		You should treat this property as read-only, although it is toggled
		automaticaly during internal use.
	**/
	var enabled : Bool;
	/**
		An array containing all of the Pre FX Controllers that
		have been added to this FX Component. They are processed in
		the order they are added.
		
		This array is empty if this is a Post FX Component.
	**/
	var list : Array<phaser.fx.Controller>;
	/**
		The amount of extra padding to be applied to this Game Object
		when it is being rendered by a PreFX Pipeline.
		
		Lots of FX require additional spacing added to the texture the
		Game Object uses, for example a glow or shadow effect, and this
		method allows you to control how much extra padding is included
		in addition to the texture size.
		
		You do not need to set this if you're only using Post FX.
	**/
	var padding : Float;
	/**
		Sets the amount of extra padding to be applied to this Game Object
		when it is being rendered by a PreFX Pipeline.
		
		Lots of FX require additional spacing added to the texture the
		Game Object uses, for example a glow or shadow effect, and this
		method allows you to control how much extra padding is included
		in addition to the texture size.
		
		You do not need to set this if you're only using Post FX.
	**/
	function setPadding(?padding:Float):FX;
	/**
		This callback is invoked when this Game Object is copied by a PreFX Pipeline.
		
		This happens when the pipeline uses its `copySprite` method.
		
		It's invoked prior to the copy, allowing you to set shader uniforms, etc on the pipeline.
	**/
	function onFXCopy(pipeline:phaser.renderer.webgl.pipelines.PreFXPipeline):Void;
	/**
		This callback is invoked when this Game Object is rendered by a PreFX Pipeline.
		
		This happens when the pipeline uses its `drawSprite` method.
		
		It's invoked prior to the draw, allowing you to set shader uniforms, etc on the pipeline.
	**/
	function onFX(pipeline:phaser.renderer.webgl.pipelines.PreFXPipeline):Void;
	/**
		Enables this FX Component and applies the FXPipeline to the parent Game Object.
		
		This is called automatically whenever you call a method such as `addBloom`, etc.
		
		You can check the `enabled` property to see if the Game Object is already enabled, or not.
		
		This only applies to Pre FX. Post FX are always enabled.
	**/
	function enable(?padding:Float):Void;
	/**
		Destroys and removes all FX Controllers that are part of this FX Component,
		then disables it.
		
		If this is a Pre FX Component it will only remove Pre FX.
		If this is a Post FX Component it will only remove Post FX.
		
		To remove both at once use the `GameObject.clearFX` method instead.
	**/
	function clear():FX;
	/**
		Searches for the given FX Controller within this FX Component.
		
		If found, the controller is removed from this component and then destroyed.
	**/
	function remove<T>(fx:T):FX;
	/**
		Disables this FX Component.
		
		This will reset the pipeline on the Game Object that owns this component back to its
		default and flag this component as disabled.
		
		You can re-enable it again by calling `enable` for Pre FX or by adding an FX for Post FX.
		
		Optionally, set `clear` to destroy all current FX Controllers.
	**/
	function disable(?clear:Bool):FX;
	/**
		Adds the given FX Controler to this FX Component.
		
		Note that adding an FX Controller does not remove any existing FX. They all stack-up
		on-top of each other. If you don't want this, make sure to call either `remove` or
		`clear` first.
	**/
	function add<T>(fx:T, ?config:Dynamic):phaser.fx.Controller;
	/**
		Adds a Glow effect.
		
		The glow effect is a visual technique that creates a soft, luminous halo around game objects,
		characters, or UI elements. This effect is used to emphasize importance, enhance visual appeal,
		or convey a sense of energy, magic, or otherworldly presence. The effect can also be set on
		the inside of the Game Object. The color and strength of the glow can be modified.
	**/
	function addGlow(?color:Float, ?outerStrength:Float, ?innerStrength:Float, ?knockout:Bool, ?quality:Float, ?distance:Float):phaser.fx.Glow;
	/**
		Adds a Shadow effect.
		
		The shadow effect is a visual technique used to create the illusion of depth and realism by adding darker,
		offset silhouettes or shapes beneath game objects, characters, or environments. These simulated shadows
		help to enhance the visual appeal and immersion, making the 2D game world appear more dynamic and three-dimensional.
	**/
	function addShadow(?x:Float, ?y:Float, ?decay:Float, ?power:Float, ?color:Float, ?samples:Float, ?intensity:Float):phaser.fx.Shadow;
	/**
		Adds a Pixelate effect.
		
		The pixelate effect is a visual technique that deliberately reduces the resolution or detail of an image,
		creating a blocky or mosaic appearance composed of large, visible pixels. This effect can be used for stylistic
		purposes, as a homage to retro gaming, or as a means to obscure certain elements within the game, such as
		during a transition or to censor specific content.
	**/
	function addPixelate(?amount:Float):phaser.fx.Pixelate;
	/**
		Adds a Vignette effect.
		
		The vignette effect is a visual technique where the edges of the screen, or a Game Object, gradually darken or blur,
		creating a frame-like appearance. This effect is used to draw the player's focus towards the central action or subject,
		enhance immersion, and provide a cinematic or artistic quality to the game's visuals.
	**/
	function addVignette(?x:Float, ?y:Float, ?radius:Float, ?strength:Float):phaser.fx.Vignette;
	/**
		Adds a Shine effect.
		
		The shine effect is a visual technique that simulates the appearance of reflective
		or glossy surfaces by passing a light beam across a Game Object. This effect is used to
		enhance visual appeal, emphasize certain features, and create a sense of depth or
		material properties.
	**/
	function addShine(?speed:Float, ?lineWidth:Float, ?gradient:Float, ?reveal:Bool):phaser.fx.Shine;
	/**
		Adds a Blur effect.
		
		A Gaussian blur is the result of blurring an image by a Gaussian function. It is a widely used effect,
		typically to reduce image noise and reduce detail. The visual effect of this blurring technique is a
		smooth blur resembling that of viewing the image through a translucent screen, distinctly different
		from the bokeh effect produced by an out-of-focus lens or the shadow of an object under usual illumination.
	**/
	function addBlur(?quality:Float, ?x:Float, ?y:Float, ?strength:Float, ?color:Float, ?steps:Float):phaser.fx.Blur;
	/**
		Adds a Gradient effect.
		
		The gradient overlay effect is a visual technique where a smooth color transition is applied over Game Objects,
		such as sprites or UI components. This effect is used to enhance visual appeal, emphasize depth, or create
		stylistic and atmospheric variations. It can also be utilized to convey information, such as representing
		progress or health status through color changes.
	**/
	function addGradient(?color1:Float, ?color2:Float, ?alpha:Float, ?fromX:Float, ?fromY:Float, ?toX:Float, ?toY:Float, ?size:Float):phaser.fx.Gradient;
	/**
		Adds a Bloom effect.
		
		Bloom is an effect used to reproduce an imaging artifact of real-world cameras.
		The effect produces fringes of light extending from the borders of bright areas in an image,
		contributing to the illusion of an extremely bright light overwhelming the
		camera or eye capturing the scene.
	**/
	function addBloom(?color:Float, ?offsetX:Float, ?offsetY:Float, ?blurStrength:Float, ?strength:Float, ?steps:Float):phaser.fx.Bloom;
	/**
		Adds a ColorMatrix effect.
		
		The color matrix effect is a visual technique that involves manipulating the colors of an image
		or scene using a mathematical matrix. This process can adjust hue, saturation, brightness, and contrast,
		allowing developers to create various stylistic appearances or mood settings within the game.
		Common applications include simulating different lighting conditions, applying color filters,
		or achieving a specific visual style.
	**/
	function addColorMatrix():phaser.fx.ColorMatrix;
	/**
		Adds a Circle effect.
		
		This effect will draw a circle around the texture of the Game Object, effectively masking off
		any area outside of the circle without the need for an actual mask. You can control the thickness
		of the circle, the color of the circle and the color of the background, should the texture be
		transparent. You can also control the feathering applied to the circle, allowing for a harsh or soft edge.
		
		Please note that adding this effect to a Game Object will not change the input area or physics body of
		the Game Object, should it have one.
	**/
	function addCircle(?thickness:Float, ?color:Float, ?backgroundColor:Float, ?scale:Float, ?feather:Float):phaser.fx.Circle;
	/**
		Adds a Barrel effect.
		
		A barrel effect allows you to apply either a 'pinch' or 'expand' distortion to
		a Game Object. The amount of the effect can be modified in real-time.
	**/
	function addBarrel(?amount:Float):phaser.fx.Barrel;
	/**
		Adds a Displacement effect.
		
		The displacement effect is a visual technique that alters the position of pixels in an image
		or texture based on the values of a displacement map. This effect is used to create the illusion
		of depth, surface irregularities, or distortion in otherwise flat elements. It can be applied to
		characters, objects, or backgrounds to enhance realism, convey movement, or achieve various
		stylistic appearances.
	**/
	function addDisplacement(?texture:String, ?x:Float, ?y:Float):phaser.fx.Displacement;
	/**
		Adds a Wipe effect.
		
		The wipe or reveal effect is a visual technique that gradually uncovers or conceals elements
		in the game, such as images, text, or scene transitions. This effect is often used to create
		a sense of progression, reveal hidden content, or provide a smooth and visually appealing transition
		between game states.
		
		You can set both the direction and the axis of the wipe effect. The following combinations are possible:
		
		* left to right: direction 0, axis 0
		* right to left: direction 1, axis 0
		* top to bottom: direction 1, axis 1
		* bottom to top: direction 1, axis 0
		
		It is up to you to set the `progress` value yourself, i.e. via a Tween, in order to transition the effect.
	**/
	function addWipe(?wipeWidth:Float, ?direction:Float, ?axis:Float):phaser.fx.Wipe;
	/**
		Adds a Reveal Wipe effect.
		
		The wipe or reveal effect is a visual technique that gradually uncovers or conceals elements
		in the game, such as images, text, or scene transitions. This effect is often used to create
		a sense of progression, reveal hidden content, or provide a smooth and visually appealing transition
		between game states.
		
		You can set both the direction and the axis of the wipe effect. The following combinations are possible:
		
		* left to right: direction 0, axis 0
		* right to left: direction 1, axis 0
		* top to bottom: direction 1, axis 1
		* bottom to top: direction 1, axis 0
		
		It is up to you to set the `progress` value yourself, i.e. via a Tween, in order to transition the effect.
	**/
	function addReveal(?wipeWidth:Float, ?direction:Float, ?axis:Float):phaser.fx.Wipe;
	/**
		Adds a Bokeh effect.
		
		Bokeh refers to a visual effect that mimics the photographic technique of creating a shallow depth of field.
		This effect is used to emphasize the game's main subject or action, by blurring the background or foreground
		elements, resulting in a more immersive and visually appealing experience. It is achieved through rendering
		techniques that simulate the out-of-focus areas, giving a sense of depth and realism to the game's graphics.
		
		See also Tilt Shift.
	**/
	function addBokeh(?radius:Float, ?amount:Float, ?contrast:Float):phaser.fx.Bokeh;
	/**
		Adds a Tilt Shift effect.
		
		This Bokeh effect can also be used to generate a Tilt Shift effect, which is a technique used to create a miniature
		effect by blurring everything except a small area of the image. This effect is achieved by blurring the
		top and bottom elements, while keeping the center area in focus.
		
		See also Bokeh.
	**/
	function addTiltShift(?radius:Float, ?amount:Float, ?contrast:Float, ?blurX:Float, ?blurY:Float, ?strength:Float):phaser.fx.Bokeh;
	/**
		Destroys this FX Component.
		
		Called automatically when Game Objects are destroyed.
	**/
	function destroy():Void;
};