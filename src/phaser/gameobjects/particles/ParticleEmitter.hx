package phaser.gameobjects.particles;

/**
	A Particle Emitter is a special kind of Game Object that controls a pool of {@link Phaser.GameObjects.Particles.Particle Particles}.
	
	Particle Emitters are created via a configuration object. The properties of this object
	can be specified in a variety of formats, given you plenty of scope over the values they
	return, leading to complex visual effects. Here are the different forms of configuration
	value you can give:
	
	## An explicit static value:
	
	```js
	x: 400
	```
	
	The x value will always be 400 when the particle is spawned.
	
	## A random value:
	
	```js
	x: [ 100, 200, 300, 400 ]
	```
	
	The x value will be one of the 4 elements in the given array, picked at random on emission.
	
	## A custom callback:
	
	```js
	x: (particle, key, t, value) => {
	   return value + 50;
	}
	```
	
	The x value is the result of calling this function. This is only used when the
	particle is emitted, so it provides it's initial starting value. It is not used
	when the particle is updated (see the onUpdate callback for that)
	
	## A start / end object:
	
	This allows you to control the change in value between the given start and
	end parameters over the course of the particles lifetime:
	
	```js
	scale: { start: 0, end: 1 }
	```
	
	The particle scale will start at 0 when emitted and ease to a scale of 1
	over the course of its lifetime. You can also specify the ease function
	used for this change (the default is Linear):
	
	```js
	scale: { start: 0, end: 1, ease: 'bounce.out' }
	```
	
	## A start / end random object:
	
	The start and end object can have an optional `random` parameter.
	This forces it to pick a random value between the two values and use
	this as the starting value, then easing to the 'end' parameter over
	its lifetime.
	
	```js
	scale: { start: 4, end: 0.5, random: true }
	```
	
	The particle will start with a random scale between 0.5 and 4 and then
	scale to the end value over its lifetime. You can combine the above
	with the `ease` parameter as well to control the value easing.
	
	## An interpolation object:
	
	You can provide an array of values which will be used for interpolation
	during the particles lifetime. You can also define the interpolation
	function to be used. There are three provided: `linear` (the default),
	`bezier` and `catmull`, or you can provide your own function.
	
	```js
	x: { values: [ 50, 500, 200, 800 ], interpolation: 'catmull' }
	```
	
	The particle scale will interpolate from 50 when emitted to 800 via the other
	points over the course of its lifetime. You can also specify an ease function
	used to control the rate of change through the values (the default is Linear):
	
	```js
	x: { values: [ 50, 500, 200, 800 ], interpolation: 'catmull', ease: 'bounce.out }
	```
	
	## A stepped emitter object:
	
	The `steps` parameter allows you to control the placement of sequential
	particles across the start-end range:
	
	```js
	x: { steps: 32, start: 0, end: 576 }
	```
	
	Here we have a range of 576 (start to end). This is divided into 32 steps.
	
	The first particle will emit at the x position of 0. The next will emit
	at the next 'step' along, which would be 18. The following particle will emit
	at the next step, which is 36, and so on. Because the range of 576 has been
	divided by 32, creating 18 pixels steps. When a particle reaches the 'end'
	value the next one will start from the beginning again.
	
	## A stepped emitter object with yoyo:
	
	You can add the optional `yoyo` property to a stepped object:
	
	```js
	x: { steps: 32, start: 0, end: 576, yoyo: true }
	```
	
	As with the stepped emitter, particles are emitted in sequence, from 'start'
	to 'end' in step sized jumps. Normally, when a stepped emitter reaches the
	end it snaps around to the start value again. However, if you provide the 'yoyo'
	parameter then when it reaches the end it will reverse direction and start
	emitting back down to 'start' again. Depending on the effect you require this
	can often look better.
	
	## A min / max object:
	
	This allows you to pick a random float value between the min and max properties:
	
	```js
	x: { min: 100, max: 700 }
	```
	
	The x value will be a random float between min and max.
	
	You can force it select an integer by setting the 'int' flag:
	
	```js
	x: { min: 100, max: 700, int: true }
	```
	
	Or, you could use the 'random' array approach (see below)
	
	## A random object:
	
	This allows you to pick a random integer value between the first and second array elements:
	
	```js
	x: { random: [ 100, 700 ] }
	```
	
	The x value will be a random integer between 100 and 700 as it takes the first
	element in the 'random' array as the 'min' value and the 2nd element as the 'max' value.
	
	## Custom onEmit and onUpdate callbacks:
	
	If the above won't give you the effect you're after, you can provide your own
	callbacks that will be used when the particle is both emitted and updated:
	
	```js
	x: {
	   onEmit: (particle, key, t, value) => {
	     return value;
	   },
	   onUpdate: (particle, key, t, value) => {
	     return value;
	   }
	}
	```
	
	You can provide either one or both functions. The `onEmit` is called at the
	start of the particles life and defines the value of the property on birth.
	
	The `onUpdate` function is called every time the Particle Emitter updates
	until the particle dies. Both must return a value.
	
	The properties are:
	
	particle - A reference to the Particle instance.
	key - The string based key of the property, i.e. 'x' or 'lifespan'.
	t - The current normalized lifetime of the particle, between 0 (birth) and 1 (death).
	value - The current property value. At a minimum you should return this.
	
	By using the above configuration options you have an unlimited about of
	control over how your particles behave.
	
	## v3.55 Differences
	
	Prior to v3.60 Phaser used a `ParticleEmitterManager`. This was removed in v3.60
	and now calling `this.add.particles` returns a `ParticleEmitter` instance instead.
	
	In order to streamline memory and the display list we have removed the
	`ParticleEmitterManager` entirely. When you call `this.add.particles` you're now
	creating a `ParticleEmitter` instance, which is being added directly to the
	display list and can be manipulated just like any other Game Object, i.e.
	scaled, rotated, positioned, added to a Container, etc. It now extends the
	`GameObject` base class, meaning it's also an event emitter, which allowed us
	to create some handy new events for particles.
	
	So, to create an emitter, you now give it an xy coordinate, a texture and an
	emitter configuration object (you can also set this later, but most commonly
	you'd do it on creation). I.e.:
	
	```js
	const emitter = this.add.particles(100, 300, 'flares', {
	   frame: 'red',
	   angle: { min: -30, max: 30 },
	   speed: 150
	});
	```
	
	This will create a 'red flare' emitter at 100 x 300.
	
	Please update your code to ensure it adheres to the new function signatures.
**/
@:native("Phaser.GameObjects.Particles.ParticleEmitter") extern class ParticleEmitter extends phaser.gameobjects.GameObject {
	function new(scene:phaser.Scene, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?config:phaser.types.gameobjects.particles.ParticleEmitterConfig);
	/**
		The Particle Class which will be emitted by this Emitter.
	**/
	var particleClass : haxe.Constraints.Function;
	/**
		An internal object holding all of the EmitterOp instances.
		
		These are populated as part of the Emitter configuration parsing.
		
		You typically do not access them directly, but instead use the
		provided getters and setters on this class, such as `ParticleEmitter.speedX` etc.
	**/
	var ops : phaser.types.gameobjects.particles.ParticleEmitterOps;
	/**
		A radial emitter will emit particles in all directions between angle min and max,
		using {@link Phaser.GameObjects.Particles.ParticleEmitter#speed} as the value. If set to false then this acts as a point Emitter.
		A point emitter will emit particles only in the direction derived from the speedX and speedY values.
	**/
	var radial : Bool;
	/**
		Horizontal acceleration applied to emitted particles, in pixels per second squared.
	**/
	var gravityX : Float;
	/**
		Vertical acceleration applied to emitted particles, in pixels per second squared.
	**/
	var gravityY : Float;
	/**
		Whether accelerationX and accelerationY are non-zero. Set automatically during configuration.
	**/
	var acceleration : Bool;
	/**
		Whether moveToX and moveToY are set. Set automatically during configuration.
		
		When true the particles move toward the moveToX and moveToY coordinates and arrive at the end of their life.
		Emitter angle, speedX, and speedY are ignored.
	**/
	var moveTo : Bool;
	/**
		A function to call when a particle is emitted.
	**/
	@:optional
	dynamic function emitCallback(particle:Particle, emitter:ParticleEmitter):Void;
	/**
		The calling context for {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallback}.
	**/
	var emitCallbackScope : Dynamic;
	/**
		A function to call when a particle dies.
	**/
	@:optional
	dynamic function deathCallback(particle:Particle):Void;
	/**
		The calling context for {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallback}.
	**/
	var deathCallbackScope : Dynamic;
	/**
		Set to hard limit the amount of particle objects this emitter is allowed to create
		in total. This is the number of `Particle` instances it can create, not the number
		of 'alive' particles.
		
		0 means unlimited.
	**/
	var maxParticles : Float;
	/**
		The maximum number of alive and rendering particles this emitter will update.
		When this limit is reached, a particle needs to die before another can be emitted.
		
		0 means no limits.
	**/
	var maxAliveParticles : Float;
	/**
		If set, either via the Emitter config, or by directly setting this property,
		the Particle Emitter will stop emitting particles once this total has been
		reached. It will then enter a 'stopped' state, firing the `STOP`
		event. Note that entering a stopped state doesn't mean all the particles
		have finished, just that it's not emitting any further ones.
		
		To know when the final particle expires, listen for the COMPLETE event.
		
		Use this if you wish to launch an exact number of particles and then stop
		your emitter afterwards.
		
		The counter is reset each time the `ParticleEmitter.start` method is called.
		
		0 means the emitter will not stop based on total emitted particles.
	**/
	var stopAfter : Float;
	/**
		The number of milliseconds this emitter will emit particles for when in flow mode,
		before it stops emission. A value of 0 (the default) means there is no duration.
		
		When the duration expires the `STOP` event is emitted. Note that entering a
		stopped state doesn't mean all the particles have finished, just that it's
		not emitting any further ones.
		
		To know when the final particle expires, listen for the COMPLETE event.
		
		The counter is reset each time the `ParticleEmitter.start` method is called.
		
		0 means the emitter will not stop based on duration.
	**/
	var duration : Float;
	/**
		For a flow emitter, the time interval (>= 0) between particle flow cycles in ms.
		A value of 0 means there is one particle flow cycle for each logic update (the maximum flow frequency). This is the default setting.
		For an exploding emitter, this value will be -1.
		Calling {@link Phaser.GameObjects.Particles.ParticleEmitter#flow} also puts the emitter in flow mode (frequency >= 0).
		Calling {@link Phaser.GameObjects.Particles.ParticleEmitter#explode} also puts the emitter in explode mode (frequency = -1).
	**/
	var frequency : Float;
	/**
		Controls if the emitter is currently emitting a particle flow (when frequency >= 0).
		
		Already alive particles will continue to update until they expire.
		
		Controlled by {@link Phaser.GameObjects.Particles.ParticleEmitter#start} and {@link Phaser.GameObjects.Particles.ParticleEmitter#stop}.
	**/
	var emitting : Bool;
	/**
		Newly emitted particles are added to the top of the particle list, i.e. rendered above those already alive.
		
		Set to false to send them to the back.
		
		Also see the `sortOrder` property for more complex particle sorting.
	**/
	var particleBringToTop : Bool;
	/**
		The time rate applied to active particles, affecting lifespan, movement, and tweens. Values larger than 1 are faster than normal.
	**/
	var timeScale : Float;
	/**
		An array containing Particle Emission Zones. These can be either EdgeZones or RandomZones.
		
		Particles are emitted from a randomly selected zone from this array.
		
		Prior to Phaser v3.60 an Emitter could only have one single Emission Zone.
		In 3.60 they can now have an array of Emission Zones.
	**/
	var emitZones : Array<phaser.types.gameobjects.particles.EmitZoneObject>;
	/**
		An array containing Particle Death Zone objects. A particle is immediately killed as soon as its x/y coordinates
		intersect with any of the configured Death Zones.
		
		Prior to Phaser v3.60 an Emitter could only have one single Death Zone.
		In 3.60 they can now have an array of Death Zones.
	**/
	var deathZones : Array<phaser.gameobjects.particles.zones.DeathZone>;
	/**
		An optional Rectangle object that is used during rendering to cull Particles from
		display. For example, if your particles are limited to only move within a 300x300
		sized area from their origin, then you can set this Rectangle to those dimensions.
		
		The renderer will check to see if the `viewBounds` Rectangle intersects with the
		Camera bounds during the render step and if not it will skip rendering the Emitter
		entirely.
		
		This allows you to create many emitters in a Scene without the cost of
		rendering if the contents aren't visible.
		
		Note that the Emitter will not perform any checks to see if the Particles themselves
		are outside of these bounds, or not. It will simply check the bounds against the
		camera. Use the `getBounds` method with the `advance` parameter to help define
		the location and placement of the view bounds.
	**/
	var viewBounds : Null<phaser.geom.Rectangle>;
	/**
		A Game Object whose position is used as the particle origin.
	**/
	var follow : Null<phaser.types.math.Vector2Like>;
	/**
		The offset of the particle origin from the {@link Phaser.GameObjects.Particles.ParticleEmitter#follow} target.
	**/
	var followOffset : phaser.math.Vector2;
	/**
		Whether the emitter's {@link Phaser.GameObjects.Particles.ParticleEmitter#visible} state will track
		the {@link Phaser.GameObjects.Particles.ParticleEmitter#follow} target's visibility state.
	**/
	var trackVisible : Bool;
	/**
		The texture frames assigned to particles.
	**/
	var frames : Array<phaser.textures.Frame>;
	/**
		Whether texture {@link Phaser.GameObjects.Particles.ParticleEmitter#frames} are selected at random.
	**/
	var randomFrame : Bool;
	/**
		The number of consecutive particles that receive a single texture frame (per frame cycle).
	**/
	var frameQuantity : Float;
	/**
		The animations assigned to particles.
	**/
	var anims : Array<String>;
	/**
		Whether animations {@link Phaser.GameObjects.Particles.ParticleEmitter#anims} are selected at random.
	**/
	var randomAnim : Bool;
	/**
		The number of consecutive particles that receive a single animation (per frame cycle).
	**/
	var animQuantity : Float;
	/**
		An internal property used to tell when the emitter is in fast-forwarc mode.
	**/
	var skipping : Bool;
	/**
		An internal Transform Matrix used to cache this emitters world matrix.
	**/
	var worldMatrix : phaser.gameobjects.components.TransformMatrix;
	/**
		Optionally sort the particles before they render based on this
		property. The property must exist on the `Particle` class, such
		as `y`, `lifeT`, `scaleX`, etc.
		
		When set this overrides the `particleBringToTop` setting.
		
		To reset this and disable sorting, so this property to an empty string.
	**/
	var sortProperty : String;
	/**
		When `sortProperty` is defined this controls the sorting order,
		either ascending or descending. Toggle to control the visual effect.
	**/
	var sortOrderAsc : Bool;
	/**
		The callback used to sort the particles. Only used if `sortProperty`
		has been set. Set this via the `setSortCallback` method.
	**/
	@:optional
	dynamic function sortCallback(a:Particle, b:Particle):Void;
	/**
		A list of Particle Processors being managed by this Emitter.
	**/
	var processors : phaser.structs.List_<ParticleProcessor>;
	/**
		The tint fill mode used by the Particles in this Emitter.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertices colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		Takes an Emitter Configuration file and resets this Emitter, using any
		properties defined in the config to then set it up again.
	**/
	function setConfig(config:phaser.types.gameobjects.particles.ParticleEmitterConfig):ParticleEmitter;
	/**
		Resets the internal counter trackers.
		
		You shouldn't ever need to call this directly.
	**/
	function resetCounters(frequency:Float, on:Bool):Void;
	/**
		Continuously moves the particle origin to follow a Game Object's position.
	**/
	function startFollow(target:phaser.types.math.Vector2Like, ?offsetX:Float, ?offsetY:Float, ?trackVisible:Bool):ParticleEmitter;
	/**
		Stops following a Game Object.
	**/
	function stopFollow():ParticleEmitter;
	/**
		Chooses a texture frame from {@link Phaser.GameObjects.Particles.ParticleEmitter#frames}.
	**/
	function getFrame():phaser.textures.Frame;
	/**
		Sets a pattern for assigning texture frames to emitted particles. The `frames` configuration can be any of:
		
		frame: 0
		frame: 'red'
		frame: [ 0, 1, 2, 3 ]
		frame: [ 'red', 'green', 'blue', 'pink', 'white' ]
		frame: { frames: [ 'red', 'green', 'blue', 'pink', 'white' ], [cycle: bool], [quantity: int] }
	**/
	function setEmitterFrame(frames:ts.AnyOf4<String, Float, Array<Dynamic>, phaser.types.gameobjects.particles.ParticleEmitterFrameConfig>, ?pickRandom:Bool, ?quantity:Float):ParticleEmitter;
	/**
		Chooses an animation from {@link Phaser.GameObjects.Particles.ParticleEmitter#anims}, if populated.
	**/
	function getAnim():String;
	/**
		Sets a pattern for assigning animations to emitted particles. The `anims` configuration can be any of:
		
		anim: 'red'
		anim: [ 'red', 'green', 'blue', 'pink', 'white' ]
		anim: { anims: [ 'red', 'green', 'blue', 'pink', 'white' ], [cycle: bool], [quantity: int] }
	**/
	function setAnim(anims:ts.AnyOf3<String, Array<String>, phaser.types.gameobjects.particles.ParticleEmitterAnimConfig>, ?pickRandom:Bool, ?quantity:Float):ParticleEmitter;
	/**
		Turns {@link Phaser.GameObjects.Particles.ParticleEmitter#radial} particle movement on or off.
	**/
	function setRadial(?value:Bool):ParticleEmitter;
	/**
		Creates a Particle Bounds processor and adds it to this Emitter.
		
		This processor will check to see if any of the active Particles hit
		the defined boundary, as specified by a Rectangle shape in world-space.
		
		If so, they are 'rebounded' back again by having their velocity adjusted.
		
		The strength of the rebound is controlled by the `Particle.bounce`
		property.
		
		You should be careful to ensure that you emit particles within a bounds,
		if set, otherwise it will lead to unpredictable visual results as the
		particles are hastily repositioned.
		
		The Particle Bounds processor is returned from this method. If you wish
		to modify the area you can directly change its `bounds` property, along
		with the `collideLeft` etc values.
		
		To disable the bounds you can either set its `active` property to `false`,
		or if you no longer require it, call `ParticleEmitter.removeParticleProcessor`.
	**/
	function addParticleBounds(x:ts.AnyOf3<Float, phaser.types.gameobjects.particles.ParticleEmitterBounds, phaser.types.gameobjects.particles.ParticleEmitterBoundsAlt>, ?y:Float, ?width:Float, ?height:Float, ?collideLeft:Bool, ?collideRight:Bool, ?collideTop:Bool, ?collideBottom:Bool):ParticleBounds;
	/**
		Sets the initial radial speed of emitted particles.
		
		Changes the emitter to radial mode.
	**/
	function setParticleSpeed(x:Float, ?y:Float):ParticleEmitter;
	/**
		Sets the vertical and horizontal scale of the emitted particles.
		
		You can also set the scale of the entire emitter via `setScale`.
	**/
	function setParticleScale(?x:Float, ?y:Float):ParticleEmitter;
	/**
		Sets the gravity applied to emitted particles.
	**/
	function setParticleGravity(x:Float, y:Float):ParticleEmitter;
	/**
		Sets the opacity (alpha) of emitted particles.
		
		You can also set the alpha of the entire emitter via `setAlpha`.
	**/
	function setParticleAlpha(value:ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>):ParticleEmitter;
	/**
		Sets the color tint of emitted particles.
		
		This is a WebGL only feature.
	**/
	function setParticleTint(value:ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>):ParticleEmitter;
	/**
		Sets the angle of a {@link Phaser.GameObjects.Particles.ParticleEmitter#radial} particle stream.
		
		The value is given in degrees using Phaser's right-handed coordinate system.
	**/
	function setEmitterAngle(value:phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the lifespan of newly emitted particles in milliseconds.
	**/
	function setParticleLifespan(value:phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the number of particles released at each flow cycle or explosion.
	**/
	function setQuantity(quantity:phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the emitter's {@link Phaser.GameObjects.Particles.ParticleEmitter#frequency}
		and {@link Phaser.GameObjects.Particles.ParticleEmitter#quantity}.
	**/
	function setFrequency(frequency:Float, ?quantity:phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Adds a new Particle Death Zone to this Emitter.
		
		A particle is immediately killed as soon as its x/y coordinates intersect
		with any of the configured Death Zones.
		
		The `source` can be a Geometry Shape, such as a Circle, Rectangle or Triangle.
		Any valid object from the `Phaser.Geometry` namespace is allowed, as long as
		it supports a `contains` function. You can set the `type` to be either `onEnter`
		or `onLeave`.
		
		A single Death Zone instance can only exist once within this Emitter, but can belong
		to multiple Emitters.
	**/
	function addDeathZone(config:ts.AnyOf4<phaser.gameobjects.particles.zones.DeathZone, phaser.types.gameobjects.particles.ParticleEmitterDeathZoneConfig, phaser.types.gameobjects.particles.DeathZoneSource, Array<phaser.types.gameobjects.particles.DeathZoneObject>>):Array<phaser.gameobjects.particles.zones.DeathZone>;
	/**
		Removes the given Particle Death Zone from this Emitter.
	**/
	function removeDeathZone(zone:phaser.gameobjects.particles.zones.DeathZone):ParticleEmitter;
	/**
		Clear all Death Zones from this Particle Emitter.
	**/
	function clearDeathZones():ParticleEmitter;
	/**
		Adds a new Particle Emission Zone to this Emitter.
		
		An {@link Phaser.Types.GameObjects.Particles.ParticleEmitterEdgeZoneConfig EdgeZone} places particles on its edges.
		Its {@link Phaser.Types.GameObjects.Particles.EdgeZoneSource source} can be a Curve, Path, Circle, Ellipse, Line, Polygon, Rectangle, or Triangle;
		or any object with a suitable {@link Phaser.Types.GameObjects.Particles.EdgeZoneSourceCallback getPoints} method.
		
		A {@link Phaser.Types.GameObjects.Particles.ParticleEmitterRandomZoneConfig RandomZone} places the particles randomly within its interior.
		Its {@link RandomZoneSource source} can be a Circle, Ellipse, Line, Polygon, Rectangle, or Triangle; or any object with a suitable {@link Phaser.Types.GameObjects.Particles.RandomZoneSourceCallback getRandomPoint} method.
		
		An Emission Zone can only exist once within this Emitter.
	**/
	function addEmitZone(zone:ts.AnyOf5<phaser.gameobjects.particles.zones.EdgeZone, phaser.gameobjects.particles.zones.RandomZone, phaser.types.gameobjects.particles.ParticleEmitterEdgeZoneConfig, phaser.types.gameobjects.particles.ParticleEmitterRandomZoneConfig, Array<phaser.types.gameobjects.particles.EmitZoneData>>):Array<phaser.types.gameobjects.particles.EmitZoneObject>;
	/**
		Removes the given Particle Emission Zone from this Emitter.
	**/
	function removeEmitZone(zone:phaser.types.gameobjects.particles.EmitZoneObject):ParticleEmitter;
	/**
		Clear all Emission Zones from this Particle Emitter.
	**/
	function clearEmitZones():ParticleEmitter;
	/**
		Takes the given particle and sets its x/y coordinates to match the next available
		emission zone, if any have been configured. This method is called automatically
		as part of the `Particle.fire` process.
		
		The Emit Zones are iterated in sequence. Once a zone has had a particle emitted
		from it, then the next zone is used and so on, in a loop.
	**/
	function getEmitZone(particle:Particle):Void;
	/**
		Takes the given particle and checks to see if any of the configured Death Zones
		will kill it and returns the result. This method is called automatically as part
		of the `Particle.update` process.
	**/
	function getDeathZone(particle:Particle):Bool;
	/**
		Changes the currently active Emission Zone. The zones should have already
		been added to this Emitter either via the emitter config, or the
		`addEmitZone` method.
		
		Call this method by passing either a numeric zone index value, or
		the zone instance itself.
		
		Prior to v3.60 an Emitter could only have a single Emit Zone and this
		method was how you set it. From 3.60 and up it now performs a different
		function and swaps between all available active zones.
	**/
	function setEmitZone(zone:ts.AnyOf3<Float, phaser.gameobjects.particles.zones.EdgeZone, phaser.gameobjects.particles.zones.RandomZone>):ParticleEmitter;
	/**
		Adds a Particle Processor, such as a Gravity Well, to this Emitter.
		
		It will start processing particles from the next update as long as its `active`
		property is set.
	**/
	function addParticleProcessor<T>(processor:T):T;
	/**
		Removes a Particle Processor from this Emitter.
		
		The Processor must belong to this Emitter to be removed.
		
		It is not destroyed when removed, allowing you to move it to another Emitter Manager,
		so if you no longer require it you should call its `destroy` method directly.
	**/
	function removeParticleProcessor<T>(processor:T):Null<T>;
	/**
		Gets all active Particle Processors.
	**/
	function getProcessors():Array<ParticleProcessor>;
	/**
		Creates a new Gravity Well, adds it to this Emitter and returns a reference to it.
	**/
	function createGravityWell(config:phaser.types.gameobjects.particles.GravityWellConfig):GravityWell;
	/**
		Creates inactive particles and adds them to this emitter's pool.
		
		If `ParticleEmitter.maxParticles` is set it will limit the
		value passed to this method to make sure it's not exceeded.
	**/
	function reserve(count:Float):ParticleEmitter;
	/**
		Gets the number of active (in-use) particles in this emitter.
	**/
	function getAliveParticleCount():Float;
	/**
		Gets the number of inactive (available) particles in this emitter.
	**/
	function getDeadParticleCount():Float;
	/**
		Gets the total number of particles in this emitter.
	**/
	function getParticleCount():Float;
	/**
		Whether this emitter is at either its hard-cap limit (maxParticles), if set, or
		the max allowed number of 'alive' particles (maxAliveParticles).
	**/
	function atLimit():Bool;
	/**
		Sets a function to call for each newly emitted particle.
	**/
	function onParticleEmit(callback:phaser.types.gameobjects.particles.ParticleEmitterCallback, ?context:Dynamic):ParticleEmitter;
	/**
		Sets a function to call for each particle death.
	**/
	function onParticleDeath(callback:phaser.types.gameobjects.particles.ParticleDeathCallback, ?context:Dynamic):ParticleEmitter;
	/**
		Deactivates every particle in this emitter immediately.
		
		This particles are killed but do not emit an event or callback.
	**/
	function killAll():ParticleEmitter;
	/**
		Calls a function for each active particle in this emitter. The function is
		sent two parameters: a reference to the Particle instance and to this Emitter.
	**/
	function forEachAlive(callback:phaser.types.gameobjects.particles.ParticleEmitterCallback, context:Dynamic):ParticleEmitter;
	/**
		Calls a function for each inactive particle in this emitter.
	**/
	function forEachDead(callback:phaser.types.gameobjects.particles.ParticleEmitterCallback, context:Dynamic):ParticleEmitter;
	/**
		Turns {@link Phaser.GameObjects.Particles.ParticleEmitter#on} the emitter and resets the flow counter.
		
		If this emitter is in flow mode (frequency >= 0; the default), the particle flow will start (or restart).
		
		If this emitter is in explode mode (frequency = -1), nothing will happen.
		Use {@link Phaser.GameObjects.Particles.ParticleEmitter#explode} or {@link Phaser.GameObjects.Particles.ParticleEmitter#flow} instead.
		
		Calling this method will emit the `START` event.
	**/
	function start(?advance:Float, ?duration:Float):ParticleEmitter;
	/**
		Turns {@link Phaser.GameObjects.Particles.ParticleEmitter#emitting off} the emitter and
		stops it from emitting further particles. Currently alive particles will remain
		active until they naturally expire unless you set the `kill` parameter to `true`.
		
		Calling this method will emit the `STOP` event. When the final particle has
		expired the `COMPLETE` event will be emitted.
	**/
	function stop(?kill:Bool):ParticleEmitter;
	/**
		{@link Phaser.GameObjects.Particles.ParticleEmitter#active Deactivates} the emitter.
	**/
	function pause():ParticleEmitter;
	/**
		{@link Phaser.GameObjects.Particles.ParticleEmitter#active Activates} the emitter.
	**/
	function resume():ParticleEmitter;
	/**
		Set the property by which active particles are sorted prior to be rendered.
		
		It allows you to control the rendering order of the particles.
		
		This can be any valid property of the `Particle` class, such as `y`, `alpha`
		or `lifeT`.
		
		The 'alive' particles array is sorted in place each game frame. Setting a
		sort property will override the `particleBringToTop` setting.
		
		If you wish to use your own sorting function, see `setSortCallback` instead.
	**/
	function setSortProperty(?property:String, ?ascending:Bool):ParticleEmitter;
	/**
		Sets a callback to be used to sort the particles before rendering each frame.
		
		This allows you to define your own logic and behavior in the callback.
		
		The callback will be sent two parameters: the two Particles being compared,
		and must adhere to the criteria of the `compareFn` in `Array.sort`:
		
		https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort#description
		
		Call this method with no parameters to reset the sort callback.
		
		Setting your own callback will override both the `particleBringToTop` and
		`sortProperty` settings of this Emitter.
	**/
	function setSortCallback(?callback:phaser.types.gameobjects.particles.ParticleSortCallback):ParticleEmitter;
	/**
		Sorts active particles with {@link Phaser.GameObjects.Particles.ParticleEmitter#depthSortCallback}.
	**/
	function depthSort():ParticleEmitter;
	/**
		Calculates the difference of two particles, for sorting them by depth.
	**/
	function depthSortCallback(a:Dynamic, b:Dynamic):Float;
	/**
		Puts the emitter in flow mode (frequency >= 0) and starts (or restarts) a particle flow.
		
		To resume a flow at the current frequency and quantity, use {@link Phaser.GameObjects.Particles.ParticleEmitter#start} instead.
	**/
	function flow(frequency:Float, ?count:phaser.types.gameobjects.particles.EmitterOpOnEmitType, ?stopAfter:Float):ParticleEmitter;
	/**
		Puts the emitter in explode mode (frequency = -1), stopping any current particle flow, and emits several particles all at once.
	**/
	function explode(?count:Float, ?x:Float, ?y:Float):Null<Particle>;
	/**
		Emits particles at the given position. If no position is given, it will
		emit from this Emitters current location.
	**/
	function emitParticleAt(?x:Float, ?y:Float, ?count:Float):Null<Particle>;
	/**
		Emits particles at a given position (or the emitters current position).
	**/
	function emitParticle(?count:Float, ?x:Float, ?y:Float):Null<Particle>;
	/**
		Fast forwards this Particle Emitter and all of its particles.
		
		Works by running the Emitter `preUpdate` handler in a loop until the `time`
		has been reached at `delta` steps per loop.
		
		All callbacks and emitter related events that would normally be fired
		will still be invoked.
		
		You can make an emitter 'fast forward' via the emitter config using the
		`advance` property. Set this value to the number of ms you wish the
		emitter to be fast-forwarded by. Or, call this method post-creation.
	**/
	function fastForward(time:Float, ?delta:Float):ParticleEmitter;
	/**
		Updates this emitter and its particles.
	**/
	function preUpdate(time:Float, delta:Float):Void;
	/**
		Takes either a Rectangle Geometry object or an Arcade Physics Body and tests
		to see if it intersects with any currently alive Particle in this Emitter.
		
		Overlapping particles are returned in an array, where you can perform further
		processing on them. If nothing overlaps then the array will be empty.
	**/
	function overlap(target:ts.AnyOf2<phaser.geom.Rectangle, phaser.physics.arcade.Body>):Array<Particle>;
	/**
		Returns a bounds Rectangle calculated from the bounds of all currently
		_active_ Particles in this Emitter. If this Emitter has only just been
		created and not yet rendered, then calling this method will return a Rectangle
		with a max safe integer for dimensions. Use the `advance` parameter to
		avoid this.
		
		Typically it takes a few seconds for a flow Emitter to 'warm up'. You can
		use the `advance` and `delta` parameters to force the Emitter to
		'fast forward' in time to try and allow the bounds to be more accurate,
		as it will calculate the bounds based on the particle bounds across all
		timesteps, giving a better result.
		
		You can also use the `padding` parameter to increase the size of the
		bounds. Emitters with a lot of randomness in terms of direction or lifespan
		can often return a bounds smaller than their possible maximum. By using
		the `padding` (and `advance` if needed) you can help limit this.
	**/
	function getBounds(?padding:Float, ?advance:Float, ?delta:Float, ?output:phaser.geom.Rectangle):phaser.geom.Rectangle;
	/**
		Prints a warning to the console if you mistakenly call this function
		thinking it works the same way as Phaser v3.55.
	**/
	function createEmitter():Void;
	/**
		The x coordinate the particles are emitted from.
		
		This is relative to the Emitters x coordinate and that of any parent.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleX : ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>;
	/**
		The y coordinate the particles are emitted from.
		
		This is relative to the Emitters x coordinate and that of any parent.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleY : ts.AnyOf11<Float, Array<Float>, phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, phaser.types.gameobjects.particles.EmitterOpRandomConfig, phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, phaser.types.gameobjects.particles.EmitterOpSteppedConfig, phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, phaser.types.gameobjects.particles.EmitterOpEaseConfig, phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig, phaser.types.gameobjects.particles.EmitterOpInterpolationConfig>;
	/**
		The horizontal acceleration applied to emitted particles, in pixels per second squared.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var accelerationX : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The vertical acceleration applied to emitted particles, in pixels per second squared.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var accelerationY : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The maximum horizontal velocity emitted particles can reach, in pixels per second squared.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var maxVelocityX : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The maximum vertical velocity emitted particles can reach, in pixels per second squared.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var maxVelocityY : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The initial speed of emitted particles, in pixels per second.
		
		If using this as a getter it will return the `speedX` value.
		
		If using it as a setter it will update both `speedX` and `speedY` to the
		given value.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var speed : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The initial horizontal speed of emitted particles, in pixels per second.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var speedX : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The initial vertical speed of emitted particles, in pixels per second.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var speedY : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The x coordinate emitted particles move toward, when {@link Phaser.GameObjects.Particles.ParticleEmitter#moveTo} is true.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var moveToX : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The y coordinate emitted particles move toward, when {@link Phaser.GameObjects.Particles.ParticleEmitter#moveTo} is true.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var moveToY : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The amount of velocity particles will use when rebounding off the
		emitter bounds, if set. A value of 0 means no bounce. A value of 1
		means a full rebound.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var bounce : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The horizontal scale of emitted particles.
		
		This is relative to the Emitters scale and that of any parent.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleScaleX : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The vertical scale of emitted particles.
		
		This is relative to the Emitters scale and that of any parent.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleScaleY : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		A color tint value that is applied to the texture of the emitted
		particle. The value should be given in hex format, i.e. 0xff0000
		for a red tint, and should not include the alpha channel.
		
		Tints are additive, meaning a tint value of white (0xffffff) will
		effectively reset the tint to nothing.
		
		Modify the `ParticleEmitter.tintFill` property to change between
		an additive and replacement tint mode.
		
		When you define the color via the Emitter config you should give
		it as an array of color values. The Particle will then interpolate
		through these colors over the course of its lifespan. Setting this
		will override any `tint` value that may also be given.
		
		This is a WebGL only feature.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleColor : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		Controls the easing function used when you have created an
		Emitter that uses the `color` property to interpolate the
		tint of Particles over their lifetime.
		
		Setting this has no effect if you haven't also applied a
		`particleColor` to this Emitter.
	**/
	var colorEase : String;
	/**
		A color tint value that is applied to the texture of the emitted
		particle. The value should be given in hex format, i.e. 0xff0000
		for a red tint, and should not include the alpha channel.
		
		Tints are additive, meaning a tint value of white (0xffffff) will
		effectively reset the tint to nothing.
		
		Modify the `ParticleEmitter.tintFill` property to change between
		an additive and replacement tint mode.
		
		The `tint` value will be overriden if a `color` array is provided.
		
		This is a WebGL only feature.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleTint : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The alpha value of the emitted particles. This is a value
		between 0 and 1. Particles with alpha zero are invisible
		and are therefore not rendered, but are still processed
		by the Emitter.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleAlpha : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The lifespan of the emitted particles. This value is given
		in milliseconds and defaults to 1000ms (1 second). When a
		particle reaches this amount it is killed.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var lifespan : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The angle at which the particles are emitted. The values are
		given in degrees. This allows you to control the direction
		of the emitter. If you wish instead to change the rotation
		of the particles themselves, see the `particleRotate` property.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleAngle : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The rotation (or angle) of each particle when it is emitted.
		The value is given in degrees and uses a right-handed
		coordinate system, where 0 degrees points to the right, 90 degrees
		points down and -90 degrees points up.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var particleRotate : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The number of particles that are emitted each time an emission
		occurs, i.e. from one 'explosion' or each frame in a 'flow' cycle.
		
		The default is 1.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var quantity : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The number of milliseconds to wait after emission before
		the particles start updating. This allows you to emit particles
		that appear 'static' or still on-screen and then, after this value,
		begin to move.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var delay : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The number of milliseconds to wait after a particle has finished
		its life before it will be removed. This allows you to 'hold' a
		particle on the screen once it has reached its final state
		before it then vanishes.
		
		Note that all particle updates will cease, including changing
		alpha, scale, movement or animation.
		
		Accessing this property should typically return a number.
		However, it can be set to any valid EmitterOp onEmit type.
	**/
	var hold : phaser.types.gameobjects.particles.EmitterOpOnEmitType;
	/**
		The internal flow counter.
		
		Treat this property as read-only.
	**/
	var flowCounter : Float;
	/**
		The internal frame counter.
		
		Treat this property as read-only.
	**/
	var frameCounter : Float;
	/**
		The internal animation counter.
		
		Treat this property as read-only.
	**/
	var animCounter : Float;
	/**
		The internal elasped counter.
		
		Treat this property as read-only.
	**/
	var elapsed : Float;
	/**
		The internal stop counter.
		
		Treat this property as read-only.
	**/
	var stopCounter : Float;
	/**
		The internal complete flag.
		
		Treat this property as read-only.
	**/
	var completeFlag : Bool;
	/**
		The internal zone index.
		
		Treat this property as read-only.
	**/
	var zoneIndex : Float;
	/**
		The internal zone total.
		
		Treat this property as read-only.
	**/
	var zoneTotal : Float;
	/**
		The current frame index.
		
		Treat this property as read-only.
	**/
	var currentFrame : Float;
	/**
		The current animation index.
		
		Treat this property as read-only.
	**/
	var currentAnim : Float;
	/**
		Destroys this Particle Emitter and all Particles it owns.
	**/
	function preDestroy():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():ParticleEmitter;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):ParticleEmitter;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* NORMAL
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency of which blend modes
		are used.
	**/
	var blendMode : ts.AnyOf3<String, Float, phaser.BlendModes>;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* NORMAL
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):ParticleEmitter;
	/**
		The depth of this Game Object within the Scene. Ensure this value is only ever set to a number data-type.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):ParticleEmitter;
	/**
		The Mask this Game Object is using during render.
	**/
	var mask : ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>;
	/**
		Sets the mask that this Game Object will use to render with.
		
		The mask must have been previously created and can be either a GeometryMask or a BitmapMask.
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		If a mask is already set on this Game Object it will be immediately replaced.
		
		Masks are positioned in global space and are not relative to the Game Object to which they
		are applied. The reason for this is that multiple Game Objects can all share the same mask.
		
		Masks have no impact on physics or input detection. They are purely a rendering component
		that allows you to limit what is visible during the render pass.
	**/
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):ParticleEmitter;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):ParticleEmitter;
	/**
		Creates and returns a Bitmap Mask. This mask can be used by any Game Object,
		including this one, or a Dynamic Texture.
		
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		To create the mask you need to pass in a reference to a renderable Game Object.
		A renderable Game Object is one that uses a texture to render with, such as an
		Image, Sprite, Render Texture or BitmapText.
		
		If you do not provide a renderable object, and this Game Object has a texture,
		it will use itself as the object. This means you can call this method to create
		a Bitmap Mask from any renderable texture-based Game Object.
	**/
	function createBitmapMask<G, T>(?maskObject:ts.AnyOf2<phaser.gameobjects.GameObject, phaser.textures.DynamicTexture>, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf3<String, Float, phaser.textures.Frame>):phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask<G, S>(?graphics:ts.AnyOf2<phaser.gameobjects.Graphics, phaser.gameobjects.Shape>):phaser.display.masks.GeometryMask;
	/**
		The initial WebGL pipeline of this Game Object.
		
		If you call `resetPipeline` on this Game Object, the pipeline is reset to this default.
	**/
	var defaultPipeline : phaser.renderer.webgl.WebGLPipeline;
	/**
		The current WebGL pipeline of this Game Object.
	**/
	var pipeline : phaser.renderer.webgl.WebGLPipeline;
	/**
		An object to store pipeline specific data in, to be read by the pipelines this Game Object uses.
	**/
	var pipelineData : Dynamic;
	/**
		Sets the initial WebGL Pipeline of this Game Object.
		
		This should only be called during the instantiation of the Game Object. After that, use `setPipeline`.
	**/
	function initPipeline(?pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>):Bool;
	/**
		Sets the main WebGL Pipeline of this Game Object.
		
		Also sets the `pipelineData` property, if the parameter is given.
	**/
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):ParticleEmitter;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):ParticleEmitter;
	/**
		Resets the WebGL Pipeline of this Game Object back to the default it was created with.
	**/
	function resetPipeline(?resetData:Bool):Bool;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		Does this Game Object have any Post Pipelines set?
	**/
	var hasPostPipeline : Bool;
	/**
		The WebGL Post FX Pipelines this Game Object uses for post-render effects.
		
		The pipelines are processed in the order in which they appear in this array.
		
		If you modify this array directly, be sure to set the
		`hasPostPipeline` property accordingly.
	**/
	var postPipelines : Array<phaser.renderer.webgl.pipelines.PostFXPipeline>;
	/**
		An object to store pipeline specific data in, to be read by the pipelines this Game Object uses.
	**/
	var postPipelineData : Dynamic;
	/**
		The Pre FX component of this Game Object.
		
		This component allows you to apply a variety of built-in effects to this Game Object, such
		as glow, blur, bloom, displacements, vignettes and more. You access them via this property,
		for example:
		
		```js
		const player = this.add.sprite();
		player.preFX.addBloom();
		```
		
		Only the following Game Objects support Pre FX:
		
		* Image
		* Sprite
		* TileSprite
		* Text
		* RenderTexture
		* Video
		
		All FX are WebGL only and do not have Canvas counterparts.
		
		Please see the FX Class for more details and available methods.
	**/
	var preFX : Null<phaser.gameobjects.components.FX>;
	/**
		The Post FX component of this Game Object.
		
		This component allows you to apply a variety of built-in effects to this Game Object, such
		as glow, blur, bloom, displacements, vignettes and more. You access them via this property,
		for example:
		
		```js
		const player = this.add.sprite();
		player.postFX.addBloom();
		```
		
		All FX are WebGL only and do not have Canvas counterparts.
		
		Please see the FX Class for more details and available methods.
		
		This property is always `null` until the `initPostPipeline` method is called.
	**/
	var postFX : phaser.gameobjects.components.FX;
	/**
		This should only be called during the instantiation of the Game Object.
		
		It is called by default by all core Game Objects and doesn't need
		calling again.
		
		After that, use `setPostPipeline`.
	**/
	function initPostPipeline(?preFX:Bool):Void;
	/**
		Sets one, or more, Post Pipelines on this Game Object.
		
		Post Pipelines are invoked after this Game Object has rendered to its target and
		are commonly used for post-fx.
		
		The post pipelines are appended to the `postPipelines` array belonging to this
		Game Object. When the renderer processes this Game Object, it iterates through the post
		pipelines in the order in which they appear in the array. If you are stacking together
		multiple effects, be aware that the order is important.
		
		If you call this method multiple times, the new pipelines will be appended to any existing
		post pipelines already set. Use the `resetPostPipeline` method to clear them first, if required.
		
		You can optionally also set the `postPipelineData` property, if the parameter is given.
	**/
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):ParticleEmitter;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):ParticleEmitter;
	/**
		Gets a Post Pipeline instance from this Game Object, based on the given name, and returns it.
	**/
	function getPostPipeline(pipeline:ts.AnyOf3<String, haxe.Constraints.Function, phaser.renderer.webgl.pipelines.PostFXPipeline>):ts.AnyOf2<phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>;
	/**
		Resets the WebGL Post Pipelines of this Game Object. It does this by calling
		the `destroy` method on each post pipeline and then clearing the local array.
	**/
	function resetPostPipeline(?resetData:Bool):Void;
	/**
		Removes a type of Post Pipeline instances from this Game Object, based on the given name, and destroys them.
		
		If you wish to remove all Post Pipelines use the `resetPostPipeline` method instead.
	**/
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):ParticleEmitter;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():ParticleEmitter;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):ParticleEmitter;
	/**
		The Texture this Game Object is using to render with.
	**/
	var texture : ts.AnyOf2<phaser.textures.Texture, phaser.textures.CanvasTexture>;
	/**
		The Texture Frame this Game Object is using to render with.
	**/
	var frame : phaser.textures.Frame;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		Calling this method will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setTexture(key:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):ParticleEmitter;
	/**
		Sets the frame this Game Object will use to render with.
		
		If you pass a string or index then the Frame has to belong to the current Texture being used
		by this Game Object.
		
		If you pass a Frame instance, then the Texture being used by this Game Object will also be updated.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf3<String, Float, phaser.textures.Frame>, ?updateSize:Bool, ?updateOrigin:Bool):ParticleEmitter;
	/**
		A property indicating that a Game Object has this component.
	**/
	final hasTransformComponent : Bool;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#depth} instead.
	**/
	var z : Float;
	/**
		The w position of this Game Object.
	**/
	var w : Float;
	/**
		This is a special setter that allows you to set both the horizontal and vertical scale of this Game Object
		to the same value, at the same time. When reading this value the result returned is `(scaleX + scaleY) / 2`.
		
		Use of this property implies you wish the horizontal and vertical scales to be equal to each other. If this
		isn't the case, use the `scaleX` or `scaleY` properties instead.
	**/
	var scale : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		The angle of this Game Object as expressed in degrees.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, 90 is down, 180/-180 is left
		and -90 is up.
		
		If you prefer to work in radians, see the `rotation` property instead.
	**/
	var angle : Float;
	/**
		The angle of this Game Object in radians.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, PI/2 is down, +-PI is left
		and -PI/2 is up.
		
		If you prefer to work in degrees, see the `angle` property instead.
	**/
	var rotation : Float;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):ParticleEmitter;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):ParticleEmitter;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):ParticleEmitter;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):ParticleEmitter;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):ParticleEmitter;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):ParticleEmitter;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):ParticleEmitter;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):ParticleEmitter;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):ParticleEmitter;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):ParticleEmitter;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix, ?parentMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
	/**
		Takes the given `x` and `y` coordinates and converts them into local space for this
		Game Object, taking into account parent and local transforms, and the Display Origin.
		
		The returned Vector2 contains the translated point in its properties.
		
		A Camera needs to be provided in order to handle modified scroll factors. If no
		camera is specified, it will use the `main` camera from the Scene to which this
		Game Object belongs.
	**/
	function getLocalPoint(x:Float, y:Float, ?point:phaser.math.Vector2, ?camera:phaser.cameras.scene2d.Camera):phaser.math.Vector2;
	/**
		Gets the sum total rotation of all of this Game Objects parent Containers.
		
		The returned value is in radians and will be zero if this Game Object has no parent container.
	**/
	function getParentRotation():Float;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):ParticleEmitter;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):ParticleEmitter;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):ParticleEmitter;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):ParticleEmitter;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():ParticleEmitter;
	/**
		Allows you to store a key value pair within this Game Objects Data Manager.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		sprite.setData('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		sprite.setData({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `getData`:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		sprite.data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):ParticleEmitter;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):ParticleEmitter;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):ParticleEmitter;
	/**
		Pass this Game Object to the Input Manager to enable it for Input.
		
		Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
		for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
		input detection.
		
		If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
		this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
		shape for it to use.
		
		You can also provide an Input Configuration Object as the only argument to this method.
	**/
	function setInteractive(?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback, ?dropZone:Bool):ParticleEmitter;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():ParticleEmitter;
	/**
		If this Game Object has previously been enabled for input, this will queue it
		for removal, causing it to no longer be interactive. The removal happens on
		the next game step, it is not immediate.
		
		The Interactive Object that was assigned to this Game Object will be destroyed,
		removed from the Input Manager and cleared from this Game Object.
		
		If you wish to re-enable this Game Object at a later date you will need to
		re-create its InteractiveObject by calling `setInteractive` again.
		
		If you wish to only temporarily stop an object from receiving input then use
		`disableInteractive` instead, as that toggles the interactive state, where-as
		this erases it completely.
		
		If you wish to resize a hit area, don't remove and then set it as being
		interactive. Instead, access the hitarea object directly and resize the shape
		being used. I.e.: `sprite.input.hitArea.setSize(width, height)` (assuming the
		shape is a Rectangle, which it is by default.)
	**/
	function removeInteractive():ParticleEmitter;
	/**
		Adds this Game Object to the given Display List.
		
		If no Display List is specified, it will default to the Display List owned by the Scene to which
		this Game Object belongs.
		
		A Game Object can only exist on one Display List at any given time, but may move freely between them.
		
		If this Game Object is already on another Display List when this method is called, it will first
		be removed from it, before being added to the new list.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any display list, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function addToDisplayList(?displayList:ts.AnyOf2<phaser.gameobjects.Layer, phaser.gameobjects.DisplayList>):ParticleEmitter;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():ParticleEmitter;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():ParticleEmitter;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():ParticleEmitter;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):ParticleEmitter;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):ParticleEmitter;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):ParticleEmitter;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):ParticleEmitter;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):ParticleEmitter;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):ParticleEmitter;
	static var prototype : ParticleEmitter;
}