package phaser.types.core;

typedef CallbacksConfig = {
	/**
		A function to run at the start of the boot sequence.
	**/
	@:optional
	dynamic function preBoot(game:phaser.Game):Void;
	/**
		A function to run at the end of the boot sequence. At this point, all the game systems have started and plugins have been loaded.
	**/
	@:optional
	dynamic function postBoot(game:phaser.Game):Void;
};