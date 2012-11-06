///Reset tile positions to solved state

var i, j;
var inst_tile;

// create and initialize tile array and tile object instances
for (i=0; i<global.tile_count_y; i+=1){
  for (j=0; j<global.tile_count_x; j+=1){
      global.tilePositions[i,j] = global.solvedPositions[i,j];
      inst_tile = instance_find(obj_tile,solvedPositions[i,j]);
      inst_tile.tile_index = global.tilePositions[i,j];
      inst_tile.tile_x_pos = j;
      inst_tile.tile_y_pos = i;
      inst_tile.x = ((j*global.tile_width)+global.x_pos_origin);
      inst_tile.y = ((i*global.tile_height)+global.y_pos_origin);
  }
}

global.empty_x = 0;
global.empty_y = 0

