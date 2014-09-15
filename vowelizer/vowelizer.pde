// split a string into a char array; 
// create a 100x100 matrix; 
// sort for vowels; 
// write vowels to matrix in original word placement
// consonants become empty spaces
// integrate minum
// create ombak notes for [i,o,e,u,a]
// create keyboard player
// create autoplayer: dots are ignored (held)
// capital letters can mean lower oct. punctuation should mean something too

String text = "Anyone who is steady in his determination for the advanced stage of spiritual realization and can equally tolerate the onslaughts of distress and happiness is certainly a person eligible for liberation.";
//String text[] = loadStrings("text.txt");

String[] ch = text.split("");
int w = 600, h = 600;
int cols = 25;
int rows = 25;

void setup(){
  size(w,h);
  background(255);
  translate(-40,-20);
  for(int i = 0; i < ch.length - 1; i++){
      letter(ch[i], i/ rows, i % cols);
  }
}

void letter(String letter, float row, float col) {
  float x = (col * (width / cols)) + (width / cols * 2);
  float y = (row * (height / rows)) + (height / rows * 2);
  fill(0);
  textAlign(CENTER, CENTER);
  point(x, y);
  if(letter.matches(".*(?i)[aeiou]")){
    text(letter, x, y);
  }
}
