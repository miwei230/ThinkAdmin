// +-----------------------+
// | 注释不留名，代码随便用 |
// +-----------------------+

require.config({
    map: {'*': {css: window.baseRoot + 'plugs/require/css.js'}},
    paths:{
        'selectpage-build': '/addons/manager/selectpage/build',
        'selectpage':'/addons/manager/selectpage/selectpage',
        'vue': '/addons/manager/vue/vue'
    },
    shim:{
        'selectpage': {deps: ['jquery', 'css!/addons/manager/selectpage/selectpage.css']},
    }
});
require(['jquery'], function () {
    var cb = $.form.reInit;
    /**
     * 重写admini.js的 $.form.reInit方法
     * @param $element
     */
    $.form.reInit = function($element){
        cb && cb($element)
        if ($element.find('input[data-switch]').size() > 0) {
            /**
             * @data-switch ajax开关,0#1 切换值
             *@data-url 请求地址
             * @data-field 数据字段，默认status
             */
            $element.find('[data-switch]').map(function () {
                if ($(this).parents('.layui-form').length === 0) {
                    $(this).parent().addClass('layui-form');
                }
                var url = $(this).data('switch');
                var filter = $(this).attr('lay-filter');
                window.form.on('switch(' + filter + ')', function (data) {
                    var $this = $(data.elem)
                        , field = $this.attr('name')
                        , param = $this.data('param')
                    param += '&' + field + '=' + (data.elem.checked ? 1 : 0);
                    $.form.load(url, param, 'post', function (res) {
                        if (res.code) {
                            $.msg.success(res.info);
                        } else {
                            $this.prop('checked', !$this.prop('checked'));
                            window.form.render('checkbox');
                            $.msg.error(res.info);
                        }
                        return false;
                    });
                })
            });
            window.form.render();
        }
        //自动渲染日期时间输入框 start
        $element.find('input[data-date]').map(function () {
            var $this = $(this);
            laydate.render({
                elem: this,
                type: $(this).data('type') || 'datetime',
                format: $(this).data('format'),
                done: function (value, date, endDate) {
                    $this.val(value).trigger('change');
                }
            });
            this.setAttribute('autocomplete', 'off');
        });
        //自动渲染这富文本编辑器
        if ($element.find('textarea.editor').size() > 0) {
            require(['ckeditor'], function () {
                $body.find('textarea.editor').map(function () {
                    var height = $(this).data('height') || 500,
                        option = {height: height};
                    $(this).attr('id', $(this).attr('id') || (Math.random() + '').replace('.', '_'));
                    window.CKEDITOR.replace($(this).attr('id'), option || {});
                });
            })
        }
        //文件上传
        $element.find('[data-upload-image]').map(function () {
            var mode = $(this).data('upload-image') || 'one';
            if (mode === 'one') {
                $(this).uploadOneImage();
            } else {
                $(this).uploadMultipleImage();
            }
        });
        if ($element.find('[render-image]').size() > 0) {
            //渲染多图
            var images;
            $element.find('[render-image]').map(function () {
                var $this = $(this);
                images = $(this).attr('render-image');
                images = images.split('|');
                images.forEach(function (image) {
                    $this.append('<div class="uploadimage" data-tips-image = "' + image + '" style="background-image:url(' + image + ')"</div>');
                })
            })
        }
        if ($element.find('input.selectpage').size() > 0) {
            require(['selectpage-build'], function (call) {
                call($element.find('input.selectpage'));
            });
        }
        if ($element.find('div[preview-image]').size() > 0) {
                $element.find('div[preview-image]').map(function () {
                    var $div = $(this);
                    var images = $(this).attr('preview-image'), tpl, i;
                    if (!images) return;
                    images = images.split('|');
                    for (i in images) {
                        var $tpl = $('<div class="uploadimage uploadimagemtl"></div>');
                        $tpl.attr('data-tips-image', images[i]).css('backgroundImage', 'url(' + images[i] + ')');
                        $div.append($tpl);
                    }
                });
            }
    };
})