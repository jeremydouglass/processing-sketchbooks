/*
 * Timer NOTES - DRAFT
 * @author Jeremy Douglass
 * @since 2016-08-28
 * 
 * Timed events:
 * 
 * 1. For basic timers (time since sketch started)
 *    do repeated calls against millis() in the loop.
 *    For fixed time tests, check millis() on input.
 * 2. For simple stopwatches, accumulate pause-time
 *    offsets against snapshot millis() timeframes.
 *    The issues here are subtle, see my example
 *    PauseableTimer
 * 3. For simple asynchronous events, call a custom
 *    top-level function with thread() and prefix the
 *    function contents with a delay. thread() cannot
 *    pass through arguments, so the callback function
 *    must parameterize itself from global state.
 * 4. For more complex timing and threading, use the
 *    Java Timer class (http://singletonjava.blogspot.com/2016/02/java-timer-example.html)
 *    (https://forum.processing.org/two/discussion/1725/millis-and-timer)
 *    and/or extend the Java Thread class.
 *    OR, instead of developing timers from scratch,
 *    use an existing Processing-specific timer library:
 5.   For ticking / multiple stopwatches, use dhchoi's 
 *    CountdownTimer Library for Processing.
 *    An alternative time library is the Executor Library.
 * 
 * See also DIY timer class tutorials, e.g. Leutenegger's
 * http://www.cs.du.edu/~leut/1671/09_Fall/ProcessingNotes7.pdf
 */




//// ----------

//// Example with CountdownTimer Library for Processing v0.9.4
//// ...make sure the library is installed to import.

//// Include library:
// import com.dhchoi.*;

//// Create and configure a new timer and start it right away.
//// 1000, 500 means call ticks every 1 second, call finish after 5 seconds.
// CountdownTimer timer = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 5000).start();
// CountdownTimer timer = CountdownTimerService.getNewCountdownTimer(this).configure(200, 10000).start();

//// Implement the two required callback events.
// void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){
//   if(t = timer){
//     myTickEvent();
//   }
//   if(t = timer2){
//     myOtherTickEvent();
//   }
// }

// void onFinishEvent(CountdownTimer t){
//   myFinishEvent();
// }