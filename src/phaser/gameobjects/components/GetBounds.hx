package phaser.gameobjects.components;

/**
	Provides methods used for obtaining the bounds of a Game Object.
	Should be applied as a mixin and not used directly.
**/
typedef GetBounds = {
	/**
		Gets the center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-left corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getTopLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getTopCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-right corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getTopRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the left-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getLeftCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the right-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getRightCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-left corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getBottomLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getBottomCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-right corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getBottomRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bounds of this Game Object, regardless of origin.
		
		The values are stored and returned in a Rectangle, or Rectangle-like, object.
	**/
	function getBounds<O>(?output:O):O;
};