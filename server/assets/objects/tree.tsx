<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.8" tiledversion="1.8.2" name="tree" tilewidth="64" tileheight="64" tilecount="10" columns="4" objectalignment="bottom">
 <tileoffset x="0" y="16"/>
 <image source="tree.png" width="256" height="128"/>
 <tile id="0">
  <objectgroup draworder="index" id="2">
   <object id="2" x="32" y="64">
    <polygon points="0,0 32,-16 0,-32 -32,-16"/>
   </object>
  </objectgroup>
  <animation>
   <frame tileid="0" duration="160"/>
   <frame tileid="1" duration="160"/>
   <frame tileid="2" duration="160"/>
   <frame tileid="3" duration="160"/>
   <frame tileid="2" duration="160"/>
   <frame tileid="1" duration="160"/>
  </animation>
 </tile>
 <tile id="4">
  <objectgroup draworder="index" id="2">
   <object id="1" x="32" y="64">
    <polygon points="0,0 32,-16 0,-32 -32,-16"/>
   </object>
  </objectgroup>
  <animation>
   <frame tileid="4" duration="160"/>
   <frame tileid="5" duration="160"/>
   <frame tileid="6" duration="160"/>
   <frame tileid="7" duration="160"/>
   <frame tileid="6" duration="160"/>
   <frame tileid="5" duration="160"/>
  </animation>
 </tile>
</tileset>
