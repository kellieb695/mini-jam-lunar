package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class KeyInstructionsSubState extends FlxSubState
{
	var quitbutton:FlxButton;
	var note:FlxSprite;
	var hasKey:Bool;

	public function new(haskey:Bool)
	{
		super();
		hasKey = haskey;
	}

	override public function create()
	{
		super.create();

		quitbutton = createQuitButton("close", () ->
		{
			close();
		}, 10, 10, FlxColor.LIME);

		note = new FlxSprite();
		if (hasKey)
		{
			note.loadGraphic(AssetPaths.pressk__png);
		}
		else
		{
			note.loadGraphic(AssetPaths.pressk__png);
		}

		add(note);
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
