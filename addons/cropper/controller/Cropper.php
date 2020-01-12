<?php
// +-----------------------+
// | 注释不留名，代码随便用 |
// +-----------------------+

namespace addons\cropper\controller;


use think\Controller;

class Cropper extends Controller
{
    /**
     * 图片裁切
     * @auth true
     * @return mixed
     */
    public function index(){
        config('template.view_depr', '.');
       return $this->fetch();
    }
}