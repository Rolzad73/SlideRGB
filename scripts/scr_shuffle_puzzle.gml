///Shuffle puzzle one step

var possible_directions_bitmap, possible_directions_count, swap_direction;
var choice;
var i;

possible_directions_count = 0;
possible_directions_bitmap = DIR_NOWHERE;
//show_debug_message("empty_x " + string(empty_x) + " | empty_y " + string(empty_y));

// 1 - determine possible swap directions
if(scr_move_isvalid(DIR_UP)){ possible_directions_bitmap |= DIR_UP; possible_directions_count += 1; } // add up swap
if(scr_move_isvalid(DIR_RIGHT)){ possible_directions_bitmap |= DIR_RIGHT; possible_directions_count += 1; } // add right left swap
if(scr_move_isvalid(DIR_DOWN)){ possible_directions_bitmap |= DIR_DOWN; possible_directions_count += 1; } // add down swap
if(scr_move_isvalid(DIR_LEFT)){ possible_directions_bitmap |= DIR_LEFT; possible_directions_count += 1; } // add left swap

//show_debug_message("dir mask1: " + string(possible_directions_bitmap));
//show_debug_message("possible_directions_count1: " + string(possible_directions_count));

// eliminate reverse of that slide direction
switch(global.last_slide_direction)
{
  case DIR_UP:
    if(possible_directions_bitmap & DIR_DOWN)
    {
      possible_directions_bitmap ^= DIR_DOWN;
      possible_directions_count -= 1;
      //show_debug_message("removed DIR_DOWN");
    }
    break;
  case DIR_RIGHT:
    if(possible_directions_bitmap & DIR_LEFT)
    {
      possible_directions_bitmap ^= DIR_LEFT;
      possible_directions_count -= 1;
      //show_debug_message("removed DIR_LEFT");
    }
    break;
  case DIR_DOWN:
    if(possible_directions_bitmap & DIR_UP)
    {
      possible_directions_bitmap ^= DIR_UP;
      possible_directions_count -= 1;
      //show_debug_message("removed DIR_UP");
    }
    break;
  case DIR_LEFT:
    if(possible_directions_bitmap & DIR_RIGHT)
    {
      possible_directions_bitmap ^= DIR_RIGHT;
      possible_directions_count -= 1;
      //show_debug_message("removed DIR_RIGHT");
    }
    break;
}


//show_debug_message("dir mask2: " + string(possible_directions_bitmap));
//show_debug_message("possible_directions_count2: " + string(possible_directions_count));

// 2 - pick a random direction from empty tile out of possible directions
choice = irandom(possible_directions_count - 1);
//show_debug_message("choice: " + string(choice));

// cycle through all directions until a valid one that matches the chosen one is found
for (i=0; i<4; i+=1)
{
  if((possible_directions_bitmap >> i) & 1)
  {
    //show_debug_message("POSSIBLE: " + string(1 << i));
    if(choice = 0){ swap_direction = 1 << i; }
    choice -= 1; 
  }
}

// store last move to eliminate cyclic thrashing
global.last_slide_direction = swap_direction;

// 3 - swap the tiles in the chosen direction
scr_swap_tile(swap_direction);

