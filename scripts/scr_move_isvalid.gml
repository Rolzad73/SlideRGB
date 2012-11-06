///Check if move is valid
var move_validity;
move_validity = true;

switch(argument[0])
{
  case DIR_UP:
    if(global.empty_y = global.tile_count_y - 1){ move_validity = false; }
    break;
  case DIR_RIGHT:
    if(global.empty_x = 0){ move_validity = false; }
    break;
  case DIR_DOWN:
    if(global.empty_y = 0){ move_validity = false; }
    break;
  case DIR_LEFT:
    if(global.empty_x = global.tile_count_x - 1){ move_validity = false; }
    break;
}
//show_debug_message("empty x,y: " + string(global.empty_x) + "," + string(global.empty_y));

return move_validity;

