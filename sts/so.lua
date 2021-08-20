ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
color=文字

主页搜索2高="wrap_content"
主页搜索CardViewlayout_margin="16dp"
主页搜索CardViewlayout_marginTop='2dp'
if 是否输入框诗句=="打开" then
  --主页搜索.hint=获取诗句()
  local rand=math.random(#aword-#aword+1,#aword)
  -- activity.getActionBar().setSubtitle(aword[rand])
  主页搜索hint=aword[rand]
 else
  主页搜索hint="输入网址或搜索"
  -- 主页搜索hint=获取诗句()
end
st=(loadlayout("layout/solayout"))
标题栏承载器.addView(loadlayout(获取标题栏("修改主页搜索栏样式",修改主页搜索栏样式外,"修改主页搜索栏样式")))--添加控件
主页.addView(st)--添加控件
页面列表["修改主页搜索栏样式"]=true
设置背景外=设置背景外
--导入包
import "android.content.Context"

function getwh(view)
  view.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
  height =view.getMeasuredHeight();
  width =view.getMeasuredWidth();
  return width,height
end
width,height=getwh(大圆角)
控件边框(大圆角,height/2,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
控件边框(中等圆角,圆角大小,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
控件边框(小圆角,dp2px("2"),"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
大圆角.onClick=function()
  写入文件("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml","大圆角")
end
中等圆角.onClick=function()
  写入文件("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml","圆角大小")
end
小圆角.onClick=function()
  写入文件("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml","2dp")
end