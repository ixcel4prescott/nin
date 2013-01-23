
var advanced_rates = false;

(function($){
  $(function() {

    $('.work-address-Wrap').hide();

    $(".sameAsW").click(function(){

      if ($(this).is(":checked")) {
        $('.work-address-Wrap').hide();
      } else {
        $('.work-address-Wrap').show();
      }

    });


    $('.payment-address-Wrap').hide();

    $(".sameAsP").click(function(){

      if ($(this).is(":checked")) {
        $('.payment-address-Wrap').hide();
      } else {
        $('.payment-address-Wrap').show();
      }

    });


    //$('.click').click();

    $("select.pm_select").change(function(){

      hideset();

      switch($(this).val())
      {
        case "paypal":

        $('.pm_spans').show();
        $('.pm_paypal_account').show();

        break;
        case "direct":

        $('.pm_spans').show();
        $('.pm_bank_account').show();
        $('.pm_bank_routing').show();
        $('.pm_bank_name').show();

        break;
        case "check":

        $('.pm_check_checkbox').show();

        if ($(".sameAsP").is(":checked")) {
          $('.payment-address-Wrap').hide();
        } else {
          $('.payment-address-Wrap').show();
        }

        break;
      }

    });

    hideset();

    $("select.pm_select").change();

    $('.full-height').height($('.body').height());

    $('.advanced_pricing_plan').hide();

    $(".pricing_plan_click").click(function(){
      //$('.click_on_que').click();
      advanced_rates = (advanced_rates) ? false : true;
      $('.advanced_pricing_plan').toggle('fast');
      $('.simple_pricing_plan').toggle('fast');
    })

    
    $('#new_interpreter').submit(function() {
      if (!advanced_rates)
      {
        $('.advanced_pricing_plan').remove();
      }else{
        $('.simple_pricing_plan').remove();
      }

      if ($(".sameAsW").is(":checked")) {
        $('.work-address-Wrap').remove();
      }

      if ($(".sameAsP").is(":checked")) {
        $('.payment-address-Wrap').remove();
      }


    });

    // $("#new_interpreter").on('ajax:beforeSend', function() {
    //  return confirm("Are you sure?");
    //   if (!advanced_rates)
    //   {
    //     $('.advanced_rates_wrap').remove();
    //   }
    // });



    // $('.normal_rates_table select').change(function(){

    //   if ( $(this).val() == "24" )
    //   {
    //     $(this).siblings('select').val($(this).val());
    //     $(this).siblings('select').data('was_nil', true);
    //     $(this).data('was_nil', true);

    //   } 
    //   else if ( $(this).data('was_nil') )
    //   {
    //     $(this).siblings('select').val($(this).val());
    //     $(this).data('was_nil', false);
    //     $(this).siblings('select').data('was_nil', false);
    //   }
    
    // })


  $('.step').hide();
 
  $('#step1 input').bind('keypress', function(e) {
    if(e.keyCode==13){
      window.location.hash = 'step2';
    }
  });

  if(window.location.hash){
      $(window.location.hash).show();
  }
  
  $(window).bind('hashchange', function() {

        if(window.location.hash != '#step1' ){
            var f = false;
        $('input.required').each(function(){
            if (!$(this).val()){
                $(this).wrap('<span class="field_error" />');
                f = true;
            }
        });
        if ($('input#user_password_confirmation').val() != $('input#user_password').val()){
          $('input#user_password_confirmation').wrap('<span class="field_error" />');
          $('input#user_password').wrap('<span class="field_error" />');
          f = true;
        }
        if(f){
         window.location.hash = 'step1';
         $('form#new_user').prepend('<div id="errors" class="alert alert-error fade in"><button type="button" class="close" data-dismiss="alert">×</button><p>Oops! Not all the fields are filled out or maybe your passwords dont match?</p></div>')
        }
      }

    $('.step').hide();
    $(window.location.hash).show();
    if(!window.location.hash){
        $('#step1').show();
    }
  });

  }); 


  function hideset()
  {
    $('.pm_spans, .pm_spans, .pm_paypal_account, .pm_spans, .pm_bank_account, .pm_bank_routing, .pm_bank_name, .pm_check_checkbox, .payment-address-Wrap').hide();
  }




  $(function(){

    $('#interpreter_middle_name').tooltip({
      title : 'Middle initial',
      trigger : 'hover',
      placement : 'top'
    })

    $('#add_virtual_addresses_btn').popover({
      title : 'what is a virtual addresses?',
      trigger : 'hover',
      content : 'Words and more words. Words and more words.'
    })

    $('.interpreter_certifications_comment').popover({
      title : 'what is a certification comment?',
      trigger : 'hover',
      content : 'Words and more words. Words and more words.',
      placement : 'top'
    })

    $('.skills_experience').popover({
      title : 'what is skills experience?',
      trigger : 'hover',
      content : 'Words and more words. Words and more words.',
      placement : 'top'
    })

  });


})(jQuery);



/// Validation for first layer of registration













//$('.sameAs').fieldClone({from:'.mailing_address_wrap', too:'.work_address_wrap', showHide:false});



// (function($){

//   $.fn.extend({ 

//     fieldClone: function(options) {

//       var defaults = { from  : '', too   : '' }
//       var o =  $.extend(defaults, options);

//       this.click(function() {

//         if ($(this).is(":checked")) {

//         if(o.showHide){
//           $(o.too).children().hide();
//         }

//         $(o.too).find('input').each(function(i) { 

//           $(this).val( 
//             $(o.from).find('input').eq(i).val()
//           );

//         });

//         $(o.too).find('select').each(function(i) { 

//           $(this).val(
//             $(o.from).find('select').eq(i).val()
//           );

//         });               

//         } else {

//           if(o.showHide){
//             $(o.too).children().show()
//           }

//           $(o.too).find('input').val('');
//           $(o.too).find('select').val(1);

//         }

//       });

//     }

//   });

// })(jQuery);


