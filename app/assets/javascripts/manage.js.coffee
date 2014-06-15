EmployeeManager = 
  initialize: ->
    $('body').on 'click', 'a.invite-employee', EmployeeManager.inviteEmployee 

  inviteEmployee: (event) ->
    event.preventDefault()
    name = $('.invite-name').val()
    email = $('.invite-email').val()
    $.ajax
      type: "POST",
      url: "/employees/invite/new"
      data: {name: name, email: email}
    .done (response) ->
      EmployeeManager.insertEmployee(response)

  insertEmployee:(employee) ->
    name = "<td>#{employee.name}</td>"
    email = "<td>#{employee.email}</td>"
    status = "<td><i class='fa fa-times'>Unregistered</i></td>"
    newEntry = "<tr>#{name}#{email}#{status}</tr>"
    $('#employees').append(newEntry)

$(document).ready ->
  EmployeeManager.initialize()