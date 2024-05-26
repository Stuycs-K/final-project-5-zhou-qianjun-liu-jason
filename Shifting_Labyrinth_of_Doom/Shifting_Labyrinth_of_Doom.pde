void setup(){
  size(1201,800);
}

void draw(){
  //BattleMap test2 = new BattleMap();
  //test2.display();
  BattleMap test2 = new BattleMap();
  test2.displayMovement(2);
  test2.display();
  //if (mousePressed == true) {
  //  background(255,255,255); // would be a clear if not continuous
  //}
  PlayerCharacter newPerson = new PlayerCharacter();
  newPerson.useSkill(test2, newPerson.getSkill(0));
  
  //Skill test = new SkillTest();
  //test.displayRange(5,5,"left");
}
