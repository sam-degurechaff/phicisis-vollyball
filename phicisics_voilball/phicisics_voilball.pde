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
FBox leftplayer, rightplayer, Contact;
FPoly leftground, rightground;
FCircle circle;
int cx;

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
  makenet();
  makeBottomPlatformright();

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
  leftground = new FPoly();
  //plot the vertices of this platform
  leftground.vertex(width/2, height*0.8);
  leftground.vertex(0, height*0.8);
  leftground.vertex(0, height*0.8+100);
  leftground.vertex(width/2, height*0.8+100);
  // define properties
  leftground.setStatic(true);
  leftground.setFillColor(brown);
  leftground.setFriction(0);
  //put it in the world
  world.add(leftground);
}
void makeBottomPlatformright() {
  rightground = new FPoly();
  //plot the vertices of this platform
  rightground.vertex(width/2+800, height*0.8);
  rightground.vertex(width/2, height*0.8);
  rightground.vertex(width/2, height*0.8+100);
  rightground.vertex(width/2+800, height*0.8+100);
  // define properties
  rightground.setStatic(true);
  rightground.setFillColor(brown);
  rightground.setFriction(0);
  //put it in the world
  world.add(rightground);
}
void makenet() {
  FPoly p = new FPoly();
  //plot the vertices of this platform
  p.vertex(width/2-10, height*0.6);
  p.vertex(width/2-10, height*0.8);
  p.vertex(width/2+10, height*0.8);
  p.vertex(width/2+10, height*0.6);
  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0);
  //put it in the world
  world.add(p);
}
void makeCircle() {
  circle = new FCircle(50);
  circle.setPosition(300, -5);
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
  rightplayer.setPosition(600, 400);
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
  if (upkey) rightplayer.setVelocity(right_vx, -1000);
  if (leftkey) rightplayer.setVelocity(-1000, right_vy);
  if (rightkey) rightplayer.setVelocity(1000, right_vy);
  //float circle_px=circle.getX();
  //float circle_py=circle.getY();
  //if(circle.x>width)circle.setposition(width-1,circle_py);
  //if(circle.x<width)sp=1;
  //if(circle.y>height) syp=height-1;
  //if(circle.y<height) syp=1;
}
void draw() {
  background(yellow);
  handleplayerinput();
  int leftscore=0;
  int rightscore=0;
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
  

  text("leftscore", 300, 200);
  text("rightscore", 700, 200);
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}
boolean hitground(FPoly ground) {
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
