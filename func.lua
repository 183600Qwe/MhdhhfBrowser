状态栏高度=activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)



网页列表={}
当前查看的页面=0

import "com.michael.NoScrollListView"--导入可以嵌套在Scrollview里的列表

w=activity.width
h=activity.height
AWidth=w
AHeight=h
function 转0x(j)
  if #j==7 then
    jj=j:match("#(.+)")
    jjj=tonumber("0xff"..jj)
   else
    jj=j:match("#(.+)")
    jjj=tonumber("0x"..jj)
  end
  return jjj
end
function isNightMode()
  local configuration = activity.getResources().getConfiguration();
  return configuration.uiMode+1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode-1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode==configuration.UI_MODE_NIGHT_YES
end
function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end

--defer
import "java.io.File"
function 写入文件(路径,内容)
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end
function 文件是否存在(id)
  return File(id).exists()
end
新悬浮按钮常用工具列表={"添加书签",
  "页内查找",
  "悬浮窗",
  "网页源码",
}
长按功能列表={
  网页后退="退出",
  网页前进="添加书签",
  打开菜单="工具箱",
  打开网页列表="新建窗口",
  返回主页="书签",
}
滑动菜单工具列表={"添加书签",
  "页内查找",
  "悬浮窗",
  "网页源码",
}
初始化列表={
  书签保存="",
  历史记录保存="",
  无痕模式="关闭",
  主页链接="仅搜索栏",
  主页是否显示收藏列表="关闭",
  允许网页打开外部应用="打开",
  定位="关闭",
  网页字体大小="100",
  搜索URL="https://www.baidu.com/s?word=搜索内容",
  暗色模式="关闭",
  暗色模式跟随系统="打开",
  一般强调色="#FF33A7AA",
  控件阴影="关闭",
  是否在主页显示搜索栏="打开",
  JS储存="",
  UA储存="Mozilla/5.0 (Linux; Android 7.1.1; OD105 Build/NMF26F; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.49 Mobile MQQBrowser/6.2 TBS/043409 Safari/537.36 MicroMessenger/6.5.13.1100 NetType/WIFI Language/zh_CN",
  是否启用纯搜索主页="关闭",
  网页缩放="关闭",
  下载记录="",
  滑动显示隐藏操作栏="关闭",
  输入框诗句="打开",
  主页搜索栏圆角=圆角大小,
  主页图片背景="关闭",
  滑动返回="打开",
  输入框诗句="打开",
  标题栏色="#FFFAFAFA",
  标题栏组件是否暗色="暗色",
  底栏样式="一般样式",
  是否全屏="关闭",
  下载器="Mhdhhf浏览器",
  主页标题是否居中="打开",
  标题显示内容="网页标题",
  是否保存表单数据="打开",
  无痕模式初次使用提醒信息对话框状态="关闭",
  浏览器页面标题栏背景是否为白色="打开",
  浏览器页面标题边框="打开",
  白色背景="关闭",
  主页项目="",
  长按功能=dump(长按功能列表),
  是否启用菜单按钮上滑功能="打开",
  菜单按钮上滑功能="搜索",
  常用网页滑动菜单="关闭",
  多窗口滑动菜单="关闭",
  工具滑动菜单="关闭",
  滑动菜单工具=dump(滑动菜单工具列表),
  是否把标题栏放到底栏中="关闭",
  是否操作栏自动变色="打开",
  是否恢复之前的书签="打开",
  脚本保存="",
  搜索引擎保存="",
  滑动菜单模式="关闭",
  打开滑动菜单所需的按钮距离屏幕右侧边缘的距离="打开",
  菜单滑动菜单="打开",
  工具脚本保存="",
  无图模式="关闭",
  是否启用新的滑动菜单样式="打开",
  是否启用更矮的滑动菜单按钮="打开",
  是否删除掉一部分滑动菜单的菜单="打开",
  打开滑动菜单所需的按钮显示位置="center|right",
  排序="按文件内容",
  是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口="打开",
  是否隐藏网页前进按钮="打开",
  是否隐藏切换窗口按钮="关闭",
  是否隐藏网页后退按钮="打开",
  是否在发起新搜索时新建一次窗口="关闭",
  跳转到另一个网页所有的时="创建能在下次跳转到另一个网页时更新的新窗口打开此网页",
  跳转到另一个域名的网页时="创建能在下次跳转到另一个网页时更新的新窗口打开此网页",
  是否将网页前进按钮和网页后退按钮改为书签按钮和历史按钮="关闭",
  是否不接受第三方cookie="关闭",
  阅读位置储存="{folder={},homepage={}}",
  是否隐藏快速输入网址器="关闭",
  书签添加器在已自动填充链接时显示链接="关闭",
  新悬浮按钮常用工具列表=dump(新悬浮按钮常用工具列表),
  双悬浮按钮中的左侧按钮="关闭",
  双悬浮按钮中的右侧按钮="关闭",
  双悬浮按钮模式="关闭",
}
圆角大小=dp2px(15)
--初始化列表项目个数=#初始化列表+8
初始化列表项目个数=83
if 文件是否存在("/data/data/"..activity.getPackageName().."/初始化列表项目个数.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/初始化列表项目个数.xml",tostring(初始化列表项目个数))
  for k,v in pairs(初始化列表) do
    if 文件是否存在("/data/data/"..activity.getPackageName().."/"..k..".xml")==false then
      写入文件("/data/data/"..activity.getPackageName().."/"..k..".xml",v)
    end
  end
 else
  初始化列表项目个数2=io.open("/data/data/"..activity.getPackageName().."/初始化列表项目个数.xml"):read("*a")
  if tonumber(初始化列表项目个数2)==初始化列表项目个数 then
   else
    for k,v in pairs(初始化列表) do
      if 文件是否存在("/data/data/"..activity.getPackageName().."/"..k..".xml")==false then
        写入文件("/data/data/"..activity.getPackageName().."/"..k..".xml",v)
      end
    end
    写入文件("/data/data/"..activity.getPackageName().."/初始化列表项目个数.xml",tostring(初始化列表项目个数))
  end
