class Goblin extends Enemy{
  private int HP = 10;
  private Skill Skills;
  private int Movement = 10;
  private int number;
  public Goblin(int num){
    number = num;
  }
  void useSkill(BattleMap map){
    int x = 0;
    int y = 0;
    boolean found = false;
    for(int i = 0; i < map.getCombat().length; i++){
      for(int k = 0; k < map.getCombat()[i].length; k++){
        if(map.getCombat()[i][k] != null && map.getCombat()[i][k].equals("EC" + number)){
          y = i;
          x = k;
          found = true;
          break;
        }
      }
      if(found == true){
          break;
      }
    }
    Skills.useSkill(map, x, y, "right");
  }
  void hpChange(int Extent){
    HP = HP - Extent;
  }
  void movement(){
  }
}