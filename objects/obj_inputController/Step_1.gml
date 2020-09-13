/// @description UPDATE CONTROLS

g.up[pressed] = keyboard_check_pressed(upKey);
g.up[released] = keyboard_check_released(upKey);
g.up[held] = keyboard_check(upKey);

g.down[pressed] = keyboard_check_pressed(downKey);
g.down[released] = keyboard_check_released(downKey);
g.down[held] = keyboard_check(downKey);

g.left[pressed] = keyboard_check_pressed(leftKey);
g.left[released] = keyboard_check_released(leftKey);
g.left[held] = keyboard_check(leftKey);

g.right[pressed] = keyboard_check_pressed(rightKey);
g.right[released] = keyboard_check_released(rightKey);
g.right[held] = keyboard_check(rightKey);

g.jump[pressed] = keyboard_check_pressed(jumpKey);
g.jump[released] = keyboard_check_released(jumpKey);
if(keyboard_check(jumpKey))
	g.jump[held]++;
else
	g.jump[held]=0;
	
g.interact[pressed] = keyboard_check_pressed(interactKey);
g.interact[released] = keyboard_check_released(interactKey);
if(keyboard_check(interactKey))
	g.interact[held]++;
else
	g.interact[held]=0;
	
g.attack[pressed] = mouse_check_button_pressed(attackKey);
g.attack[released] = mouse_check_button_released(attackKey);
if(mouse_check_button(attackKey))
	g.attack[held]++;
else
	g.attack[held]=0;
	
g.altAttack[pressed] = mouse_check_button_pressed(altAttackKey);
g.altAttack[released] = mouse_check_button_released(altAttackKey);
if(mouse_check_button(altAttackKey))
	g.altAttack[held]++;
else
	g.altAttack[held]=0;
	
g.slide[pressed] = keyboard_check_pressed(slideKey);
g.slide[released] = keyboard_check_released(slideKey);
if(keyboard_check(slideKey))
	g.slide[held]++;
else
	g.slide[held]=0;
	
g.enter[pressed] = keyboard_check_pressed(enterKey);
g.enter[released] = keyboard_check_released(enterKey);
if(keyboard_check(enterKey))
	g.enter[held]++;
else
	g.enter[held]=0;


//--------------------- input direction code ------------------------//
g.inputHorizontalTotal = g.right[held] - g.left[held];
g.inputVerticalTotal	= g.up[held] - g.down[held];

if(point_distance(0,0,g.inputHorizontalTotal,g.inputVerticalTotal) > 0)
	g.inputDirection = point_direction(0,0,g.inputHorizontalTotal,g.inputVerticalTotal);
else
	g.inputDirection = no_direction;