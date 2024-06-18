package phaser.geom.mesh;

/**
	A Vertex Geometry Object.
	
	This class consists of all the information required for a single vertex within a Face Geometry Object.
	
	Faces, and thus Vertex objects, are used by the Mesh Game Object in order to render objects in WebGL.
**/
@:native("Phaser.Geom.Mesh.Vertex") extern class Vertex extends phaser.math.Vector3 {
	function new(x:Float, y:Float, z:Float, u:Float, v:Float, ?color:Float, ?alpha:Float, ?nx:Float, ?ny:Float, ?nz:Float);
	/**
		The projected x coordinate of this vertex.
	**/
	var vx : Float;
	/**
		The projected y coordinate of this vertex.
	**/
	var vy : Float;
	/**
		The projected z coordinate of this vertex.
	**/
	var vz : Float;
	/**
		The normalized projected x coordinate of this vertex.
	**/
	var nx : Float;
	/**
		The normalized projected y coordinate of this vertex.
	**/
	var ny : Float;
	/**
		The normalized projected z coordinate of this vertex.
	**/
	var nz : Float;
	/**
		UV u coordinate of this vertex.
	**/
	var u : Float;
	/**
		UV v coordinate of this vertex.
	**/
	var v : Float;
	/**
		The color value of this vertex.
	**/
	var color : Float;
	/**
		The alpha value of this vertex.
	**/
	var alpha : Float;
	/**
		The translated x coordinate of this vertex.
	**/
	var tx : Float;
	/**
		The translated y coordinate of this vertex.
	**/
	var ty : Float;
	/**
		The translated alpha value of this vertex.
	**/
	var ta : Float;
	/**
		The translated uv u coordinate of this vertex.
	**/
	var tu : Float;
	/**
		The translated uv v coordinate of this vertex.
	**/
	var tv : Float;
	/**
		Sets the U and V properties.
		
		Also resets the translated uv properties, undoing any scale
		or shift they may have had.
	**/
	function setUVs(u:Float, v:Float):Vertex;
	/**
		Translates the original UV positions by the given amounts.
		
		The original properties `Vertex.u` and `Vertex.v`
		remain unchanged, only the translated properties
		`Vertex.tu` and `Vertex.tv`, as used in rendering,
		are updated.
	**/
	function scrollUV(x:Float, y:Float):Vertex;
	/**
		Scales the original UV values by the given amounts.
		
		The original properties `Vertex.u` and `Vertex.v`
		remain unchanged, only the translated properties
		`Vertex.tu` and `Vertex.tv`, as used in rendering,
		are updated.
	**/
	function scaleUV(x:Float, y:Float):Vertex;
	/**
		Transforms this vertex by the given matrix, storing the results in `vx`, `vy` and `vz`.
	**/
	function transformCoordinatesLocal(transformMatrix:phaser.math.Matrix4, width:Float, height:Float, cameraZ:Float):Void;
	/**
		Resizes this Vertex by setting the x and y coordinates, then transforms this vertex
		by an identity matrix and dimensions, storing the results in `vx`, `vy` and `vz`.
	**/
	function resize(x:Float, y:Float, width:Float, height:Float, originX:Float, originY:Float):Vertex;
	/**
		Updates this Vertex based on the given transform.
	**/
	function update(a:Float, b:Float, c:Float, d:Float, e:Float, f:Float, roundPixels:Bool, alpha:Float):Vertex;
	/**
		Loads the data from this Vertex into the given Typed Arrays.
	**/
	function load(F32:js.lib.Float32Array, U32:js.lib.Uint32Array, offset:Float, textureUnit:Float, tintEffect:Float):Float;
	static var prototype : Vertex;
}