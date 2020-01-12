define(['selectpage'],function(){
    return function ($elements) {
        $elements.map(function (index,element) {
            var $element = $(element)
                ,options = {
                data: $element.data('source')
                ,keyField: $element.data('primarykey') || 'id'
                ,pageSize: $element.data('pagesize') || 10
                ,showField: $element.data('field') || 'name'
                ,params : function(){
                    return {
                        'orderby': $element.data('orderby') || {id: 'desc'}
                        ,'searchField': $element.data('search') || options.showField
                        ,'showField': options.showField
                        ,'isrree': $element.data('isrree') || 0
                        ,'keyField' : options.keyField
                        ,'where' : $element.data('where') || [],
                        'with': $element.data('with') || ''
                    };
                }
                ,eAjaxSuccess: function (res) {
                    if(res.code === 0 ) return [];
                    var data = res.data;
                    data.list = typeof data.rows !== 'undefined' ? data.rows : (typeof data.list !== 'undefined' ? data.list : []);
                    data.totalRow = typeof data.total !== 'undefined' ? data.total : (typeof data.count !== 'undefined' ? data.count : data.list.length);

                    return data;
                }
                ,eSelect: function(data){
                    var filter = $element.attr('data-callback') || $element.dataCallback || $elements.dataCallback;
                    if (typeof filter === 'function') {
                        // 如果数据过滤失败
                         filter(data);

                    }else if(typeof filter === 'string'){
                        window[filter](data);

                    }
                }
            };
            $element.selectPage(options)
        })

    }
});