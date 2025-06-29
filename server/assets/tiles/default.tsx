<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.8" tiledversion="1.8.0" name="Stairs - Default" tilewidth="64" tileheight="56" tilecount="3" columns="3">
 <tileoffset x="0" y="8"/>
 <image source="default.png" width="192" height="56"/>
 <tile id="0" type="Stairs">
  <properties>
   <property name="Direction" value="Up Left"/>
  </properties>
 </tile>
 <tile id="1" type="Stairs">
  <properties>
   <property name="Direction" value="Up Left"/>
  </properties>
 </tile>
 <tile id="2">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="16" width="58" height="35"/>
  </objectgroup>
 </tile>
</tileset>
