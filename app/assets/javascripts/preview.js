$(function(){
  for (var i=0; i<= 3 ; i++){show_preview(i);}
});

function show_preview(num) {
  $(".js-preview").on("change", function() {
    var file = this.files;
    if (!file[0].type.match(/^image\/(png|jpeg|gif)$/)) return;
    var reader = new FileReader();
    var target_id = $(this).data("preview");
    reader.onload = function (e) {$(target_id).attr('src', e.target.result).show();}
    reader.readAsDataURL(file[0]);
  });
};

$(function create_image_form(){
  $(".image-upload-plus").on("click", function(){$(".image-upload-plus").hide();
  $(".image-upload.hidden").removeClass("hidden");
  });
});
