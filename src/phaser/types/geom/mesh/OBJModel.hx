package phaser.types.geom.mesh;

typedef OBJModel = {
	/**
		An array of Faces.
	**/
	var faces : Array<OBJFace>;
	/**
		The name of the model.
	**/
	var name : String;
	/**
		An array of texture coordinates.
	**/
	var textureCoords : Array<UV>;
	/**
		An array of vertex normals.
	**/
	var vertexNormals : Array<phaser.types.math.Vector3Like>;
	/**
		An array of vertices in the model.
	**/
	var vertices : Array<phaser.types.math.Vector3Like>;
};