package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class BookSubState extends FlxSubState
{
	var quitbutton:FlxButton;
	var bookPage:FlxSprite;

	override public function create()
	{
		super.create();

		quitbutton = createQuitButton("close", () ->
		{
			close();
		}, 10, 10, FlxColor.LIME);

		bookPage = new FlxSprite();
		bookPage.loadGraphic(AssetPaths.homenotebookpage__png);

		add(bookPage);
		add(quitbutton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(posx, posy, labelText, onClick);
		button.makeGraphic(40, 20, color);
		button.label.size = 10;

		return button;
	}
}
