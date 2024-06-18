package phaser;

@:native("Phaser.Utils") @valueModuleOnly extern class Utils {
	/**
		A NOOP (No Operation) callback function.
		
		Used internally by Phaser when it's more expensive to determine if a callback exists
		than it is to just invoke an empty function.
	**/
	static function NOOP():Void;
	/**
		A NULL OP callback function.
		
		This function always returns `null`.
		
		Used internally by Phaser when it's more expensive to determine if a callback exists
		than it is to just invoke an empty function.
	**/
	static function NULL():Void;
}