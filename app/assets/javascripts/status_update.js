$(document).on("turbolinks:load", function() {
  let authenticity_token;
  const refreshStatus = function() {
    const id = $(this).data('id');
    const health_interview_id = $(this).data('health-interview-id');
    // authenticity_token = $("input[name=authenticity_token]").val();
    authenticity_token = authenticity_token || $("input[name=authenticity_token]").val();

    console.log(authenticity_token);
    const status = $(this).val();
    $.ajax({
      type: 'PATCH',
      url: '/health_interviews/' + health_interview_id + '/guide_statuses/' + id,
      data: {
        authenticity_token,
        guide_status: {
          id,
          health_interview_id,
          status: status
        }
      },
      dataType: 'json',
    })
    .always(function(data, textStatus, jqXHR){
      $.ajax({
        type: 'GET',
        url: '/health_interviews/',
        dataType: 'HTML',
      }).always(function(data, textStatus, jqXHR) {
        const dom = new DOMParser().parseFromString(data, 'text/html');
        const list_dom = dom.getElementById("health-interviews_index-form");
        $("#health-interviews_index-form").replaceWith(list_dom.parentElement.innerHTML);
        $('.js-status').change(refreshStatus);
      });
    })
  }
  $('.js-status').change(refreshStatus);
});