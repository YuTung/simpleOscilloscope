int[] readPort = new int[5];
float value = 0.0;
float[] val = new float[400];
boolean finishRead = false; 

void mySerialRead(){
  while(port.available()>0){
    readPort[0] = port.read();
    readPort[1] = port.read();
    readPort[2] = port.read();
    readPort[3] = port.read();
    readPort[4] = port.read();
    
    if( readPort[0] == 255 && readPort[1] == 2 && readPort[4] == 254 ){
      value = readPort[2]*256+readPort[3];
      finishRead = true;
    }
    //print(value+"\n");
  }
  
}
