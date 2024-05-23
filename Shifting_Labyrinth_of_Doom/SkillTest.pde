class SkillTest extends Skill{
  private int[][] Range;
  private int Dmg;
  private int Cooldown;
  private int MaxCooldown;
  
  public SkillTest(){
    Range = new int[][]{
      {0,1,0,0,1,0,0,1,0},
      {0,0,1,0,1,0,1,0,0},
      {0,0,0,1,1,1,0,0,0},
      {0,0,0,0,1,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0},
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
  
  void voidcooldown(){
    if(Cooldown == 0){
    }else{
      Cooldown--;
    }
  };
  void useSkill(BattleMap map, int a, int b, String direction){
  };
  void displayRange(int a, int b, String direction){
    if(direction.equals("up")){
      for(int i = 0; i < Range.length; i++){
        for(int j = 0; j < Range[i].length; j++){
          if(Range[i][j] == 1){
            int c = a - (4 - i);
            int d = b - (4 - j);
            if(c<0||c>15||d<0||d>15){
            }else{
              fill(124,252,0);
              square(400+d*50,c*50,50);
              noFill();
            }
          }
        }
      }
    }
    if(direction.equals("down")){
      for(int i = 0; i < Range.length; i++){
        for(int j = 0; j < Range[i].length; j++){
          if(Range[i][j] == 1){
            int c = a + (4 - i);
            int d = b - (4 - j);
            if(c<0||c>15||d<0||d>15){
            }else{
              fill(124,252,0);
              square(400+d*50,c*50,50);
              noFill();
            }
          }
        }
      }
    }
    if(direction.equals("right")){
      for(int i = 0; i < Range.length; i++){
        for(int j = 0; j < Range[i].length; j++){
          if(Range[i][j] == 1){
            int d = a + (4 - i);
            int c = b - (4 - j);
            if(c<0||c>15||d<0||d>15){
            }else{
              fill(124,252,0);
              square(400+d*50,c*50,50);
              noFill();
            }
          }
        }
      }
    }
    if(direction.equals("left")){
      for(int i = 0; i < Range.length; i++){
        for(int j = 0; j < Range[i].length; j++){
          if(Range[i][j] == 1){
            int d = a - (4 - i);
            int c = b - (4 - j);
            if(c<0||c>15||d<0||d>15){
            }else{
              fill(124,252,0);
              square(400+d*50,c*50,50);
              noFill();
            }
          }
        }
      }
    }
  };
}
