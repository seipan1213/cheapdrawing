int mode=0;
int cri=0;
int mx,my,count,count1,count2=0,grx=50,gry=200,grw=1000,grh=700,hako;
int x,y,z,zure;
float goukei=20,e;
color c=-335544;
int fontsize=30;
int[][] posi = new int[2][2];
boolean syoki=true,press=true;
PGraphics pg;
PImage img;
Undo undo;
ArrayList<Undo> list;

void setup(){
  size(1200,1000);
  list = new ArrayList<Undo>();
  pg = createGraphics(grw, grh);
  pg.beginDraw();
  pg.background(#ffffff);
  background(255);
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(grx-1,gry-1,grw+1,grh+1);
  frameRate(60);
  for(x=0;x<4;x++){
      for(y=0;y<4;y++){
          for(z=0;z<4;z++){
            fill(85*x,85*y,85*z);
            zure=z*1000/6;
            rect(1000/27*x+zure,40*y,1000/27,1000/27);
          }
      }
  }
    noFill();
}
void draw(){
  if(second()!=1){
  pg.beginDraw();
  }
   if(cri==1){
      fill(c);
      pg.noStroke();
      pg.fill(c);
      switch(mode){
        case 2:
         count1++;
         pg.rect(posi[0][0],posi[0][1],posi[1][0]-posi[0][0],posi[1][1]-posi[0][1]);
         list.add(new Undo(2,posi[0][0],posi[0][1],posi[1][0]-posi[0][0],posi[1][1]-posi[0][1],c,goukei));
      hako = list.size();
      if(count2>0){
         for(int i=hako;i>hako-count2-1;i--){
           if(list.size()!=0){
         list.remove(i-1);
           }
         println(list.size());
         }
         count2=0;
      }
     cri=0;
         break;
        case 3:
          count1++;
          pg.ellipse((posi[0][0]+posi[1][0])/2,(posi[0][1]+posi[1][1])/2,posi[1][0]-posi[0][0],posi[1][1]-posi[0][1]);
          list.add(new Undo(3,(posi[0][0]+posi[1][0])/2,(posi[0][1]+posi[1][1])/2,posi[1][0]-posi[0][0],posi[1][1]-posi[0][1],c,goukei));
      hako = list.size();
      if(count2>0){
         for(int i=hako;i>hako-count2-1;i--){
           if(list.size()!=0){
         list.remove(i-1);
           }
         println(list.size());
         }
         count2=0;
      }
      cri=0;
          break;
        case 4:
          count1++;
          pg.stroke(c);
          pg.strokeWeight(goukei);
          pg.line(posi[0][0],posi[0][1],posi[1][0],posi[1][1]);
          list.add(new Undo(4,posi[0][0],posi[0][1],posi[1][0],posi[1][1],c,goukei));
      hako = list.size();
      if(count2>0){
         for(int i=hako;i>hako-count2-1;i--){
           if(list.size()!=0){
         list.remove(i-1);
           }
         println(list.size());
         }
         count2=0;
      }
      cri=0;
          break;
        default:
      }
      stroke(000000);
      cri=0;
   }else if(mode==1&&mousePressed){
      pg.strokeWeight(goukei);
      pg.stroke(c);
      if(press){
      mx=mouseX-grx;
      my=mouseY-gry;
      press=false;
      }
      pg.line(mx,my,mouseX-grx,mouseY-gry);  
      list.add(new Undo(1,mx,my,mouseX-grx,mouseY-gry,c,goukei));
      mx=mouseX-grx;
      my=mouseY-gry;
      stroke(0);
      strokeWeight(1);
      hako = list.size();
      if(count2>0){
         for(int i=hako;i>hako-count2-1;i--){
           if(list.size()!=0){
         list.remove(i-1);
           }
         println(list.size());
         }
         count2=0;
      }
   }else if(mode==6&&mousePressed){
      fill(255);
      pg.strokeWeight(goukei);
      pg.stroke(255);
      if(press){
      mx=mouseX-grx;
      my=mouseY-gry;
      press=false;
      }
      pg.line(mx,my,mouseX-grx,mouseY-gry);  
      list.add(new Undo(6,mx,my,mouseX-grx,mouseY-gry,c,goukei));
      mx=mouseX-grx;
      my=mouseY-gry;
      pg.stroke(0);
     
   }
   if(syoki){      
     fill(255,0,0);
     rect(900,10,10,10);
   }else{
      fill(0);
      rect(900,10,10,10);
   }
   textSize(fontsize);
   textAlign(CENTER);
   fill(c);
      switch(mode){
        case 0:
          rect(730,45,150,100);
          fill(0);
          text("none",800,100);
         break;
        case 1:
          rect(730,45,150,100);
          fill(0);
          text("burasi",800,100);
          break;
        case 2:
          rect(730,45,150,100);
          fill(0);
          text("cube",800,100);
          break;
        case 3:
          rect(730,45,150,100);
          fill(0);
          text("ellipse",800,100);
          break;
        case 4:
          rect(730,45,150,100);
          fill(0);
          text("line",800,100);
          break;
        case 5:
          rect(730,45,150,100);
          fill(0);
          text("color",800,100);
          break;
        case 6:
          rect(730,45,150,100);
          fill(0);
          text("clean",800,100);
          break;
        default:
      }
      fill(#ffffff);
      rect(1000,50,100,100);
      fill(c);
      ellipse(1050,100,goukei,goukei);
      pg.endDraw();
      image(pg, grx, gry);

    
}
  void mouseClicked(){
    if(mode==5){
      c = get(mouseX, mouseY); 
        fill(c);
        println(c);
      
      }else if(mode>0){
        if(syoki){
        posi[0][0]=mouseX-grx;
        posi[0][1]=mouseY-gry;
        syoki=false;
      }
      else{
        posi[1][0]=mouseX-grx;
        posi[1][1]=mouseY-gry;
        syoki=true;
        cri=1;
      }
    }
  }
  void keyPressed() {
    cri=0;
    syoki=true;
    if (key == '1') {
     mode=1;
    }
    if (key == '2') {
      mode=2;
    }if (key == '3') {
      mode=3;
    }if (key == '4') {
      mode=4;
    }if (key == 'x') {
      mode=5;
    }if (key == 'c') {
      mode=6;
    }
    if(key==' '){
      pg.clear();
      pg.beginDraw();
      pg.background(#ffffff);
      fill(#ffffff);
      rect(grx-1,gry-1,grw+1,grh+1);
      fill(c);
    }
    if(key=='m'&&count1>1){
      count1--;
      pg.clear();
      img=loadImage("undo/"+(count1)+".jpg");
      pg.image(img,0,0);
      println(count1);
    }
    if(key == 'p' || key == 'P') {

    // デスクトップのパスを取得
    String path  = "画像/screenshot" + count + ".jpg";

    // 保存
    pg.save(path);

    // 番号を加算
    count++;

    // ログ用途
    println("screen saved." + path); 
  }
  if(key == 'z'&&list.size()>0 || key == 'Z'&&list.size()>0||key == 'y'&&list.size()>0 || key == 'Y'&&list.size()>0){
    pg.clear();
      pg.beginDraw();
      pg.background(#ffffff);
      fill(#ffffff);
      rect(grx-1,gry-1,grw+1,grh+1);
      fill(c);
      if(key=='z'&&count2-2 <=list.size()){
      count2++;
      println(count2);
      }else if(count2>0){
      count2--;
      println(count2);
      }
      
    for(int i = 0; i < list.size()-count2; i++){
      pg.fill(list.get(i).getSt());
      pg.strokeWeight(list.get(i).getStw());
      switch(list.get(i).getMode()){
        case 1:
          pg.line(list.get(i).getX(),list.get(i).getY(),list.get(i).getW(),list.get(i).getH());
          break;
        case 2:
          pg.rect(list.get(i).getX(),list.get(i).getY(),list.get(i).getW(),list.get(i).getH());
          break;
        case 3:
          pg.ellipse(list.get(i).getX(),list.get(i).getY(),list.get(i).getW(),list.get(i).getH());
          break;
        case 4:
          pg.line(list.get(i).getX(),list.get(i).getY(),list.get(i).getW(),list.get(i).getH());
          break;
        case 5:
          pg.line(list.get(i).getX(),list.get(i).getY(),list.get(i).getW(),list.get(i).getH());
          break;
      }
    }
  }
}
  void mouseReleased(){
      press=true;
      if(mode==1){
          count1++;
      }
}
void mouseWheel(MouseEvent event) {
  e = event.getCount();
  goukei += e;
  if(goukei<1){
    goukei=1;
  }
  if(goukei>100){
    goukei=100;
  }
  
}
 public class Undo{
   public int mode,x,y,w,h,st;
   public float stw;
   public Undo(int mode,int x,int y,int w,int h,int st,float stw) {
        this.mode = mode;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.st = st;
        this.stw = stw;
      }
      public int getMode(){
        return this.mode;
    }
      public int getX(){
        return this.x;
    }

    public int getY(){
        return this.y;
    }
     public int getW(){
        return this.w;
    }

    public int getH(){
        return this.h;
    }
     public int getSt(){
        return this.st;
    }

    public float getStw(){
        return this.stw;
    }
 }