end

if 文件是否存在("/data/data/"..activity.getPackageName().."/程序启动事件.lua")==false then
  写入文件("/data/data/"..activity.getPackageName().."/程序启动事件.lua","--lua代码")
end
function 设置UC(UC代码)
  view.getSettings().setUserAgentString(UC代码)
  写入文件("/data/data/"..activity.getPackageName().."/UA储存.xml",UC代码)
end
打开滑动菜单所需的按钮距离屏幕右侧边缘的距离=io.open("/data/data/"..activity.getPackageName().."/打开滑动菜单所需的按钮距离屏幕右侧边缘的距离.xml"):read("*a")
if 打开滑动菜单所需的按钮距离屏幕右侧边缘的距离=="打开" then
  打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2=dp2px(56)
 else
  打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2=dp2px(0)
end
暗色模式跟随系统=io.open("/data/data/"..activity.getPackageName().."/暗色模式跟随系统.xml"):read("*a")
if 暗色模式跟随系统=="打开" then
  if isNightMode() then
    --这里是变深色的代码
    写入文件("/data/data/"..activity.getPackageName().."/暗色模式.xml","打开")
   else
    --这里是变浅色的代码
    写入文件("/data/data/"..activity.getPackageName().."/暗色模式.xml","关闭")
  end
end
--写入文件("/data/data/"..activity.getPackageName().."/长按功能.xml",dump(长按功能列表))

--if (activity.Title=="Mhdhhf浏览器")==false then--判断是否主页

