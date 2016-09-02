/**
 * Loop status
 *
 * The built-in "looping" variable returns the current
 * current sketch status of loop() vs noLoop().
 * This sketch demonstrates toggling looping with
 * spacebar.
 *
 * @author  Jeremy Douglass
 * @version 1.0
 * @since   2016-09-02
 */

    boolean myLooping = true;
    
    int bgBlue = 0;
    void draw(){
        background( 0, 0, bgBlue );
        bgBlue = (bgBlue+3)%255;
    }
    
    void keyPressed(){
        switch(key){
      //// use a sketch variable and keep it in sync
            case '1':
                if(myLooping){ noLoop(); }
                else { loop(); }
                myLooping = !myLooping;
                break;
            //// check the `isLooping()` method
            case '2':
                if(isLooping()){ noLoop(); }
                else { loop(); }
                break;
      //// check `looping` and set with loop()/noLoop()
            case '3':
                if(looping){ noLoop(); }
                else { loop(); }      
                break;
      //// flip `looping` directly
            case '4':
                looping = !looping;
                break;
        }
    }