import Timer from 'easytimer'

function redirectToBreakNew(timer) {
  console.log(targetAchieved(timer))
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
  const dataSetLimits = document.getElementById("timer").dataset
  const focusLimit = dataSetLimits.limit
  const breakLimit = dataSetLimits.breaklimit
    console.log(breakLimit)
  if (breakLimit) {
    return (timer.seconds === parseInt(breakLimit)) ? true : false;
  } else {
    console.log(timer.seconds)
    console.log(parseInt(focusLimit))
    return (timer.seconds === parseInt(focusLimit)) ? true : false;
  }
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

// import Timer from 'easytimer'

// function redirectToBreakNew(timer) {
//   if(targetAchieved(timer)){
//     const dataSetTimer = document.getElementById("timer").dataset
//     const idSession = dataSetTimer.sessionid
//     const idBreak = dataSetTimer.break
//     if (idBreak) {
//       window.location.href = `/timer_sessions/${idSession}`
//     } else {
//       window.location.href =`/timer_sessions/${idSession}/breaks/new`
//     }
//   }

//   // rediredctio to break new
// }

// function targetAchieved(timer) {
//   const target = document.getElementById("timer").dataset.limit
//   console.log(timer.toString())
//   console.log(target)
//   return(timer.toString() === target);
// }

// function startTimerSession() {

//   const timer = new Timer();
//   timer.start();
//   timer.addEventListener('secondsUpdated', function (e) {
//     $('#timer').html(timer.getTimeValues().toString());
//     redirectToBreakNew(timer.getTimeValues())
//   });
// }
// global.startTimerSession = startTimerSession
