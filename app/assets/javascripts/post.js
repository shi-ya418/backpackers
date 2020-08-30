$(document).on('turbolinks:load', function(){
  $(function(){
    function appendOption(category) {
      let html = 
        `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    function appendChildrenBox(insertHTML) {
      let childSelectHtml = '';
      childSelectHtml = 
        `<select class="category__children--select" id="children_category">
           <option value="" data-category="" >選択してください</option>
           ${insertHTML}</select>
         <i class = "fa fa-chevron-down"></i>`;
      $('#children_box').append(childSelectHtml);
    }
    $(document).on("change","#parent_category", function() {
      let parentCategory =  $("#parent_category").val();
      if (parentCategory != "") {
        $.ajax( {
          type: 'GET',
          url: 'get_category_children',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children) {
          $("#children_box").empty();
          let insertHTML = '';
          children.forEach(function(child) {
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function() {
          alert('error：子カテゴリーの取得に失敗');
        })
      }else{
        $("#children_box").empty();
        $("#grandchildren_box").empty();
      }
    });
  })
})