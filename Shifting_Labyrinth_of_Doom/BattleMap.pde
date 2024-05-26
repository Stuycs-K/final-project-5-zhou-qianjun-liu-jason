class BattleMap{
  PImage[][] Appearance;
  String[][] MiniMap;
  String[][] Combat;
  public int sizeOfSidebar = 400;
  public int sizePerSquare = 50;
  
  public BattleMap(){
    Appearance = new PImage[16][16];
    MiniMap = new String[][]{
      {null,null,"tr",null,null},
      {"e","co","en",null,null},
      {null,"en","co",null,null},
      {null,null,"co",null,null},
      {null,null,"ex",null,null}
      
      // need to add identifier likely based in string of ,Two-Letter Acronym + Direction, in order to map map more functional
    };
    Combat = new String[][]{
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,"PC",null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,"EC",null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null}
    };
  }
  
  public void generateRoom(String type){
  }
  
  public void generateFloor(){
  }
  
  public void combatEncounter(int diff){
  }
  
  public void display(){
    stroke(0,0,0);
    for(int i = 400; i < 1200; i += 50){
      for(int j = 0; j < 800; j += 50){
        square(i,j,50);
        if(Combat[(i-400)/50][j/50] != null){
          if(Combat[(i-400)/50][j/50].equals("PC")){
            fill(1,50,32);
            circle(i+25,j+25,25);
            noFill();
          }
          if(Combat[(i-400)/50][j/50].equals("EC")){
            fill(255,127,127);
            circle(i+25,j+25,25);
            noFill();
          }
        }
      }
    }
    stroke(255,255,255);
    fill(0,0,0);
    square(0,0,400);
    noFill();
    noStroke();
    for(int i = 0; i < MiniMap.length; i++){
      for(int j = 0; j < MiniMap[i].length; j++){
        String a = MiniMap[i][j];
        stroke(255,255,255);
        if(a == null){
          fill(0,0,0);
          square(j*80+10,i*80+10,60);
          noFill();
        }else{
          if(a.equals("e")){
            fill(0,191,255);
            square(j*80+10,i*80+10,60);
            noFill();
          }
          if(a.equals("co")){
            fill(255,0,0);
            square(j*80+10,i*80+10,60);
            noFill();
          }
          if(a.equals("en")){
            fill(0,255,127);
            square(j*80+10,i*80+10,60);
            noFill();
          }
          if(a.equals("ex")){
            fill(0,191,255);
            square(j*80+10,i*80+10,60);
            noFill();
          }
          if(a.equals("tr")){
            fill(255,235,205);
            square(j*80+10,i*80+10,60);
            noFill();
          }
        }
        noStroke();
      }
    }
  }
  
  void displayMovement(int movement){  // a and b is x-cord y-cord of array beginning with 1
    stroke(0,0,0);
    int[][] possibleMoves = possiblemovement(Combat, movement);
    for(int i = 0; i < possibleMoves.length; i++){
      for(int k = 0; k < possibleMoves[i].length; k++){
        if(possibleMoves[i][k] == 1){
            fill(124,252,0);
            square(sizeOfSidebar + i * sizePerSquare, k * sizePerSquare, sizePerSquare);
            noFill();
          }
      }
    }
    noStroke();
  }
  
  int[][] possiblemovement(String[][] currentMap, int numMoves){
    int[][] returnable = new int[currentMap.length][currentMap[0].length];
    int x = 0;
    int y = 0;
    for(int i = 0; i < currentMap.length; i++){
      for(int k = 0; k < currentMap[i].length; k++){
        if(currentMap[i][k] != null && currentMap[i][k].equals("PC")){
          x = i;
          y = k;
          returnable[i][k] = 1;
        }
        else{
          returnable[i][k] = 0;
        }
      }
    }
    return recursiveMovement(returnable, x, y, numMoves); 
  }
  int[][] recursiveMovement(int[][] current, int x, int y, int numMoves){
    int[][] returnable = new int[current.length][current[0].length];
    for(int i = 0; i < current.length; i++){
      for(int k = 0; k < current[i].length; k++){
        if(Math.abs(i-x)+Math.abs(k-y) <= numMoves){
          returnable[i][k] = 1;
        }else{
          returnable[i][k] = 0;
        }
      }
    }
    return returnable;
  }
}
