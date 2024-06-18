package phaser.gameobjects;

/**
	Manages Lights for a Scene.
	
	Affects the rendering of Game Objects using the `Light2D` pipeline.
**/
@:native("Phaser.GameObjects.LightsManager") extern class LightsManager {
	function new();
	/**
		The Lights in the Scene.
	**/
	var lights : Array<Light>;
	/**
		The ambient color.
	**/
	var ambientColor : phaser.display.RGB;
	/**
		Whether the Lights Manager is enabled.
	**/
	var active : Bool;
	/**
		The maximum number of lights that a single Camera and the lights shader can process.
		Change this via the `maxLights` property in your game config, as it cannot be changed at runtime.
	**/
	final maxLights : Float;
	/**
		The number of lights that the LightPipeline processed in the _previous_ frame.
	**/
	final visibleLights : Float;
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
	function addPointLight(x:Float, y:Float, ?color:Float, ?radius:Float, ?intensity:Float, ?attenuation:Float):PointLight;
	/**
		Enable the Lights Manager.
	**/
	function enable():LightsManager;
	/**
		Disable the Lights Manager.
	**/
	function disable():LightsManager;
	/**
		Get all lights that can be seen by the given Camera.
		
		It will automatically cull lights that are outside the world view of the Camera.
		
		If more lights are returned than supported by the pipeline, the lights are then culled
		based on the distance from the center of the camera. Only those closest are rendered.
	**/
	function getLights(camera:phaser.cameras.scene2d.Camera):Array<Light>;
	/**
		Set the ambient light color.
	**/
	function setAmbientColor(rgb:Float):LightsManager;
	/**
		Returns the maximum number of Lights allowed to appear at once.
	**/
	function getMaxVisibleLights():Float;
	/**
		Get the number of Lights managed by this Lights Manager.
	**/
	function getLightCount():Float;
	/**
		Add a Light.
	**/
	function addLight(?x:Float, ?y:Float, ?radius:Float, ?rgb:Float, ?intensity:Float):Light;
	/**
		Remove a Light.
	**/
	function removeLight(light:Light):LightsManager;
	/**
		Shut down the Lights Manager.
		
		Recycles all active Lights into the Light pool, resets ambient light color and clears the lists of Lights and
		culled Lights.
	**/
	function shutdown():Void;
	/**
		Destroy the Lights Manager.
		
		Cleans up all references by calling {@link Phaser.GameObjects.LightsManager#shutdown}.
	**/
	function destroy():Void;
	static var prototype : LightsManager;
}