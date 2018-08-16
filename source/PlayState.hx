package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState {
  var hero = new FlxSprite();
  override public function create():Void {
    super.create();

    // 背景
    var backGround = new FlxSprite(0, 0);
    backGround.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
    this.add(backGround);

    hero.loadGraphic(AssetPaths.archer__png, true, 32, 32, true);
    hero.animation.add("Idle", [0], 1, true);
    hero.setPosition(100, 100);
    hero.animation.play("Idle");
    this.add(hero);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);

    if(FlxG.keys.pressed.RIGHT) {
      hero.x += 10;
    }

    if(FlxG.keys.pressed.LEFT) {
      hero.x -= 10;
    }

  }
}
