package phaser;

typedef DeviceConf = {
	/**
		The OS Device functions.
	**/
	var os : phaser.device.OS;
	/**
		The Browser Device functions.
	**/
	var browser : phaser.device.Browser;
	/**
		The Features Device functions.
	**/
	var features : phaser.device.Features;
	/**
		The Input Device functions.
	**/
	var input : phaser.device.Input;
	/**
		The Audio Device functions.
	**/
	var audio : phaser.device.Audio;
	/**
		The Video Device functions.
	**/
	var video : phaser.device.Video;
	/**
		The Fullscreen Device functions.
	**/
	var fullscreen : phaser.device.Fullscreen;
	/**
		The Canvas Device functions.
	**/
	var canvasFeatures : phaser.device.CanvasFeatures;
};