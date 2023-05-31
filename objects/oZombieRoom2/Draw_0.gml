//draw self flipped the right way
draw_sprite_ext ( sprite_index,image_index,x, y, face, image_yscale, image_angle, image_blend, image_alpha   );

//hp HUD
var _healthPercent = hp / maxHp;
var _hpImage = _healthPercent* (sprite_get_number ( sEnemyHealth ) -1) ;
draw_sprite_ext(sEnemyHealth, _hpImage,x,y - sprite_height -1, image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//draw_text (x,y,string(hp));