package;

import flixel.FlxState;
import moon.MoonHero;

class AsteroidsState extends FlxState
{
	override public function create()
	{
		add(new MoonHero(150, 250));
		add(new MoonHero(300, 150));
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
