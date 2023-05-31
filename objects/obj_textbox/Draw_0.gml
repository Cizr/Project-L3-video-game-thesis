//draw text box
draw_rectangle (x-2 , y-2 , x+boxWidth+2 , y+boxHeight+2,false);
draw_sprite(trigger,0,x,y);
draw_set_font(Font3);

if (charCount< string_length(text[page])){
charCount +=0.5;
}
textPart =string_copy (text[page], 1,charCount);
// the name of npc
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_text(x +(boxWidth/2),y+yBuffer,name);
draw_set_halign(fa_left);
//context text
draw_set_color(c_white);
draw_text_ext(x+xBuffer,y+stringHeight+yBuffer,textPart,stringHeight, boxWidth- (2*xBuffer)); 
