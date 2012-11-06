///Set tile visibility

var i, inst_tile;
global.tiles_visible = argument[0];
for (i=0; i<instance_number(obj_tile); i+=1){
  inst_tile = instance_find(obj_tile,i);
  inst_tile.visible = global.tiles_visible;
}

