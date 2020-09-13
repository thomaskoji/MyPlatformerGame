event_inherited();

#region Controls

g.up = [0,0,0];
g.down = [0,0,0];
g.left = [0,0,0];
g.right = [0,0,0];
g.jump = [0,0,0];
g.slide = [0,0,0];

g.interact = [0,0,0];

g.attack = [0,0,0];
g.altAttack = [0,0,0];

g.enter = [0,0,0];

#endregion

#region Key properties

upKey		= ord("W");
downKey		= ord("S");
leftKey		= ord("A");
rightKey	= ord("D");
jumpKey		= vk_space;
slideKey	= vk_control;

interactKey = ord("E");

attackKey	= mb_left;
altAttackKey	= mb_right;

enterKey	= vk_enter;

#endregion

g.inputHorizontalTotal = 0;
g.inputVerticalTotal = 0;