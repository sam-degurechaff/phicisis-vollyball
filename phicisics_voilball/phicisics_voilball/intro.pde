void intro() {
  rectMode(CENTER);
  rect(width, height, 0, 0);
  rect(width/2, height/2, 200, 100);
  if (mousePressed&&mouseX>width/2-100&&mouseX<width/2+100&&mouseY>height/2-50&&mouseY<height/2+50) {
    mode=PLAY;
  }
}
