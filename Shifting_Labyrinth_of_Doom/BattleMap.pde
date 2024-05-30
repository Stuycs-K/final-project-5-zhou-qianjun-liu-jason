class BattleMap{
  PImage[][] Appearance;
  String[][] MiniMap;
  String[][] Combat;
  int[][] possibleMove;
  public int sizeOfSidebar = 400;
  public int sizePerSquare = 50;
  Enemy[] enemies;
  public BattleMap(){
    Appearance = new PImage[16][16];
    MiniMap = new String[][]{
      {null,null,"tru",null,null},
      {"etl","col","enu","cor",null},
      {null,"end","cou",null,null},
      {null,null,"cou",null,null},
      {null,null,"exnp",null,null}
      
      // need to add identifier likely based in string of ,Two-Letter Acronym + Direction, in order to map map more functional
      // direction is set to which way to enter so u is go up to get in room
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
      {null,null,null,null,null,null,null,null,null,null,null,null,"EC1",null,null,null},
      {null,null,null,null,null,null,null,null,null,null,"EC2",null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null}
    };
  }
  
  String[][] getCombat(){
    return Combat;
  }
  
  public void generateRoom(String type){
  }
  
  public void generateFloor(){
  }
  
  public void combatEncounter(int diff){
  }

  boolean swap(int x, int y){
    int updateableX = 0;
    int updateableY = 0;
    boolean found = false;
    for(int i = 0; i < Combat.length; i++){
      for(int k = 0; k < Combat[i].length; k++){
        if(Combat[i][k] != null && Combat[i][k].equals("PC")){
          updateableX = i;
          updateableY = k;
          found = true;
          break;
        }
      }
      if(found){
        break;
      }
    }
    if(possibleMove[x][y] == 1){
      if(Combat[x][y] != null && Combat[x][y].substring(0, 2).equals("EC")){
        return false;
      }
      Combat[updateableX][updateableY] = null;
      Combat[x][y] = "PC";
      return true;
    }
    else{
      return false;
    }
  }
  
  void displayCombat(){
    stroke(0,0,0);
    for(int i = 400; i < 1200; i += 50){
      for(int j = 0; j < 800; j += 50){
        if(Combat[(i-400)/50][j/50] != null){
          if(Combat[(i-400)/50][j/50].equals("PC")){
            fill(1,50,32);
            circle(i+25,j+25,25);
            noFill();
          }
          if(Combat[(i-400)/50][j/50].substring(0,2).equals("EC")){
            fill(255,127,127);
            circle(i+25,j+25,25);
            noFill();
          }
        }
      }
    }
  }
  
  void display(){
    stroke(0,0,0);
    for(int i = 400; i < 1200; i += 50){
      for(int j = 0; j < 800; j += 50){
        fill(255,255,255);
        square(i,j,50);
        noFill();
      }
    }
    fill(255,255,255);
    square(0, 400, 400);
    noFill();
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
        }else{
          a = a.substring(0,2);
          String b = MiniMap[i][j].substring(2,3);
          if(a.equals("et")){
            fill(0,191,255); 
          }
          if(a.equals("co")){
            fill(255,0,0);
          }
          if(a.equals("en")){
            fill(0,255,127);
          }
          if(a.equals("ex")){
            fill(0,191,255);
          }
          if(a.equals("tr")){
            fill(255,235,205);
          }
          square(j*80+10,i*80+10,60);
          fill(220,220,220);
          if(b.equals("u")){
            square(j*80+30,i*80+70,20);
          }
          if(b.equals("d")){
            square(j*80+30,i*80-10,20);
          }
          if(b.equals("l")){
            square(j*80+70,i*80+30,20);
          }
          if(b.equals("r")){
            square(j*80-10,i*80+30,20);
          }
          noFill();
          if(MiniMap[i][j].length() == 4){
            fill(17,26,98);
            circle(j*80+40,i*80+40,20);
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
    possibleMove = possibleMoves;
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
