package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
using flixel.util.FlxSpriteUtil;

import Player;

class PlayState extends FlxState {
  var player:Player;
  public static var arrows:FlxTypedGroup<Arrow>;

  override public function create():Void {
    super.create();

    // 背景
    var backGround = new FlxSprite(0, 0);
    backGround.makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(240, 240, 240));
    // 地面
    var lineStyle:LineStyle = { color: FlxColor.fromRGB(200, 200, 200), thickness: 3 };
    backGround.drawLine(0, FlxG.height-30, FlxG.width, FlxG.height-30, lineStyle);
    this.add(backGround);
    var player = new Player();
    player.setPosition(100, FlxG.height-player.height-10);
    this.add(player);
    arrows = new FlxTypedGroup<Arrow>();
    this.add(arrows);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);
  }
}
