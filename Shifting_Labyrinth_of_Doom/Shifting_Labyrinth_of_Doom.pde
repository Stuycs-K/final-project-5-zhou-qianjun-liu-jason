public int sizeOfSidebar = 400;
public int sizePerSquare = 50;
int x;
int y;

void setup(){
  size(1201,800);
}

void draw(){
  //BattleMap test2 = new BattleMap();
  //test2.display();
  BattleMap test2 = new BattleMap();
  //test2.displayMovement(2);
  test2.display();
  if (mousePressed == true) {
    background(255,255,255); // would be a clear if not continuous
  }
  PlayerCharacter newPerson = new PlayerCharacter();
  //newPerson.displayMovement(test2);
  //newPerson.useSkill(test2, newPerson.getSkill(0));
  //fill(125,26,73);
  square(x*sizePerSquare+sizeOfSidebar, y*sizePerSquare, sizePerSquare);
  
  //Skill test = new SkillTest();
  //test.displayRange(5,5,"left");
}

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
}
