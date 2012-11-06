///Init Puzzle Room

globalvar tilePositions, solvedPositions;
globalvar empty_x, empty_y;
globalvar puzzle_width, puzzle_height;
globalvar tile_count_x, tile_count_y;
globalvar x_start, y_start;
globalvar tile_width, tile_height;
globalvar puzzle_image_inst, puzzleBG_image_inst;
globalvar tiles_visible;
globalvar tile_sprites_created;
globalvar x_pos_origin, y_pos_origin;
globalvar current_slide_speed, user_slide_speed, shuffle_slide_speed;
globalvar slide_path;
globalvar sliding;
globalvar last_slide_direction;
globalvar shuffle_count;

// empty tile always starts at 0,0 (although could also be configurable)
empty_x = 0;
empty_y = 0;
puzzle_width = 128;  // could change with resolution change
puzzle_height = 128; // could change with resolution change
tile_count_x = 4;    // should be configurable
tile_count_y = 4;    // should be configurable
tile_width = 32;     // depends on puzzle_width / tile count_x
tile_height = 32;    // depends on puzzle_height / tile_count_y

//test alternate stats
//tile_count_x = 8;    // should be configurable
//tile_count_y = 8;    // should be configurable
//tile_width = 16;     // depends on puzzle_width / tile count_x
//tile_height = 16;    // depends on puzzle_height / tile_count_y

tiles_visible = false;
tile_sprites_created = false;
x_pos_origin = 32;  // location of top left origign of on screen puzzle
y_pos_origin = 32;  // location of top left origign of on screen puzzle
current_slide_speed = room_speed;
user_slide_speed = room_speed;
shuffle_slide_speed = room_speed * 2;
slide_path = path_add(); // create a path and add 2 empty points
path_set_closed(slide_path, false);
path_add_point(slide_path, 0, 0, current_slide_speed);
path_add_point(slide_path, 0, 0, current_slide_speed);
sliding = false;
last_slide_direction = DIR_NOWHERE;
shuffle_count = 100;

// working variables
var i, j;
var inst_tile;

// create and initialize tile array and tile object instances
for (i=0; i<tile_count_y; i+=1){
  //show_debug_message("i={ " + string(i));
  for (j=0; j<tile_count_x; j+=1){
    //show_debug_message("    " + string(j) + ",");
    tilePositions[i,j] = (i*tile_count_x)+j;
    solvedPositions[i,j] = tilePositions[i,j];
    inst_tile = instance_create((j*tile_width)+x_pos_origin, (i*tile_height)+y_pos_origin, obj_tile);
    inst_tile.tile_index = tilePositions[i,j];
    inst_tile.tile_x_pos = j;
    inst_tile.tile_y_pos = i;
    //show_debug_message("i,j=k: " + string(i) + "," + string(j) + "="+ string(tilePositions[i,j]));
  }
  //show_debug_message("},");
}

