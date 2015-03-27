//http://www.sojamo.de/libraries/controlP5/examples/controllers/ControlP5button/ControlP5button.pde

boolean runORstop = false; //false = run ; true = stop
boolean clear = false;

void controlp5Init() {
  PFont p = createFont("Times",12); 
  cp5.setControlFont(p);
  
  button_exit = cp5.addButton("EXIT", 1, 648, 45, 95, 15).setColorBackground(color(250,0,0)).setCaptionLabel("         EXIT");
  button_runStop = cp5.addButton("r_s", 1, 5, 282, 48, 15).setColorBackground(color(200,200,0)).setCaptionLabel(" STOP").setColorCaptionLabel(color(250,0,0));
  button_clear = cp5.addButton("CLEAR", 1, 60, 282, 48, 15).setColorBackground(color(0,204,0)).setColorCaptionLabel(color(0,0,250));
  
  button_cursor = cp5.addButton("CURSOR", 1, 648, 100, 95, 15).setColorBackground(color(76,153,0)).setColorCaptionLabel(color(0,255,255)).setCaptionLabel("     CURSOR");
  
  button_channel = cp5.addButton("CHANNEL", 1, 650, 120, 30, 20).setColorBackground(color(255,255,0)).setColorCaptionLabel(0).setCaptionLabel("CH1");
  button_lineNum = cp5.addButton("lineNum", 1, 685, 120, 20, 20).setColorBackground(color(255,0,0)).setColorCaptionLabel(255).setCaptionLabel(" 1");
  
  listPort = port.list();
  dropDownList_comPort = cp5.addDropdownList("comPort",648,80,95,15).setBarHeight(15).toUpperCase(false);
  for(int i = 0 ; i < listPort.length ; i ++ ){
    dropDownList_comPort.addItem(listPort[i],i+1); 
  }
  
  button_saveFrame = cp5.addButton("saveFrame", 1, 365, 282, 80, 15).setColorBackground(color(255,0,255));
  
}
 
void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) {     
    if(theEvent.controller().name()=="r_s") {
      if(!runORstop){
        runORstop = true;
        button_runStop.setCaptionLabel("  RUN").setColorBackground(color(200,0,200)).setColorCaptionLabel(color(250,250,0));
      }else{
        runORstop=false;
        button_runStop.setCaptionLabel(" STOP").setColorBackground(color(200,200,0)).setColorCaptionLabel(color(250,0,0));
      }
    }
    if(theEvent.controller().name()=="CLEAR") {
      clear = true;
    }
    if(theEvent.controller().name()=="EXIT") {
      exit();
    }  
  
    if(theEvent.controller().name()=="CURSOR") {
      if(!cursor){      cursor = true;    button_cursor.setColorBackground(color(0,0,153));
      }else{             cursor = false;  button_cursor.setColorBackground(color(76,153,0));
      }
    }  
    if(theEvent.controller().name()=="lineNum") {      
      if(lineNumber==1){
          button_lineNum.setCaptionLabel(" 2").setColorBackground(color(204,0,204));
      }else{
          button_lineNum.setCaptionLabel(" 1").setColorBackground(color(255,0,0));
      }
      lineNumber++;
      lineNumber = lineNumber%2;
    }     
    if(theEvent.controller().name()=="saveFrame") {
      if(month<10){
        //saveFrame("capture/test"+"_0"+month+day+".png");
      }else{
        //saveFrame("capture/test"+"_"+month+day+".png");
      }
    } 
    
    
  }else if(theEvent.isGroup()){//if controller
    if (theEvent.group().name() == "comPort") {
      portNumber = int(theEvent.group().value());
      portSelect = true;
      dropDownList_comPort.disableCollapse();
      port = new Serial(this, Serial.list()[portNumber-1], 115200);
    }
  
  }
  
 
  
}
