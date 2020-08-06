int n = 1;
float w;
float margin = 2;
int gifFrameDigits = 2;
float i = 0;
int frames = 0;
boolean animated = true;
boolean saveGif = false;
JSONArray jsonData;
ArrayList<ArrayList<PVector>> results = new ArrayList<ArrayList<PVector>>(0);
void setup(){
  size(800, 800, P2D);
  background(51);
  if (!saveGif){
    frameRate(10);
  }
  results.add(new ArrayList<PVector>(0));
  noStroke();
  fill(255, 100, 150);
  textSize(36);
  textAlign(LEFT, TOP);
  if (!animated){
    noLoop();
    jsonData = new JSONArray();
    
    while (true){
      JSONArray tempData = new JSONArray();
      
      for(i = 1; i <= n; i++){
        if ((float) n / (float) i == floor(n/i)){
          results.get(results.size()-1).add(new PVector(i, n/i));
        }
      }
      
      
      tempData.append(n);
      tempData.append(results.get(results.size()-1).size());
      jsonData.append(tempData);
      if (results.get(results.size()-1).size() == 64){
      //if (n == 64000){
        println(n);
        saveJSONArray(jsonData, "out/data.json");
        break;
      }
      results.add(new ArrayList<PVector>(0));
      n++;
    }
  }
}
void draw(){
  background(51);
  if ((float) n / (float) i == floor(n/i)){
    results.get(results.size()-1).add(new PVector(i, n/i));
    float a = (i>n/i)?i:n/i;
    w = ((float) width-((1+a)*margin))/a;
    fill(255, 100, 150);
    for(int j = 0; j < i; j++){
      for(int k = 0; k < n/i; k++){
        square(margin*(j+1)+j*w, margin*(k+1)+k*w, w);
      }
    }
    
    fill(255);
    text("n: "+str(n)+"; "+str((int)i)+"x"+str((int)(n/i)), margin*2, margin*2);
    if (saveGif){
      save("out/gif-"+nf(frames, gifFrameDigits)+".png");
    }
    frames++;
    if (frames % 50 == 0){
      println(frames);
    }
    if (frames == pow(10, gifFrameDigits)-1){
      exit();
    }
  }else{
    fill(255);
    text("n: "+str(n), margin*2, margin*2);
  }
  if (i > n){
    i = 0;
    if (results.get(results.size()-1).size() == 64){
      println(n);
    }
    results.add(new ArrayList<PVector>(0));
    n++;
  }
  i++;
}
