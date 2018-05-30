import Timer from 'easytimer'

function redirectToBreakNew(timer) {
  if(targetAchieved(timer)){
    console.log("redirect break");
    const id = document.getElementById("timer").dataset.sessionid
    console.log(`/timer_sessions/${id}/breaks/new`)
    window.location.href =`/timer_sessions/${id}/breaks/new`
  }

  // rediredctio to break new
}

function targetAchieved(timer) {
  const target = document.getElementById("timer").dataset.limit
  console.log(timer.toString())
  console.log(target)
  return(timer.toString() === target);
}

function startTimerSession() {

  const timer = new Timer();
  timer.start();
  timer.addEventListener('secondsUpdated', function (e) {
    $('#timer').html(timer.getTimeValues().toString());
    redirectToBreakNew(timer.getTimeValues())
  });
}
global.startTimerSession = startTimerSession
