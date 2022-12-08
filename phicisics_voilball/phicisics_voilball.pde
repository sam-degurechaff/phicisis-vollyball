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
int leftscore, rightscore, sp, vxb, vyb;
float setvelocity;
FBox leftplayer, leftground, rightground, Contact;
FCircle circle;
FBox lbox;

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

  //makeBottomPlatform();
  makeCircle();
  //createbodies();
  keypressed();
  keyreleased();
  handleplayerinput();
}
void makeWorld() {
  Fisica.init(this);
  world=new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}
void reset() {
}
void makeCircle() {
  circle = new FCircle(50);
  circle.setPosition(sp, -5);
  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);
  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);
  //add to world
  world.add(circle);
}
void makeBox() {
  FBox lbox = new FBox(25, 100);

  //image(img, 0, 0);
  //image(img, 0, 0, width/2, height/2);
  lbox.setPosition(vxb, vyb);
  //set visuals
  lbox.setStroke(0);
  lbox.setStrokeWeight(2);
  lbox.setFillColor(green);
  //set physical properties
  lbox.setDensity(0.2);
  lbox.setFriction(1);
  lbox.setRestitution(0.25);
  world.add(lbox);
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
void handleplayerinput() {
  float left_vx=leftplayer.getVelocityX();
  float left_vy=leftplayer.getVelocityY();
  if (upkey==true) {
    vxb=0;
  } else {
    vxb=20;
  }
  if (wkey) leftplayer.setVelocity(vxb, -1000);
}
void draw() {
  background(yellow);
  handleplayerinput();
  if (hitground(leftground)==true) {
    rightscore++;
    reset();
  }
  if (hitground(rightground)==true) {
    leftscore++;
    reset();
  }
}
boolean hitground(FBox ground) {
  ArrayList<FContact>contactlist=circle.getContacts();
  int i=0;
  while (i<contactlist.size()) {
    FContact myContact=contactlist.get(i);
    if (myContact.contains(ground))
      return true;
    i++;
  }
  return false;
}
