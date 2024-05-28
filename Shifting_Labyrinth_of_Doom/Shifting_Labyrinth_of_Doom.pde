public int sizeOfSidebar = 400;
public int sizePerSquare = 50;
int x;
int y;
BattleMap test2 = new BattleMap();
PlayerCharacter newPerson = new PlayerCharacter();

void setup(){
  size(1201,800);
  
}

void draw(){
  //BattleMap test2 = new BattleMap();
  //test2.display();

  //test2.displayMovement(2);
  
  if (mousePressed == true) {
    background(255,255,255); // would be a clear if not continuous
  }
  
  newPerson.displayMovement(test2);
  //newPerson.useSkill(test2, newPerson.getSkill(0));
  //fill(125,26,73);
  square(x*sizePerSquare+sizeOfSidebar, y*sizePerSquare, sizePerSquare);
  newPerson.movement(test2, x, y);
  Skill test = new SkillTest();
  //test.displayRange(10,10,"down");
  test.useSkill(test2,10,10,"down");
}

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
  test2.display();
}
