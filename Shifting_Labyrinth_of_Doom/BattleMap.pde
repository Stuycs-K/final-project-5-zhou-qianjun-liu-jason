class BattleMap{
  PImage[][] Appearance;
  String[][] MiniMap;
  String[][] Combat;
  int[][] possibleMove;
  public int sizeOfSidebar = 400;
  public int sizePerSquare = 50;
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  PlayerCharacter store;
  PImage[] textures;
  PImage[][] texturesMap;
  public BattleMap(PlayerCharacter a, PImage[] textures){
    store = a;
    Appearance = new PImage[16][16];
    //MiniMap = new String[][]{
    //  {null,null,"tru",null,null},
    //  {"etl","col","enu","cor",null},
    //  {null,"end","cou",null,null},
    //  {null,null,"cou",null,null},
    //  {null,null,"exnp",null,null}
      
    //  // need to add identifier likely based in string of ,Two-Letter Acronym + Direction, in order to map map more functional
    //  // direction is set to which way to enter so u is go up to get in room
    //};
    //Combat = new String[][]{
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,"EC3",null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,"PC",null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,"EC0",null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,"EC1",null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,"EC2",null,null,null,null,null,null,null,null,null,null,null},
    //  {null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null},
    //};
    ////enemies.add(new Goblin(0));
    //enemies.add(new Dartgoblin(0));
    ////enemies.add(new Bomber(2));
    
    this.textures = textures;
  }
  
  PlayerCharacter getPlayerCharacter(){
    return store;
  }
  
  String[][] getCombat(){
    return Combat;
  }
  
  ArrayList<Enemy> getEnemy(){
    return enemies;
  }
  
  public void generateRoom(String type, int floor, int diff){
    enemies = new ArrayList<Enemy>();
    if(type.substring(0,2).equals("co")){
      combatEncounter(diff, type.charAt(2), floor);
    }
    if(type.substring(0,2).equals("en")){
      encounterRoom();
    }
    if(type.substring(0,2).equals("tr")){
      trainingRoom();
    }
    if(type.substring(0,2).equals("et")){
      enterenceRoom();
    }
    if(type.substring(0,2).equals("ex")){
      exitRoom();
    }
    texturesMap = new PImage[16][16];
    for(int i = 0; i < texturesMap.length; i++){
      for(int k = 0; k < texturesMap[i].length; k++){
        int random = (int)(Math.random()*13);
        if(floor == 2){
          random += 16;
        }
        if(floor == 3){
          random += 32;
        }
        texturesMap[i][k] = textures[(int)(random)];
      }
    }
    if(type.substring(0,2).equals("ex")){
      texturesMap[7][9] = textures[50];
      texturesMap[8][9] = textures[50];
      texturesMap[9][9] = textures[50];
      texturesMap[7][10] = textures[50];
      texturesMap[8][10] = textures[51];
      texturesMap[9][10] = textures[50];
      texturesMap[7][11] = textures[50];
      texturesMap[8][11] = textures[50];
      texturesMap[9][11] = textures[50];
    }
  }
  
  void enterenceRoom(){
    Combat = new String[][]{
      {null, null, null, null, null, null, null, "PC", null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
    };
  }
  
  boolean enterenceExitArrive(){
    if(CurrentMapType().equals("et")){
      for(int i = 0; i < 15; i++){
        if(Combat[15][i] != null && Combat[15][i].equals("PC")){
          return true;
        }
      }
    }
    return false;
  }
  void trainingRoom(){
    Combat = new String[][]{
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, "PC", null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
    };
  }
  
  void encounterRoom(){
    Combat = new String[][]{
      {null, null, null, null, null, null, null, "PC", null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, "EC0", null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
    };
    enemies.add(new HealerTurrent(0));
  }
  
  boolean enounterRoomLeave(){
    if(CurrentMapType().equals("en")){
      for(int i = 0; i < 15; i++){
        if(Combat[15][i] != null && Combat[15][i].equals("PC")){
          return true;
        }
      }
    }
    return false;
  }
  
  void exitRoom(){
    Combat = new String[][]{
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, "PC", null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
      {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null},
    };
  }
  
  boolean leaveFloor(){
    if(CurrentMapType().equals("ex")){
      if(Combat[7][9] != null && Combat[7][9].equals("PC")){
        return true;
      }
      if(Combat[8][9] != null && Combat[8][9].equals("PC")){
        return true;
      }
      if(Combat[9][9] != null && Combat[9][9].equals("PC")){
        return true;
      }
      if(Combat[7][10] != null && Combat[7][10].equals("PC")){
        return true;
      }
      if(Combat[8][10] != null && Combat[8][10].equals("PC")){
        return true;
      }
      if(Combat[9][10] != null && Combat[9][10].equals("PC")){
        return true;
      }
      if(Combat[7][11] != null && Combat[7][11].equals("PC")){
        return true;
      }
      if(Combat[8][11] != null && Combat[8][11].equals("PC")){
        return true;
      }
      if(Combat[9][11] != null && Combat[9][11].equals("PC")){
        return true;
      }
    }
    return false;
  }
  
  public void generateFloor(){
    int start = (int)(Math.random()*3)+1;
    int end = (int)(Math.random()*3)+1;
    int x = start;
    int y = 0;
    boolean needsTraining = true;
    boolean needsEncounter = true;
    int rmNumber = 0;
    MiniMap = new String[5][5];
    MiniMap[x][y] = "etnp";
    String addition = "n";
    while(!(x == end && y == 4)){
      boolean step = true;
      int randomized = (int)(Math.random()*4);
      boolean up = false;
      boolean down = false;
      boolean left = false;
      boolean right = false;
      while(step){
        if(randomized == 0){//up
          if(Math.abs(Math.abs(4-y)+Math.abs(end-x))>Math.abs(Math.abs(4-y)+Math.abs(end-(x-1)))){
            if(x-1>=0&&MiniMap[x-1][y]==null){
              x -= 1;
              addition = "u";
              step = false;
            }else{
              up = true;
            }
          }else{
            if(Math.random()>.4&&y!=4){
              if(x-1>=0&&MiniMap[x-1][y]==null&&rmNumber<6){
                x -= 1;
                addition = "u";
                step = false;
              }else{
                up = true;
              }
            }else{
              //if(x-1>=0&&MiniMap[x-1][y]==null&&rmNumber<6){
              //  if(Math.random()>.05){
              //    MiniMap[x-1][y] = "cou";
              //    if(needsEncounter && Math.random()>.5){
              //      MiniMap[x-1][y] = "enu";
              //      needsEncounter = false;
              //    }
              //  }else{
              //    MiniMap[x-1][y] = "enu";
              //  }
              //}
            }
            up = true;
          }
        }
        if(randomized == 1){//down
          if(Math.abs(Math.abs(4-y)+Math.abs(end-x))>Math.abs(Math.abs(4-y)+Math.abs(end-(x+1)))){
            if(x+1<=4&&MiniMap[x+1][y]==null){
              x += 1;
              addition = "d";
              step = false;
            }else{
              down = true;
            }
          }else{
            if(Math.random()>.4&&y!=4){
              if(x+1<=4&&MiniMap[x+1][y]==null&&rmNumber<6){
                x += 1;
                addition = "d";
                step = false;
              }else{
                down = true;
              }
            }else{
              //if(x+1<=4&&MiniMap[x+1][y]==null&&rmNumber<6){
              //  if(Math.random()>.05){
              //    MiniMap[x-1][y] = "cou";
              //    if(needsEncounter && Math.random()>.5){
              //      MiniMap[x-1][y] = "enu";
              //      needsEncounter = false;
              //    }
              //  }else{
              //    MiniMap[x-1][y] = "enu";
              //  }
              //}
            }
            down = true;
          }
        }
        if(randomized == 2){//left
          if(Math.abs(Math.abs(4-y)+Math.abs(end-x))>Math.abs(Math.abs(4-(y-1))+Math.abs(end-(x)))){
            if(y-1>=0&&MiniMap[x][y-1]==null){
              y-= 1;
              addition = "l";
              step = false;
            }else{
              left = true;
            }
          }else{
            left = true;
          }
        }
        if(randomized == 3){//right
          if(Math.abs(Math.abs(4-y)+Math.abs(end-x))>Math.abs(Math.abs(4-(y+1))+Math.abs(end-(x)))){
            if(y+1<=4&&MiniMap[x][y+1]==null){
              y += 1;
              addition = "r";
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
      
      if(Math.random()>.75 && needsTraining){
        MiniMap[x][y] = "tr" + addition;
        needsTraining = false;
      }else{
        if(Math.random()>.05){
          MiniMap[x][y] = "co" + addition;
          if(needsEncounter && Math.random()>.5){
            MiniMap[x][y] = "en" + addition;
            needsEncounter = false;
          }
        }else{
          MiniMap[x][y] = "en" + addition;
        }
        
      }
      if(rmNumber == 2 && needsTraining){
        MiniMap[x][y] = "tr" + addition;
        needsTraining = false;
      }
      rmNumber++;
    }
    MiniMap[end][4] = "ex" + addition;
  }
  
  void combatEncounter(int diff, char b, int floor){
    String[][] combat = new String[16][16];
    for(int i = 0; i < combat.length; i++){
      for(int k = 0; k < combat[i].length; k++){
        combat[i][k] = null;
      }
    }
    //combat[0][0] = "PC";
    int a = 0;
    ArrayList<Enemy> enemys = new ArrayList<Enemy>();
    while(diff>0){
      int x = (int)(Math.random()*14)+1;
      int y = (int)(Math.random()*14)+1;
      if(combat[x][y] == null){
         int select = (int)(Math.random()*3);
         if(select == 0){
           if(diff - 1 >= 0){
             combat[x][y] = "EC" + a;
             enemys.add(new Goblin(a));
             a++;
             diff--;
           }
         }
         if(select == 1){
           if(diff - 1 >= 0){
             combat[x][y] = "EC" + a;
             enemys.add(new Dartgoblin(a));
             a++;
             diff--;
           }
         }
         if(select == 2){
           if(floor == 1){
             if(diff - 2 >= 0){
               combat[x][y] = "EC" + a;
               enemys.add(new Bomber(a));
               a++;
               diff -= 2;
             }
           }else{
             if(diff - 2 >= 0){
               combat[x][y] = "EC" + a;
               enemys.add(new Ogre(a));
               a++;
               diff -= 2;
             }
           }
         }
      }
    }
    enemies = enemys;
    Combat = combat;
    //going from up
    x = 15;
    y = 7;
    if(b == 'u'){
      if(Combat[y][x] == null){
        Combat[y][x] = "PC";
      }
      else{
        if(Combat[y][x+1] == null){
          Combat[y][x+1] = "PC";
        }
      }
    }
    //going from down
    x = 0;
    y = 7;
    if(b == 'd'){
      if(Combat[y][x] == null){
        Combat[y][x] = "PC";
      }
      else{
        if(Combat[y][x+1] == null){
          Combat[y][x+1] = "PC";
        }
      }
    }
    ////going from left
    //x = 7;
    //y = 0;
    //if(b == 'l'){
    //  if(Combat[x][y] != null && Combat[x][y].substring(0,2) != "EC"){
    //    Combat[x][y] = "PC";
    //  }
    //  else{
    //    if(Combat[x + 1][y] != null && Combat[x][y].substring(0,2) != "EC"){
    //      Combat[x][y] = "PC";
    //    }
    //  }
    //}
    //going from right
    x = 7;
    y = 0;
    if(b == 'r'){
      if(Combat[y][x] == null){
        Combat[y][x] = "PC";
      }
      else{
        if(Combat[y+1][x] == null){
          Combat[y+1][x] = "PC";
        }
      }
    }
    //Combat[x][y] = "PC";
  }
  
  boolean allEnemyDead(){
    for(int i = 0; i < enemies.size(); i++){
      if(enemies.get(i).getHP() > 0){
        return false;
      }
    }
    return true;
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
    if(x >= 0 && y >= 0 && possibleMove[x][y] == 1){
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
    int[][] characters = new int[enemies.size()+1][2];
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
          if(Math.abs(Math.abs(characters[1][1]-characters[0][1])+Math.abs(characters[1][0]-characters[0][0])-dist)>Math.abs(Math.abs(characters[1][1]-(characters[0][1]-1))+Math.abs(characters[1][0]-characters[0][0])-dist)){
            if(confirmation(characters, characters[0][0], characters[0][1]-1)){
              if(characters[0][1]-1 < 0){
                up = true;
              }else{
                characters[0][1]-=1;
                step = false;
              }
            }else{
              up = true;
            }
          }else{
            up = true;
          }
        }
        if(randomized == 1){// down
          if(Math.abs(Math.abs(characters[1][1]-characters[0][1])+Math.abs(characters[1][0]-characters[0][0])-dist)>Math.abs(Math.abs(characters[1][1]-(characters[0][1]+1))+Math.abs(characters[1][0]-characters[0][0])-dist)){
            if(confirmation(characters, characters[0][0], characters[0][1]+1)){
              if(characters[0][1]+1 > 15){
                down = true;
              }else{
                characters[0][1]+=1;
                step = false;
              }
            }else{
              down = true;
            }
          }else{
            down = true;
          }
        }
        if(randomized == 2){//left
          if(Math.abs(Math.abs(characters[1][1]-characters[0][1])+Math.abs(characters[1][0]-characters[0][0])-dist)>Math.abs(Math.abs(characters[1][1]-characters[0][1])+Math.abs(characters[1][0]-(characters[0][0]-1))-dist)){
            if(confirmation(characters, characters[0][0]-1, characters[0][1])){
              if(characters[0][0]-1 < 0){
                left = true;
              }else{
                characters[0][0]-=1;
                step = false;
              }
            }else{
              left = true;
            }
          }else{
            left = true;
          }
        }
        if(randomized == 3){//right
          if(Math.abs(Math.abs(characters[1][1]-characters[0][1])+Math.abs(characters[1][0]-characters[0][0])-dist)>Math.abs(Math.abs(characters[1][1]-characters[0][1])+Math.abs(characters[1][0]-(characters[0][0]+1))-dist)){
            if(confirmation(characters, characters[0][0]+1, characters[0][1])){
              if(characters[0][0]+1 > 15){
                right = true;
              }else{
                characters[0][0]+=1;
                step = false;
              }
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
  
  void displayCombat(int floor){
    stroke(0,0,0);
    for(int i = 400; i < 1200; i += 50){
      for(int j = 0; j < 800; j += 50){
        if(Combat[(i-400)/50][j/50] != null){
          if(Combat[(i-400)/50][j/50].equals("PC")){
            image(textures[49], i + 5, j + 5);
            textSize(20);
            fill(0,0,0);
            text(store.getHP(),i+15,j+60);
            noFill();
          }
          if(Combat[(i-400)/50][j/50].substring(0,2).equals("EC")){
            if(enemies.get(Integer.parseInt(Combat[(i-400)/50][j/50].substring(2))).getHP() <= 0){
              Combat[(i-400)/50][j/50] = null;
            }else{
              String a = enemies.get(Integer.parseInt(Combat[(i-400)/50][j/50].substring(2,3))).getName();
              if(a.equals("Goblin")){
                if(floor == 1){
                  image(textures[14], i + 5, j + 5);
                }
                if(floor == 2){
                  image(textures[14+16], i + 5, j + 5);
                }
                if(floor == 3){
                  image(textures[14+32], i + 5, j + 5);
                }
              }
              if(a.equals("Dartgoblin")){
                if(floor == 1){
                  image(textures[15], i + 5, j + 5);
                }
                if(floor == 2){
                  image(textures[15+16], i + 5, j + 5);
                }
                if(floor == 3){
                  image(textures[15+32], i + 5, j + 5);
                }
              }
              if(a.equals("Bomber")){
                image(textures[13], i + 5, j + 5);
              }
              if(a.equals("Ogre")){
                if(floor == 2){
                  image(textures[13+16], i + 5, j + 5);
                }else{
                  image(textures[13+32], i + 5, j + 5);
                }
              }
              if(a.equals("HealerTurrent")){
                image(textures[48], i + 5, j + 5);
              }
              textSize(20);
              fill(0,0,0);
              text(enemies.get(Integer.parseInt(Combat[(i-400)/50][j/50].substring(2,3))).getHP()+"", i+15, j+60);
              noFill();
            }
          }
        }
      }
    }
  }
  
  void display(){
    stroke(0,0,0);
    for(int i = 400; i < 1200; i += 50){
      for(int j = 0; j < 800; j += 50){
        image(texturesMap[(i-400)/50][j/50], i, j);
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

  
  String getNextRoom(){
    for(int i = 0; i < MiniMap.length; i++){
      for(int k = 0; k < MiniMap[0].length; k++){
        if(MiniMap[i][k] != null && MiniMap[i][k].substring(3).equals("p")){
          MiniMap[i][k] = MiniMap[i][k].substring(0,3);
          int y = i;
          int x = k;
          ////left block
          //x = x-1;
          //if(x <= 4 && x >= 0 && y <= 4 && y >=0){ //check for in bound
          //  if(MiniMap[y][x] != null && MiniMap[y][x].charAt(2) == 'r'){
          //    return MiniMap[y][x].substring(0,3);
          //  }
          //}
          //x = k;
          //right block
          x = x+1;
          if(x <= 4 && x >= 0 && y <= 4 && y >=0){ //check for in bound
            if(MiniMap[y][x] != null && MiniMap[y][x].charAt(2) == 'r'){
              MiniMap[y][x] = MiniMap[y][x] + "p";
              return MiniMap[y][x].substring(0,3);
            }
          }
          x = k;
          //down block
          y = y + 1;
          if(x <= 4 && x >= 0 && y <= 4 && y >=0){ //check for in bound
            if(MiniMap[y][x] != null && MiniMap[y][x].charAt(2) == 'd'){
              MiniMap[y][x] = MiniMap[y][x] + "p";
              return MiniMap[y][x].substring(0,3);
            }
          }
          y = i;
          //up block
          y = y - 1;
          if(x <= 4 && x >= 0 && y <= 4 && y >=0){ //check for in bound
            if(MiniMap[y][x] != null && MiniMap[y][x].charAt(2) == 'u'){
              MiniMap[y][x] = MiniMap[y][x] + "p";
              return MiniMap[y][x].substring(0,3);
            }
          }
          y = i;
        }
      }
    }
    return "dzn";
  }
  
  String CurrentMapType(){
    for(int i = 0; i < MiniMap.length; i++){
      for(int k = 0; k < MiniMap[0].length; k++){
        if(MiniMap[i][k] != null && MiniMap[i][k].substring(3).equals("p")){
          return MiniMap[i][k].substring(0, 2);
        }
      }
    }
    return "";
  }
}
