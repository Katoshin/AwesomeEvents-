
$(document).on 'ajax:success', '#createCheck', (xhr, data, status) ->
  location.reload()

$(document).on 'ajax:error', '#createCheck', (xhr, data, status) ->
  form = $('#new_Check .modal-body')
  div = $('<div id="createCheckErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  data.responseJSON.messages.forEach (message, i) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $('#createCheckErrors')[0]
    $('#createCheckErrors').html(ul)
  else
    div.append(ul)
    form.prepend(div)
