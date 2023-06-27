var_spd = lerp(var_spd, 0, .05);
image_index =  var_spd *sign(var_spd) > .5 ? 1 : 0

collisionBasic()