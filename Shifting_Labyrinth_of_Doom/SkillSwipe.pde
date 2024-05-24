class SkillSwipe extends Skill{
  private int[][] Range;
  private int Dmg;
  private int Cooldown;
  private int MaxCooldown;
  public int sizeOfSidebar = 400;
  public int sizePerSquare = 50;
  public SkillSwipe(){
    Range = new int[][]{
      {0,0,0,0,0,0,0,0,0}, // range center is person location you can change and try
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,1,1,1,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
    };
    Dmg = 1;
    Cooldown = 0;
    MaxCooldown = 10;
  }
  
  int getCooldown(){
    return Cooldown;
  }
  int getMaxCooldown(){
    return MaxCooldown;
  }
  int getDmg(){
    return Dmg;
  }
  
  void cooldown(){
    if(Cooldown == 0){
    }else{
      Cooldown--;
    }
  }
  
  void useSkill(BattleMap map, int a, int b, String direction){ // didnt finish as map wasnt done
  
  }
  
  void displayRange(int a, int b, String direction){  // a and b is x-cord y-cord of array beginning with 1
    stroke(0,0,0);
      for(int i = 0; i < Range.length; i++){
        for(int j = 0; j < Range[i].length; j++){
          if(Range[i][j] == 1){
            int squareAtY = a + (4 - i);
            int squareAtX = b + (4 - j);
            fill(124,252,0);
            square(sizeOfSidebar + squareAtX * sizePerSquare, squareAtY * sizePerSquare, sizePerSquare);
            noFill();
          }
        }
      }
      noStroke();
  };
  
}
