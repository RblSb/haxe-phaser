package phaser.physics.matter.components;

/**
	Enables a Matter-enabled Game Object to set its Body. Should be used as a mixin and not directly.
**/
typedef SetBody = {
	/**
		Set this Game Objects Matter physics body to be a rectangle shape.
		
		Calling this methods resets all previous properties you may have set on the body, including
		plugins, mass, friction, collision categories, etc. So be sure to re-apply these as needed.
	**/
	function setRectangle(width:Float, height:Float, ?options:phaser.types.physics.matter.MatterBodyConfig):SetBody;
	/**
		Set this Game Objects Matter physics body to be a circle shape.
		
		Calling this methods resets all previous properties you may have set on the body, including
		plugins, mass, friction, collision categories, etc. So be sure to re-apply these as needed.
	**/
	function setCircle(radius:Float, ?options:phaser.types.physics.matter.MatterBodyConfig):SetBody;
	/**
		Set this Game Objects Matter physics body to be a polygon shape.
		
		Calling this methods resets all previous properties you may have set on the body, including
		plugins, mass, friction, collision categories, etc. So be sure to re-apply these as needed.
	**/
	function setPolygon(radius:Float, sides:Float, ?options:phaser.types.physics.matter.MatterBodyConfig):SetBody;
	/**
		Set this Game Objects Matter physics body to be a trapezoid shape.
		
		Calling this methods resets all previous properties you may have set on the body, including
		plugins, mass, friction, collision categories, etc. So be sure to re-apply these as needed.
	**/
	function setTrapezoid(width:Float, height:Float, slope:Float, ?options:phaser.types.physics.matter.MatterBodyConfig):SetBody;
	/**
		Set this Game Object to use the given existing Matter Body.
		
		The body is first removed from the world before being added to this Game Object.
	**/
	function setExistingBody(body:matterjs.BodyType, ?addToWorld:Bool):SetBody;
	/**
		Set this Game Object to create and use a new Body based on the configuration object given.
		
		Calling this methods resets all previous properties you may have set on the body, including
		plugins, mass, friction, collision categories, etc. So be sure to re-apply these as needed.
	**/
	function setBody(config:ts.AnyOf2<String, phaser.types.physics.matter.MatterSetBodyConfig>, ?options:phaser.types.physics.matter.MatterBodyConfig):SetBody;
};