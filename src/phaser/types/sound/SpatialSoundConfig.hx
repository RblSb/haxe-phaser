package phaser.types.sound;

/**
	Config object containing settings for the source of the spatial sound.
	
	See https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics
**/
typedef SpatialSoundConfig = {
	/**
		The horizontal position of the audio in a right-hand Cartesian coordinate system.
	**/
	@:optional
	var x : Float;
	/**
		The vertical position of the audio in a right-hand Cartesian coordinate system.
	**/
	@:optional
	var y : Float;
	/**
		Represents the longitudinal (back and forth) position of the audio in a right-hand Cartesian coordinate system.
	**/
	@:optional
	var z : Float;
	/**
		An enumerated value determining which spatialization algorithm to use to position the audio in 3D space.
	**/
	@:optional
	var panningModel : String;
	/**
		Which algorithm to use to reduce the volume of the audio source as it moves away from the listener. Possible values are "linear", "inverse" and "exponential". The default value is "inverse".
	**/
	@:optional
	var distanceModel : String;
	/**
		The horizontal position of the audio source's vector in a right-hand Cartesian coordinate system.
	**/
	@:optional
	var orientationX : Float;
	/**
		The vertical position of the audio source's vector in a right-hand Cartesian coordinate system.
	**/
	@:optional
	var orientationY : Float;
	/**
		Represents the longitudinal (back and forth) position of the audio source's vector in a right-hand Cartesian coordinate system.
	**/
	@:optional
	var orientationZ : Float;
	/**
		A double value representing the reference distance for reducing volume as the audio source moves further from the listener. For distances greater than this the volume will be reduced based on `rolloffFactor` and `distanceModel`.
	**/
	@:optional
	var refDistance : Float;
	/**
		The maximum distance between the audio source and the listener, after which the volume is not reduced any further.
	**/
	@:optional
	var maxDistance : Float;
	/**
		A double value describing how quickly the volume is reduced as the source moves away from the listener. This value is used by all distance models.
	**/
	@:optional
	var rolloffFactor : Float;
	/**
		The angle, in degrees, of a cone inside of which there will be no volume reduction.
	**/
	@:optional
	var coneInnerAngle : Float;
	/**
		The angle, in degrees, of a cone outside of which the volume will be reduced by a constant value, defined by the `coneOuterGain` property.
	**/
	@:optional
	var coneOuterAngle : Float;
	/**
		The amount of volume reduction outside the cone defined by the `coneOuterAngle` attribute. Its default value is 0, meaning that no sound can be heard. A value between 0 and 1.
	**/
	@:optional
	var coneOuterGain : Float;
	/**
		Set this Sound object to automatically track the x/y position of this object. Can be a Phaser Game Object, Vec2 or anything that exposes public x/y properties.
	**/
	@:optional
	var follow : phaser.types.math.Vector2Like;
};