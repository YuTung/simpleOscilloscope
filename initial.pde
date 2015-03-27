void initialVariable(){
  maxVal = 0;
  timeStart = millis();
}

void imageInitial(){
  arrow_r_u = loadImage("arrowRup.png");
  arrow_r_d = loadImage("arrowRdown.png");
  arrow_r_l = loadImage("arrowRleft.png");
  arrow_r_r = loadImage("arrowRright.png");
  arrow_g_u = loadImage("arrowGup.png");
  arrow_g_d = loadImage("arrowGdown.png");
  arrow_g_l = loadImage("arrowGleft.png");
  arrow_g_r = loadImage("arrowGright.png");
  arrow_r_u.resize(20,20);
  arrow_g_u.resize(20,20);
  arrow_r_l.resize(20,20);
  arrow_g_l.resize(20,20);
  arrow_r_r.resize(20,20);
  arrow_g_r.resize(20,20);
  arrow_r_d.resize(20,20); 
  arrow_g_d.resize(20,20);


}
