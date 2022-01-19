function 提示(text)
  对话框({
    标题="提示",
    点击事件=function()end,
    文本内容=tostring(text),
    是否显示取消按钮=false,
  })
end
--thread(function()

import "mods.shuqiantianjia"
import 'android.content.Context'


--代码由 Ayaka_ago 整理

--import "java.io.File"
import "android.os.Build"
import "android.graphics.Canvas"
import "java.io.FileOutputStream"
import "android.graphics.Bitmap"

-- 注意，此功能函数只返回位图，不保存为文件
function getViewBitmap(view)
  --view 要获取位图的控件id
  if view then
    view.destroyDrawingCache()
    view.setDrawingCacheEnabled(true)
    view.buildDrawingCache()
    return view.getDrawingCache()
   else
    return false
  end
end

-- 注意，此功能函数只返回位图，不保存为文件
function captureWeb()
   -- 对于安卓5.0以下，使用此方法
  -- FA只能5.0以上用，所以其实不需要做判断
  -- 对于安卓5.0以下的，可使用webView的一个自带方法，详细自己百度
  return getViewBitmap(view)
end

-- 注意，此功能函数只返回位图，不保存为文件
function captureWeb2()
  if Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP then
    print("正在获取截图\n请稍候")
    -- 网页太长会造成卡顿，所以提示一下用户
    bitmap=Bitmap.createBitmap(view.getWidth(),view.getContentHeight()*view.getScale(),Bitmap.Config.RGB_565)
    -- bitmap的配置
    canvas=Canvas(bitmap)
    view.draw(canvas)
    -- 把webView内容绘制到画布中
    return bitmap
   else
    -- 对于安卓5.0以下，使用此方法
    -- FA只能5.0以上用，所以其实不需要做判断
    -- 对于安卓5.0以下的，可使用webView的一个自带方法，详细自己百度
    return getViewBitmap(view)
  end
end

--保存为图片文件
function savePicture(fileName,bitmap,msg,shouldPrintIfFinish)
  --fileName 完整的文件路径
  --bitmap 要保存为图片的位图
  --msg 保存成功后提示给用户的信息，如果不需要提示，则传入false
  --shouldPrintIfFinish 是否提示保存成功/失败，如果不需要，则传入false
  if bitmap and fileName then
    import "java.io.FileOutputStream"
    import "java.io.File"
    import "android.graphics.Bitmap"
    f,e=pcall(function ()
      local fileName=File(tostring(fileName))
      out = FileOutputStream(fileName)
      bitmap.compress(Bitmap.CompressFormat.PNG,90, out)
      out.flush()
      out.close()
    end)
    if not e then
      if shouldPrintIfFinish then
        print("保存成功，保存在了\n"..fileName)
      end
      if msg then
        print(tostring(msg))
      end
      return true
     else
      if shouldPrintIfFinish then
        print("保存失败 "..e)
      end
      return false
    end
   else
    if shouldPrintIfFinish then
      print("保存失败, 没有传入图片")
    end
    return false
  end
end
function createShortcut(m)
  import "mods/createShortcut"
  createShortcut2(m)
end
function 大小转换(a)
  if a>=1024 then
    local b=tonumber(string.format("%.2f",a/1024))
    if b>=1024 then
      return string.format("%.2fMB",b/1024)
     else
      return b.."KB"
    end
   else
    return a.."B"
  end
end
function 获取下载内容(标题,链接,进度)
  return [==[【项目】【标题】]==]..标题..[==[【标题】【链接】]==]..链接..[==[【链接】【进度】]==]..进度..[==[【进度】【项目】]==]
end
function Mhdhhf浏览器下载(url,em)
  写入文件("/data/data/"..activity.getPackageName().."/下载记录.xml","")--#c7ffffff
  --[[导入包
  import "android.content.Context"
  import "android.net.Uri"
  downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
  url=Uri.parse(url);
  request=DownloadManager.Request(url);
  request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
  request.setDestinationInExternalPublicDir("Download",em);
  request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
  downloadManager.enqueue(request);]]
  function 下载提示(内容,进度)
    写入文件("/data/data/"..activity.getPackageName().."/下载记录.xml",io.open("/data/data/"..activity.getPackageName().."/下载记录.xml"):read("*a")..获取下载内容(em,内容,进度))
  end
  下载管理=dzdd(url)
  下载管理:创建下载("Download",em,function(id)
    下载id=id
  end)
  下载管理:下载信息(下载id,function(已下载,总大小,状态,函数)
    函数状态=函数
    if 状态==2 then
      下载提示("已下载："..大小转换(已下载).."总大小："..大小转换(总大小).."下载状态：正在下载",已下载/总大小*100)
      -- 进度条.setProgress(已下载/总大小*100)
     elseif 状态==4 then
      下载提示("已下载："..大小转换(已下载).."总大小："..大小转换(总大小).."下载状态：等待下载",已下载/总大小*100)
      -- 进度条.setProgress(已下载/总大小*100)
     elseif 状态==8 then
      下载提示("已下载："..大小转换(已下载).."总大小："..大小转换(总大小).."下载状态：下载完成",已下载/总大小*100)
      --[[进度条.setProgress(已下载/总大小*100)
      取消下载.setVisibility(8)
      暂停下载.setVisibility(8)
      后台下载.setText("下载完成")]]
      if 函数状态 and 函数状态.isRun() then
        函数状态.stop()
      end
     elseif 状态==16 then
      下载提示("已下载："..大小转换(已下载).."总大小："..大小转换(总大小).."下载状态：下载失败",已下载/总大小*100)
      --   进度条.setProgress(已下载/总大小*100)
      if 函数状态 and 函数状态.isRun() then
        函数状态.stop()
      end
     else
      下载提示("已下载："..大小转换(已下载).."总大小："..大小转换(总大小).."下载状态："..状态,已下载/总大小*100)
      -- 进度条.setProgress(已下载/总大小*100)
    end
  end)
end
function 下载()--以下代码可自由编辑，每当监听到下载任务时会运行以下代码。可用的值：url,userAgent,contentDisposition,mimetype,contentLength,文件名,文件类型,文件大小,下载链接
  AlertDialog.Builder(this)
  .setTitle("新建下载任务")
  .setMessage("文件名："..文件名.."\n文件类型："..文件类型.."\n文件大小："..文件大小.."\n下载链接："..下载链接)
  .setPositiveButton("下载",{onClick=function(v)
      if((Uri.parse(下载链接).authority):find"baidupan") then--检测是否蓝奏云
        import "android.content.Intent"
        import "android.net.Uri"
        viewIntent = Intent("android.intent.action.VIEW",Uri.parse(下载链接))
        activity.startActivity(viewIntent)
       else
        下载器=io.open("/data/data/"..activity.getPackageName().."/下载器.xml"):read("*a")
        if 下载器=="Mhdhhf浏览器"
          Mhdhhf浏览器下载(下载链接,文件名)
         elseif 下载器=="系统下载器"
          --导入包
          import "android.content.Context"
          import "android.net.Uri"
          downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
          url=Uri.parse(下载链接);
          request=DownloadManager.Request(下载链接);
          request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
          request.setDestinationInExternalPublicDir("Download",文件名);
          request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
          downloadManager.enqueue(request);
         elseif 下载器=="调用其他浏览器下载"
          import "android.content.Intent"
          import "android.net.Uri"
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(下载链接))
          activity.startActivity(viewIntent)
        end
      end
  end})
  .setNegativeButton("取消",nil)
  --[[ .setNeutralButton("ADM下载",{onClick=function(v)
      adm(下载链接)
    end})]]
  .show()
