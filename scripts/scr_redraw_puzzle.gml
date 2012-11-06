///Redraw puzzle
var inst, x_start, y_start, tile_width, tile_height;
x_start = 32;
y_start = 32;
tile_width = 32;
tile_height = 32;
var i, j;

//change instance image indexes to match array of tilePositions
for (i=0; i<tile_count_y; i+=1){
  for (j=0; j<tile_count_x; j+=1){
      inst = instance_find(obj_tile, (i*tile_count_x)+j);
      inst.image_index = tilePositions[j,i];
  }
}

