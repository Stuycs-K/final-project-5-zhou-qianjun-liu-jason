class SkillTest extends Skill{
  private int[][] Range;
  private int Dmg;
  private int Cooldown;
  private int MaxCooldown;
  
  public SkillTest(){
    Range = new int[][]{
      {0,0,0,0,0,0,0,0,0}, // range center is person location you can change and try
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,1,0,0,0,0},
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
  };
  
  void useSkill(BattleMap map, int a, int b, String direction){ // didnt finish as map wasnt done
  };
  
  void displayRange(int a, int b, String direction){  // a and b is x-cord y-cord of array beginning with 1
    stroke(0,0,0);
      for(int i = 0; i < Range.length; i++){
        for(int j = 0; j < Range[i].length; j++){
          if(Range[i][j] == 1){
            int c = 0;
            int d = 0;
            if(direction.equals("up")){
              c = a - (Range.length/2 - i);
              d = b - (Range[i].length/2 - j);
            }
            if(direction.equals("down")){
              c = a + (Range.length/2 - i);
              d = b - (Range[i].length/2 - j);
            }
            if(direction.equals("right")){
              d = a + (Range.length/2 - i);
              c = b - (Range[i].length/2 - j);
            }
            if(direction.equals("left")){
              d = a - (Range.length/2 - i);
              c = b - (Range[i].length/2 - j);
            }
            if(c<0||c>15||d<0||d>15){
            }else{
                fill(124,252,0);
                square(400+d*50,c*50,50);
                noFill();
            }
          }
        }
      }
      noStroke();
  };
  
}
