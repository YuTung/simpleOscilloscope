//0407test
import processing.serial.*;
import controlP5.*;

Serial port; // The serial port object

ControlP5 cp5;
Button button_runStop,button_clear,button_exit;
Button button_cursor,button_channel;
Button button_lineNum;
boolean cursor = false;
//Button button_aRu;
int lineNumber = 1;

Button button_saveFrame;

DropdownList dropDownList_comPort;
String[] listPort = new String[3];
boolean portSelect = false;
int portNumber = 0;

PImage arrow_r_u,arrow_r_d,arrow_r_l,arrow_r_r;
PImage arrow_g_u,arrow_g_d,arrow_g_l,arrow_g_r;
boolean arrowU = false , arrowD = false , arrowL = false , arrowR = false;

void setup() {
  //println(port.list());
  //port = new Serial(this, Serial.list()[0], 115200); //must connected in my laptop:0
 
  size(750,350); 
  smooth();
  frame.setTitle("simple oscilloscope");
  
  cp5 = new ControlP5(this);
  controlp5Init();
  
  for(int i = 0 ; i < 400; i ++){
    val[i] = 0;
  }
  
  imageInitial();
  initialVariable();
}

void draw() {
  background(0); 
  
  plotBackground();  
  plotArrow();    
  plotText();
    
  if(portSelect){  
    mySerialRead();     
    plotCurve();   
  }
  
  plotActualtime();
  
}

