package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class ComputerState extends FlxState
{
	var quitbutton:FlxButton;
	var computerscreen:FlxSprite;
	var text0:FlxTypeText;
	var text1:FlxTypeText;
	var text2:FlxTypeText;
	var text3:FlxTypeText;
	var textx:FlxText;
	var texty:FlxText;
	var line:Int = 1;
	var xcoordInput:Int;
	var ycoordInput:Int;
	var textReauth:FlxTypeText;
	var fontSize:Int;

	override public function create()
	{
		super.create();
		quitbutton = createQuitButton("back", () ->
		{
			FlxG.switchState(new PlayState());
		}, 10, 10, FlxColor.LIME);
		fontSize = 15;
		computerscreen = new FlxSprite();
		computerscreen.loadGraphic(AssetPaths.computer__png);

		text0 = new FlxTypeText(50, 75, 500, ">Press enter to proceed or R to restart  ", 15);
		text0.delay = 0.1;
		text0.color = FlxColor.LIME;

		text1 = new FlxTypeText(50, 75, 500, "\n \n>user@4jd9sj7s3", 15);
		// text1.prefix = ">Press enter to proceed or R to restart \n ";
		text1.delay = 0.1;
		text1.color = FlxColor.LIME;

		text2 = new FlxTypeText(50, 75, 500, "\n \n \n \n>Authorizing...     ", 15);
		text2.delay = 0.1;
		text2.color = FlxColor.LIME;

		text3 = new FlxTypeText(50, 75, 500, "\n \n \n \n \n \n>Select launch coordinates with arrow keys           ", 15);
		text3.delay = 0.1;
		text3.color = FlxColor.LIME;

		xcoordInput = 100;
		ycoordInput = 100;
		textx = new FlxText(50, 75, 500, "\n \n \n \n \n \n \n \n>X Coordinate: " + xcoordInput + "\n", 15);
		texty = new FlxText(50, 75, 500, "\n \n \n \n \n \n \n \n \n \n>Y Coordinate: " + ycoordInput, 15);
		textx.color = FlxColor.LIME;
		texty.color = FlxColor.LIME;

		textReauth = new FlxTypeText(50, 75, 500, ">Wrong coordinates...\n \n>Reauthorizing...               ", 15);
		textReauth.prefix = "\n \n \n \n \n \n \n \n \n \n \n \n";
		textReauth.delay = 0.1;
		textReauth.color = FlxColor.LIME;

		add(computerscreen);
		add(quitbutton);
		add(text0);
		add(text1);
		add(text2);
		add(text3);
		text0.start();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		processEnter();
		processSpace();
		if (line == 5)
		{
			updateX();
		}
		if (line == 7)
		{
			updateY();
		}
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(posx, posy, labelText, onClick);
		button.makeGraphic(40, 20, color);
		button.label.size = 10;

		return button;
	}

	private function processEnter()
	{
		if ((FlxG.keys.justReleased.R))
		{
			FlxG.switchState(new ComputerState());
		}
		if ((FlxG.keys.justReleased.ENTER) && (line == 7))
		{
			if ((xcoordInput < 496) && (xcoordInput > 400) && (ycoordInput < 596) && (ycoordInput > 500))
			{
				FlxG.switchState(new RocketState());
			}
			else
			{
				add(textReauth);
				textReauth.start();
				textReauth.completeCallback = () ->
				{
					FlxG.switchState(new ComputerState());
				};
				trace("wrong lol");
			}
		}
		if ((FlxG.keys.justReleased.ENTER) && (line == 5))
		{
			add(texty);
			line = 7;
		}
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
			text3.start();
			trace(line);
			text3.completeCallback = () ->
			{
				trace("hi");
				add(textx);
				line = 5;
			};
		}
	}

	private function processSpace()
	{
		if (FlxG.keys.justReleased.SPACE)
		{
			trace("space");
			FlxG.switchState(new RocketState());
		}
	}

	private function updateX()
	{
		if (FlxG.keys.pressed.UP)
		{
			xcoordInput++;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			xcoordInput--;
		}
		textx.text = "\n \n \n \n \n \n \n \n>X Coordinate: " + xcoordInput + "\n";
	}

	private function updateY()
	{
		if (FlxG.keys.pressed.UP)
		{
			ycoordInput++;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			ycoordInput--;
		}
		texty.text = "\n \n \n \n \n \n \n \n \n \n>Y Coordinate: " + ycoordInput + "\n";
	}
}
