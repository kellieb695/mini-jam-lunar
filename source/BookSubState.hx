package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSprite;
import flixel.FlxSubState;

class BookSubState extends FlxSubState
{
	var bookPage:FlxSprite;

	override public function create()
	{
		super.create();

		bookPage = new FlxSprite();
		bookPage.loadGraphic(AssetPaths.book__png);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE)
		{
			close();
			trace("closed");
		}
	}
}
