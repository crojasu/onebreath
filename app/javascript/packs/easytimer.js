import Timer from 'easytimer'

function redirectToBreakNew(timer) {
  if(targetAchieved(timer)){
    const dataSetTimer = document.getElementById("timer").dataset
    const idSession = dataSetTimer.sessionid
    const idBreak = dataSetTimer.break
    if (idBreak) {
      window.location.href = `/timer_sessions/${idSession}`
    } else {
      window.location.href =`/timer_sessions/${idSession}/breaks/new`
    }
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

