//http://www.rapidtables.com/web/color/RGB_Color.htm

float maxVal = 0.0,minVal = 0.0;
int cursor_1_v = 0,cursor_1_h = 0 , cursor_2_v = 0,cursor_2_h = 0;
float cursorDeltaH = 0.0;

int timeStart = 0,timeEnd = 0;
int filterTime = 0;
boolean timeChange = false;

int day , month , year;
int min , sec  ,hr;

void plotBackground(){
  //frame
  noFill();  stroke(151,255,255);  rect(0,0,450,300);//block for value
  noFill();  stroke(151,255,255);  rect(450,0,20,300);//block for label number
  
  //label
  for(int i = -5 ; i <= 5 ; i ++ ){
    textSize(13);  fill(255);   text(-i,453,150+i*25.6);
  }
  textSize(11);  fill(255);   text("(V)",453,297);
  
  //grid 
  stroke(250);             
  line(0,150,450,150);
  stroke(100);
  for(int i = 1  ; i < 6 ; i++ ){ 
    line(0,150+i*25.6,450,150+i*25.6);
    line(0,150-i*25.6,450,150-i*25.6);
  }
  
}

void plotCurve(){

  val[val.length-1] = value/8.192;
  maxVal = max(maxVal,value/8.192/25.6);//get max value  
  minVal = min(minVal,value/8.192/25.6);//get min value
  
  if(clear){
    clear = false;
    for(int i = 0 ; i < 400; i ++){     val[i] = 0;      }
  }  
  noFill();
  stroke(255,255,0);
  beginShape();
    for(int i = 0; i<val.length;i++)
      vertex(i,-val[i]+150);
  endShape();
  if(!runORstop){  
      for(int i = 1; i<val.length;i++)
        val[i-1] = val[i];
  }
  
}

void plotCursor(){
  if(lineNumber==1){
    if(arrowU){  cursor_1_h--;      }
    if(arrowL){  cursor_1_v--;      }
    if(arrowR){  cursor_1_v++;      }
    if(arrowD){  cursor_1_h++;      }
    
    //set limit
    if(cursor_1_h>150)    cursor_1_h =150;
    else if(cursor_1_h<-150) cursor_1_h=-150;
    if(cursor_1_v>225)    cursor_1_v =225;
    else if(cursor_1_v<-225) cursor_1_v=-225;
  }else{
    if(arrowU){  cursor_2_h--;      }
    if(arrowL){  cursor_2_v--;      }
    if(arrowR){  cursor_2_v++;      }
    if(arrowD){  cursor_2_h++;      }
    
    //set limit
    if(cursor_2_h>150)    cursor_2_h =150;
    else if(cursor_1_h<-150) cursor_2_h=-150;
    if(cursor_2_v>225)    cursor_2_v =225;
    else if(cursor_2_v<-225) cursor_2_v=-225;
  }
  
  stroke(255,0,0);  line(0,150+cursor_1_h,450,150+cursor_1_h);//horizon
  stroke(255,0,0);  line(225+cursor_1_v,0,225+cursor_1_v,300);//vertical
 
  stroke(204,0,204);  line(0,150+cursor_2_h,450,150+cursor_2_h);//horizon
  stroke(204,0,204);  line(225+cursor_2_v,0,225+cursor_2_v,300);//vertical  
  
  cursorDeltaH = abs(cursor_1_h-cursor_2_h)/25.6;
}
void plotArrow(){
  fill(255);  noStroke();  rect(710,120,20,20);//block
  fill(255);  noStroke();  rect(655,150,20,20);//block
  fill(255);  noStroke();  rect(682,150,20,20);//block
  fill(255);  noStroke();  rect(710,150,20,20);//block
  if(!arrowU){    image(arrow_r_u,710,120);    }else{    image(arrow_g_u,710,120);    }
  if(!arrowL){    image(arrow_r_l,655,150);    }else{    image(arrow_g_l,655,150);    }
  if(!arrowR){    image(arrow_r_r,682,150);    }else{    image(arrow_g_r,682,150);    }
  if(!arrowD){    image(arrow_r_d,710,150);    }else{    image(arrow_g_d,710,150);    }
  if(cursor){
    plotCursor();
  }
}



void plotText(){
  stroke(151,255,255);  line(470,20,620,20);
  
  //text on the left
  noFill();      stroke(151,255,255);  rect(470,0,75,300);//block
  textSize(15);  fill(151,255,255);    text("   BASIC",475,15);
  textSize(14);  fill(255);            text("posWidth",475,35);
  textSize(14);  fill(255,255,0);          text("(ms)",515,55);
  
  textSize(14);  fill(255);            text("negWidth",475,75);
  textSize(14);  fill(255,255,0);          text("(ms)",515,95);
  
  textSize(14);  fill(255);            text("frequency",475,115);
  textSize(14);  fill(255,255,0);          text("(Hz)",515,135);
  
  textSize(14);  fill(255);            text("maxValue",475,155);
  textSize(14);  fill(255,255,0);      text(maxVal,480,175);            text("(v)",527,175);
  
  textSize(14);  fill(255);            text("curValue",475,195);
  textSize(14);  fill(255,255,0);      text(value/8.192/25.6,480,215);  text("(v)",527,215);
  
  textSize(14);  fill(255);            text("peak2peak",472,235);
  textSize(14);  fill(255,255,0);      text(abs(maxVal-minVal),480,255);  text("(v)",527,255);  
  
  textSize(14);  fill(255);            text("dutyCycle",475,275);
  textSize(14);  fill(255,255,0);          text("(%)",525,295);
  
  
  //text on the right
  noFill();      stroke(151,255,255);  rect(545,0,75,300);//block
  textSize(15);  fill(151,255,255);    text("MEASURE",550,15);
  
  textSize(14);  fill(255);            text("deltaTime",550,35);
  textSize(14);  fill(255,255,0);          text("(ms)",590,55);
  if(timeChange){
    timeEnd = millis();    
    timeChange = false;  
  }
  if(cursor){
    textSize(14);  fill(255,255,0);          text(abs(cursor_2_v - cursor_1_v)*(timeEnd - timeStart),550,55);   
  }
  filterTime++;
  if(filterTime>=30){
    filterTime = 0;
    timeStart = millis();  
    timeChange = true;  
  }
  textSize(14);  fill(255);            text("deltaVol",550,75);
  if(cursor){
    textSize(14);  fill(255,255,0);          text(cursorDeltaH,555,95);
  }
  textSize(14);  fill(255,255,0);          text("(v)",604,95);
  
  //text below
  fill(255,255,0); noStroke();         rect(3,305,35,15);
  textSize(13);  fill(0);              text("CH 1",5,316);
}

void plotActualtime(){
  day = day() ;   month = month();   year = year();
  min = minute(); sec = second() ;   hr  = hour();
  
  textSize(18);  fill(255);
  text(year+"/",640,15);
  if(month<10)  text("0"+month+"/",695,15);
    else        text(month+"/",695,15);
  if(day<10)  text("0"+day,726,15);
    else        text(day,726,15);
  textSize(18);  fill(255);  
  if(hr<10) text("0"+hr+":",648,35);
   else     text(hr+":",648,35);
  if(min<10)text("0"+min+":",683,35);
   else     text(min+":",683,35);
  if(sec<10)text("0"+sec,718,35);
   else     text(sec,718,35);
  stroke(255); line(645,40,745,40); //line(495,50,500,50);
}
