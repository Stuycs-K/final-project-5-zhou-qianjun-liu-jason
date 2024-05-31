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
      {null,null,null,null,null,null,null,null,null,null,null,null,null,"EC3",null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,"PC",null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,"EC0",null,null,null},
      {null,null,null,null,null,null,null,null,null,null,"EC1",null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,"EC2",null,null,null,null,null,null,null,null,null,null,null},
      {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    };
    
    enemies = new Enemy[4];
    enemies[0] = new Goblin(0);
    enemies[1] = new Goblin(1);
    enemies[2] = new Goblin(2);
    enemies[3] = new Goblin(3);
  }
  
  String[][] getCombat(){
    return Combat;
  }
  
  Enemy[] getEnemy(){
    return enemies;
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
  
  void enemySwap(int num, int movement, int dist){
    int spotEnemies = 2;
    int[][] characters = new int[enemies.length+1][2];
    for(int i = 0; i < Combat.length; i++){
      for(int k = 0; k < Combat[i].length; k++){
        if(Combat[i][k] != null && Combat[i][k].equals("PC")){
          characters[1][0] = i;
          characters[1][1] = k;
        }
        if(Combat[i][k] != null && Combat[i][k].substring(0,2).equals("EC" )){
          if(Combat[i][k].equals("EC" + num)){
            characters[0][0] = i;
            characters[0][1] = k;
          }else{
            characters[spotEnemies][0] = i;
            characters[spotEnemies][1] = k;
            spotEnemies++;
          }
        }
      }
    }
    Combat[characters[0][0]][characters[0][1]] = null;
    while(movement != 0){
      boolean step = true;
      int randomized = (int)(Math.random()*4);
      boolean up = false;
      boolean down = false;
      boolean left = false;
      boolean right = false;
      while(step){
        if(randomized == 0){//up
          if(characters[1][1]-characters[0][1]<-(dist-1)){
            if(confirmation(characters, characters[0][0], characters[0][1]-1)){
              characters[0][1]-=1;
              step = false;
            }else{
              up = true;
            }
          }else{
            up = true;
          }
        }
        if(randomized == 1){// down
          if(characters[1][1]-characters[0][1]>dist-1){
            if(confirmation(characters, characters[0][0], characters[0][1]+1)){
              characters[0][1]+=1;
              step = false;
            }else{
              down = true;
            }
          }else{
            down = true;
          }
        }
        if(randomized == 2){//left
          if(characters[1][0]-characters[0][0]<dist-1){
            if(confirmation(characters, characters[0][0]-1, characters[0][1])){
              characters[0][0]-=1;
              step = false;
            }else{
              left = true;
            }
          }else{
            left = true;
          }
        }
        if(randomized == 3){//right
          if(characters[1][0]-characters[0][0]>-(dist-1)){
            if(confirmation(characters, characters[0][0]+1, characters[0][1])){
              characters[0][0]+=1;
              step = false;
            }else{
              right = true;
            }
          }else{
            right = true;
          }
        }
        if(up && down && left && right){
          step = false;
        }
        randomized = (randomized+1)%4;
      }
      movement--;
    }
    Combat[characters[0][0]][characters[0][1]] = "EC" + num;
  }
  
  boolean confirmation(int[][] list, int x, int y){
    for(int i = 1; i < list.length; i++){
      if(list[i][0] == x && list[i][1] == y){
        return false;
      }
    }
    return true;
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
            fill(0,0,0);
            textSize(20);
            text(Combat[(i-400)/50][j/50].substring(2,3),i+20,j+30);
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
