package phaser.tilemaps;

/**
	Phaser Tilemap constants for orientation.
**/
@:native("Phaser.Tilemaps.Orientation") extern enum abstract Orientation(Int) from Int to Int {
	/**
		Orthogonal Tilemap orientation constant.
	**/
	var ORTHOGONAL;
	/**
		Isometric Tilemap orientation constant.
	**/
	var ISOMETRIC;
	/**
		Staggered Tilemap orientation constant.
	**/
	var STAGGERED;
	/**
		Hexagonal Tilemap orientation constant.
	**/
	var HEXAGONAL;
}
