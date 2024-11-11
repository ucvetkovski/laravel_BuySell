const BASE_URL=window.location.origin;
$(document).ready(function () {

$('.multiple-items').slick({
  infinite: true,
  slidesToShow: 3,
  slidesToScroll: 2,
  autoplay: true,
  autoplaySpeed: 2000
});

$('.single-item').slick({
    autoplay: true,
    autoplaySpeed: 3000
});

$('.slick-next').html('<i class="fa-solid fa-arrow-right"></i>');
$('.slick-prev').html('<i class="fa-solid fa-arrow-left"></i>');


$('#city_div').hide();
$('#address_div').hide();

if ($('#country').val() != null) {
  cities();
}

  $('#country').change(function () {
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

$(".state_filter").on('click', function () {
   filter();
})

$("#filtersDiv").on('click', '.category_checkbox', function() {
  filter();
})

$(".type_filter").on('click', function () {
  filter();
})

$('#min_price').keyup(function(event){
        if(event.keyCode === 13){
          filter();
        }
});
    
  $('#max_price').keyup(function(event){
        if(event.keyCode === 13){
          filter();
        }
  });

  $('#keyword').keyup(function(event){
    if (event.keyCode === 13) {
          
          filter();
        }
  });

$('#sort').on('change', function () {
  filter();
})
  
  
    
$(document).on('click', '.pageBtn', function () {
  filter($(this).attr('data-id'));
  window.scrollTo(0,0);
})
  

  if (document.getElementById('itemsDiv')) {
    filter();
  }


  function filter(page = 1) {
  
  let itemConditions = [];
  let conditionCheckbox=document.querySelectorAll('.state_filter');
  conditionCheckbox.forEach(function(c){
        if(c.checked)
            itemConditions.push(c.value)
  });
  
  let priceTypes = [];
  let types=document.querySelectorAll('.type_filter');
  types.forEach(function(c){
        if(c.checked)
            priceTypes.push(c.value)
  });
  
  let categoryCollection = [];
  let cats=document.querySelectorAll('.category_checkbox');
  cats.forEach(function(c){
        if(c.checked)
            categoryCollection.push(c.value)
    });

  $.ajax({
  url: '/search',
    method: 'get',
    data: {
      page: page,
      keyword: $("#keyword").val(),
      minPrice: $("#min_price").val(),
      maxPrice: $("#max_price").val(),
      sortBy: $("#sort").val(),
      priceType: priceTypes,
      category: categoryCollection,
      state: itemConditions
    },
  success: function (response) {
    
    $("#itemsDiv").html(response.reply);
    $("#pagination").html(response.pagination);
  },
  error: function (error) {
    console.log(error);
  }
})
}

})


$("#addItemBtn").on('click', function () {


  let form_data = new FormData();
  files = $('#image').prop('files');
  files_array = [];

  Array.from(files).forEach(file => 
    form_data.append('files[]',file)
  );
  
  form_data.append('_token', $("#addItemBtn").attr("data-token"));
  form_data.append('name', $("#addName").val());
  form_data.append('category', $("#addSelect").val());
  form_data.append('state', $("#addCondition").val());
  form_data.append('price', $("#addPrice").val());
  form_data.append('type', $("#addPriceSelect").val());
  form_data.append('description', $("#description").val());
  
  console.log(form_data);
  $.ajax({
    url: '/addItem',
    method: 'post',
    cache: false,
    contentType: false,
    processData: false,
    data: form_data,
    success: function (response) {
      window.location.href = response.response;
    },
    error: function (error) {
      console.log(error);
    }
  })
})



//   $.ajax({
//     url: '/addItem',
//     method: 'post',
//     data: {
//       name: $("#addName").val(),
//       price: $("#addPrice").val(),
//       category: $("#addSelect").val(),
//       type: $("#addPriceSelect").val(),
//       state: $("$addCondition").val(),
//       description: $("#description").val(),
//       image: $("#image").val()
//     }
//   })
// })

$('#errorsDiv').hide();
$("#purchaseBtn").on('click', function () {
  $.ajax({
    url: '/checkout',
    method: 'post',
    data: {
      _token: $("#purchaseBtn").attr("data-token"),
      _method: 'post',
      cardNumber: $("#cardNumber").val(),
      month: $("#month").val(),
      year: $("#year").val(),
      saveCardData: $("#saveCardData").is(":checked"),
      buyer: $("#user").val(),
      item: $("#item").val(),
      cvv: $("#cvv").val(),
    },
    dataType: 'json',
    success: function (response) {
      window.location.href = BASE_URL + "/profile";
    },
    error: function (error) {
      console.log(error);
      let ers="";
            error.responseJSON.errors.forEach(x => {
                ers+=x+"<br/>";
            });
      $('#errorsDiv').html(ers);
      $('#errorsDiv').show();
    }
  })
})