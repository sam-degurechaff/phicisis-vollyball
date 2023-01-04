void gameOver2() {
  rectMode(CENTER);
  rect(width/2, height/2, 200, 100);
  leftscore=0;
  rightscore=0;
  rightplayer.setPosition(900, 400);
  leftplayer.setPosition(100, 400);
  circle.setPosition(width/2, -5);circle = new FCircle(50);
  text("left victory", width/2, 100);
  if (mousePressed&&mouseX>width/2-100&&mouseX<width/2+100&&mouseY>height/2-50&&mouseY<height/2+50) {
    mode=PLAY;
  }
}
