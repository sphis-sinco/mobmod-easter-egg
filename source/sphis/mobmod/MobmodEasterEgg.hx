package sphis.mobmod;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;

class MobmodEasterEgg extends FlxState
{
	override function create()
	{
		super.create();

        var sphis = new FlxSprite();
        sphis.frames = FlxAtlasFrames.fromSparrow('assets/sphis-scare.png','assets/sphis-scare.xml');
		sphis.animation.addByPrefix('scare', 'scare', 12, false);

        add(sphis);

		sphis.animation.play('scare');
		
        sphis.screenCenter();
		sphis.x += sphis.width / 12;

        sphis.animation.onFinish.add(an -> {
            #if sys
			Sys.exit(0);
            #else
            trace("You're stuck here now");
            #end
        });
        FlxG.sound.play('assets/sphis-scare.ogg');
	}
}
