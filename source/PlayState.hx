package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.FlxSprite;
using flixel.util.FlxSpriteUtil;

import Player;

class PlayState extends FlxState {
  var Player:Player;
  override public function create():Void {
    super.create();

    // 背景
    var backGround = new FlxSprite(0, 0);
    backGround.makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(240, 240, 240));
    // 地面
    var lineStyle:LineStyle = { color: FlxColor.fromRGB(200, 200, 200), thickness: 3 };
    backGround.drawLine(0, FlxG.height-30, FlxG.width, FlxG.height-30, lineStyle);
    this.add(backGround);
    var Player = new Player();
    Player.setPosition(100, FlxG.height-Player.height-10);
    this.add(Player);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);
  }
}