--[[function 标题颜色(标题颜色w)
  --自定义ActionBar标题颜色
  import "android.text.SpannableString"
  import "android.text.style.ForegroundColorSpan"
  import "android.text.Spannable"
  sp = SpannableString(activity.Title)
  sp.setSpan(ForegroundColorSpan(标题颜色w),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
  activity.ActionBar.setTitle(sp)
end]]
--end
一般强调色=io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a")

function 刷新颜色()
  --标题栏色=io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")
  夜间模式=io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")
  if 夜间模式=="打开" then
    背景3="#F5191919"
    背景=0xFF191919
    背景2="#FF191919"
    卡片="#FF212121"
    网页覆盖色="#66191919"
    文字=0xFFffffff
    文字123=0xFFffffff
    文字qwe=0xFFffffff
    底栏="#FF191919"
    菜单背景="#DA313131"
    导航栏=0xFF191919
    对话框iop=0xFF212121
    标题栏组件色=0xFFffffff
    边框2="#27ffffff"
    较暗色2="#FF0C0C0C"
    小条="#37ffffff"
    小条2=0x12181818
    小条3="#12181818"
    开关关闭=0xFF9B9B9B
    activity.setTheme(android.R.style.Theme_Material)
    if 一般强调色=="#FF505050" then
      一般强调色="#FFffffff"
    end
   else
    白色背景=io.open("/data/data/"..activity.getPackageName().."/白色背景.xml"):read("*a")
    if 白色背景=="打开" then
      背景=0xFFffffff
      背景2="#FFffffff"
     else
      背景=0xFFFAFAFA
      背景2="#FFFAFAFA"
    end
    背景5="#DCFAFAFA"
    背景3="#F5FAFAFA"
    卡片="#FFF0F0F0"
    网页覆盖色="#00000000"
    文字=0xFF505050
    文字123=0xFF505050
    文字qwe=0x8e000000
    底栏="#FFffffff"
    菜单背景="#33000000"
    导航栏=0xFFffffff
    对话框iop=0xFFFFFFFF
    边框2="#FFF0F0F0"
    较暗色2="#FFE0E0E0"
    小条="#24181818"
    小条2=0x12181818
    小条3="#12181818"
    开关关闭=0xFF9B9B9B
    xpcall(function()
      if io.open("/data/data/"..activity.getPackageName().."/标题栏组件是否暗色.xml"):read("*a")=="浅色" then
        --丑角给的
        activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
       else
        activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
      end
      end,function(e)
      activity.Theme=(android.R.style.Theme_Holo_Light)
    end)
    if 一般强调色=="#FFffffff" then
      一般强调色="#FF505050"
    end
    标题栏组件色=转0x(一般强调色)
  end
  标题栏色=背景2
  activity.getWindow().setNavigationBarColor(导航栏)
end
刷新颜色()


--[[if (activity.Title=="Mhdhhf浏览器")==false then--判断是否主页
  import "android.graphics.drawable.ColorDrawable"
  function activity背景颜色(color)
    _window = activity.getWindow();
    _window.setBackgroundDrawable(ColorDrawable(color));
    _wlp = _window.getAttributes();
    _wlp.gravity = Gravity.BOTTOM;
    _wlp.width = WindowManager.LayoutParams.MATCH_PARENT;
    _wlp.height = WindowManager.LayoutParams.MATCH_PARENT;--WRAP_CONTENT
    _window.setAttributes(_wlp);
  end
  --该函数需设置布局后使用

  --调用例子
  activity背景颜色(背景)
end]]

if 滑动菜单模式=="打开" then
 else
  底栏样式=io.open("/data/data/"..activity.getPackageName().."/底栏样式.xml"):read("*a")
  if 底栏样式=="一般样式" then
    第四个按钮图标=nil
   elseif 底栏样式=="书签样式" then
    第四个按钮图标="png/fglkg.png"
   elseif 底栏样式=="搜索样式" then
    第四个按钮图标="png/mmm.png"
  end
  浏览器页面标题边框=io.open("/data/data/"..activity.getPackageName().."/浏览器页面标题边框.xml"):read("*a")
  if 浏览器页面标题边框=="打开" then
    标题tlayout_marginLeftRight="12dp"
    网页标题副父布局内layout_margin="5dp"
    标题ttextSize="14sp"
   else
    标题tlayout_marginLeftRight="0"
    网页标题副父布局内layout_margin="0"
    标题ttextSize="16sp"
  end
end
主页链接=io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")
if 主页链接=="仅搜索栏" then
  主页搜索2高="fill"
  主页搜索CardViewlayout_margin="16dp"
  主页搜索CardViewlayout_marginTop="-44dp"--0
 else
  主页搜索2高="wrap_content"
  主页搜索CardViewlayout_margin="16dp"
  主页搜索CardViewlayout_marginTop='46dp'
end
打开滑动菜单所需的按钮显示位置=io.open("/data/data/"..activity.getPackageName().."/打开滑动菜单所需的按钮显示位置.xml"):read("*a")
if 打开滑动菜单所需的按钮显示位置=="center|left" then
  打开滑动菜单所需的按钮距离屏幕左侧边缘的距离2=打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2
  打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2=dp2px(0)
 else
  打开滑动菜单所需的按钮距离屏幕左侧边缘的距离2=dp2px(0)
end
task(1,function()
  import "android.webkit.WebView"
  import "android.webkit.CookieManager"
  import "com.nirenr.Color"
  import "android.graphics.Color"
  --import "listlayout2"
  import "android.animation.ObjectAnimator"
  import "android.view.animation.DecelerateInterpolator"
  import "android.view.animation.ScaleAnimation"
  import "dzdd"
  import "android.net.Uri"
  import "java.util.HashMap"
end)

是否允许网页打开外部应用=io.open("/data/data/"..activity.getPackageName().."/允许网页打开外部应用.xml"):read("*a")
网页字体大小=io.open("/data/data/"..activity.getPackageName().."/网页字体大小.xml"):read("*a")
--print(io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a"))
定位=io.open("/data/data/"..activity.getPackageName().."/定位.xml"):read("*a")
主页是否显示收藏列表=io.open("/data/data/"..activity.getPackageName().."/主页是否显示收藏列表.xml"):read("*a")
是否输入框诗句=io.open("/data/data/"..activity.getPackageName().."/输入框诗句.xml"):read("*a")

全屏模式状态="关闭"
--[[function 设置浏览器长按事件(pweb)
  网页链接=pweb.url


end]]
--读取数据("滑动屏幕前进后退")
--if 数据=="" then

--end

function 加载Js(JavaScript代码)
  --view.loadUrl([[javascript:dataBox(']]..JavaScript代码..[[');]])--加载js代码
  view.evaluateJavascript(JavaScript代码,nil)
  写入文件("/data/data/"..activity.getPackageName().."/JS储存.xml",JavaScript代码)
end

--代码由 Ayaka_ago 整理
--import "java.io.File"导入文件类
--picsave="/sdcard/download/alitao/web_picture/" --注意后面有个/才是文件夹
picture="/sdcard/Pictures/MhdhhfBrowser/"
websave="/sdcard/Download/MhdhhfBrowser/websave/"
backup="/sdcard/Download/MhdhhfBrowser/backup/"
File(websave).mkdirs()--如果只创建一级文件夹，请改为mkdir
File(picture).mkdirs()
File(backup).mkdir()



















--写入文件("/data/data/"..activity.getPackageName().."/历史记录保存.xml","")
--写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml","")

--[[function 恢复颜色()
  if 夜间模式=="打开" then
    mToolbar3.setBackgroundColor(Color.parseColor(背景2))
   else
    mToolbar3.setBackgroundColor(Color.parseColor(标题栏色))
  end
  底部栏2.setBackgroundColor(Color.parseColor(背景2))
  底部栏2.setBackgroundColor(Color.parseColor(背景2))

  网页列表数量显示.setTextColor(文字)

  网页后退ImageView.setColorFilter(文字)
  网页前进ImageView.setColorFilter(文字)
  打开菜单ImageView.setColorFilter(文字)
  第四个按钮ImageView.setColorFilter(文字)
  返回主页ImageView.setColorFilter(文字)
  if 夜间模式=="打开" then
    导航栏=0xFF191919
    对话框iop=0xFF212121
   else
    导航栏=0xFFffffff
    对话框iop=0xFFFFFFFF
  end
  activity.getWindow().setNavigationBarColor(导航栏)
  标题栏色=io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")
  if io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")=="#FFFAFAFA"
   else
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      --activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(转0x(标题栏色));
    end
  end
  if 夜间模式=="打开"
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(背景);
    end
  end
  mToolbar3.Elevation=获取控件阴影();
  控件边框(底栏mToolbar3,dp2px(19),"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
end]]



function 自动变色()
  pcall(function()
    if io.open("/data/data/"..activity.getPackageName().."/是否操作栏自动变色.xml"):read("*a")=="打开" then
      if 夜间模式=="关闭" and 是否显示主页列表[当前窗口]==false then
        mToolbar3.Elevation=0;
        import "android.graphics.*"
        import "android.renderscript.*"
        import "android.graphics.drawable.*"
        --SavePicture("/storage/emulated/0/Asd box/收款码.jpg",loadBitmapFromViewBySystem(webviewp0))
        网页顶部色=captureWeb(父布局).getPixel(1,1)
        --SavePicture("/storage/emulated/0/Asd box/收款码.jpg",captureWeb(父布局))
        网页顶部色=(Integer.toHexString(网页顶部色))
        网页顶部色=tonumber("0x"..网页顶部色)
        --print(string.format("%#x",string.format("%d",网页顶部色)))
        mToolbar3.setBackgroundColor((网页顶部色))
        底部栏2.setBackgroundColor((网页顶部色))
        --底部mToolbar.setBackgroundColor((网页顶部色))
        activity.getWindow().setNavigationBarColor(网页顶部色)
        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(网页顶部色);
        local window=activity.getWindow()
        window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
        pcall(function()
          window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
          window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
          window.setStatusBarColor(Color.TRANSPARENT)
          window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
        end)
        if 是否暗色(网页顶部色) then
          --判断比较暗
          菜单文字颜色=0xFFffffff
          边框5="#56ffffff"
          pcall(function()
            window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR)
          end)
         else
          --判断比较亮
          菜单文字颜色=0xFF505050
          边框5="#10000000"
          pcall(function()
            window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR|View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
          end)
        end
        window=activity.getWindow()
        --[[  if 网页顶部色==0xFFffffff
          window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
         else
          window.getDecorView().setSystemUiVisibility(0)
        end]]
        标题t.setTextColor(菜单文字颜色)
        底栏标题t.setTextColor(菜单文字颜色)
        ids.text.textColor=菜单文字颜色
        pcall(function()_G[webtmp.multiText].setTextColor(菜单文字颜色)end)

        搜索图标.setColorFilter(菜单文字颜色)
        底栏搜索图标.setColorFilter(菜单文字颜色)
        Sideslip1.setColorFilter(菜单文字颜色)
        网页后退ImageView.setColorFilter(菜单文字颜色)
        网页前进ImageView.setColorFilter(菜单文字颜色)
        打开菜单ImageView.setColorFilter(菜单文字颜色)
        第四个按钮ImageView.setColorFilter(菜单文字颜色)
        返回主页ImageView.setColorFilter(菜单文字颜色)
        底栏Sideslip1.setColorFilter(菜单文字颜色)
        ids.icon.setColorFilter(菜单文字颜色)

        if 浏览器页面标题边框=="打开" then
          --标题t.textSize=sp2px(7)
          网页标题副父布局内.backgroundDrawable=边框(dp2px("17"),"#00000000",边框5,dp2px(1.5));
        end
        activity.getWindow().setNavigationBarColor(网页顶部色)
        --设置标题栏()
        控件边框(底栏mToolbar3,dp2px(19),"#00000000",边框5,dp2px("1.5"))--id，度数，内框透明，边框颜色

        --这个需要系统SDK21以上才能用
        if Build.VERSION.SDK_INT >= 21 then
          状态栏.setBackgroundColor(网页顶部色);
        end
        if 夜间模式=="打开"
          --这个需要系统SDK21以上才能用
          if Build.VERSION.SDK_INT >= 21 then
            状态栏.setBackgroundColor(背景);
          end
        end
       else
        恢复颜色()
      end
    end
  end)

end
function isDarkColor(color)
  import 'java.lang.Long'
  local r=utf8.sub(color,3,4)
  local g=utf8.sub(color,5,6)
  local b=utf8.sub(color,7,8)
  local function toint(e)
    return Long.parseLong(e, 16)
  end
  return ((toint(r) * 0.299/145.298) + (toint(g) * 0.587/145.298) + (toint(b) * 0.114/145.298))<= 0.5
end
是否暗色=isDarkColor
function CircleButton(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end
function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end
function 隐藏控件(控件ID)
  --控件隐藏
  控件ID.setVisibility(View.GONE)
end
function 显示控件(控件ID)
  --控件可视
  控件ID.setVisibility(View.VISIBLE)
end
function 隐藏控件2(控件ID)
  --同理设置高度
  linearParams = 控件ID.getLayoutParams()
  linearParams.height =0
  控件ID.setLayoutParams(linearParams)
end
function 显示控件2(控件ID)
  --同理设置高度
  linearParams = 控件ID.getLayoutParams()
  linearParams.height =dp2px(44)
  控件ID.setLayoutParams(linearParams)
end



import "android.content.res.ColorStateList"
function 波纹(id,lx,color)
  xpcall(function()
    ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    for index,content in ipairs(id) do
      if lx=="圆" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      if lx=="方" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      -- content.onTouchListener=点击监听--动画效果
    end
  end,function(e)end)
end

--import "android.webkit.*"
import "android.content.Intent"
--import "android.app.Activity"


import "android.text.format.Formatter"

function 获取控件阴影()
  控件阴影=io.open("/data/data/"..activity.getPackageName().."/控件阴影.xml"):read("*a")
  if 控件阴影=="打开"
    return dp2px(3)
   else
    return dp2px(0)
  end
end

function 取小数点后面的n位(d,n)
  import "java.math.BigDecimal"
  b = BigDecimal(d)
  return b.setScale(n,BigDecimal.ROUND_HALF_UP).doubleValue()
end
function 取颜色亮度(color)
  local r=utf8.sub(color,3,4)
  local g=utf8.sub(color,5,6)
  local b=utf8.sub(color,7,8)
  function toint(e)--封装函数
    import 'java.lang.Long'
    return Long.parseLong(e, 16)
  end
  local grayLevel = toint(r) * 0.299 + toint(g) * 0.587 + toint(b) * 0.114;--RGB 模式转换成 YUV 模式，而 Y 是明亮度（灰阶），因此只需要获得 Y 的值而判断他是否足够亮就可以了
  if (grayLevel <= 192) then
    return true --黑
   else
    return false--白
  end
end


--[[function 设置标题栏()
  import "android.os.Build"
  --设置标题栏阴影
  activity.ActionBar.setElevation(获取控件阴影())

  --设置ActionBar背景颜色
  import "android.graphics.drawable.ColorDrawable"
  activity.ActionBar.setBackgroundDrawable(ColorDrawable(转0x(标题栏色)))
  if io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")=="#FFFAFAFA"
   else
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF757575);
    end
  end
  if 夜间模式=="打开"
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(背景);
    end
  end
  标题颜色(标题栏组件色)
end]]
function DialogButtonFilter(dialog)
  WidgetColor=转0x(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
  if Build.VERSION.SDK_INT >= 21 then
    import "android.graphics.PorterDuffColorFilter"
    import "android.graphics.PorterDuff"

    --if button==1 then
    dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(WidgetColor)
    --  elseif button==2 then
    dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(WidgetColor)
    --   elseif button==3 then
    dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(WidgetColor)
    --end
  end
end
强调色=io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a")
function 波纹2(颜色)
  import "android.content.res.ColorStateList"local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  --  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
  return Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
end
--导入包
import "android.content.Context"

function getwh(view)
  view.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
  height =view.getMeasuredHeight();
  width =view.getMeasuredWidth();
  return width,height
end

function loadBitmapFromViewBySystem(view2)
  view2.destroyDrawingCache();
  view2.setDrawingCacheEnabled(true);
  view2.buildDrawingCache();
  bmp = view2.getDrawingCache();
  return bmp
end
function AutoSetToolTip(view,text)
  if tonumber(Build.VERSION.SDK) >= 26 then
    view.setTooltipText(text)
  end
end
function 恢复颜色()
  if 夜间模式=="打开" then
    mToolbar3.setBackgroundColor(0xFF191919)
   else
    if 是否正在查看布局页面 then
      mToolbar3.setBackgroundColor(Color.parseColor(背景2))
     else
      mToolbar3.setBackgroundColor(Color.parseColor(标题栏色))
    end
  end
  底部栏2.setBackgroundColor(Color.parseColor(背景2))

  网页后退ImageView.setColorFilter(文字123)
  网页前进ImageView.setColorFilter(文字123)
  打开菜单ImageView.setColorFilter(文字123)
  第四个按钮ImageView.setColorFilter(文字123)
  返回主页ImageView.setColorFilter(文字123)
  Sideslip1.setColorFilter(文字123)
  搜索图标.setColorFilter(文字123)
  底栏Sideslip1.setColorFilter(文字123)
  底栏搜索图标.setColorFilter(文字123)
  if ids then
    ids.icon.setColorFilter(文字123)
    ids.text.textColor=文字123
  end
  标题t.setTextColor(文字123)
  底栏标题t.setTextColor(文字123)
  if 夜间模式=="打开" then
    导航栏=0xFF191919
    对话框iop=0xFF212121
   else
    导航栏=0xFFffffff
    对话框iop=0xFFFFFFFF
  end
  activity.getWindow().setNavigationBarColor(导航栏)
  --标题栏色=io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")
  --[[if io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")=="#FFFAFAFA"
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(-9079435);
    end
   else
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      --activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(转0x(标题栏色));
    end
  end
  if 夜间模式=="打开" then
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(背景);
    end
  end]]
  mToolbar3.Elevation=获取控件阴影();
  波纹qwe()
  if 浏览器页面标题边框=="打开" then
    --标题t.textSize=sp2px(7)
    网页标题副父布局内.backgroundDrawable=边框(dp2px("17"),"#00000000",边框2,dp2px(1.5));
  end
  activity.getWindow().setNavigationBarColor(导航栏)
  --设置标题栏()
  控件边框(底栏mToolbar3,dp2px(19),"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
  if 夜间模式=="打开" then
    进度条.setBackgroundColor(0xFF191919)
   else
    进度条.setBackgroundColor(Color.parseColor(一般强调色))
  end


  if io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")=="#FFFAFAFA"
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      状态栏.setBackgroundColor(-9079435);
    end
   else
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      状态栏.setBackgroundColor(0xFF757575);
    end
  end
  if 夜间模式=="打开"
    --这个需要系统SDK21以上才能用
    if Build.VERSION.SDK_INT >= 21 then
      状态栏.setBackgroundColor(背景);
    end
  end
  local window=activity.getWindow()
  window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
  pcall(function()
    window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
    window.setStatusBarColor(Color.TRANSPARENT)
    window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
  end)
  pcall(function()
    window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR)
  end)
end
function 波纹qwe()
  波纹({网页前进3,
    网页后退LinearLayout,
    打开菜单,
    打开网页列表,
    返回主页,
    网页标题副父布局,
    Sideslip,
    主页搜索LinearLayout,
    底栏网页标题副父布局,
    底栏Sideslip,
    搜索图标LinearLayout,
    底栏搜索图标LinearLayout,
  },"方",文字)
end
task(1,function()

  if (activity.Title=="Mhdhhf浏览器")==false then--判断是否主页

    import "func2"
  end
end)
function CircleButton(--[[view,]]InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  --view.setBackgroundDrawable(drawable)
  return drawable
end

function 控件边框(id,r,t,y,宽度)
  import "android.graphics.Color"
  InsideColor = Color.parseColor(t)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  --设置填充色
  drawable.setColor(InsideColor)
  --设置圆角 : 左上 右上 右下 左下
  drawable.setCornerRadii({r, r, r, r, r, r, r, r});
  --设置边框 : 宽度 颜色
  drawable.setStroke(宽度, Color.parseColor(y))
  id.setBackgroundDrawable(drawable)
end

function 悬浮窗刷新标题()
  标题显示内容=io.open("/data/data/"..activity.getPackageName().."/标题显示内容.xml"):read("*a")
  if 标题显示内容=="网页标题" then
    win_move.text=悬浮窗webView.getTitle()
   elseif 标题显示内容=="网页域名" then
    import "android.net.Uri"
    win_move.text=Uri.parse(悬浮窗webView.url).authority
   elseif 标题显示内容=="网页链接" then
    win_move.text=悬浮窗webView.Url
  end
end

function sp2px(spValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return spValue * scale + 0.5
end
--[[
代码来自小伍

GradientDrawable.Orientation.LEFT_RIGHT 渐变属性
LEFT_RIGHT 左往右
RIGHT_LEFT 右往左
TOP_BOTTOM 上往下
BOTTOM_TOP 下往上
]]
function 保存阅读进度()
  if 阅读进度记录id列表[当前查看的页面] then
    id=阅读进度记录id列表[当前查看的页面][1]
    a=阅读进度记录id列表[当前查看的页面][2]
    if tostring(a)==a then
      文件夹id=a
      保存当前阅读位置(收藏分类.folder,id,view.ScrollY,文件夹id)
     else
      当前收藏分类=a
      保存当前阅读位置(当前收藏分类,id,view.ScrollY)
    end
  end
end
function onKeyDown(code,event)
  if 页面状态=="弹窗" then
    页面状态="没有页面"
    关闭对话框b()
    return true
   elseif 页面状态=="首次启动页" then
    页面状态="没有页面"
    关闭对话框a()
    return true
   else
    if 强力前进后退 then
      当前查看的页面=当前查看的页面-1
      view.loadUrl(网页列表[当前查看的页面])
     elseif(view.canGoBack())then
      view.goBack()--网页后退
     else
      if(是否正在查看布局页面 or view.Url==主页链接)then
        if 参数+2 > tonumber(os.time()) then
          activity.finish()
         else
          Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT )
          .show()
          参数=tonumber(os.time())
        end
       else
        返回主页f(当前窗口)
      end
    end
    if view.getTitle()~="网页无法打开" or 是否正在查看布局页面 then
      if 网页加载失败页面 then
        网页加载失败页面=false
        隐藏控件(网页加载失败背景)
      end
    end
    保存阅读进度()
    return true
  end
end

版本表={"3.15","3.13","3.12","3.11","3.10","3.9"}

function onConfigurationChanged(config)
  --这个函数不是自定义的，屏幕旋转系统会调用这个的

  AWidth=activity.getWidth()--新宽
  AHeight=activity.getHeight()--新高
end
mmpe={"更换背景色",
  "翻译网页",
  "无痕模式",
  "定时刷新",
  "网页源码",
  "页内查找",
  "获取Cookie",
  "切换UA",
  "保存网页",
  "无图模式",
  "调用其他浏览器",
  "悬浮窗",
  "网页调试",
  "加载Js",
  "强力前进后退",
  "横竖屏切换",
  "浏览器日志",
  "翻页器",
  "刷新网页",
  "网页后退",
  "网页前进",
  "新建窗口",
  "搜索",
  "网页信息",
  "主页",
}--,"网页缩放"
mmpea={"更换背景色",
  "翻译网页",
  "无痕模式",
  "定时刷新",
  "网页源码",
  "页内查找",
  "获取Cookie",
  "切换UA",
  "保存网页",
  "无图模式",
  "调用其他浏览器",
  "悬浮窗",
  "网页调试",
  "加载Js",
  "强力前进后退",
  "横竖屏切换",
  "浏览器日志",
  "翻页器",
  "刷新网页",
}--,"网页缩放"
mmpe开关={
  [3]=function()
    return 无痕模式=="打开"
  end,--无图模式
  [6]=function()
    return 页内查找CardView.Visibility==View.VISIBLE
  end,--页内查找
  [10]=function()
    return 无图模式=="打开"
  end,--无痕模式
}
mmpqwe={"添加书签","书签","历史记录","下载管理","暗色模式","设置","工具箱","退出"}
aw3菜单={"png/fhvpfxgj.png","png/bookmarks_black.png","png/timelap.png","png/gnjs2x.png","png/black.png","png/settings.png","png/inbox_black.png","png/highlight_off_black.png"}


aw3工具箱={"png/palette_black.png",
  "png/9846.png",
  "png/bubble_chart_black.png",
  "png/timelap.png",
  "png/sjwjj.png",
  "png/mmm.png",
  "png/list_alt_black.png",
  "png/recording_change.png",
  "png/syvg.png",
  "png/image_black.png",
  "png/tbs.png",
  "png/open_in_browser_black.png",
  "png/sjwjj.png",
  "png/jjjss.png",
  "png/recording_change.png",
  "png/undo_black.png",
  "png/list_alt_black.png",
  "png/ic_unfold_more_black_24dp.png",
  "png/mklj.png",
  "png/gfwzu.png",
  "png/chevron_right.png",
  "png/fhvpfxgj.png",
  "png/mmm.png",
  "png/lou.png",
  "png/home.png",
}
if io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")=="打开" then
  mmpqwe[5]="亮色模式"
  aw3菜单[5]="png/wb_sunny_black.png"
 elseif io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")=="关闭" then
  mmpqwe[5]="暗色模式"
  aw3菜单[5]="png/black.png"
end
mmpqwe2=table.clone(mmpqwe)
aw3菜单2=table.clone(aw3菜单)
暗色模式跟随系统=io.open("/data/data/"..activity.getPackageName().."/暗色模式跟随系统.xml"):read("*a")
if 暗色模式跟随系统=="打开" then
  mmpqwe2[5]="页内查找"
  aw3菜单2[5]="png/mmm.png"
end
function string2tab(t)
  return load(table.concat({"return ",t},""))()
end
function 转波纹(e)
  import 'android.content.res.ColorStateList'
  return (activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground})
  .getResourceId(0,0)).setColor(ColorStateList(int[0].class{int{}},int{e}))
  .setColor(ColorStateList(int[0].class{int{}},int{e})))
end
function 边框(r,t,y,宽度)
  import "android.graphics.Color"
  InsideColor = Color.parseColor(t)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  --设置填充色
  drawable.setColor(InsideColor)
  --设置圆角 : 左上 右上 右下 左下
  drawable.setCornerRadii({r, r, r, r, r, r, r, r});
  --设置边框 : 宽度 颜色
  drawable.setStroke(宽度,Color.parseColor(y))
  return drawable
end
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
function 获取内容(标题,链接)
  return [==[【项目】【标题】]==]..标题..[==[【标题】【链接】]==]..链接..[==[【链接】【项目】]==]
end
function 获取内容带ScrollY(标题,链接,ScrollY)
  return [==[【项目】【标题】]==]..标题..[==[【标题】【链接】]==]..链接..[==[【链接】【ScrollY】]==]..ScrollY..[==[【ScrollY】【项目】]==]
end
function 打开关闭转TF(内容)
  return 内容=="打开"
end
function 打开关闭转TF带读取文件(内容)
  return io.open("/data/data/"..activity.getPackageName().."/"..内容..".xml"):read("*a")=="打开"
end
读取记录项目=打开关闭转TF带读取文件
function 打开关闭反转并转TF带读取文件(内容)
  if io.open("/data/data/"..activity.getPackageName().."/"..内容..".xml"):read("*a")=="打开" then
    return false
   else
    return true
  end
end
import "android.view.animation.AlphaAnimation"
function 运行代码含读取文件(路径)
  loadstring(io.open(activity.getLuaDir().."/"..路径..".lua"):read("*a"))()
end
function 打开页面(文件,id)
  if id then
    显示控件(id)
   else
    import(文件)
  end
end
function 加载(链接)
  view.loadUrl(链接)
end
function 震动(a)
  --导入包
  vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
  vibrator.vibrate(long{0,a} ,-1)
  --{等待时间,振动时间,等待时间,振动时间,…}
  --{0,1000,500,1000,500,1000}
  --别忘了申明权限
end