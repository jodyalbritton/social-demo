jQuery ->
  $('#circle_user_tokens').tokenInput '/contacts.json'
    theme: 'facebook'
    zindex: 9999
    prePopulate: $('#circle_user_tokens').data('load')
