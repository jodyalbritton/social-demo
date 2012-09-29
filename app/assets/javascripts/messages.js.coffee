jQuery ->
  $('#message_user_tokens').tokenInput '/contacts.json'
    theme: 'facebook'
    zindex: 9999
    prePopulate: $('#message_user_tokens').data('load')