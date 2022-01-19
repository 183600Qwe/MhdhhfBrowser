require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"







--导包5
--import "com.lua.*"
目前页面="主页"
是否强力前进后退=false
是否翻页按钮=false
是否上下滑动翻页=false



是否显示主页列表={}
网页加载状态列表={}
页面列表={}
onConfigurationChangedList={}
import "mods.shuqianlishi"

function 离开布局页面()
  是否正在查看布局页面=false
  设置右上角按钮图标("png/qwetyi.png")
  网页加载状态列表[当前窗口]=false
  if 全屏模式状态=="关闭" then
    if 是否把标题栏放到底栏中=="关闭" then
      if AWidth<AHeight then
        是否显示标题栏=true
        显示控件2(mToolbar3)
        显示控件2(顶部代替paddingTop)
      end
    end
  end
  --恢复颜色()
  --控件不可视
  vngggggg.setVisibility(View.INVISIBLE)
  是否显示主页列表[当前窗口]=false
end
import "android.webkit.WebChromeClient"

task(1,function()
  import "java.net.URLDecoder"
end)


--activity.Theme=(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
--欢迎下载这个源码
--这个浏览器基于dingyi浏览器
--这个浏览器于2020年5月初开始开发
--这个项目的源码不使用任何开源许可证
--import "com.lua.*"--必导入此类

--import "view.MultiWebView"
--import "view.MultiTextView"
--import "view.BottomBar"


import "func"
滑动菜单模式=io.open("/data/data/"..activity.getPackageName().."/滑动菜单模式.xml"):read("*a")
是否启用更矮的滑动菜单按钮=io.open("/data/data/"..activity.getPackageName().."/是否启用更矮的滑动菜单按钮.xml"):read("*a")
if 是否启用更矮的滑动菜单按钮=="打开" then
  滑动菜单按钮高="37dp"
  滑动菜单按钮间隔="5dp"
 else
  滑动菜单按钮高="56dp"
  滑动菜单按钮间隔="20dp"
end
function 网页后退()
  --xpcall(function()
  if 强力前进后退 then
    当前查看的页面=当前查看的页面-1
    view.loadUrl(网页列表[当前查看的页面])
   else
    if(view.canGoBack())then
      view.goBack()--网页后退
     else
      if(是否正在查看布局页面 or view.Url==主页链接)then
        activity.finish()
       else
        返回主页f()
      end
    end
  end
  if view.getTitle()~="网页无法打开" or 是否正在查看布局页面 then
    if 网页加载失败页面 then
      网页加载失败页面=false
      隐藏控件(网页加载失败背景)
    end
  end
  保存阅读进度()
  --[[end,function(e)
  end)]]
end
function 网页前进()
  --xpcall(function()
  if 强力前进后退 then
    当前查看的页面=当前查看的页面+1
    view.loadUrl(网页列表[当前查看的页面])
   else
    if(view.canGoForward())then
      view.goForward()--网页前进
     else
      返回主页f(当前窗口)
    end
  end
  --[[end,function(e)
  end)]]
  保存阅读进度()
end
if AWidth<AHeight then
  菜单CardViewWidth =AWidth
 else
  菜单CardViewWidth =AHeight
end
跳转到另一个网页所有的时=io.open("/data/data/"..activity.getPackageName().."/跳转到另一个网页所有的时.xml"):read("*a")
import "view.MultiWebView"
import "view.MultiTextView"--import "view.BottomBar"
主页布局=loadlayout("layout")
双悬浮按钮模式=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮模式.xml"):read("*a")
是否全屏=滑动菜单模式=="打开" or 双悬浮按钮模式=="打开"
是否全屏2=滑动菜单模式=="关闭" or 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开"
mToolbar3外.addView(loadlayout("layout/zhuye/mActionBar"))
是否启用新的滑动菜单样式=io.open("/data/data/"..activity.getPackageName().."/是否启用新的滑动菜单样式.xml"):read("*a")
if 是否启用新的滑动菜单样式=="打开" then
  隐藏控件(ftb2)
  隐藏控件(常用工具ftb2)
  隐藏控件(菜单ftb2)
  隐藏控件(多窗口ftb2)
  ftb2=ftb3
  常用工具ftb2=常用工具ftb3
  菜单ftb2=菜单ftb3
  多窗口ftb2=多窗口ftb3
 else
  滑动菜单按钮高="56dp"
end

--import "view.MultiTextView"--import "view.BottomBar"
a=loadlayout(
{
  FrameLayout,--帧布局
  layout_width="fill",--布局宽度
  layout_height="fill",--布局高度
  --backgroundColor=网页覆盖色,--背景颜色
  --id="网页覆盖",--父容器，装载WebView
  {
    MultiTextView
    {
      id="multiText",
    },
    --layout_weight="1",--重力分配
    layout_width="56dp",--布局宽度
    layout_height="25dp",--布局高度
    layout_gravity="center";
    --BackgroundDrawable=转波纹(0xffffffff)
  }
}--结束
)
--if 是否全屏2 then
import "mods.gongjulan"
w,低栏高度=getwh(底部栏2)
打开网页列表.addView(a)
--end

webviewp外.addView(loadlayout(
{
  MultiWebView
  {
    id="webviewp",
    multiText="multiText",

  },
  layout_width="fill",--布局宽度
  layout_height="fill",--布局高度
}))

view=webView
viewy=view



输入框内容=io.open("/data/data/"..activity.getPackageName().."/输入框内容.xml"):read("*a")
if 主页搜索hint=="诗句" then
  import "mods/shiju"
  local rand=math.random(#aword-#aword+1,#aword)
  主页搜索hint=aword[rand]
end
activity.ActionBar.hide()
loadfile("/data/data/"..activity.getPackageName().."/程序启动事件.lua")()

--task(5000,function()
--  webviewp:remove(1)

--end)
function onNewIntent(intent)
  --print(intent)
  if tostring(intent.getData())=="num1" then
    书签状态=true
   elseif tostring(intent.getData())=="num2" then
    弹出搜索状态=true
   elseif tostring(intent.getData())=="num3" then
    历史状态=true
   elseif tostring(intent.getData())=="num4" then
    悬浮窗状态=true
   else
    内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
    for t,c in 内容:gmatch("【项目】(.-)【项目】") do
      if t:match("【标题】(.-)【标题】")==tostring(intent.getData())
        view.loadUrl(t:match("【链接】(.-)【链接】"))
        是否已经找到可访问的链接=true
      end
    end
    if 是否已经找到可访问的链接 then
     else
      for d,文件夹内容 in pairs(文件夹内容) do
        for d,链接 in pairs(文件夹内容) do
          if d==tostring(intent.getData()) then
            view.loadUrl(t:match("【链接】(.-)【链接】"))
            是否已经找到可访问的链接=true
          end
        end
      end
    end
    if 是否已经找到可访问的链接 then
     else
      次数=0
      for d,文件夹内容 in pairs(文件夹列表) do
        次数=次数+1
        if d==tostring(intent.getData()) then
          文件夹内容弹窗(文件夹内容,文件夹列表项目存放表[次数])
        end
      end
    end
    if 是否已经找到可访问的链接 then
     else
      次数=0
      for d,链接 in pairs(主页项目) do
        次数=次数+1
        if d==tostring(intent.getData()) then
          view.loadUrl(链接)
        end
      end
    end
  end
end
task(1,function()
  双悬浮按钮中的左侧按钮=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮中的左侧按钮.xml"):read("*a")
  双悬浮按钮中的右侧按钮=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮中的右侧按钮.xml"):read("*a")
  双悬浮按钮模式=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮模式.xml"):read("*a")

  if 双悬浮按钮中的左侧按钮=="打开" or 双悬浮按钮模式=="打开" then
   else
    隐藏控件(ftba)
  end
  if 双悬浮按钮中的右侧按钮=="打开" or 双悬浮按钮模式=="打开" then
   else
    隐藏控件(ftba左)
  end
  常用网页滑动菜单=io.open("/data/data/"..activity.getPackageName().."/常用网页滑动菜单.xml"):read("*a")
  工具滑动菜单=io.open("/data/data/"..activity.getPackageName().."/工具滑动菜单.xml"):read("*a")
  菜单滑动菜单=io.open("/data/data/"..activity.getPackageName().."/菜单滑动菜单.xml"):read("*a")
  多窗口滑动菜单=io.open("/data/data/"..activity.getPackageName().."/多窗口滑动菜单.xml"):read("*a")
  if 常用网页滑动菜单=="打开" or
    工具滑动菜单=="打开" or
    菜单滑动菜单=="打开" or
    多窗口滑动菜单=="打开" or
    滑动菜单模式=="打开"
    then
   else
    隐藏控件(ftb2)
    隐藏控件(常用工具ftb2)
    隐藏控件(菜单ftb2)
    隐藏控件(多窗口ftb2)
    隐藏控件(ftb3)
    隐藏控件(常用工具ftb3)
    隐藏控件(菜单ftb3)
    隐藏控件(多窗口ftb3)
  end
  是否显示标题栏=true
  activity.setContentView(主页布局)

  import "hua"


  主页搜索padding="16dp"
  底栏mToolbar3width=1
  底栏mToolbar3width=底栏mToolbar3width-0.11
  底栏mToolbar3width=底栏mToolbar3width-0.11
  是否隐藏切换窗口按钮=io.open("/data/data/"..activity.getPackageName().."/是否隐藏切换窗口按钮.xml"):read("*a")
  是否隐藏网页前进按钮=io.open("/data/data/"..activity.getPackageName().."/是否隐藏网页前进按钮.xml"):read("*a")
  是否隐藏网页后退按钮=io.open("/data/data/"..activity.getPackageName().."/是否隐藏网页后退按钮.xml"):read("*a")
  是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=io.open("/data/data/"..activity.getPackageName().."/是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口.xml"):read("*a")
  if 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开" then
    隐藏控件(底栏mToolbar3外)
   else
    隐藏控件(底栏窗口切换HorizontalScrollView)
  end
  if 是否隐藏网页前进按钮=="打开" then
    隐藏控件(网页前进3)
   else
    底栏mToolbar3width=底栏mToolbar3width-0.11
  end
  if 是否隐藏网页后退按钮=="打开" then
    隐藏控件(网页后退LinearLayout)
   else
    底栏mToolbar3width=底栏mToolbar3width-0.11
  end
  if 是否隐藏切换窗口按钮=="打开" then
    隐藏控件(打开网页列表)
   else
    底栏mToolbar3width=底栏mToolbar3width-0.11
  end
  if 是否全屏 then
    if 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开" then
      底栏mToolbar3width=底栏mToolbar3width+0.11
      底栏mToolbar3width=底栏mToolbar3width+0.11
    end
  end
  function onConfigurationChanged(config)
    --这个函数不是自定义的，屏幕旋转系统会调用这个的

    AWidth=activity.getWidth()--新宽
    AHeight=activity.getHeight()--新高

    --local w=tostring(config):match("w(.-)dp")
    --local h=tostring(config):match("h(.-)dp")
    是否横屏=AWidth<AHeight
    if 是否横屏 then
      AWidth2=AWidth
      --竖屏
      --设置宽度
      linearParams = 底栏mToolbar3.getLayoutParams()
      linearParams.width =AWidth*底栏mToolbar3width
      底栏mToolbar3.setLayoutParams(linearParams)
      底栏窗口切换HorizontalScrollView.setLayoutParams(linearParams)
      是否把标题栏放到底栏中=io.open("/data/data/"..activity.getPackageName().."/是否把标题栏放到底栏中.xml"):read("*a")
      if 是否把标题栏放到底栏中=="打开" then
        if io.open("/data/data/"..activity.getPackageName().."/滑动返回.xml"):read("*a")=="打开" then
          隐藏控件(网页后退LinearLayout)
          --隐藏控件(网页前进3)
        end
       else
        隐藏控件(底栏mToolbar3外)
        if 是否显示标题栏 then
          显示控件2(顶部代替paddingTop)
          显示控件2(mToolbar3外2)
        end
      end
     else--info=land
      AWidth2=AHeight
      --横屏
      是否把标题栏放到底栏中=io.open("/data/data/"..activity.getPackageName().."/是否把标题栏放到底栏中.xml"):read("*a")
      if 是否把标题栏放到底栏中=="打开" then
        if io.open("/data/data/"..activity.getPackageName().."/滑动返回.xml"):read("*a")=="打开" then
          显示控件(网页后退LinearLayout)
          --隐藏控件(网页前进3)
        end
      end
      --设置宽度
      linearParams = 底栏mToolbar3.getLayoutParams()
      linearParams.width =AWidth*0.71
      底栏mToolbar3.setLayoutParams(linearParams)
      底栏窗口切换HorizontalScrollView.setLayoutParams(linearParams)
      --设置宽度
      linearParams = vngggggg内.getLayoutParams()
      linearParams.width =AHeight
      vngggggg内.setLayoutParams(linearParams)
      if 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="关闭" then
        显示控件(底栏mToolbar3外)
      end
      隐藏控件2(顶部代替paddingTop)
      隐藏控件2(mToolbar3外2)
    end
    for d,a in pairs(onConfigurationChangedList) do
      a(是否横屏)
    end
  end
  if 是否横屏 then
    --竖屏
    AWidth2=AHeight
   else--info=land
    --横屏
    AWidth2=AWidth
  end
  隐藏控件(侧栏)
  --设置宽度
  linearParams = 侧栏.getLayoutParams()
  linearParams.width =AWidth2
  侧栏.setLayoutParams(linearParams)
  --打开菜单.Elevation=获取控件阴影();

  --listlayout.removeView()
  --activity.setContentView(loadlayout("layout"))
  --webviewp0.setVisibility(View.INVISIBLE)
  --奇思妙想喜羊羊(想做个浏览器)
  --哈哈
  --by dingyi qq2960586094
  --完善了删除功能
  --去除自带的丑丑的进度条(然后写了更丑的，真棒)
  --弃坑fa
  --长按选择图片(长按后台加载&本地加载链接)
  --修复浏览器输入布局弹不出来
  --已知bug(选择窗口有点问题)
  --这个简单的浏览器还会更新的哈哈(也许呢)
  浏览器页面标题栏背景是否为白色=io.open("/data/data/"..activity.getPackageName().."/浏览器页面标题栏背景是否为白色.xml"):read("*a")
  if 浏览器页面标题栏背景是否为白色=="打开" then
    标题栏色=底栏
  end
  恢复颜色()
  全屏模式状态=io.open("/data/data/"..activity.getPackageName().."/是否全屏.xml"):read("*a")
  if 全屏模式状态=="打开" then
    隐藏控件(底部栏2)
    隐藏控件(mToolbar3外2)
    隐藏控件(顶部代替paddingTop)
    悬浮按钮外.addView(loadlayout("layout/zhuye/xuanfuanniu"))
    --控件可视
    悬浮按钮.setVisibility(View.VISIBLE)
   else
    显示控件(底部栏2)
    if 主页链接=="收藏带搜索栏" then
     elseif 主页链接=="标志加搜索栏加网格收藏" then
     else
      显示控件(mToolbar3外2)
      显示控件(顶部代替paddingTop)
    end
  end

  if 是否全屏 then
    if 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开" then
      隐藏控件(返回主页)
      隐藏控件(打开菜单)
      --else
      --隐藏控件(底部栏2)
    end
    --隐藏控件(mToolbar3)
    --隐藏控件(顶部代替paddingTop)
   else
    显示控件(底部栏2)
    if 主页链接=="收藏带搜索栏" then
     elseif 主页链接=="标志加搜索栏加网格收藏" then
     else
      显示控件(mToolbar3外2)
      显示控件(顶部代替paddingTop)
    end
    是否把标题栏放到底栏中=io.open("/data/data/"..activity.getPackageName().."/是否把标题栏放到底栏中.xml"):read("*a")
    if 是否把标题栏放到底栏中=="打开" then
     else
      隐藏控件(底栏mToolbar3外)
    end
    if io.open("/data/data/"..activity.getPackageName().."/主页标题是否居中.xml"):read("*a")=="打开" then
      网页标题副父布局.setGravity(Gravity.CENTER_HORIZONTAL | Gravity.CENTER_VERTICAL);
    end
  end

  --task(1,function()
  import "shu2"

  波纹qwe()

  function 获取itemc2()
    return
    {
      LinearLayout,
      orientation="horizontal",
      layout_width="fill",
      layout_height='45dp';
      id="列表LinearLayout",
      {
        ImageView;
        --src="png/tbs.png";
        layout_width='22dp';
        layout_height='22dp';
        layout_gravity='left|center';
        layout_marginLeft='18dp';
        id='icon';
        ColorFilter=文字;--图片颜色
      };
      {
        TextView,
        id="title",
        textColor=文字;
        text='加载中';--文本内容
        textSize="14sp",
        --layout_margin="16dp",
        layout_marginLeft="8dp";
        layout_gravity="center",
      },
    }
  end
  itemc3width=dp2px(360)/3.7
  function 获取itemc3()
    return
    {
      LinearLayout,
      orientation="horizontal",
      id="列表LinearLayout",
      --Background=转波纹(文字);
      layout_width=itemc3width;
      {
        ImageView;
        --src="png/tbs.png";
        layout_width='18dp';
        layout_height='18dp';
        layout_gravity='left|center';
        layout_margin='10dp';
        layout_marginLeft='7dp';
        layout_marginRight='7dp';
        id='icon';
        ColorFilter=文字;--图片颜色
      };
      {
        TextView,
        id="title",
        textColor=文字;
        text='加载中';--文本内容
        textSize="14sp",
        --layout_margin="16dp",
        layout_gravity="center",
        MaxLines=2,
      },
    }
  end
  底栏窗口切换列表id表={}

  浏览器页面标题栏背景是否为白色=io.open("/data/data/"..activity.getPackageName().."/浏览器页面标题栏背景是否为白色.xml"):read("*a")
  标签栏中当前的的背景=CircleButton(小条2,dp2px(12));
  标签栏中其他的的背景=CircleButton(0,dp2px(12));
  把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口的按钮={
    LinearLayout,
    orientation="horizontal",
    id="列表LinearLayout",
    layout_width=itemc3width;
    layout_height='fill';
    {
      LinearLayout,
      orientation="horizontal",
      Background=标签栏中当前的的背景;
      layout_width='fill';
      layout_height='38dp';
      layout_marginTop='3dp';
      id="列表LinearLayout内",
      {
        ImageView;
        --src="png/tbs.png";
        layout_width='18dp';
        layout_height='18dp';
        layout_gravity='left|center';
        layout_margin='10dp';
        layout_marginLeft='7dp';
        layout_marginRight='7dp';
        id='icon';
        ColorFilter=文字;--图片颜色
      };
      {
        TextView,
        id="title",
        textColor=文字;
        text='加载中';--文本内容
        textSize="14sp",
        --layout_margin="16dp",
        layout_gravity="center",
        MaxLines=2,
      },
    };
  }
  adp=LuaAdapter(activity,{},获取itemc2())--线性布局 结束
  function 返回主页f(窗口,istrue)
    窗口=当前窗口
    if istrue then
      if 主页链接=="收藏" then
       elseif 主页链接=="收藏带搜索栏" then
       elseif 主页链接=="仅搜索栏" then
       else
        是否正在查看布局页面=false
        webView.loadUrl(主页链接)
        vngggggg.setVisibility(View.INVISIBLE)
        --adp.getData()[窗口]={icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=view.getProgress()}

        --table.insert(adp.getData(),{title="主页",icon=loadbitmap("png/home.png")})
        是否显示主页列表[窗口]=false
        adp.notifyDataSetChanged()

      end
     else
      标题t.text="Mhdhhf浏览器"
      底栏标题t.text="Mhdhhf浏览器"
      if 主页链接=="收藏" then
        是否正在查看布局页面=true
        --控件可视
        vngggggg.setVisibility(View.VISIBLE)
        标题t.text="主页"
        底部栏2.setBackgroundColor(Color.parseColor(背景2))
        if 浏览器页面标题栏背景是否为白色=="打开" then
          mToolbar3.setBackgroundColor(Color.parseColor(背景2))
        end
        主页搜索2.setVisibility(View.GONE)
        隐藏控件(书签和历史记录)
        隐藏控件(list3)
        恢复颜色()
        --pcall(self2.imp.webchange,view,{icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=view.getProgress()})


        --table.insert(adp.getData(),{title="主页",icon=loadbitmap("png/home.png")})
        是否显示主页列表[窗口]=true
        adp.notifyDataSetChanged()



        if not 网页加载状态列表[当前窗口] then
          view.stopLoading()
        end
       elseif 主页链接=="收藏带搜索栏" then
        是否显示标题栏=false
        是否正在查看布局页面=true
        隐藏控件2(mToolbar3外2)
        隐藏控件2(顶部代替paddingTop)
        --控件可视
        vngggggg.setVisibility(View.VISIBLE)
        --控件可视
        主页搜索2.setVisibility(View.VISIBLE)
        底部栏2.setBackgroundColor(Color.parseColor(背景2))
        if 浏览器页面标题栏背景是否为白色=="打开" then
          mToolbar3.setBackgroundColor(Color.parseColor(背景2))
        end
        隐藏控件(书签和历史记录)
        隐藏控件(list3)
        恢复颜色()
        --pcall(self2.imp.webchange,view,{icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=100})
        --pcall(self2.imp.webchange,view,{icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=view.getProgress()})
        --table.insert(adp.getData(),{title="主页",icon=loadbitmap("png/home.png")})
        是否显示主页列表[窗口]=true
        adp.notifyDataSetChanged()



        if not 网页加载状态列表[当前窗口] then
          view.stopLoading()
        end
       elseif 主页链接=="仅搜索栏" then
        主页搜索LinearLayout.onClick=function()
          弹出搜索(true)
        end
        是否显示标题栏=false
        是否正在查看布局页面=true
        隐藏控件2(mToolbar3外2)
        隐藏控件2(顶部代替paddingTop)
        --控件可视
        vngggggg.setVisibility(View.VISIBLE)
        --控件可视
        主页搜索2.setVisibility(View.VISIBLE)
        底部栏2.setBackgroundColor(Color.parseColor(背景2))
        隐藏控件(收藏列表ScrollView)
        if 浏览器页面标题栏背景是否为白色=="打开" then
          mToolbar3.setBackgroundColor(Color.parseColor(背景2))
        end
        恢复颜色()



        --table.insert(adp.getData(),{title="主页",icon=loadbitmap("png/home.png")})
        是否显示主页列表[窗口]=true
        adp.notifyDataSetChanged()




        if not 网页加载状态列表[当前窗口] then
          view.stopLoading()
        end
       else
        是否正在查看布局页面=false
        webView.loadUrl(主页链接)
        vngggggg.setVisibility(View.INVISIBLE)
        --adp.getData()[窗口]={icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=view.getProgress()}

        --table.insert(adp.getData(),{title="主页",icon=loadbitmap("png/home.png")})
        是否显示主页列表[窗口]=false
        adp.notifyDataSetChanged()

      end
      if self2 then
        adp.getData()[窗口]={icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=view.getProgress()}
        pcall(self2.imp.webchange,view,{icon=loadbitmap("png/home.png"),id=self2:findWebView(view),title="主页",progress=view.getProgress()})
        if 底栏窗口切换列表id表[当前窗口] then
         elseif 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开" then
          底栏窗口切换.addView(loadlayout(把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口的按钮))
          table.insert(底栏窗口切换列表id表,{icon2=icon,title2=title,列表LinearLayout2=列表LinearLayout,列表LinearLayout内2=列表LinearLayout内})
          列表LinearLayout.Background=转波纹(小条2);
          if 上一个窗口id then
            底栏窗口切换列表id表[上一个窗口id].列表LinearLayout内2.Background=标签栏中其他的的背景
          end
          local 点击的窗口=当前窗口
          local 长按的窗口=当前窗口
          列表LinearLayout.onClick=function()
            if 状态6 then
              if 点击的窗口==当前窗口 then
                popw.dismiss()
               else
                webviewp:select(上一个窗口id)
                上一个窗口id=上一个窗口id2
              end
              webviewp:remove(点击的窗口)
              震动(20)
             else
              if 点击的窗口==当前窗口 then
                弹出搜索()
               else
                上一个窗口id2=上一个窗口id
                webviewp:select(点击的窗口)
              end
            end
            状态6=true
            task(300,function()
              状态6=false
            end)
          end
          列表LinearLayout.onLongClick=function()
            窗口切换长按菜单(长按的窗口,底栏窗口切换列表id表[长按的窗口].列表LinearLayout2)
          end
        end
        --设置的图片也可以输入路径
        底栏窗口切换列表id表[当前窗口].icon2.setImageBitmap(loadbitmap("png/home.png"))
        底栏窗口切换列表id表[当前窗口].title2.text="主页"
        底栏窗口切换列表id表[当前窗口].icon2.ColorFilter=文字
      end
    end
  end
  if 主页链接=="收藏" or 主页链接=="收藏带搜索栏" or 主页链接=="仅搜索栏" then
    名称="网页收藏"
    showDataDialog(名称,名称)
    主页2.addView(listlayout)--添加控件
  end
  当前窗口=1
  返回主页f(当前窗口)
  if 是否全屏 then
   else
    返回主页.onClick=返回主页f
  end



  页内查找EditText.addTextChangedListener{
    onTextChanged=function(s)
      view.findAllAsync(页内查找EditText.text)
  end}
  页内查找CardView.setVisibility(View.INVISIBLE)
  波纹({上翻,下翻,关闭页内查找},"方",文字)
  是否将网页前进按钮和网页后退按钮改为书签按钮和历史按钮=io.open("/data/data/"..activity.getPackageName().."/是否将网页前进按钮和网页后退按钮改为书签按钮和历史按钮.xml"):read("*a")
  if 是否将网页前进按钮和网页后退按钮改为书签按钮和历史按钮=="打开" then
    网页后退LinearLayout.onClick=function(v)
      打开书签()
    end
    网页前进3.onClick=function(v)
      打开历史()
    end
    --设置的图片也可以输入路径
    网页后退ImageView.setImageBitmap(loadbitmap("png/fglkg.png"))

    --设置的图片也可以输入路径
    网页前进ImageView.setImageBitmap(loadbitmap("png/timelap.png"))
  end
  if 文件是否存在("/data/data/"..activity.getPackageName().."/是否显示悬浮工具栏设置与教程卡片.xml")==false then
    悬浮工具栏设置与教程卡片外.addView(loadlayout("layout/kapian"))
  end
  task(1,function()
    import "menu"
    --import "view.MultiWebView"


    all1=""
    view.setFindListener{
      onFindResultReceived=function(position,all, b)
        查找提示区.setText("当前第"..(position+1).."个结果，".."总共找到"..all.."个");
        if all<=1 then
          查找提示区.textColor=文字123
         else
          查找提示区.textColor=转0x(一般强调色)
        end
        if all1==all then
         else
          import "android.content.Context"
          --导入包
          vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
          vibrator.vibrate(long{0,30} ,-1)
          --{等待时间,振动时间,等待时间,振动时间,…}
          --{0,1000,500,1000,500,1000}
          --别忘了申明权限
        end
        all1=all
      end
    }

    --adp


    --adp set



    webviewp:setOnWebViewAdd(function(view2,info)
      --print(info["istrue"])
      --view=webView

      --viewy=view
      --返回主页f(#weblist)
      if info["istrue"] then
        local view=view2

        local viewy=view2
       else
        view=view2

        viewy=view2
      end


      当前窗口=#weblist
      返回主页f(#weblist,info["istrue"])


    end)

    webviewp:setOnWebViewDelete(function(view,info)
      local 关闭的标签页=io.open("/data/data/"..activity.getPackageName().."/关闭的标签页.xml"):read("*a")
      关闭的标签页=string2tab(关闭的标签页)
      mWebBackForwardList=view.copyBackForwardList()
      mWebBackForwardListSize=mWebBackForwardList.getSize()-1
      local 当前页面=mWebBackForwardList.getCurrentItem()
      --if mWebBackForwardListSize>0 then
      --print(mWebBackForwardList.getCurrentItem())
      --print(mWebBackForwardList.getItemAtIndex(0))
      --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
      local datas={}


      --循环添加匹配有数据的列表到
      --nj只是一个变量，你可以用其他变量代替
      --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
      --就相当于  for  1,3   do
      for nj=0,mWebBackForwardListSize do
        local mItemAtIndex=mWebBackForwardList.getItemAtIndex(nj)
        --print(mItemAtIndex.getFavicon())
        --给空的datas添加所有的数据
        --格式为  table.insert(空列表名称,{id=数据列表[nj]})
        table.insert(datas,{title=mItemAtIndex.getTitle(),Url=mItemAtIndex.getUrl()})
      end

      local datas2={
        datas=datas,
        当前页面={title=当前页面.getTitle(),Url=当前页面.getUrl()}
      }
      table.insert(关闭的标签页,datas2)
      写入文件("/data/data/"..activity.getPackageName().."/关闭的标签页.xml",dump(关闭的标签页))
      保存阅读进度()
      table.remove(adp.getData(),info.id)
      print("已删除 "..info.title)
      adp.notifyDataSetChanged()
      --设置宽度
      linearParams = (底栏窗口切换列表id表[info.id].列表LinearLayout2).getLayoutParams()
      linearParams.width =0
      (底栏窗口切换列表id表[info.id].列表LinearLayout2).setLayoutParams(linearParams)
    end)

    创建关联页面的页面=当前窗口
    webviewp:setOnWebViewChange(function(view,info)
      adp.getData()[info.id]={title=info.title,icon=(info.icon or "image/web_96x96.png")}
      adp.notifyDataSetChanged()
      if 关联页面储存表[创建关联页面的页面] then
       else
        关联页面储存表[创建关联页面的页面]={}
      end
      if 创建关联页面的页面~=info.id then
        table.insert(关联页面储存表[创建关联页面的页面],info.id)
      end
    end)

    if 滑动菜单模式=="打开" and 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="关闭" then
     else
      webviewp:setOnMultiChoose(function()
        if AWidth<AHeight then
          多窗口CardViewWidth =AWidth
         else
          多窗口CardViewWidth =AHeight
        end
        底部弹窗({
          ListView,--列表视图控件
          layout_width="fill",--布局宽度
          --layout_height="80%h",--布局高度
          dividerHeight=0,--分割线高度
          id="多窗口list",
          paddingTop="30dp";
          paddingBottom="0";
          --BackgroundColor=背景2;
          verticalScrollBarEnabled=false,--隐藏滑条
        },
        {
          FrameLayout;
          layout_gravity='right|center';
          id="右下角菜单";
          layout_marginLeft="8dp";
          layout_marginRight="8dp";
          layout_width='fill';
          {
            LinearLayout;
            layout_width='44dp';
            layout_height='44dp';
            Gravity="center",
            id="清空窗口";
            Background=转波纹(文字);
            {
              ImageView;
              layout_height="28dp";
              src="png/delete_black.png";
              colorFilter=文字123,--图片颜色
              layout_width="25dp";
              -- layout_marginRight="17dp";
              layout_gravity='center';
            };
          };
          {
            LinearLayout;
            layout_width='44dp';
            layout_height='44dp';
            Gravity="center",
            id="添加窗口";
            layout_gravity='right|center';
            Background=转波纹(文字);
            {
              ImageView;
              layout_height="28dp";
              src="png/fhvpfxgj.png";
              colorFilter=文字123,--图片颜色
              layout_width="25dp";
              -- layout_marginRight="17dp";
              layout_gravity='center';
            };
          };
        }
        )
        添加窗口.onClick=function()
          webviewp:openNewUrl()
          创建关联页面的页面=当前窗口
          关闭对话框()
        end
        清空窗口.onClick=function()
          对话框({
            标题="提示",
            点击事件=function()
              webviewp:destroy()
            end,
            文本内容="是否删除所有窗口",
            是否显示取消按钮=true,
          })
          关闭对话框()
        end
        多窗口list.adapter=adp

        多窗口list.onItemClick=function(_,_,_,l)
          webviewp:select(l)
          关闭对话框()
        end

        多窗口list.onItemLongClick=function(_,v,_,l)
          窗口切换长按菜单(l,v)
          --关闭对话框()
        end
      end)
    end
    function 窗口切换长按菜单(长按的窗口,控件ID)
      pop=PopupMenu(activity,控件ID)
      menu=pop.Menu
      if 长按的窗口==当前窗口 then
        if not 网页加载状态列表[当前窗口] then
          menu.add("刷新").onMenuItemClick=function(a)
            view.reload()--刷新页面
            刷新状态="刷新"
          end
        end
      end
      menu.add("打开竖向的切换窗口弹窗").onMenuItemClick=function(a)
        webviewp:multiChoose()
      end
      menu.add("删除所有窗口").onMenuItemClick=function(a)
        对话框({
          标题="提示",
          点击事件=function()
            webviewp:destroy()
          end,
          文本内容="是否删除所有窗口",
          是否显示取消按钮=true,
        })
      end
      menu.add("删除").onMenuItemClick=function(a)
        webviewp:remove(长按的窗口)
      end
      pop.show()--显示@音六站长～
    end
    参数=0
    --[[function onKeyDown(code,event)
  --if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 网页加载状态=="末完成" then
      view.stopLoading()
     else
      if 参数+2 > tonumber(os.time()) then
        activity.finish()
       else
        Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT )
        .show()
        参数=tonumber(os.time())
      end
    end
    return true
  --end
end]]

    --按两次返回退出页面
    --没加退出webview那些高端玩意，你们来
    if 是否全屏 then
     else
      Sideslip.onClick=function()
        浏览器菜单("刷新网页")
      end
      底栏Sideslip.onClick=function()
        浏览器菜单("刷新网页")
      end
      网页标题副父布局.onClick=function()
        弹出搜索()
      end
      底栏网页标题副父布局.onClick=function()
        弹出搜索()
      end
    end

    import "mods.sousuo"
    if 弹出搜索状态 then
      弹出搜索()
    end
    网页标题副父布局onLongClick=function(v)
      pop=PopupMenu(activity,v)
      menu=pop.Menu
      menu.add("粘贴").onMenuItemClick=function(a)
        弹出搜索(true,true)
      end
      menu.add("复制链接").onMenuItemClick=function(a)
        --先导入包
        import "android.content.*"
        activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(view.Url)
        print("已复制")
      end
      menu.add("切换搜索引擎").onMenuItemClick=function(a)
        切换搜索引擎(v)
      end
      menu.add("克隆标签页").onMenuItemClick=function(a)
        webviewp:openNewUrl(view.Url)
      end
      menu.add("后台克隆标签页").onMenuItemClick=function(a)
        webviewp:openNewUrl(view.Url,true)
      end
      pop.show()--显示@音六站长～
    end
    网页标题副父布局.onLongClick=网页标题副父布局onLongClick
    底栏网页标题副父布局.onLongClick=网页标题副父布局onLongClick
    主页搜索LinearLayout.onLongClick=网页标题副父布局onLongClick
    --[[菜单按钮.onLongClick=function()
  showChoose()
end
]]

    --view.getSettings().setJavaScriptEnabled(false); --支持js脚本



    function QQ群(h)
      url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin="..h.."&card_type=group&source=qrcode"
      activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
    end


    import "android.graphics.drawable.ColorDrawable"

    --网页列表数量显示2=网页列表数量显示
    --设置加粗
    --网页列表数量显示.getPaint().setFakeBoldText(true)
    --qwe=view.getScrollVisiblePosition()
    记录2=0
    滑动显示隐藏操作栏=io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")
    if 滑动显示隐藏操作栏=="打开"
      function 刷新2()
        task(60,function()
          if AWidth<AHeight then
            if 是否显示主页列表[当前窗口] then
             else


              if 全屏模式状态=="关闭" then
                if 记录2==0
                  显示控件2(顶部代替paddingTop)
                  显示控件2(mToolbar3外2)
                  显示控件2(底部栏2)
                 elseif 记录2<获取浏览器滑动位置(view)
                  linearParams2 = mToolbar3.getLayoutParams()
                  if linearParams2.height==0 then
                   elseif 动画是否正在执行 then
                   else
                    --相关参数，请自行手册查询
                    --定义动画,500为上升高度。
                    yuxuandh=TranslateAnimation(0,0,0,-dp2px(44))
                    --动画时间，也就是上升动画的快慢
                    yuxuandh.setDuration(150)
                    yuxuandh.setRepeatCount(0)
                    --动画开始执行
                    mToolbar3.startAnimation(yuxuandh);
                    --动画开始执行
                    顶部代替paddingTop.startAnimation(yuxuandh);
                    --相关参数，请自行手册查询
                    --定义动画,500为上升高度。
                    yuxuandh3=TranslateAnimation(0,0,0,dp2px(44))
                    --动画时间，也就是上升动画的快慢
                    yuxuandh3.setDuration(150)
                    yuxuandh3.setRepeatCount(0)
                    --动画开始执行
                    底部栏2.startAnimation(yuxuandh3);
                    --相关参数，请自行手册查询
                    --定义动画,500为上升高度。
                    yuxuandh3=TranslateAnimation(0,0,0,-dp2px(44))
                    --动画时间，也就是上升动画的快慢
                    yuxuandh3.setDuration(150)
                    yuxuandh3.setRepeatCount(0)
                    --动画开始执行
                    webviewp0.startAnimation(yuxuandh3);
                    动画是否正在执行=true
                    task(15,function()
                      隐藏控件2(顶部代替paddingTop)
                      隐藏控件2(mToolbar3外2)
                      隐藏控件2(底部栏2)
                      动画是否正在执行=false
                    end)
                  end
                 elseif 记录2>获取浏览器滑动位置(view)
                  linearParams2 = mToolbar3.getLayoutParams()
                  if linearParams2.height==0 then
                    --相关参数，请自行手册查询
                    --定义动画,500为上升高度。
                    yuxuandh3=TranslateAnimation(0,0,-dp2px(44),0)
                    --动画时间，也就是上升动画的快慢
                    yuxuandh3.setDuration(150)
                    --动画开始执行
                    mToolbar3.startAnimation(yuxuandh3);
                    --动画开始执行
                    webviewp0.startAnimation(yuxuandh3);
                    --动画开始执行
                    顶部代替paddingTop.startAnimation(yuxuandh3);
                    --相关参数，请自行手册查询
                    --定义动画,500为上升高度。
                    yuxuandh3=TranslateAnimation(0,0,dp2px(44),0)
                    --动画时间，也就是上升动画的快慢
                    yuxuandh3.setDuration(150)
                    yuxuandh3.setRepeatCount(0)
                    --动画开始执行
                    底部栏2.startAnimation(yuxuandh3);
                  end
                  显示控件2(顶部代替paddingTop)
                  显示控件2(mToolbar3外2)
                  显示控件2(底部栏2)
                end
                记录2=获取浏览器滑动位置(view)
              end
            end
          end
          刷新2()
        end)
      end
      刷新2()
    end
    if io.open("/data/data/"..activity.getPackageName().."/滑动返回.xml"):read("*a")=="打开" then
      侧滑布局.setDrawerListener(DrawerLayout.DrawerListener{
        onDrawerSlide=function(v,i)
          if io.open("/data/data/"..activity.getPackageName().."/滑动返回.xml"):read("*a")=="打开" then
            if(i>0.80)then
              if(状态码==nil)then
                if(tostring(v)==tostring(右侧滑栏))then
                  网页前进()
                  侧滑布局.closeDrawer(Gravity.END)
                 else
                  网页后退()
                  侧滑布局.closeDrawer(3)
                end
              end
              状态码="qwe"
              task(100,function()
                状态码=nil
              end)
            end
           else
            侧滑布局.closeDrawer(3)
          end
      end})
    end
    --import "android.graphics.PorterDuffColorFilter"
    --import "android.graphics.PorterDuff"
    --修改ProgressBar颜色
    --pbar.ProgressDrawable.setColorFilter(PorterDuffColorFilter(文字,PorterDuff.Mode.SRC_ATOP))
    --mToolbar3外.Elevation=dp2px(5);
    mToolbar3外.Elevation=dp2px(5);
    --设置TypeFace
    --import "android.graphics.Typeface"
    --标题t.getPaint().setTypeface(Typeface.MONOSPACE)
    --网页列表数量显示.getPaint().setTypeface(Typeface.MONOSPACE)
    --网页列表数量显示.getPaint().setFakeBoldText(true)
    import "android.graphics.PixelFormat"
    --网页中的视频，上屏幕的时候，可能出现闪烁的情况，需要如下设置
    activity.getWindow().setFormat(PixelFormat.TRANSLUCENT);
    --ftb=打开菜单

    if not 是否全屏 then
      if 全屏模式状态=="打开" then
        import "mods/xuanfuqiu"
      end
      if 底栏样式=="搜索样式" then
        隐藏控件2(mToolbar3外2)
        隐藏控件(ids.ftb_five)
       elseif 底栏样式=="书签样式" then
        隐藏控件(ids.ftb_five)
      end
    end
    是否启用菜单按钮上滑功能=io.open("/data/data/"..activity.getPackageName().."/是否启用菜单按钮上滑功能.xml"):read("*a")
    if 是否启用菜单按钮上滑功能=="打开" then
      import "mods/shanghua"
    end
    if 文件是否存在("/data/data/"..activity.getPackageName().."/添加快捷方式数字记录.xml")==false or
      io.open("/data/data/"..activity.getPackageName().."/添加快捷方式数字记录.xml"):read("*a")~="4"
      then
      import "mods/changanShortcut"
    end
    function main(...)
      if ... then
        view.loadUrl(...)
      end
      页面是否在前台=true
    end
    function onStop()
      页面是否在前台=false
    end


    --[[table.eq=function(a,b)
      if #a~=#b then return false end
      for k,v in pairs(b) do
        if tostring(a[k])~=tostring(v) then
          return false
        end
      end
      return true
    end]]
    主页itemc={
      LinearLayout,
      layout_width=菜单CardViewWidth/4;
      layout_height=高度;
      orientation="vertical",--布局方向
      Gravity="center",
      id="LinearLayout3",
      -- onTouchListener=点击监听,--动画效果

      --   onTouchListener=点击监听,--动画效果

      {
        FrameLayout,
        layout_width=圆环大小;
        layout_height=圆环大小,
        layout_Gravity="center",
        --Gravity="center",
        id="CardView2",
        --backgroundDrawable=边框(圆环大小/2,"#00000000",边框2,dp2px("1.5"));
        {
          LinearLayout,
          layout_width=圆环大小;
          layout_height=圆环大小,
          layout_Gravity="center",
          Gravity="center",
          {
            ImageView;
            layout_height="22dp";
            src="png/kadb.png";
            id="图标";
            ColorFilter=文字;--图片颜色
            layout_width="22dp";
            layout_Gravity="center",
          };
        };
        {
          TextView;
          -- colorFilter=0xFFffffff;
          layout_gravity="center";
          textSize="12sp";
          textColor=主页文字颜色;
          --   Typeface=字体("Product");
          id="TextView图标";
          Gravity="center",
          MaxEms=1,
          MaxLines=1,
        };
      };
      {
        TextView;
        -- colorFilter=0xFFffffff;
        text=activity.Title;
        layout_gravity="center";
        textSize="12sp";
        textColor=文字123;
        --   Typeface=字体("Product");
        id="标题";
        Gravity="center",
        paddingTop="5dp";
        padding="16dp",
        MaxLines=1,
      };
    };
    主页itemc2={
      LinearLayout,
      layout_width=菜单CardViewWidth/5;
      --layout_height=高度;
      orientation="vertical",--布局方向
      Gravity="center",
      id="LinearLayout2",
      paddingTop="3dp";
      paddingBottom="3dp";
      -- onTouchListener=点击监听,--动画效果

      --   onTouchListener=点击监听,--动画效果
      {
        FrameLayout,
        layout_width=圆环大小*0.8;
        layout_height=圆环大小*0.8,
        layout_Gravity="center",
        --Gravity="center",
        id="CardView5",
        --backgroundDrawable=边框(圆环大小*0.9/2,"#00000000",边框2,dp2px("1.5"));
        {
          LinearLayout,
          layout_width=圆环大小*0.8;
          layout_height=圆环大小*0.8,
          layout_Gravity="center",
          Gravity="center",
          {
            ImageView;
            layout_height="22dp";
            src="png/kadb.png";
            id="图标";
            ColorFilter=文字;--图片颜色
            layout_width="22dp";
            layout_Gravity="center",
          };
        };
        {
          TextView;
          -- colorFilter=0xFFffffff;
          layout_gravity="center";
          textSize="12sp";
          textColor=文字;
          --   Typeface=字体("Product");
          id="TextView图标";
          Gravity="center",
          MaxEms=1,
          MaxLines=1,
        };
      };
      {
        TextView;
        -- colorFilter=0xFFffffff;
        text=activity.Title;
        layout_gravity="center";
        textSize="12sp";
        textColor=文字123;
        --   Typeface=字体("Product");
        id="text";
        Gravity="center",
        paddingTop="0dp";
        padding="2dp",
        MaxLines=1,
      };
    };
    task(1,function()
      常用网页滑动菜单=io.open("/data/data/"..activity.getPackageName().."/常用网页滑动菜单.xml"):read("*a")
      工具滑动菜单=io.open("/data/data/"..activity.getPackageName().."/工具滑动菜单.xml"):read("*a")
      菜单滑动菜单=io.open("/data/data/"..activity.getPackageName().."/菜单滑动菜单.xml"):read("*a")
      多窗口滑动菜单=io.open("/data/data/"..activity.getPackageName().."/多窗口滑动菜单.xml"):read("*a")

      if 常用网页滑动菜单=="打开" or
        工具滑动菜单=="打开" or
        菜单滑动菜单=="打开" or
        多窗口滑动菜单=="打开" or
        滑动菜单模式=="打开"
        then
        import "huadongcaidan"
      end
      function 网页信息()
        运行代码含读取文件("mods/wangyexinxi")
      end
      搜索图标LinearLayout.onClick=网页信息
      底栏搜索图标LinearLayout.onClick=网页信息
      是否允许执行事件=true
      --_,viewh=getwh(webviewp外)
      viewh=AHeight-dp2px(88)
      --print(viewh)
      view.onTouch=function(_,event,a)
        if 是否上下滑动翻页 then
          if event.getAction()==MotionEvent.ACTION_DOWN then
            downX2 = event.getRawX()
            downY2 = event.getRawY()
           elseif event.getAction()==MotionEvent.ACTION_MOVE then
            downX = event.getRawX()
            downY = event.getRawY()
            if downY-downY2>dp2px(8) and 是否允许执行事件 then
              view.ScrollY=view.ScrollY-viewh
              是否允许执行事件=false
            end
            if downY2-downY>dp2px(8) and 是否允许执行事件 then
              view.ScrollY=view.ScrollY+viewh
              是否允许执行事件=false
            end
           elseif event.getAction()==MotionEvent.ACTION_UP then
            是否允许执行事件=true
            --[[ downX = event.getRawX()
          downY = event.getRawY()
          a=MotionEvent()
          a.RawX=downX
        a.RawY=downY
          view.onTouchEvent(a)
            --view.addTouchables(ArrayList{downX,downY})]]
          end
          --[[if event.getAction()==MotionEvent.ACTION_UP then
          downY = event.getRawY()
          if downY<AHeight/2 then
            view.ScrollY=view.ScrollY-viewh
           else
            view.ScrollY=view.ScrollY+viewh
          end
        end]]
          return true
        end
      end
      下翻按钮.onClick=function()
        view.ScrollY=view.ScrollY+viewh
      end;
      上翻按钮.onClick=function()
        view.ScrollY=view.ScrollY-viewh
      end;
      --[[双悬浮按钮中的左侧按钮=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮中的左侧按钮.xml"):read("*a")
      双悬浮按钮中的右侧按钮=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮中的右侧按钮.xml"):read("*a")
      双悬浮按钮模式=io.open("/data/data/"..activity.getPackageName().."/双悬浮按钮模式.xml"):read("*a")]]
      a=function()
        id=ftba
        --[[id.onClick=function(v,event)

    end]]
        w2=dp2px(50)
        if 打开滑动菜单所需的按钮显示位置=="center|left" then
          idgetXb=dp2px(72)
         else
          idgetXb=AWidth-dp2px(72)-w2
        end
        local idgetY=id.getY()
        --隐藏控件(右菜单菜单工具箱GridView)
        状态=false
        --隐藏控件(右菜单)
        --上面也有一段这个被注释的代码
        --[[if 双悬浮按钮模式=="打开" then
          if 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开" then
            隐藏控件(返回主页)
            隐藏控件(打开菜单)
           else
            隐藏控件(底部栏2)
          end
          隐藏控件(mToolbar3)
          隐藏控件(顶部代替paddingTop)
        end]]
        if 双悬浮按钮中的左侧按钮=="打开" or 双悬浮按钮模式=="打开" then
          id.onLongClick=function()
            震动(25)
            返回主页f()
            状态5=true
            task(500,function()
              状态5=false
            end)
          end
          id.onClick=function(v)
            if not(状态5) then
              if 状态6 then
                关闭对话框()
                浏览器菜单("刷新网页",false,v,true)--LinearLayout2
                震动(20)
               else
                打开菜单2()
              end
              状态6=true
              task(300,function()
                状态6=false
              end)
              --print(12)
            end
          end
          w2=dp2px(50)
          idgetYa=AHeight-dp2px(50)-dp2px(100)
          if 打开滑动菜单所需的按钮显示位置=="center|left" then
            --这个是左边的按钮的X
            idgetXa=dp2px(72)
            --这个是左边的按钮的X
            idgetXa右=idgetXa+w2+dp2px(10)
           else
            --这个是右边的按钮的X
            idgetXa右=AWidth-dp2px(72)-w2
            --这个是左边的按钮的X
            idgetXa=idgetXa右-dp2px(10)-w2
          end

          新悬浮按钮常用工具列表=io.open("/data/data/"..activity.getPackageName().."/新悬浮按钮常用工具列表.xml"):read("*a")
          if 新悬浮按钮常用工具列表=="" or 新悬浮按钮常用工具列表==nil then
           else
            新悬浮按钮常用工具列表=string2tab(新悬浮按钮常用工具列表)
            新悬浮按钮常用工具datas={}
            for d,名称 in pairs(新悬浮按钮常用工具列表) do
              --给空的datas添加所有的数据
              local 项目编号=(table.find(mmpqwe,名称) or table.find(mmpe,名称))
              table.insert(新悬浮按钮常用工具datas,{text=名称,图标=aw3工具箱[项目编号],TextView图标={Visibility=View.VISIBLE}})
              if not 项目编号 then
                table.insert(新悬浮按钮常用工具datas,{text=名称,图标="png/a",TextView图标={Visibility=View.VISIBLE}})
              end
            end
            --
            --创建适配器，将datas里面的数据匹配给itemc小项目
            yuxuan_adpqy=LuaAdapter(activity,新悬浮按钮常用工具datas,主页itemc2)

            --将小项目匹配给大list
            新悬浮按钮常用工具GridView.Adapter=yuxuan_adpqy
          end
          w1,h2=getwh(新悬浮按钮多窗口listCardView)
          w,h1=getwh(新悬浮按钮常用工具GridView)
          local h=h1*(#新悬浮按钮常用工具列表)
          local a=0.5
          local h2=h*a
          Top右悬浮球工具=idgetYa-h2
          --print(w1,h2)
          Left右悬浮球工具=idgetXa右-w
          linearParams = 新悬浮按钮多窗口listCardView.getLayoutParams()
          linearParams.setMargins(Left右悬浮球工具,Top右悬浮球工具,0,0)
          新悬浮按钮多窗口listCardView.setLayoutParams(linearParams)
          --显示控件(新悬浮按钮多窗口listCardView)
          ftba.onTouch=function(_,event,a)
            if event.getAction()==MotionEvent.ACTION_DOWN then
              downX2 = event.getRawX()
              downY2 = event.getRawY()
              --y=event.getY()+idgetY
              --print(downY2,y,idgetY)
              --状态=true
              --是否为多窗口2=是否为多窗口
              --if (右菜单.Visibility==View.GONE) then
              --只显示要显示的内容(id2)
              --end
             elseif event.getAction()==MotionEvent.ACTION_MOVE then
              --[[moveX = event.getRawX()
        moveY = event.getRawY()
        downX = moveX
        downY = moveY]]
              downX = event.getRawX()
              downY = event.getRawY()
              --if event.getY()+idgetY-y<-1 or downX>idgetY then
              --状态=false
              --end
              --downY2:最初的downY
              --print(1)
              if downX>idgetXa右+w2 and (downY)<(downY2+dp2px(64)) then
                震动(20)
                if 打开滑动菜单所需的按钮显示位置=="center|left" then
                  网页前进()
                 else
                  网页后退()
                end
               elseif downX<idgetXa右 --[[and (downY)<(downY2+dp2px(64))]] and not 状态5 then
                显示控件(新悬浮按钮多窗口listCardView)
                显示控件(新悬浮按钮常用工具GridView)
                隐藏控件(新悬浮按钮多窗口list)
                if 状态6 then
                  popw.dismiss()
                end
                状态5=true
                是否打开了新悬浮按钮常用工具=true
                task(200,function()
                  状态5=false
                end)
               elseif downY>downY2+tointeger(菜单CardViewWidth/21) and not 状态6 then
                --下滑事件
                import "android.content.Context"
                震动(25)
                --打开工具箱()
                弹出搜索()
                状态6=true
                task(200,function()
                  状态6=false
                end)
               elseif downY2>downY+tointeger(菜单CardViewWidth/21) and not 状态6 then
                --上滑事件
                import "android.content.Context"
                震动(25)
                弹出搜索()
                状态6=true
                task(200,function()
                  状态6=false
                end)
              end
             elseif event.getAction()==MotionEvent.ACTION_UP then
              --print(idgetX,downX)
              --w2,h2=getwh(id)
              -- print((downY),(idgetY+dp2px(88)))
              --local 状态3=true
              --状态=false
              --状态2=false
              隐藏控件(新悬浮按钮多窗口listCardView)
              if 是否打开了新悬浮按钮常用工具 then
                是否打开了新悬浮按钮常用工具=false
                local downY = event.getRawY()
                local Y2=downY-Top右悬浮球工具
                local 项目编号=Y2/h1
                local 项目编号=tointeger(项目编号)
                local 项目=新悬浮按钮常用工具datas[项目编号].text
                --print(datas[项目编号].text,项目编号)
                震动(25)
                浏览器菜单(项目,false,ftba,true)--LinearLayout2
              end
              downY2=nil
              downY=nil
            end
          end
         else
          隐藏控件(ftba)
        end
      end
      a()
      if 双悬浮按钮中的右侧按钮=="打开" or 双悬浮按钮模式=="打开" then
        a=function()
          id=ftba左
          --隐藏控件(右菜单菜单工具箱GridView)
          状态=false
          --隐藏控件(右菜单)
          新悬浮按钮多窗口list.Adapter=adp
          新悬浮按钮多窗口list.onItemClick=function(_,_,_,l)
            webviewp:select(l)
            隐藏控件(右菜单)
          end

          新悬浮按钮多窗口list.onItemLongClick=function(_,_,_,l)
            窗口切换长按菜单(l,v)
          end
          id.onLongClick=function()
            if not 状态5 then
              震动(25)
              webviewp:openNewUrl()
              状态5=true
              task(500,function()
                状态5=false
              end)
            end
          end
          --[[id.onClick=function(v,event)

    end]]
          --local idgetY=id.getY()
          --新悬浮按钮多窗口list外.Y=Top
          id.onClick=function(v)
            if not(状态5) then
              震动(25)
              if 状态6 then
                webviewp:remove(长按的窗口)
               else
                webviewp:multiChoose()
              end
              状态6=true
              task(300,function()
                状态6=false
              end)
              --print(12)
            end
          end
          ftba左.onTouch=function(_,event,a)
            if event.getAction()==MotionEvent.ACTION_DOWN then
              downX2 = event.getRawX()
              downY2 = event.getRawY()
              当前窗口2=当前窗口
              --y=event.getY()+idgetY
              --print(downY2,y,idgetY)
              --状态=true
              --是否为多窗口2=是否为多窗口
              --if (右菜单.Visibility==View.GONE) then
              --只显示要显示的内容(id2)
              --end
             elseif event.getAction()==MotionEvent.ACTION_MOVE then
              --[[moveX = event.getRawX()
        moveY = event.getRawY()
        downX = moveX
        downY = moveY]]
              downX = event.getRawX()
              downY = event.getRawY()
              --if event.getY()+idgetY-y<-1 or downX>idgetY then
              --状态=false
              --end
              --downY2:最初的downY
              --print(1)
              if not 状态2 then
                w,h1=getwh(新悬浮按钮多窗口list)
                local h=h1*(#weblist)
                local a=(当前窗口-1)/#weblist
                local h2=h*a
                Top=idgetYa-h2
                Left=idgetXa-w
                linearParams = 新悬浮按钮多窗口listCardView.getLayoutParams()
                linearParams.setMargins(Left,Top,0,0)
                新悬浮按钮多窗口listCardView.setLayoutParams(linearParams)
                显示控件(新悬浮按钮多窗口listCardView)
                显示控件(新悬浮按钮多窗口list)
                隐藏控件(新悬浮按钮常用工具GridView)
                状态2=true
              end
              if downX>idgetXa+w2 and (downY)<(downY2+dp2px(64)) and not 状态5 then
                震动(20)
                浏览器菜单("历史记录",false,v,true)--LinearLayout2
                状态5=true
                task(200,function()
                  状态5=false
                end)
               elseif downX<idgetXa and (downY)<(downY2+dp2px(64)) and not 状态5 then
                震动(20)
                状态5=true
                task(200,function()
                  状态5=false
                end)
                浏览器菜单("书签",false,v,true)--LinearLayout2
               elseif not 状态5 then
                --下滑事件
                Y=downY-Top
                标签页编号=tointeger(Y/h1)
                if 标签页编号>=1 and 标签页编号<=#weblist and 标签页编号~=当前窗口 then
                  webapi:select(标签页编号)
                end
                --[[下滑事件
             local downY=downY
              local downY2=downY2
             local 差=downY2-downY
              local 经过的项目数=差/h1
              local 经过的项目数=经过的项目数-经过的项目数*2
              if downY>downY2 then
                标签页编号=tointeger(当前窗口2+(经过的项目数)-1)
               else
                标签页编号=tointeger(当前窗口2-(经过的项目数)-1)
              end
              --print("下滑事件",标签页编号,当前窗口2,经过的项目数)
              if 标签页编号>=1 and 标签页编号<=#weblist and 标签页编号~=当前窗口 then
                webapi:select(标签页编号)
              end]]
                状态5=true
                task(200,function()
                  状态5=false
                end)
              end
             elseif event.getAction()==MotionEvent.ACTION_UP then
              隐藏控件(新悬浮按钮多窗口listCardView)
              --print(idgetX,downX)
              --w2,h2=getwh(id)
              -- print((downY),(idgetY+dp2px(88)))
              --local 状态3=true
              状态2=false
            end
          end
        end
        a()
       else
        隐藏控件(ftba左)
      end
      --[[下翻按钮.onLongClick=function()
        for nj=1,10000 do
          xpcall(function()
            view.ScrollY=view.ScrollY+AHeight*0.6
            end,function()
            nj=100
          end)
        end
      end]]
      task(1,function()
        --import "view.MultiWebView2"

        import "func2"
        if 书签状态 then
          打开书签()
        end
        if 历史状态 then
          打开历史()
        end
        task(1,function()
          --延迟之后执行的事件
          --显示首次启动页()
          if 文件是否存在("/data/data/"..activity.getPackageName().."/是否是首次启动.xml")==false then
            --qweasd用户协议.show()
            import "shouciqidongyie"
            显示首次启动页()
          end
        end)
        task(1,function()
          if 悬浮窗状态 then
            import "xuanfuchuang"
            showWindow(view.url)
            import "android.content.Intent"
            home=Intent(Intent.ACTION_MAIN);
            home.addCategory(Intent.CATEGORY_HOME);
            activity.startActivity(home);
          end
        end)
      end)
    end)
  end)
  --end)
  onConfigurationChanged()
end)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
--task(1,function()
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)
--end)
function onPause()
  保存阅读进度()
end
