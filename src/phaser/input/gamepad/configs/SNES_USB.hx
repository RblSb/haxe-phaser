package phaser.input.gamepad.configs;

/**
	Tatar SNES USB Controller Gamepad Configuration.
	USB Gamepad  (STANDARD GAMEPAD Vendor: 0079 Product: 0011)
**/
@:native("Phaser.Input.Gamepad.Configs.SNES_USB") @valueModuleOnly extern class SNES_USB {
	/**
		D-Pad up
	**/
	static final UP : Float;
	/**
		D-Pad down
	**/
	static final DOWN : Float;
	/**
		D-Pad left
	**/
	static final LEFT : Float;
	/**
		D-Pad right
	**/
	static final RIGHT : Float;
	/**
		Select button
	**/
	static final SELECT : Float;
	/**
		Start button
	**/
	static final START : Float;
	/**
		B Button (Bottom)
	**/
	static final B : Float;
	/**
		A Button (Right)
	**/
	static final A : Float;
	/**
		Y Button (Left)
	**/
	static final Y : Float;
	/**
		X Button (Top)
	**/
	static final X : Float;
	/**
		Left bumper
	**/
	static final LEFT_SHOULDER : Float;
	/**
		Right bumper
	**/
	static final RIGHT_SHOULDER : Float;
}