end
function 暗色模式亮色模式切换()
  if io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")=="打开" then
    写入文件("/data/data/"..activity.getPackageName().."/暗色模式.xml","关闭")
    夜间模式="关闭"
    mmpqwe2[5]="暗色模式"
    aw3菜单2[5]="png/black.png"
   elseif io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")=="关闭" then
    写入文件("/data/data/"..activity.getPackageName().."/暗色模式.xml","打开")
    mmpqwe2[5]="亮色模式"
    aw3菜单2[5]="png/wb_sunny_black.png"
    夜间模式="打开"
  end
  刷新颜色()
  恢复颜色()
  父布局.setBackgroundColor(Color.parseColor(背景2))
  widtht,heightt=getwh(主页搜索CardView)
  主页搜索.setHintTextColor(Color.parseColor(边框2))
  if 主页图片背景=="关闭" then
    主页搜索.setHintTextColor(文字qwe)
  end
  主页2.removeAllViews()
  名称="网页收藏"
  showDataDialog(名称,名称)
  主页2.addView(listlayout)--添加控件
  tittled.textColor=标题栏组件色
  标题t.textColor=标题栏组件色
  网页覆盖.setBackgroundColor(Color.parseColor(网页覆盖色))
  if HasLaunch then
    vngggggg悬浮窗.setBackgroundColor(Color.parseColor(背景2))
    for d in pairs(adpd悬浮窗) do
      adpd悬浮窗[d].text["textColor"]=主页文字颜色
      adpd悬浮窗[d].Image2["ColorFilter"]=主页文字颜色3
    end
    悬浮窗标题栏LinearLayout.setBackgroundColor(Color.parseColor(背景2))
    悬浮窗搜索CardView.setBackgroundColor(Color.parseColor(背景2))
    悬浮窗底部栏2.setBackgroundColor(Color.parseColor(底栏))
    悬浮窗网页后退ImageView.setColorFilter(文字123)
    悬浮窗网页前进ImageView.setColorFilter(文字123)
    悬浮窗打开菜单ImageView.setColorFilter(文字123)
    悬浮窗返回主页ImageView.setColorFilter(文字123)
    win_worhImageView.setColorFilter(文字123)
    悬浮窗搜索LinearLayout.backgroundDrawable=边框(dp2px(10.5),"#00000000",边框2,dp2px("1.5"));
    移动TextView.textColor=标题栏组件色
    最小化TextView.textColor=标题栏组件色
    win_move.textColor=标题栏组件色
    悬浮窗搜索图标ImageView.setColorFilter(文字123)
    关闭悬浮窗ImageView.setColorFilter(文字123)
  end
  for d in pairs(底栏窗口切换列表id表) do
    底栏窗口切换列表id表[d].title2.textColor=文字123
    底栏窗口切换列表id表[d].icon2.setColorFilter(文字123)
  end
  if io.open("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml"):read("*a")=="大圆角" then
    控件边框(主页搜索CardView,heightt/2,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
   elseif io.open("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml"):read("*a")=="圆角大小" then
    控件边框(主页搜索CardView,圆角大小,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
   else
    控件边框(主页搜索CardView,io.open("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml"):read("*a"),"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
  end
  控件边框(书签,圆角大小,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
  控件边框(历史记录,圆角大小,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色

end
function 切换搜索引擎(id)
  pop1=PopupMenu(activity,id)
  menu1=pop1.Menu
  搜索引擎列表={
    {"百度搜索","https://www.baidu.com/s?word=搜索内容"},
    {"搜狗搜索","https://m.sogou.com/web/searchList.jsp?uID=HzeRJIpO7NJ4sZ0b&v=5&from=index&w=1274&t=1528636381841&s_t=1528636397379&s_from=index&keyword=搜索内容"},
    {"必应搜索","http://cn.bing.com/search?q=搜索内容"},
    {"360搜索","https://m.so.com/s?q=搜索内容"},
    {"秘迹搜索","https://m.mijisou.com/?q=搜索内容&category_general=on&time_range=&language=zh-CN&pageno=1"},
    {"头条搜索","https://m.toutiao.com/search?keyword=搜索内容"},
    {"神马搜索","https://yz.m.sm.cn/s?from=wm291047&q=搜索内容"},
    {"谷歌搜索","https://www.google.com/search?q=搜索内容"},
    {"DuckDuckGo","https://duckduckgo.com/?q=搜索内容"},
    {"Yahoo","https://search.yahoo.com/yhs/search?hspart=Opera&hsimp=yhs-Opera_14mobile&p=搜索内容"},
    {"Yandex","https://yandex.com/search/?text=搜索内容"},
    {"magi","https://magi.com/search?q=搜索内容"},
  }
  for k,v in ipairs(搜索引擎列表) do --遍历
    menu1.add(v[1]).onMenuItemClick=function(a)
      写入文件("/data/data/"..activity.getPackageName().."/搜索URL.xml",v[2])
    end
  end
  menu1.add("自定义").onMenuItemClick=function(a)
    搜索URL=(io.open("/data/data/"..activity.getPackageName().."/搜索URL.xml"):read("*a"))
    对话框({
      标题="自定义",
      HINT="链接",
      点击事件=function(text)
        写入文件("/data/data/"..activity.getPackageName().."/搜索URL.xml",text)
      end,
      是否显示取消按钮=true,
      输入框文本=搜索URL
    })
  end
  pop1.show()--显示@音六站长～
end
import "android.view.Window"
import "android.view.WindowManager"
import "android.graphics.Color"
import "android.graphics.drawable.GradientDrawable"
function 渐变色背景(id,a,b,方向)
  grad = GradientDrawable(方向,{a,b});
  id.setBackground
  (grad)
end
function 弹窗(布局,是否可获得焦点)
  import "android.graphics.drawable.*"
  local pop=PopupWindow(activity)
  --给弹窗一个自定义布局
  pop.setContentView(布局)
  --修复bug,千万不能删除
  pop.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
  --设置显示宽度
  pop.setWidth(WindowManager.LayoutParams.FILL_PARENT)
  --设置显示高度
  pop.setHeight(WindowManager.LayoutParams.FILL_PARENT)

  --点击PopupWindow外面区域  true为消失
  pop.setOutsideTouchable(true)
  import "android.graphics.drawable.GradientDrawable"
  import "android.view.animation.TranslateAnimation"
  --修复bug,千万不能删
  pop.setBackgroundDrawable(BitmapDrawable(loadbitmap("1.jpg")))
  --设置pop可获得焦点
  pop.setFocusable(是否可获得焦点)
  --设置pop可触摸
  pop.setTouchable(true)
  --设置弹窗显示位置
  pop.showAtLocation(view,Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL,0,0)
  --yuxuanpop2.addView(loadlayout(信息列表.页面布局))
  if 是否可获得焦点 then
    页面状态="没有页面"
   else
    页面状态="弹窗"
  end
  return pop
end
function 弹窗2(布局)
  local dialog= AlertDialog.Builder(this)
  local dialog1=dialog.show()
  --设置弹窗宽度
  local p=dialog1.getWindow().getAttributes();
  --p.width=(AWidth);
  p.height=(WindowManager.LayoutParams.FILL_PARENT);
  p.width=(WindowManager.LayoutParams.FILL_PARENT);
  dialog1.getWindow().setAttributes(p);
  dialog1.getWindow().setContentView(布局);
  dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
  local dialogWindow = dialog1.getWindow();
  dialogWindow.setGravity(Gravity.BOTTOM);
  --设置弹窗与返回键的响应,true为消失
  dialog1.setCancelable(true)
  --设置对话框外的背景
  dialogWindow.setDimAmount(0)
  --设置点击外部弹窗不消失
  --  dialog1.setCanceledOnTouchOutside(true)
  return dialog1
end
import "duihuakuang"
import "android.graphics.drawable.BitmapDrawable"
import "android.graphics.Color"
import "android.content.res.ColorStateList"
import "android.graphics.PorterDuff"
import "android.graphics.ColorFilter"
import "android.graphics.PorterDuffColorFilter"
function 拖动条颜色(id,颜色)
  id.ProgressDrawable.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
  --修改SeekBar滑块颜色
  id.Thumb.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
end

function 导出(列表,文本,文件夹列表)
  书签前=[[<!DOCTYPE NETSCAPE-Bookmark-file-1>
<!-- This is an automatically generated file.
     It will be read and overwritten.
     DO NOT EDIT! -->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL><p>]]
  导出的书签2=""
  if 文件夹列表 then
    for k,v in pairs(文件夹列表) do
      名称=v[1]
      项目内容=[[
<DL><p>
<DT><H3 DATA="FOLDER">]]..名称..[[</H3>
<DL><p>]]
      导出的书签2=导出的书签2..项目内容
      for k,v in pairs(v[2]) do
        标题=v[1]
        链接=v[2]
        项目内容='\n<DT><A HREF="'..链接..'">'..标题..'</A>'
        导出的书签2=导出的书签2..项目内容
      end
      项目内容='\n</DL><p>'
      导出的书签2=导出的书签2..项目内容
    end
  end
  for k,v in pairs(列表) do
    链接=v
    项目内容='\n<DT><A HREF="'..链接..'">'..k..'</A>'
    导出的书签2=导出的书签2..项目内容
  end
  书签后="</DL><p>"
  --替换
  导出的书签=书签前..导出的书签2..书签后
  写入文件(backup..os.date("%Y-%m-%d %H:%M:%S")..文本..".html",导出的书签)
  print("导出成功")
end
--[[function 页面进入动画(id)
  --动画
  --相关参数，请自行手册查询
  --定义动画,500为上升高度。
  yuxuandh3=TranslateAnimation(AWidth,0,0,0)
  --动画时间，也就是上升动画的快慢
  yuxuandh3.setDuration(200)
  --动画开始执行
  id.startAnimation(yuxuandh3);
  yuxuandh3.hasEnded()
  --设置动画的属性
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(200)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  id.startAnimation(透明动画)
  end]]
function 获取标题栏(标题内容,id,数据记录,是否显示菜单,此页面在屏幕旋转事件列表中的位置)
  if 是否显示菜单 then
    菜单按钮高度="56dp"
   else
    菜单按钮高度="0dp"
  end
  return {
    FrameLayout;
    layout_width="fill";
    --orientation="horizontal";
    layout_height="56dp";
    -- elevation="3dp";
    {
      LinearLayout;
      layout_height="fill";
      layout_width="fill";
      --layout_weight="1";
      orientation="horizontal";
      gravity="center";
      {
        TextView;
        text=标题内容;
        textColor=文字;
        layout_gravity="center";
        textSize="18sp";
        id="标题";
      };
    };
    {
      LinearLayout;
      gravity="center";
      layout_width="56dp";
      layout_height="56dp";
      id="返回";
      Background=转波纹(文字);
      onClick=function()
        隐藏控件(id)
        table.remove(onConfigurationChangedList,此页面在屏幕旋转事件列表中的位置)
      end;
      {
        ImageView;
        layout_height="28dp";
        src="png/__ic_fltbtn.png";
        --  id="Sideslip1";
        colorFilter=文字;
        -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
        layout_width="25dp";
      };
    };
    {
      LinearLayout;
      layout_gravity="center|right";
      gravity="center";
      layout_width="56dp";
      layout_height=菜单按钮高度;
      id="菜单";
      Background=转波纹(文字);
      {
        ImageView;
        layout_height="28dp";
        src="png/__ic_fltbtn2.png";
        --  id="Sideslip1";
        colorFilter=文字;
        -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
        layout_width="25dp";
      };
    };
  };
end
function 底部弹窗(内layout,右下角菜单2)
  if AWidth<AHeight then
    菜单CardViewWidth =AWidth
   else
    菜单CardViewWidth =AHeight
  end
  local mlayout={
    FrameLayout,
    layout_height='fill';
    layout_width='fill';
    id='idmlz外';
    {
      FrameLayout,
      layout_height='fill';
      layout_width='fill';
      id='idmlz';
      background=菜单背景,
      --[[ {
        FrameLayout,
        layout_height='fill';
        layout_width='fill';
        background=菜单背景,
        id='菜单背景FrameLayout';
      };]]
      {
        CardView;
        Elevation='8dp';
        layout_width=菜单CardViewWidth;
        radius='30dp';
        layout_gravity="bottom";
        layout_marginBottom='-30dp';
        id='菜单CardView';
        {
          LinearLayout;
          Orientation='vertical';
          layout_width='fill';
          --layout_height='420dp';
          layout_marginBottom="30dp";
          BackgroundColor=背景2;
          内layout;
          {
            FrameLayout,
            --  Orientation='vertical';
            layout_width='fill';
            layout_height='44dp';
            BackgroundColor=背景2;
            {
              LinearLayout;
              Orientation='vertical';
              layout_width='fill';
              layout_height='fill';
              Gravity="center",
              id="关闭";
              Background=转波纹(文字);
              -- onTouchListener=点击监听,--动画效果
              {
                ImageView;
                layout_height="30dp";
                src="png/kadb.png";
                id="关闭图标";
                ColorFilter=文字,--图片颜色
                layout_width="30dp";
              };
            };
            右下角菜单2;
          };
        };
      };
    };
  };
  local dialog1=弹窗2(loadlayout(mlayout))
  local width,height=getwh(菜单CardView)
  --上升动画
  --相关参数，请自行手册查询
  --定义动画,500为上升高度。
  yuxuandh3=TranslateAnimation(0,0,height,0)
  --动画时间，也就是上升动画的快慢
  yuxuandh3.setDuration(150)
  --动画开始执行
  菜单CardView.startAnimation(yuxuandh3);
  --动画结束回调
  --设置动画的属性
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(150)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  idmlz.startAnimation(透明动画)
  --波纹(gfwz,0xffff0000)
  --波纹(hhbgvbg,0xffff0000)
  function 关闭对话框()
    yuxuandh4=TranslateAnimation(0,0,0,activity.height)
    yuxuandh4.setDuration(150)
    菜单CardView.startAnimation(yuxuandh4);
    import "android.view.animation.Animation$AnimationListener"
    yuxuandh4.setAnimationListener(AnimationListener{
      onAnimationEnd=function()
        return dialog1 and dialog1.dismiss()
    end})
    --设置动画的属性
    透明动画=AlphaAnimation(1,0)
    透明动画.setDuration(150)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    idmlz.startAnimation(透明动画)
  end
  isAnimaing = false
  dialog1.setOnKeyListener{
    onKey = function(dl,c,v)
      if c == 4 and v.getAction() == MotionEvent.ACTION_DOWN then
        if isAnimaing == false then
          isAnimaing = true
          --弹出消息("返回键")
          关闭对话框()
        end
        return true
      end

    end
  }
  关闭对话框b=关闭对话框
  关闭.onClick=关闭对话框
  idmlz.onClick=关闭对话框
end
function 查看图片(src)
  view.loadUrl(src)
end