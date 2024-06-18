package phaser.types.loader.filetypes;

typedef AudioFileURLConfig = {
	/**
		The audio file format. See property names in {@link Phaser.Device.Audio}.
	**/
	var type : String;
	/**
		The absolute or relative URL of the audio file.
	**/
	var url : String;
};