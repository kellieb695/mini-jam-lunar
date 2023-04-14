package;

import flixel.FlxState;
import moon.MoonHero;

class PlayState extends FlxState
{
	override public function create()
	{
		add(new MoonHero(150, 250));
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
