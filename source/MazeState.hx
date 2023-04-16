package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MazeState extends FlxState
{
	var quitbutton:FlxButton;
	var maze:FlxTilemap;
	var sprite:FlxSprite;

	override public function create()
	{
		super.create();

		quitbutton = createQuitButton("back", () ->
		{
			FlxG.switchState(new PlayState());
		}, 50, 50, FlxColor.LIME);

		maze = new FlxTilemap();
		maze.loadMapFromArray([
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1,
			1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1,
			1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1,
			1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1,
			1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1,
			1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1,
			1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1,
			1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		], 20, 15, AssetPaths.wall__png, 32, 32);

		sprite = new FlxSprite(96, 96);

		add(maze);
		add(sprite);
		add(quitbutton);
	}

	override public function update(elapsed:Float)
	{
		keyboardMovement();
		FlxG.collide(maze, sprite);
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

	private function keyboardMovement()
	{
		if (FlxG.keys.pressed.RIGHT)
		{
			sprite.x += 1;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			sprite.x -= 1;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			sprite.y += 1;
		}
		if (FlxG.keys.pressed.UP)
		{
			sprite.y -= 1;
		}
	}
}
