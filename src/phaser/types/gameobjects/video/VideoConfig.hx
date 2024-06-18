package phaser.types.gameobjects.video;

typedef VideoConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		Optional key of the Video this Game Object will play, as stored in the Video Cache.
	**/
	@:optional
	var key : String;
};