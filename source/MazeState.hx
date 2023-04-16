package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MazeState extends FlxState
{
	var quitbutton:FlxButton;
	var maze:FlxTilemap;
	var sprite:FlxSprite;
	var book:FlxSprite;
	var hasKey:Bool;

	public function new(haskey:Bool)
	{
		super();
		hasKey = haskey;
	}

	override public function create()
	{
		super.create();
		trace(hasKey);
		quitbutton = createQuitButton("back", () ->
		{
			FlxG.switchState(new PlayState());
		}, 10, 10, FlxColor.LIME);

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

		sprite = new FlxSprite(320, 240);
		book = new FlxSprite(360, 240);
		book.loadGraphic(AssetPaths.book__png);

		add(maze);
		add(sprite);
		add(book);
		add(quitbutton);
	}

	override public function update(elapsed:Float)
	{
		keyboardMovement();
		getBook();
		unlockDoor();
		FlxG.collide(maze, sprite);
		super.update(elapsed);
	}

	private function unlockDoor()
	{
		if (hasKey && FlxG.keys.justPressed.K)
		{
			maze.setTile(5, 9, 0, true);
			trace("tile changed");

			maze.setTileProperties(0, NONE);
			maze.setTileProperties(1, ANY);
		}
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(posx, posy, labelText, onClick);
		button.makeGraphic(40, 20, color);
		button.label.size = 10;

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

	private function getBook()
	{
		if ((sprite.overlaps(book)))
		{
			book.kill();
		}
	}
}
