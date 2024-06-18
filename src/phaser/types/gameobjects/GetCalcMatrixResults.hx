package phaser.types.gameobjects;

typedef GetCalcMatrixResults = {
	/**
		The calculated Camera matrix.
	**/
	var camera : phaser.gameobjects.components.TransformMatrix;
	/**
		The calculated Sprite (Game Object) matrix.
	**/
	var sprite : phaser.gameobjects.components.TransformMatrix;
	/**
		The calculated results matrix, factoring all others in.
	**/
	var calc : phaser.gameobjects.components.TransformMatrix;
};