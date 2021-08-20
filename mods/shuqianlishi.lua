
function 打开历史()
  if 页面列表["书签"] then
    显示控件(书签背景外外外)
    vngggggg0=vngggggg
    名称="历史记录保存"
    showDataDialog(名称,"历史记录")
    list承载器.addView(listlayout)--添加控件
    vngggggg历史记录=vngggggg
    vngggggg=vngggggg0
    是否访问过历史记录=true
    --标题2="历史记录"
    标题.text="历史记录"
    隐藏控件(主页搜索2)
    if vngggggg书签 then
      隐藏控件(vngggggg书签)
    end
    if vngggggg历史记录 then
      显示控件(vngggggg历史记录)
    end
    --上升动画
    --相关参数，请自行手册查询
    --定义动画,500为上升高度。
    yuxuandh3=TranslateAnimation(AWidth,0,0,0)
    --动画时间，也就是上升动画的快慢
    yuxuandh3.setDuration(200)
    --动画开始执行
    书签背景外外.startAnimation(yuxuandh3);
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(200)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    书签背景外.startAnimation(透明动画)
   else
    名称="历史记录保存"
    import "shu"
  end
end
function 打开书签()
  if 页面列表["书签"] then
    显示控件(书签背景外外外)
    vngggggg0=vngggggg
    名称="网页收藏"
    showDataDialog(名称,"书签")
    list承载器.addView(listlayout)--添加控件
    vngggggg书签=vngggggg
    vngggggg=vngggggg0
    是否访问过书签=true
    --标题2="书签"
    标题.text="书签"
    隐藏控件(主页搜索2)
    if vngggggg历史记录 then
      隐藏控件(vngggggg历史记录)
    end
    if vngggggg书签 then
      显示控件(vngggggg书签)
    end
    --上升动画
    --相关参数，请自行手册查询
    --定义动画,500为上升高度。
    yuxuandh3=TranslateAnimation(AWidth,0,0,0)
    --动画时间，也就是上升动画的快慢
    yuxuandh3.setDuration(200)
    --动画开始执行
    书签背景外外.startAnimation(yuxuandh3);
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(200)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    书签背景外.startAnimation(透明动画)
   else
    名称="网页收藏"
    import "shu"
  end
end