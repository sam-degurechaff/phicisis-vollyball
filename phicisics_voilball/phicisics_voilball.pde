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
FBox leftplayer, leftground, rightground, rightplayer, Contact;
FCircle circle;


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
  makeBox();
  makeBoxr();
  makeBottomPlatform();

  //createbodies();
}
void makeWorld() {
  Fisica.init(this);
  world=new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}
void reset() {
}
void makeBottomPlatform() {
  FPoly p = new FPoly();
  //plot the vertices of this platform
  p.vertex(width, height*0.8);
  p.vertex(width/2-100, height*.8);
  p.vertex(width/2-100, height*.4);
  p.vertex(width/2+100, height*.4);
  p.vertex(width/2+100, height*.8);
  p.vertex(0, height*0.8);
  p.vertex(0, height*0.8+100);
  p.vertex(width, height*0.8+100);
  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0);
  //put it in the world
  world.add(p);
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
  leftplayer = new FBox(25, 100);

  //image(img, 0, 0);
  //image(img, 0, 0, width/2, height/2);
  leftplayer.setPosition(100, 400);
  //set visuals
  leftplayer.setStroke(0);
  leftplayer.setStrokeWeight(2);
  leftplayer.setFillColor(green);
  //set physical properties
  leftplayer.setDensity(0.2);
  leftplayer.setFriction(1);
  leftplayer.setRestitution(0.25);
  world.add(leftplayer);
}
void makeBoxr() {
  rightplayer = new FBox(25, 100);

  //image(img, 0, 0);
  //image(img, 0, 0, width/2, height/2);
  rightplayer.setPosition(100, 400);
  //set visuals
  rightplayer.setStroke(0);
  rightplayer.setStrokeWeight(2);
  rightplayer.setFillColor(green);
  //set physical properties
  rightplayer.setDensity(0.2);
  rightplayer.setFriction(1);
  rightplayer.setRestitution(0.25);
  world.add(rightplayer);
}
void keyPressed() {
  if (key=='w'||key=='W')wkey=true;
  if (key=='a'||key=='A')akey=true;
  if (key=='s'||key=='S')skey=true;
  if (key=='d'||key=='D')dkey=true;
  if (keyCode==UP)upkey=true;
  if (keyCode==DOWN)downkey=true;
  if (keyCode==LEFT)leftkey=true;
  if (keyCode==RIGHT)rightkey=true;
}
void keyReleased() {
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

  if (wkey) leftplayer.setVelocity(left_vx, -1000);
  if (akey) leftplayer.setVelocity(-1000, left_vy);
  if (dkey) leftplayer.setVelocity(1000, left_vy);
  float right_vx=rightplayer.getVelocityX();
  float right_vy=rightplayer.getVelocityY();
  if (upkey) leftplayer.setVelocity(right_vx, -1000);
  if (leftkey) leftplayer.setVelocity(-1000, right_vy);
  if (rightkey) leftplayer.setVelocity(1000, right_vy);
}
void draw() {
  background(yellow);
  handleplayerinput();
  if (hitground(leftground)==true) {
    rightscore++;
    reset();
    sp=200;
  }
  if (hitground(rightground)==true) {
    leftscore++;
    reset();
    sp=800;
  }

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
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
