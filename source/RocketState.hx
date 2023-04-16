package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class RocketState extends FlxState
{
	var quitbutton:FlxButton;
	var computerscreen:FlxSprite;
	var text1:FlxTypeText;
	var text2:FlxTypeText;
	var text4:FlxTypeText;
	var line:Int = 1;

	override public function create()
	{
		quitbutton = createQuitButton("back", () ->
		{
			FlxG.switchState(new PlayState());
		}, 10, 10, FlxColor.LIME);

		computerscreen = new FlxSprite();
		computerscreen.loadGraphic(AssetPaths.computer__png);

		text1 = new FlxTypeText(75, 75, 500, "\nuser@4jd9sj7s3>", 20);
		text1.prefix = "Press enter to proceed> \n ";
		text1.delay = 0.1;

		text2 = new FlxTypeText(75, 75, 500, "\n \n \n \nAuthorizing...", 20);
		text2.delay = 0.1;

		text4 = new FlxTypeText(75, 75, 500, "\n \n \n \n \n \nSelect launch coordinates>", 20);
		text2.delay = 0.1;

		add(computerscreen);
		add(quitbutton);
		add(text1);
		add(text2);
		add(text4);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (((FlxG.keys.justReleased.ENTER) && (line == 1)))
		{
			text1.start();
			++line;
			trace(line);
		}
		else if ((FlxG.keys.justReleased.ENTER && (line == 2)))
		{
			text2.start();
			++line;
			trace(line);
		}
		else if ((FlxG.keys.justReleased.ENTER && line == 3))
		{
			text4.start();
			trace(line);
		}
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(posx, posy, labelText, onClick);
		button.makeGraphic(40, 20, color);
		button.label.size = 10;

		return button;
	}
}
