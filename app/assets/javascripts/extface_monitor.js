window.extface_jobs = [];
document.extface_monitor = function(url) {
  if (!!window.EventSource) {
    var source = new EventSource(url);
    var modal = $('#extface_monitor');
    var message = $('#extface_message');

    source.onmessage = function(e) {
      message.html(e.data);
    };
    
    source.onopen = function(e) {
      window.extface_jobs.push(url);
      modal.modal('show');
    };
    
    source.onerror = function(e) {
      window.extface_jobs.splice( $.inArray(url, window.extface_jobs), 1 );
      source.close();
      if (window.extface_jobs.length == 0) setTimeout(function(){modal.modal('hide');},1000);
    };
  }
};