{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_volcano20",
  "creationCodeFile": "rooms/rm_volcano20/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_41F20875","path":"rooms/rm_volcano20/rm_volcano20.yy",},
    {"name":"inst_3BDDF7A2","path":"rooms/rm_volcano20/rm_volcano20.yy",},
    {"name":"inst_BBEE54B","path":"rooms/rm_volcano20/rm_volcano20.yy",},
    {"name":"inst_7F20A11A","path":"rooms/rm_volcano20/rm_volcano20.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"HoneyTiles","depth":-100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":20,"TileCompressedData":[
-280,0,],"TileDataFormat":1,},"tilesetId":{"name":"tl_honey","path":"tilesets/tl_honey/tl_honey.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"SolidTiles","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":20,"TileCompressedData":[
-180,0,-7,13,1,14,-12,0,2,23,46,-4,23,2,47,24,-12,0,-5,23,
3,46,23,24,-12,0,-7,23,1,24,-12,0,-3,23,1,46,-3,23,1,24,
-9,0,3,12,13,13,],"TileDataFormat":1,},"tilesetId":{"name":"tl_volcano","path":"tilesets/tl_volcano/tl_volcano.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7F20A11A","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_checkpoint","path":"objects/obj_checkpoint/obj_checkpoint.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":48.0,"y":144.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Walls","depth":200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_41F20875","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_wall","path":"objects/obj_wall/obj_wall.yy",},"properties":[],"rotation":0.0,"scaleX":8.0,"scaleY":5.0,"x":0.0,"y":144.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3BDDF7A2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_wall","path":"objects/obj_wall/obj_wall.yy",},"properties":[],"rotation":0.0,"scaleX":3.0,"scaleY":1.0,"x":272.0,"y":208.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_BBEE54B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"en_Volcano","path":"objects/en_Volcano/en_Volcano.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":112.0,"y":144.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CoupledTiles","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":20,"TileCompressedData":[
-160,0,9,3,4,2,3,4,2,3,4,5,-19,0,1,15,-19,0,1,25,
-19,0,1,35,-19,0,1,15,-7,0,4,1,2,3,4,-8,0,1,25,-7,
0,1,11,-3,0,],"TileDataFormat":1,},"tilesetId":{"name":"tl_volcano","path":"tilesets/tl_volcano/tl_volcano.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"BackgroundTiles","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":14,"SerialiseWidth":20,"TileCompressedData":[
-206,0,-10,2,1,3,-11,0,-7,5,2,6,12,-11,0,-6,14,3,18,15,
12,-11,0,-4,14,5,9,14,14,15,12,-3,0,],"TileDataFormat":1,},"tilesetId":{"name":"tl_volcanoBG","path":"tilesets/tl_volcanoBG/tl_volcanoBG.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_FOREGROUND","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":500,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_volcanoFOREGROUND","path":"sprites/bg_volcanoFOREGROUND/bg_volcanoFOREGROUND.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_MIDDLE","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":600,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_volcanoMIDDLE","path":"sprites/bg_volcanoMIDDLE/bg_volcanoMIDDLE.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_BACKGROUND","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":700,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_volcanoBACKGROUND","path":"sprites/bg_volcanoBACKGROUND/bg_volcanoBACKGROUND.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"P_DEEPEST","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":800,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"bg_volcanoDEEPEST","path":"sprites/bg_volcanoDEEPEST/bg_volcanoDEEPEST.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Volcano",
    "path": "folders/Rooms/Volcano.yy",
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
    "Width": 320,
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