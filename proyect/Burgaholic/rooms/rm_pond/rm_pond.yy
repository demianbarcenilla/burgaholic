{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_pond",
  "creationCodeFile": "${project_dir}/rooms/rm_pond/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_7251996C_2_1_1_1_1","path":"rooms/rm_pond/rm_pond.yy",},
    {"name":"inst_8E74D25","path":"rooms/rm_pond/rm_pond.yy",},
    {"name":"inst_5240E268","path":"rooms/rm_pond/rm_pond.yy",},
    {"name":"inst_39EE0DFC","path":"rooms/rm_pond/rm_pond.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tube","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":40,"TileCompressedData":[
3,-2147483648,1,2,-38,-2147483648,2,1,2,-38,-2147483648,2,1,2,-38,-2147483648,2,1,2,-38,-2147483648,2,1,2,-38,-2147483648,2,4,5,-38,-2147483648,-2,0,-38,-2147483648,-2,0,-277,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tl_tube","path":"tilesets/tl_tube/tl_tube.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"HoneyTiles","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":40,"TileCompressedData":[
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tl_honey","path":"tilesets/tl_honey/tl_honey.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"SolidTiles","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":40,"TileCompressedData":[
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-11,13,1,14,-4,0,2,11,12,-22,13,],"TileDataFormat":1,},"tilesetId":{"name":"tl_pond","path":"tilesets/tl_pond/tl_pond.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":300,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_8E74D25","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_tube","path":"objects/obj_tube/obj_tube.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":0.5,"x":16.0,"y":192.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5240E268","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_checkpoint","path":"objects/obj_checkpoint/obj_checkpoint.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":208.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Walls","depth":400,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7251996C_2_1_1_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_wall","path":"objects/obj_wall/obj_wall.yy",},"properties":[],"rotation":0.0,"scaleX":12.0,"scaleY":1.0,"x":0.0,"y":208.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_39EE0DFC","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_wall","path":"objects/obj_wall/obj_wall.yy",},"properties":[],"rotation":0.0,"scaleX":23.0,"scaleY":1.0,"x":272.0,"y":208.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CoupledTiles","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":40,"TileCompressedData":[
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,
-20,0,-20,-2147483648,-20,0,-20,-2147483648,13,3,4,3,4,2,4,3,4,3,2,3,4,5,-3,0,24,1,2,3,4,2,3,4,2,3,4,2,3,4,2,3,
4,2,3,4,2,3,4,2,3,-12,0,1,25,-7,0,-20,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tl_pond","path":"tilesets/tl_pond/tl_pond.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"BackgroundTiles","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":40,"TileCompressedData":[
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,
-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,-20,0,-20,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tl_forestBG","path":"tilesets/tl_forestBG/tl_forestBG.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_FOREGROUND","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":700,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_pondFOREGROUND","path":"sprites/bg_pondFOREGROUND/bg_pondFOREGROUND.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_MIDDLE","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":800,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_pondMIDDLE","path":"sprites/bg_pondMIDDLE/bg_pondMIDDLE.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_BACKGROUND","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":900,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_pondBACKGROUND","path":"sprites/bg_pondBACKGROUND/bg_pondBACKGROUND.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_DEEPEST","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":1000,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_pondDEEPEST","path":"sprites/bg_pondDEEPEST/bg_pondDEEPEST.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Pond",
    "path": "folders/Rooms/Pond.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 224,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 640,
  },
  "sequenceId": null,
  "views": [
    {"hborder":160,"hport":224,"hspeed":-1,"hview":224,"inherit":false,"objectId":null,"vborder":112,"visible":true,"vspeed":-1,"wport":320,"wview":320,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}