///Delete existing tile sprites

var i;
var inst_tile;

for (i=0; i<instance_number(obj_tile); i+=1){
  inst_tile = instance_find(obj_tile,i);
  if(inst_tile.sprite_index != spr_blanktile)
  {
    if(sprite_exists(inst_tile.sprite_index)){sprite_delete(inst_tile.sprite_index);}
  }
}
