public int sizeOfSidebar = 400;
public int sizePerSquare = 50;
int x;
int y;
BattleMap test2 = new BattleMap();
PlayerCharacter newPerson = new PlayerCharacter();
Skill test = new SkillTest();
int phase = 0;

void setup(){
  size(1201,800);
  test2.display();
}

void draw(){
  if(phase == 0){
    newPerson.displayMovement(test2);
    test2.displayCombat();
    
  }
  if(phase == 1){
    test.displayRange(10,10,"down");
    test.useSkill(test2,10,10,"down");
  }
  textSize(128);
  text(phase, 40, 120); 
}

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
  if(newPerson.movement(test2, x, y)){
    phase ++;
  }else{
    if(phase != 0){
      phase ++;
    }
  }
  test2.display();
  test2.displayCombat();
  phase = phase % 4;
  
}
