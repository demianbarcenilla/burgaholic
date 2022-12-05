instance_deactivate_all(true);
instance_activate_object(obj_control);
if(!instance_exists(obj_black)) instance_create_depth(0, 0, 0, obj_black);

var_input = true;