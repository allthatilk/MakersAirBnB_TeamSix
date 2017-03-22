$( function() {
    $( "#calendar" ).datepicker({beforeShowDay: unavailableDates,
                                 minDate: 0});
  } );

unavailableDates = function(date) {
  for (i = 0; i < bookedDateArray.length; i++) {
    if (date.getMonth() == bookedDateArray[i][1] - 1 && date.getDate() == bookedDateArray[i][0]) {
      return [false, "unavailable"];
    }
  }
  return [true, ""];
}
