ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
color=文字

st=(loadlayout("layout/dilanlayout"))
标题栏承载器.addView(loadlayout(获取标题栏("修改底栏样式",修改底栏样式,"修改底栏样式")))--添加控件
主页.addView(st)--添加控件
页面列表["修改底栏样式"]=true
设置背景外=设置背景外

import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"



波纹({一般样式,
  书签样式,
  搜索样式,
},"方",文字)--0xFF7F7F7F
一般样式.onClick=function()
  写入文件("/data/data/"..activity.getPackageName().."/底栏样式.xml","一般样式")
end
书签样式.onClick=function()
  写入文件("/data/data/"..activity.getPackageName().."/底栏样式.xml","书签样式")
end
搜索样式.onClick=function()
  写入文件("/data/data/"..activity.getPackageName().."/底栏样式.xml","搜索样式")
end
