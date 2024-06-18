package phaser.gameobjects.particles.zones;

/**
	A zone that places particles on a shape's edges.
**/
@:native("Phaser.GameObjects.Particles.Zones.EdgeZone") extern class EdgeZone {
	function new(source:phaser.types.gameobjects.particles.EdgeZoneSource, quantity:Float, ?stepRate:Float, ?yoyo:Bool, ?seamless:Bool, ?total:Float);
	/**
		An object instance with a `getPoints(quantity, stepRate)` method returning an array of points.
	**/
	var source : ts.AnyOf2<phaser.types.gameobjects.particles.EdgeZoneSource, phaser.types.gameobjects.particles.RandomZoneSource>;
	/**
		The points placed on the source edge.
	**/
	var points : Array<phaser.geom.Point>;
	/**
		The number of particles to place on the source edge. Set to 0 to use `stepRate` instead.
	**/
	var quantity : Float;
	/**
		The distance between each particle. When set, `quantity` is implied and should be set to 0.
	**/
	var stepRate : Float;
	/**
		Whether particles are placed from start to end and then end to start.
	**/
	var yoyo : Bool;
	/**
		The counter used for iterating the EdgeZone's points.
	**/
	var counter : Float;
	/**
		Whether one endpoint will be removed if it's identical to the other.
	**/
	var seamless : Bool;
	/**
		The total number of particles this zone will emit before the Emitter
		transfers control over to the next zone in its emission zone list.
		
		By default this is -1, meaning it will never pass over from this
		zone to another one. You can call the `ParticleEmitter.setEmitZone`
		method to change it, or set this value to something else via the
		config, or directly at runtime.
		
		A value of 1 would mean the zones rotate in order, but it can
		be set to any integer value.
	**/
	var total : Float;
	/**
		Update the {@link Phaser.GameObjects.Particles.Zones.EdgeZone#points} from the EdgeZone's
		{@link Phaser.GameObjects.Particles.Zones.EdgeZone#source}.
		
		Also updates internal properties.
	**/
	function updateSource():EdgeZone;
	/**
		Change the source of the EdgeZone.
	**/
	function changeSource(source:phaser.types.gameobjects.particles.EdgeZoneSource):EdgeZone;
	/**
		Get the next point in the Zone and set its coordinates on the given Particle.
	**/
	function getPoint(particle:phaser.gameobjects.particles.Particle):Void;
	static var prototype : EdgeZone;
}