void setup(){
  size(1201,800);
}

void draw(){
  Skill test = new SkillTest();
  test.displayRange(3,3,"left");
  BattleMap test2 = new BattleMap();
  test2.display();
}
