$(document).on('ajax:success', function (event) {
    var data = event.detail[0];
    $('#results').html(data);
  });
  
  $(document).on('ajax:error', function (event) {
    var xhr = event.detail[0];
    alert('Произошла ошибка: ' + xhr.statusText);
  });