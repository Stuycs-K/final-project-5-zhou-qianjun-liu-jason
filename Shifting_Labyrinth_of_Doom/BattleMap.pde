class BattleMap{
  PImage[][] Appearance;
  String[][] MiniMap;
  String[][] Combat;
  
  public BattleMap(){
    Appearance = new PImage[16][16];
    MiniMap = new String[][]{
      {null,null,"tr",null,null},
      {"e","co","en",null,null},
      {null,"en","co",null,null},
      {null,null,"co",null,null},
      {null,null,"ex",null,null}
      
      // need to add identifier likely based in string of ,Two-Letter Acronym + Direction, in order to map map more functional
    };
    Combat = new String[16][16];
  }
  
  public void generateRoom(String type){
  }
  
  public void generateFloor(){
  }
  
  public void combatEncounter(int diff){
  }
  
  public void display(){
    stroke(0,0,0);
    for(int i = 400; i < 1200; i += 50){
      for(int j = 0; j < 800; j += 50){
        square(i,j,50);
      }
    }
    noStroke();
    for(int i = 0; i < MiniMap.length; i++){
      for(int j = 0; j < MiniMap[i].length; j++){
        String a = MiniMap[i][j];
        stroke(255,255,255);
        if(a == null){
          fill(0,0,0);
          square(j*80,i*80,80);
          noFill();
        }else{
          if(a.equals("e")){
            fill(0,191,255);
            square(j*80,i*80,80);
            noFill();
          }
          if(a.equals("co")){
            fill(255,0,0);
            square(j*80,i*80,80);
            noFill();
          }
          if(a.equals("en")){
            fill(0,255,127);
            square(j*80,i*80,80);
            noFill();
          }
          if(a.equals("ex")){
            fill(0,191,255);
            square(j*80,i*80,80);
            noFill();
          }
          if(a.equals("tr")){
            fill(255,235,205);
            square(j*80,i*80,80);
            noFill();
          }
        }
        noStroke();
      }
    }
  }
  
}
