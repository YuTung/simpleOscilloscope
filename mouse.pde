void mousePressed() {
  //arrow    
  if( mouseX>=710 && mouseX<=730 && mouseY >=120 && mouseY<=140 ){// up
    if(cursor)
      arrowU = true;
  }else if( mouseX>=655 && mouseX<=675 && mouseY >=150 && mouseY<=170 ){//left
    if(cursor)  
      arrowL = true;
  }else if( mouseX>=682 && mouseX<=702 && mouseY >=150 && mouseY<=170 ){//right
    if(cursor)  
      arrowR = true;
  }else if( mouseX>=710 && mouseX<=730 && mouseY >=150 && mouseY<=170 ){//down
    if(cursor)  
      arrowD = true;
  }
 /*
 rect(710,120,20,20);//block
  rect(655,150,20,20);//block
   rect(682,150,20,20);//block
   rect(710,150,20,20);//block
 */
 
  
}
void mouseReleased() {
  //arrow  
  // up
  if(arrowU){
    arrowU = false;
  }
  if(arrowD){
    arrowD = false;
  }
  if(arrowR){
    arrowR = false;
  }
  if(arrowL){
    arrowL = false;
  }

}
