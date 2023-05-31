//ger cam coord

var _camX = camera_get_view_x (view_camera[0]);
var _camY = camera_get_view_y (view_camera[0]);

//central HUD coord
var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;
//draw player hp
if instance_exists(oPlayer)
{

draw_sprite (sHealthBar,0,_camX+ _border,_camY + _border);

for (var i=0; i< playerMaxHp; i++)
{
	
	//show current hp
	var _img =1
	if i+1<= playerHp {_img = 2;};
	var _sep = 4
	draw_sprite(sHealthBar,_img, _hudX + _sep*i,_hudY);
}
}



//draw enemy kill count (ec = enemycount)
if  instance_exists(oPlayer) 
{
var _enemyCountOffset = 25;
var _ecHudX = _hudX;
var _ecHudY = _hudY +_enemyCountOffset;
draw_sprite (sEnemyCountHud,0, _ecHudX,_ecHudY );





//draw text

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font (fnAnim);

//the current enemy kill
draw_text (_ecHudX +20,_ecHudY +2.5,string (global.enemyKillCount));
//total zombies
draw_text (_ecHudX +42,_ecHudY +2.5, "/" + string (global.enemyRoomMax));
}
// draw level number

if (instance_exists(oPlayer)) {
var _levelOffset = 50;
var _levelHudX = _hudX;
var _levelHudY = _hudY + _levelOffset;
draw_sprite(sLevelX, 0, _levelHudX, _levelHudY);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnAnim);
draw_text(_levelHudX + 9, _levelHudY + 2.5, "LEVEL " + string(global.currentLevel));
}





if global.orb_x != undefined && global.orb_y != undefined
{
    if (instance_exists(oPlayer))
    {
        var _levelOffset = 75;
        var _levelHudX = _hudX ;
        var _levelHudY = _hudY + _levelOffset;

        // Draw the sLevelX sprite
        draw_sprite(sLevelXX, 0, _levelHudX, _levelHudY);

        // Draw the orb sprite to the left of the sLevelXX sprite
        var _orbX = _levelHudX + sprite_get_width(sLevelXX) - sprite_get_width(orb2)-80;
        var _orbY = _levelHudY + sprite_get_height(sLevelXX) / 2 - sprite_get_height(orb2)+8;
        draw_sprite(orb2, 0, _orbX, _orbY);

        // Draw the text to the right of the sprite
        draw_set_halign(fa_left); // Align to left
        draw_set_valign(fa_top);
        draw_set_font(fnAnim);
        draw_text(_levelHudX + sprite_get_width(sLevelXX) -78, _levelHudY+sprite_get_height(sLevelXX)-16.5, "JavaOrb");

    }
}