void play() {


  background(yellow);
  handleplayerinput();

  if (hitground(leftground)==true) {
    rightscore++;
    reset();
    sp=200;
    rightplayer.setPosition(900, 400);
    if (rightscore==1)mode=GAMEOVER1;
  }
  if (hitground(rightground)==true) {
    leftscore++;
    reset();
    sp=800;
    leftplayer.setPosition(100, 400);
    if (leftscore==10)mode=GAMEOVER2;
  }

  textSize(30);
  text("leftscore", 300, 200);
  text(leftscore, 380, 200);
  text("rightscore", 700, 200);
  text(rightscore, 780, 200);
  world.step();  //get box2D to calculate all the forces and new positions

  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}
//boolean hitground(FPoly ground) {
//  ArrayList<FContact>contactlist=circle.getContacts();
//  int i=0;
//  while (i<contactlist.size()) {
//    FContact myContact=contactlist.get(i);
//    if (myContact.contains(ground))
//      return true;
//    i++;
//  }
//  return false;
//}
