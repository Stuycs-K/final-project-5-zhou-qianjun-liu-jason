class Goblin extends Enemy{
  private int HP;
  private Skill Skills;
  private int Movement = 3;
  private int number;
  public Goblin(int num){
    HP = 10;
    number = num;
    Skills = new Goblinswipe();
  }
  
  int getHP(){
    return HP;
  }
  
  String getName(){
    return "Goblin";
  }
  
  private void useSkill(BattleMap map){
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
  private void hpChange(int Extent){
    HP = HP - Extent;
  }
  private void movement(BattleMap map){
    map.enemySwap(number,Movement,1);
  }
}
