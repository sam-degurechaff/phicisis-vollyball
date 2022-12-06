//https://youtube.com/playlist?list=PL__Tph-7Dyp0d4_iUA_RBb5AwsRJxJv2u
import fisica.*;
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
//keyboard
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
FWorld world ;
boolean leftplayer;
void setup() {
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //make window
  fullScreen();

  //load resources

  //initialize world
  makeWorld();
  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
  createworld();
  createbodies();
  keypressed();
  keyreleased();
  handleplayerinput();
}
void createworld() {
  Fisica.init(this);
  world=new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}
void keypressed() {
  if (key=='w'||key=='W')wkey=true;
  if (key=='a'||key=='A')akey=true;
  if (key=='s'||key=='S')skey=true;
  if (key=='d'||key=='D')dkey=true;
  if (keyCode==UP)upkey=true;
  if (keyCode==DOWN)downkey=true;
  if (keyCode==LEFT)leftkey=true;
  if (keyCode==RIGHT)rightkey=true;
}
void keyreleased() {
  if (key=='w'||key=='W')wkey=false;
  if (key=='a'||key=='A')akey=false;
  if (key=='s'||key=='S')skey=false;
  if (key=='d'||key=='D')dkey=false;
  if (keyCode==UP)upkey=false;
  if (keyCode==DOWN)downkey=false;
  if (keyCode==LEFT)leftkey=false;
  if (keyCode==RIGHT)rightkey=false;
}
void handleplaterinput() {
  float left_vx=leftPlayer.getvelocityX();
  float left_vy=leftPlayer.getvelocityy();
  leftplayer.setvelocity(100, 0);
}
