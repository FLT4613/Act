package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.FlxSprite;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {
  var hero = new FlxSprite();
  override public function create():Void {
    super.create();

    // 背景
    var backGround = new FlxSprite(0, 0);
    backGround.makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(240, 240, 240));
    // 地面
    var lineStyle:LineStyle = { color: FlxColor.fromRGB(200, 200, 200), thickness: 3 };
    backGround.drawLine(0, FlxG.height-30, FlxG.width, FlxG.height-30, lineStyle);
    this.add(backGround);

    hero.loadGraphic(AssetPaths.archer__png, true, 32, 32, true);
    hero.animation.add("Idle", [0], 1, true);
    hero.animation.add("Move", [0, 1, 2, 3], 10, true);


    hero.setPosition(100, FlxG.height-hero.height-10);
    hero.animation.play("Idle");
    this.add(hero);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);

    if(FlxG.keys.pressed.RIGHT) {
      hero.x += 3;
      hero.animation.play("Move");
    } else if(FlxG.keys.pressed.LEFT) {
      hero.x -= 3;
      hero.animation.play("Move");
    } else {
      hero.animation.play("Idle");
    }

  }
}
