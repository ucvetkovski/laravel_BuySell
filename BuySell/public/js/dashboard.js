$(function () {
  $(document).ready(function () {
            $("#userResult").hide();
    createDashBoardItems();

    $("#logData").ready(function () {
      $.ajax({
        url: '/log',
        method: 'get',
        success: function (response) {
          let data = response.split(' ');
          let dataArray = [];
          for (let i = 5; i < data.length; i += 6){
            dataArray.push(data[i]);
          }
          let logData = [];
          dataArray.forEach(element => {
            logData.push(JSON.parse(element));
          });

          let result = `<table class='table table-striped'>
          <thead>
          <tr>
          <td>#User</td>
          <td>Accessed</td>
          </tr>
          </thead><tbody>`;
          logData.forEach(logEntry => {
            if (logEntry['request_method'] == "POST") {
                          result += `<tr>
            <td>${logEntry['id_user']}</td>
            <td>${logEntry['request_url']}</td>
            </tr>`;
            }
          })
          result += `</tbody></table>`;
          $("#logData").html(result);
        },
        error: function (error) {
          console.log(error);
        }
      })
    })

  $('#city_div').hide();
    $('#address_div').hide();



if ($('#country').val() != null) {
  cities();
}
    $("#country").change(function () {
      cities();
    })

    
    $("#userResult").on('change', '#country', function () {
      cities();
    })



function cities() {
  let id = $("#country").val();
  let token = $("#country").attr('data-token');
  let userCity = $("#userCity").val();


  $.ajax({
    url: '/getCities',
    method: 'post',
    data: {
      _method: 'post',
      _token: token,
      id: id
    },
    success: function (result) {
      let response = '';
      response = `<label for="city">City</label><select class="form-select p-2 col-md-6" id="city" name="city">
                        <option selected disabled>Select a city</option>`;
      result.forEach(item => {
        response += `<option ${item['id_city'] == userCity ? 'selected' : ''} value="${item['id_city']}" id="${item['city_name']}">${item['city_name']}</option>`;
      });

      $('#city').html(response);
      $('#city_div').show();
      $('#address_div').show();
      console.log(result);
    },
    error: function (error) {
    console.log(error);
    }
  })
}

    $("#tableUsers").on('click', '.editUserBtn', function () {
          getUserData($(this).attr('data-token'), $(this).attr('id'));
    })
    $("#tableUsers").on('click', '.deleteUserBtn', function () {
      id = $(this).attr('id');
      $.ajax({
        url: '/deleteUser',
        method: 'post',
        data: {
          id: id,
          _token: $(this).attr('data-token'),
          _method: 'post'
        },
        success: function (response) {
          loadUsers();
        },
        error: function (error) {
          console.log(error)
        }
      });
    })
  $("#searchUserBtn").on('click', function () {
    getUserData($("#searchUserBtn").attr('data-token'), $("#userToEdit").val());
  })


  function getUserData(ttoken, iid) {
    let token = ttoken;
    $.ajax({
      url: '/getUserData',
      method: 'post',
      data: {
        _method: 'post',
        _token: token,
        id: iid,
      },
      success: function (response) {
        $("#userResult").html(response.user);
            cities();
        $("#userResult").show();
      },
      error: function (error) {
        console.log(error);
      }
    })
  }
    
      function loadUsers() {
    $.ajax({
    url: "/users",
    method: 'get',
    dataType: 'json',
    success: function (response) {
      $("#usersResultDiv").html(response.users);
    },
    error: function (error) {
      console.log(error);
    }
  })
  }
  $("#tableUsers").ready(function () {
    loadUsers();
  })
    
    
  })

  function createDashBoardItems() {
    $.ajax({
      url: '/getTransactionData',
      method: 'get',
      success: function (response) {
        console.log(response);
        createChart(response.sellers, response.buyers, response.userCount);
      },
      error: function (error) {
        console.log(error);
      }
    });

    function createChart($a,$b,$userCount) {
     var breakup = {
    color: "#adb5bd",
    series: [($b/$userCount)*100, ($a/$userCount)*100],
    labels: ["Buyers", "Sellers"],
    chart: {
      width: 180,
      type: "donut",
      foreColor: "#adb0bb",
    },
    plotOptions: {
      pie: {
        startAngle: 0,
        endAngle: 360,
        donut: {
          size: '45%',
        },
      },
    },
    stroke: {
      show: false,
    },

    dataLabels: {
      enabled: false,
    },

    legend: {
      show: false,
    },
    colors: ["#d11724", "#0e70b5"],

    responsive: [
      {
        breakpoint: 991,
        options: {
          chart: {
            width: 150,
          },
        },
      },
    ],
    tooltip: {
      theme: "dark",
      fillSeriesColor: false,
    },
  };

  var chart = new ApexCharts(document.querySelector("#breakup"), breakup);
  chart.render();

  }
  }

  function getRecentTransactions() {
    $.ajax({
      url: '/getRecentTransactions',
      method: 'get',
      success: function (response) {
        console.log(response);
        createChart(response.sellers, response.buyers, response.userCount);
      },
      error: function (error) {
        console.log(error);
      }
    })
  }




})

