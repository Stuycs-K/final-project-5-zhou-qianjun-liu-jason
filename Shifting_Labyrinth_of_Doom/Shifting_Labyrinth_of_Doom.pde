public int sizeOfSidebar = 400;
public int sizePerSquare = 50;
int x;
int y;
BattleMap test2 = new BattleMap();
PlayerCharacter newPerson = new PlayerCharacter();
Skill test = new SkillTest();
int phase = 0;
boolean phaseStart = true;
int selection;

void setup(){
  size(1201,800);
  test2.display();
  test2.displayCombat();
}

void draw(){
  if(phase == 0){
    if(phaseStart){
      test2.display();
      newPerson.displayMovement(test2);
      test2.displayCombat();
      phaseStart = false;
    }
  }
  textSize(100);
  text(phase, 10, 70);
  if(phase == 5){
    phase = 0;
  }
}

void mouseClicked(){
  x = (mouseX-sizeOfSidebar)/sizePerSquare;
  y = (mouseY)/sizePerSquare;
  if(phase == 0){
    if(newPerson.movement(test2, x, y)){
      test2.display();
      test2.displayCombat();
      phase = 1;
      phaseStart = true;
    }
  }
}

void keyPressed(){
  if(phase == 1){
    if(keyCode == UP){
      newPerson.setOrientation("up");
      phase = 2;
    }
    if(keyCode == DOWN){
      newPerson.setOrientation("down");
      phase = 2;
    }
    if(keyCode == LEFT){
      newPerson.setOrientation("left");
      phase = 2;
    }
    if(keyCode == RIGHT){
      newPerson.setOrientation("right");
      phase = 2;
    }
  }
  if(phase == 2){
    if(key == 'a'){
      newPerson.displaySkill(test2,newPerson.getSkill(0));
      test2.displayCombat();
      selection = 0;
      phase = 3;
    }
    if(key == 'b'){
      newPerson.displaySkill(test2,newPerson.getSkill(1));
      test2.displayCombat();
      selection = 1;
      phase = 3;
    }
    if(key == 'c'){
      newPerson.displaySkill(test2,newPerson.getSkill(2));
      test2.displayCombat();
      selection = 1;
      phase = 3;
    }
    if(keyCode == ENTER){
      phase = 5;
    }
    if(key == 'x'){
      phase = 1;
    }
  }
  if(phase == 3){
    if(key == 'x'){
      test2.display();
      test2.displayCombat();
      phase = 2;
    }
    if(keyCode == ENTER){
      newPerson.useSkill(test2,newPerson.getSkill(selection));
      phase = 4;
    }
  }
  if(key == 'p'){
      phase++;
  }
}
