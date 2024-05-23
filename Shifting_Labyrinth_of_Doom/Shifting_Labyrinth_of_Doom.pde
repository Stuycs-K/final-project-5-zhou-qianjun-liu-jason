void setup(){
  size(1201,800);
  square(400,0,800);
  square(0,0,400);

  for(int i = 400; i < 1200; i += 50){
    for(int j = 0; j < 800; j += 50){
      square(i,j,50);
    }
  }
}

void draw(){
  Skill test = new SkillTest();
  test.displayRange(3,3,"down");
}
