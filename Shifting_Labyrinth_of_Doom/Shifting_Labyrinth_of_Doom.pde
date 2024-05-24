void setup(){
  size(1201,800);
}

void draw(){
  //BattleMap test2 = new BattleMap();
  //test2.display();
  PlayerCharacter newPerson = new PlayerCharacter();
  newPerson.useSkill(newPerson.getSkill(0));
  BattleMap test2 = new BattleMap();
  test2.display();
  if (mousePressed == true) {
    background(255,255,255); // would be a clear if not continuous
  }
  //Skill test = new SkillTest();
  //test.displayRange(5,5,"down");
}
