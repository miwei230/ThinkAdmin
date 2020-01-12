require(['jquery'], function () {
    !function () {
        //重写uploadOneImage
        $.fn.uploadOneImage = function () {
            var name = $(this).attr('name') || 'image', type = $(this).data('type') || 'png,jpg,gif';
            var $input = $(this);
            var $tpl = $('<a data-file="btn" class="uploadimage relative"></a>').attr('data-field', name).attr('data-type', type);
            $tpl.attr('data-background-image',  $tpl.css('backgroundImage'));
            $(this).attr('name', name).after($tpl.data('input', this)).on('change', function () {
                if (this.value) {
                    $tpl.css('backgroundImage', 'url(' + this.value + ')');
                    var icons = '<a class="position-right-top upload-icon layui-icon layui-icon-delete" ></a><a class="position-left-top upload-icon fa fa-crop " ></a><a class="fa fa-search-plus upload-icon  position-right-bottom"></a>';
                    $tpl.html(icons);
                }
            }).trigger('change');

            $tpl.on('click', 'a.layui-icon-delete', function (e) {
                e.stopPropagation();
                var $cur = $(this).parent();
                return $.msg.confirm('确定要移除这张图片吗？', function (index) {
                    $input.val('');
                    $tpl.css('backgroundImage', $tpl.attr('data-background-image')).html('');
                    $.msg.close(index);
                });
            }).on('click', 'a.fa-crop', function (e) {
                e.stopPropagation();
                var param = {
                    image: $input.val(),
                    name: name
                };
                Object.assign(param, $input.data());
                $.form.iframe('/addons/cropper-cropper-index' + $.param(param), '图片裁切', ['1200px', '750px'])
            }).on('click', 'a.fa-search-plus',function(e){
                $.previewImage($input.val());
                e.stopPropagation();
            });
            $tpl.uploadFile()
        }
    }();
});