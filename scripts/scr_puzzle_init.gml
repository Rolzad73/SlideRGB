///Init Puzzle Room

// do these even need to be gloabls?
globalvar tilePositions, solvedPositions;
globalvar empty_x, empty_y, solved_empty_x, solved_empty_y;
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

// empty tile always starts at 0,0 (although should also be configurable)
solved_empty_x = 0;
solved_empty_y = 0;

/////set values derved from init setup
tile_count_x = 4;    // should be configurable
tile_count_y = 4;    // should be configurable
tile_width = global.screendensity[global.game_size] * 4 / tile_count_x;
tile_height = global.screendensity[global.game_size] * 4 / tile_count_y;

puzzle_width = tile_width * tile_count_x;
puzzle_height = tile_width * tile_count_y;
tile_width = global.screendensity[global.game_size] * 4 / tile_count_x;
tile_height = global.screendensity[global.game_size] * 4 / tile_count_y;
x_pos_origin = global.view_width_mid - (tile_width * tile_count_x / 2);
y_pos_origin = global.view_height_mid - (tile_height * tile_count_y / 2);
// set slide speeds
user_slide_speed = tile_width / 3; // make configurable
shuffle_slide_speed = tile_width; // make configurable
current_slide_speed = user_slide_speed;
// NOTE : slide speed seems to be slower for small puzzles
//        and fast for large puzzles

tiles_visible = false;
tile_sprites_created = false;

// create path for sliding tiles animation
slide_path = path_add();
path_set_closed(slide_path, false);
path_add_point(slide_path, 0, 0, current_slide_speed);
path_add_point(slide_path, 0, 0, current_slide_speed);
sliding = false;
last_slide_direction = DIR_NOWHERE;
shuffle_count = 20; // make this configrable

// create and initialize tile array and tile object instances
var i, j;
var inst_tile;

for (i=0; i<tile_count_y; i+=1) {
  for (j=0; j<tile_count_x; j+=1) {
    tilePositions[i,j] = (i * tile_count_x) + j;
    solvedPositions[i,j] = tilePositions[i,j];
    inst_tile = instance_create((j * tile_width) + x_pos_origin, (i * tile_height) + y_pos_origin, obj_tile);
    inst_tile.tile_index = tilePositions[i,j];
    inst_tile.tile_x_pos = j;
    inst_tile.tile_y_pos = i;
    //show_debug_message("i,j=k: " + string(i) + "," + string(j) + "="+ string(tilePositions[i,j]));
  }
  //show_debug_message("},");
}

