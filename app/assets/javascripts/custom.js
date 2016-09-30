$(document).ready(function(){
    $(".thumb_image").click(function(){
        src=$(this).attr('src');
    $(".large_thumb img").fadeOut(500,function(){
        $(this).attr("src",src).fadeIn(500);
    });
    });
    $(".bar_container").click(function(){
        if($(".items ul li").hasClass("intro"))
        {
        $(".items ul li").slideUp(1000);
        $(".items ul li").removeClass("intro");
        }
        else
        {
         $(".items ul li").slideDown(1000); 
        $(".items ul li").addClass("intro");
        }
    });

    $(".cat_icon").click(function(){
    
        if($(".menu").hasClass("introd"))
        {
        $(".menu").slideUp(500);
        $(".menu").removeClass("introd");
        }
        else
        {
        $(".menu").slideDown(500);
        $(".menu").addClass("introd");       
        }
    });
    $(".filter_respo").click(function(){
    
        if($(".fliter_container").hasClass("introdc"))
        {
        $(".fliter_container").slideUp(500);
        $(".fliter_container").removeClass("introdc");
        }
        else
        {
        $(".fliter_container").slideDown(500);
        $(".fliter_container").addClass("introdc");       
        }
    });
    
    $(window).load(function() {
    $("#nav > li > a").click(function (e) { // binding onclick
        if ($(this).parent().hasClass('selected')) {
            $("#nav .selected div div").slideUp(100); // hiding popups
            $("#nav .selected").removeClass("selected");
        } else {
            $("#nav .selected div div").slideUp(100); // hiding popups
            $("#nav .selected").removeClass("selected");
            if ($(this).next(".subs").length) {
                $(this).parent().addClass("selected"); // display popup
                $(this).next(".subs").children().slideDown(200);
            }
        }
        e.stopPropagation();
    });
 
    $("body").click(function () { // binding onclick to body
        $("#nav .selected div div").slideUp(100); // hiding popups
        $("#nav .selected").removeClass("selected");
    });

});
    $(".login").click(function(){
        $(".full").slideDown(500);
    })
    $(".close").click(function(){
        $(".full").slideUp(500);
    })
       $(".view_cart").click(function(){
        $(".cart_full").slideDown(700);
    })
    $(".cart_close").click(function(){
        $(".cart_full").slideUp(700);
    })
          $(".view_whats_app").click(function(){
        $(".whats_app_ful").slideDown(700);
    })
    $(".whats_app_close").click(function(){
        $(".whats_app_ful").slideUp(700);
    })
   });


