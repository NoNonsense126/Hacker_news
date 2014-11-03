
$(document).ready(function(){

  $(".vote").click(function(event){
    self = $(this);
    name = $(this).attr('class')
    event.preventDefault();
    $.ajax({
      type: "GET",
      url: self.attr("href"),
      success: function(result){        
        $("." + name.split(' ')[1] + " div").addClass("voted")
        }
      });
  });

});