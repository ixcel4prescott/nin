$(function(){

  //$('.part2').hide();

  $('.back').click(function() {
    $('.part2').hide();
    $('.part1').show();
  });

  // $('form#new_job_request').bind('ajax:success', function(evt, data, status, xhr){
  //   //console.log( {'evt':evt, 'data':data, 'status':status, 'xhr':xhr } )
  //   $('.part2').show();
  //   $('.part1').hide();
  // })

  // auto filling out scheduled-locations from address book
  $('#scheduled-locations tr').click(function() {
    $.each($(this).data().location, function(k, v)
    { 
      $('#job_request_physical_address_attributes_'+k).val(v);
    });

    lookup_interps();

  });

  $('#job_request_physical_address_attributes_zip ').blur(function() {

    if( $('#job_request_physical_address_attributes_zip').val() ){
      lookup_interps();
    }

  });

  $('#gender').change(function() {
    lookup_interps();
  });

  $('#choose_interpreters').click(function() {

    var interpArray = [];
    $('.interpListing tr.selected').each(function() {
     interpArray.push($(this).data('interp_id'));
     $('#new_job_request').append('<input type="hidden" name="preferred_interpreters[]" value="'+$(this).data('interp_id')+'" >');
   });
    //$('input#preferred_interpreters').val('['+interpArray+']');
    $('#interp_listing').modal('hide');
    $('.aval_intep').html(' Interpreters Selected');
    $('.num_aval_interp').html(interpArray.length);
  });




})


function lookup_interps() {
  $('#interp_listing_body table').html('');
  $('.num_aval_interp').html('');
  $('.aval_intep').html("loading...");
  $.post(interpreters_available, $('#new_job_request').serialize(), function(data)
  {

    $('.aval_intep').html(' Available Interpreters');
    $('.num_aval_interp').html(data.length);
    $('#list_interps').removeClass('disabled');
    // console.log(data);

    $.each(data, function() {
      $('#interp_listing_body table').append('\
        <tr data-interp_id="'+this.id+'">\
        <td style="width:78px;" class="imageFace">\
        <img src="/assets/face.jpg" >\
        </td>\
        <td>\
        <h3>'+this.first_name+' '+this.last_name+'</h3> <span class="stars">*****</span>\
        <p>\
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam laoreet\
        blandit orci eget commodo. Sed convallis aliquam enim ut volutpat. Praesent\
        adipiscing dignissim aliquet. Maecenas accumsan suscipit mi, sit amet\
        volutpat erat bibendum id. Vivamus quis tortor non nisl rutrum consectetur.\
        </p>\
        </td>\
        <td style="width:200px;">\
        '+this.years_experience+' Certifications Here\
        </td>\
        <td width="20">\
        <input class="interp_check" type="checkbox" />\
        </td>\
        </tr>\
        ');
    });

    $('#interp_listing_body table tr').hover(function() {
      $(this).addClass('text-hover');
    },function () {
      $(this).removeClass('text-hover');
    });

    $('#interp_listing_body table tr').click(function() {
      if($(this).hasClass('selected')){
        $(this).children('td').children('input').prop('checked', false);
        $(this).removeClass('selected');
      }else{
        $(this).children('td').children('input').prop('checked', true);
        $(this).addClass('selected');
      }
    });

  }).error(function() 
  { 
    $('.aval_intep').html("Whoops not quite ready"); 
  });

};

  



