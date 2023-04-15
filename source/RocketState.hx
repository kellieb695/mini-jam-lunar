package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class RocketState extends FlxState
{
	var quitbutton:FlxButton;
	var computerscreen:FlxSprite;

	override public function create()
	{
		quitbutton = createQuitButton("back", () ->
		{
			FlxG.switchState(new PlayState());
		}, 50, 50, FlxColor.LIME);
		computerscreen = new FlxSprite();
		computerscreen.loadGraphic(AssetPaths.computer__png);

		add(computerscreen);
		add(quitbutton);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(0, 0, labelText, onClick);
		button.makeGraphic(20, 20, color);
		button.label.size = 10;
		button.width = button.label.width;
		button.height = button.label.height;
		button.setPosition(posx, posy);
		button.scrollFactor.set(0);

		return button;
	}
}
