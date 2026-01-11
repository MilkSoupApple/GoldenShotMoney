var key_right = keyboard_check(ord("D"));
var key_left = keyboard_check(ord("A"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));
var key_shoot_right = keyboard_check_pressed(vk_right);
var key_shoot_left = keyboard_check_pressed(vk_left);
var key_shoot_up = keyboard_check_pressed(vk_up);
var key_shoot_down = keyboard_check_pressed(vk_down);

var key_jump_pressed  = keyboard_check_pressed(vk_space);
var key_jump_held     = keyboard_check(vk_space);
var key_jump_released = keyboard_check_released(vk_space);


var move = (key_right - key_left);

hsp = wspeed*move;
ctime -= 1;
btime -= 1;

// JUMP INPUT / BUFFER
if (key_jump_pressed) {
    ctime = 30; // jump buffer
}

// JUMP EXECUTION
if (ctime > 0 && (place_meeting(x, y + 1, Owall) || btime > 0)) {
  if (key_jump_held) {
  vsp = -12;      // jump strength
    ctime = 0;
    btime = 0;
  }
  else {
	  vsp = -7;
	  ctime = 0;
    btime = 0;
  }
}

// VARIABLE JUMP HEIGHT (jump cut)
if (key_jump_released && vsp < 0) {
    vsp *= 0.4; // how much the jump is shortened
}



if (place_meeting(x+hsp,y,Owall)) {
	while (!place_meeting(x+sign(hsp),y,Owall)) {
		x += sign(hsp);
	}
hsp = 0;	
}

x += hsp;


vsp += grv;
if (place_meeting(x,y+vsp,Owall)) {
	while (!place_meeting(x,y+sign(vsp),Owall)) {
		y += sign(vsp);
	}

vsp = 0;	
}

y += vsp;


if (place_meeting(x,y+1,Owall)) {
	btime = 15;
}