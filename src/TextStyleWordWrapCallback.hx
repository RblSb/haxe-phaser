/**
	A custom function that will be responsible for wrapping the text.
**/
typedef TextStyleWordWrapCallback = (text:String, textObject:phaser.gameobjects.Text) -> ts.AnyOf2<String, Array<String>>;