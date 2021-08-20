--文字=0xFF000000
--下面是基于夸喵关于开源代码修改的菜单弹窗代码和菜单函数
--夸喵关于开源代码【带更新提示】
--小白菜QQ：2694199949 【代写布局，有需要者可咨询】
--特别声明：小白菜开发这个关于，个人只写了布局和更新提示
--文件管理以及更新弹窗套用某网友的源码再进行二次更改和优化
--所以小白菜只开发了布局和更新提示！！！
--套用夸喵这个关于的请在源代码中留下小白菜的信息，每个开发者都不容易，谢谢您的尊重！

function 浏览器菜单(文本,是否在悬浮窗,id,a)
  if a then
    id=id
   elseif id then
    id=id.Tag.CardView
  end
  if 文本=="添加书签" then
    if 是否在悬浮窗 then
      --上升动画
      --相关参数，请自行手册查询
      --定义动画,500为上升高度。
      yuxuandh3=TranslateAnimation(0,0,activity.height,0)
      --动画时间，也就是上升动画的快慢
      yuxuandh3.setDuration(150)
      --动画开始执行
      悬浮窗收藏LinearLayout.startAnimation(yuxuandh3);
      --控件可视
      悬浮窗收藏LinearLayout外.setVisibility(View.VISIBLE)
      悬浮窗收藏标题qwe.text=悬浮窗webView.title
      悬浮窗收藏链接qwe.text=悬浮窗webView.Url
     else
      保存收藏(view.title,view.Url)
    end
   elseif 文本=="书签" or 文本=="历史记录" then
    if 是否在悬浮窗 then
      --控件可视
      悬浮窗收藏2.setVisibility(View.VISIBLE)
      if 文本=="书签" then
        名称="网页收藏"
        if vngggggg悬浮窗历史记录 then
          隐藏控件(vngggggg悬浮窗历史记录)
        end
        if vngggggg悬浮窗书签 then
          显示控件(vngggggg悬浮窗书签)
        end
       else
        名称="历史记录保存"
        if vngggggg悬浮窗书签 then
          隐藏控件(vngggggg悬浮窗书签)
        end
        if vngggggg悬浮窗历史记录 then
          显示控件(vngggggg悬浮窗历史记录)
        end
      end
      showDataDialog(名称,"书签",true)
      if 文本=="书签" then
        vngggggg悬浮窗书签=vngggggg悬浮窗
       else
        vngggggg悬浮窗历史记录=vngggggg悬浮窗
      end
      悬浮窗收藏2.addView(listlayout)--添加控件
      主页搜索2.setVisibility(View.GONE)
      yuxuandh4=TranslateAnimation(0,0,0,activity.height)
      yuxuandh4.setDuration(150)
      悬浮窗菜单scrollView外.startAnimation(yuxuandh4);
      import "android.view.animation.Animation$AnimationListener"
      task(50,function()
        --控件不可视
        悬浮窗菜单scrollView外.setVisibility(View.INVISIBLE)
      end)
      --上升动画
      --相关参数，请自行手册查询
      --定义动画,500为上升高度。
      yuxuandh3=TranslateAnimation(0,0,activity.height,0)
      --动画时间，也就是上升动画的快慢
      yuxuandh3.setDuration(150)
      --动画开始执行
      悬浮窗收藏LinearLayout外.startAnimation(yuxuandh3);
      --控件可视
      悬浮窗收藏LinearLayout外.setVisibility(View.VISIBLE)
      --控件不可视
      悬浮窗收藏LinearLayout.setVisibility(View.INVISIBLE)
      --控件可视
      关闭外2.setVisibility(View.VISIBLE)
      --上升动画
      --相关参数，请自行手册查询
      --定义动画,500为上升高度。
      yuxuandh3=TranslateAnimation(0,0,activity.height,0)
      --动画时间，也就是上升动画的快慢
      yuxuandh3.setDuration(300)
      --动画开始执行
      关闭外.startAnimation(yuxuandh3);
      function 关闭a()
        yuxuandh4=TranslateAnimation(0,0,0,activity.height)
        yuxuandh4.setDuration(150)
        悬浮窗收藏LinearLayout外.startAnimation(yuxuandh4);
        yuxuandh5=TranslateAnimation(0,0,0,activity.height)
        yuxuandh5.setDuration(1000)
        关闭外.startAnimation(yuxuandh5);
        import "android.view.animation.Animation$AnimationListener"
        task(50,function()
          --控件不可视
          悬浮窗收藏LinearLayout外.setVisibility(View.INVISIBLE)
          --控件不可视
          关闭外2.setVisibility(View.INVISIBLE)
          --控件可视
          悬浮窗收藏LinearLayout.setVisibility(View.VISIBLE)
        end)
      end
     else
      if 文本=="书签" then
        打开书签()
       else
        打开历史()
      end
    end
   elseif 文本=="下载管理" then
    activity.newActivity('xiazai')
   elseif 文本=="暗色模式" then
    暗色模式亮色模式切换()
   elseif 文本=="亮色模式" then
    暗色模式亮色模式切换()
   elseif 文本=="设置" then
    if 页面列表["设置"] then
      显示控件(设置背景外)
     else
      import "sts/st2"
    end
   elseif 文本=="工具箱" then
    打开工具箱()
   elseif 文本=="退出" then
    activity.finish()
   elseif 文本=="在一般的页面浏览网页" then
    if 页面是否在前台 then
      webview(悬浮窗webView.Url)
     else
      activity.newActivity("main",{悬浮窗webView.Url})
    end
   elseif 文本=="更换背景色" then
    底部弹窗({
      ListView;
      --layout_height="fill";
      id="mList";
      layout_width="fill";
      dividerHeight="0";
    })

    local item={
      FrameLayout,
      layout_width='-1';
      {
        TextView;
        id="item";
        layout_width="fill";--宽度
        Focusable=false,
        FocusableInTouchMode=false,
        gravity="center";
        padding="16dp";
        textColor=文字;--卡片背景颜色--#F17F42
        textSize="15sp";
      };
    }
    --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
    datas={}

    --创建了三个有数据的列表
    backgroundColor={0xFFe8e8ff,0xFFffe8e8,0xFFffffe8,0xFFe8ffe8,0xFFe8f3ff,0xfff7f7f7,0x3533A7AA,0x6533A7AA}
    backgroundColor应用={"#e8e8ff","#ffe8e8","#ffffe8","#e8ffe8","#e8f3ff","#FAFAFA"}
    aw3={"淡紫色","淡红色","淡黄色","淡绿色","淡蓝色","灰色","自定义","恢复"}

    --循环添加匹配有数据的列表到
    --nj只是一个变量，你可以用其他变量代替
    --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
    --就相当于  for  1,3   do
    for nj=1,#aw3 do
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      table.insert(datas,{item={text=aw3[nj],backgroundColor=backgroundColor[nj]}})
    end
    --
    --创建适配器，将datas里面的数据匹配给itemc小项目
    yuxuan_adpqy=LuaAdapter(activity,datas,item)

    --将小项目匹配给大list
    mList.Adapter=yuxuan_adpqy
    mList.setOnItemClickListener(AdapterView.OnItemClickListener{
      onItemClick=function(parent,v,pos,id)
        关闭对话框()
        if v.Tag.item.Text=="自定义" then
          对话框({
            标题="自定义背景色",
            HINT="十六进制颜色码，例如#e8e8ff",
            点击事件=function(text)
              qwe="iop"
              当前颜色=text
              asd=([[javascript:(function(){var styleElem=null,doc=document,ie=doc.all,fontColor=50,sel="body,body *";styleElem=createCSS(sel,setStyle(fontColor),styleElem);function setStyle(fontColor){var colorArr=[fontColor,fontColor,fontColor];return"background-color:]]..当前颜色..[[ !important;color:RGB("+colorArr.join("%,")+"%) !important;"}function createCSS(sel,decl,styleElem){var doc=document,h=doc.getElementsByTagName("head")[0],styleElem=styleElem;if(!styleElem){s=doc.createElement("style");s.setAttribute("type","text/css");styleElem=ie?doc.styleSheets[doc.styleSheets.length-1]:h.appendChild(s)}if(ie){styleElem.addRule(sel,decl)}else{styleElem.innerHTML="";styleElem.appendChild(doc.createTextNode(sel+" {"+decl+"}"))}return styleElem}})();]]);
              加载Js(asd)
              --写入文件("/data/data/"..activity.getPackageName().."/背景色.xml",asd)
              写入文件("/data/data/"..activity.getPackageName().."/背景色颜色码.xml",当前颜色)
              view.reload()--刷新页面
            end,
            是否显示取消按钮=true,
            输入框文本=io.open("/data/data/"..activity.getPackageName().."/背景色颜色码.xml"):read("*a")
          })
         else
          qwe="iop"
          if v.Tag.item.Text=="恢复" then
            当前颜色=""
            asd=""
           else
            当前颜色=backgroundColor应用[id]
            asd=([[javascript:(function(){var styleElem=null,doc=document,ie=doc.all,fontColor=50,sel="body,body *";styleElem=createCSS(sel,setStyle(fontColor),styleElem);function setStyle(fontColor){var colorArr=[fontColor,fontColor,fontColor];return"background-color:]]..当前颜色..[[ !important;color:RGB("+colorArr.join("%,")+"%) !important;"}function createCSS(sel,decl,styleElem){var doc=document,h=doc.getElementsByTagName("head")[0],styleElem=styleElem;if(!styleElem){s=doc.createElement("style");s.setAttribute("type","text/css");styleElem=ie?doc.styleSheets[doc.styleSheets.length-1]:h.appendChild(s)}if(ie){styleElem.addRule(sel,decl)}else{styleElem.innerHTML="";styleElem.appendChild(doc.createTextNode(sel+" {"+decl+"}"))}return styleElem}})();]]);
          end
          加载Js(asd)
          --写入文件("/data/data/"..activity.getPackageName().."/背景色.xml",asd)
          写入文件("/data/data/"..activity.getPackageName().."/背景色颜色码.xml",当前颜色)
          view.reload()--刷新页面
        end
    end})
   elseif 文本=="翻译网页" then
    if view.url then
      import "java.lang.String"
      import "javax.crypto.Cipher"
      import "javax.crypto.spec.IvParameterSpec"
      import "javax.crypto.spec.SecretKeySpec"
      import "android.util.Base64"
      import "java.net.URLEncoder"
      翻译链接="http://fanyi.baidu.com/transpage?query="..URLEncoder.encode(view.Url).."&from=auto&to=zh&source=url&ie=utf8&render=1"
      view.loadUrl(翻译链接)
     else
      print("没有加载网页")
    end
   elseif 文本=="打开无痕模式" then
    写入文件("/data/data/"..activity.getPackageName().."/无痕模式.xml","打开")
    mmpe[3]="关闭无痕模式"
    view.getSettings().setAcceptThirdPartyCookies(false) --不接受第三方cookie
   elseif 文本=="关闭无痕模式" then
    写入文件("/data/data/"..activity.getPackageName().."/无痕模式.xml","关闭")
    mmpe[3]="打开无痕模式"
    view.getSettings().setAcceptThirdPartyCookies(true) --接受第三方cookie
   elseif 文本=="定时刷新" then
    if view.url then
      InputLayout={
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        {
          SeekBar;
          --hint="输入";
          layout_marginTop="22dp";
          layout_marginBottom="22dp";
          layout_margin="10dp";
          layout_width="fill";
          layout_gravity="center",
          id="seekBar";
        };
        {
          TextView;
          --hint="输入";
          layout_marginTop="22dp";
          layout_marginBottom="22dp";
          layout_margin="10dp";
          layout_width="fill";
          layout_gravity="center",
          Gravity="center",
          id="textView";
        };
      };
      对话框({
        标题="定时刷新",
        点击事件=function()
          频率=seekBar.getProgress()+1*60000
          view2=view
          function 刷新一下()
            task(频率,function()
              view2.reload()--刷新页面
              刷新一下()
            end)
          end
          刷新一下()
        end,
        是否显示取消按钮=true,
        对话框布局=loadlayout(InputLayout),
      })
      seekBar.setMax(29)
      seekBar.setProgress(4)
      --绑定监听
      seekBar.setOnSeekBarChangeListener{
        onStartTrackingTouch=function()
          --开始拖动
        end,
        onStopTrackingTouch=function()
          --停止拖动
        end,
        onProgressChanged=function()
          --状态改变
          textView.text="每隔"..tostring(seekBar.getProgress()+1).."分钟刷新一次"
      end}
      --状态改变
      textView.text="每隔"..tostring(seekBar.getProgress()+1).."分钟刷新一次"
      拖动条颜色(seekBar,Color.parseColor(一般强调色))
     else
      print("没有加载网页")
    end
   elseif 文本=="网页源码" then
    --[[if view.url then
      viewsource后=string.gsub(view.Url,"view-source:","")
      if(string.sub(view.Url,1,12)=="view-source:")
        if(view.canGoBack())then
          view.goBack()--网页后退
        end
       else
        view.loadUrl("view-source:"..view.Url)
      end
     else
      print("没有加载网页")
    end]]
    webviewp:openNewUrl("view-source:"..view.Url)
    --print(viewsource后)
   elseif 文本=="页内查找" then
    if view.url then
      --控件可视
      页内查找CardView.setVisibility(View.VISIBLE)
      view.findAllAsync(页内查找EditText.text)
      w,h=getwh(页内查找CardView外)
      --上升动画
      --相关参数，请自行手册查询
      --定义动画,500为上升高度。
      yuxuandh3=TranslateAnimation(0,0,h,0)
      --动画时间，也就是上升动画的快慢
      yuxuandh3.setDuration(76)
      --动画开始执行
      页内查找CardView外.startAnimation(yuxuandh3);
      --动画结束回调
     else
      print("没有加载网页")
    end
   elseif 文本=="获取Cookie" then
    if view.url then
      local url=view.url
      local 域名=Uri.parse(view.url).authority
      local cookie=tostring(CookieManager.instance.getCookie(url))
      local cookie2=tostring(CookieManager.instance.getCookie(域名))
      对话框({
        标题="Cookie",
        点击事件=function()end,
        文本内容="当前URL: "..url.."\n当前域名:"..域名.."\n\nCookie (请勿泄漏以防账号被盗):\nURL:"..cookie.."\n域名:"..cookie2,
        是否显示取消按钮=false,
      })
     else
      print("没有加载网页")
    end
   elseif 文本=="切换UA" then
    pop=PopupMenu(activity,id)
    menu=pop.Menu
    menu.add("手机UA").onMenuItemClick=function(a)
      设置UC("Mozilla/5.0 (Linux; Android 7.1.1; OD105 Build/NMF26F; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.49 Mobile MQQBrowser/6.2 TBS/043409 Safari/537.36 MicroMessenger/6.5.13.1100 NetType/WIFI Language/zh_CN");
      关闭对话框()
    end
    menu.add("电脑UA").onMenuItemClick=function(a)
      设置UC("Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36");
      关闭对话框()
    end
    menu.add("自定义").onMenuItemClick=function(a)
      对话框({
        标题="自定义UA",
        HINT="UA",
        点击事件=function(text)
          设置UC(text)
        end,
        是否显示取消按钮=true,
        输入框文本=io.open("/data/data/"..activity.getPackageName().."/UA储存.xml"):read("*a")
      })
      关闭对话框()
    end
    pop.show()--显示@音六站长～
   elseif 文本=="保存网页" then
    pop=PopupMenu(activity,id)
    menu=pop.Menu
    menu.add("保存网页(mht)").onMenuItemClick=function(a)
      view.saveWebArchive(websave..view.getTitle()..".mht")
      print("已保存到:"..websave..view.getTitle()..".mht")
      关闭对话框()
    end
    menu.add("保存网页(图片)").onMenuItemClick=function(a)
      --代码由 Ayaka_ago 整理
      -- 对于安卓5.0以上，启用webView的整个网页绘制
      -- FA只能5.0以上用，所以其实不需要做判断
      -- 对于安卓5.0以下的，可使用webView的一个自带方法，详细自己百度
      if Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP then
        view.enableSlowWholeDocumentDraw()
        -- 这个方法不能在截图时才调用
        -- 如果不调用此方法，不可视的部分将无法截取到
      end
      savePicture(websave..view.getTitle()..".png",captureWeb(),false,true)
      print("已保存到:"..websave..view.getTitle()..".png")
      --注意
      --为避免踩雷，使用os.date应避免含有 / 的数值
      --比如%x
      --因为 / 会认定为是一个文件夹
      关闭对话框()
    end
    pop.show()--显示@音六站长～
   elseif 文本=="无图模式" then
    无图模式=io.open("/data/data/"..activity.getPackageName().."/无图模式.xml"):read("*a")

    if 无图模式=="打开" then
      写入文件("/data/data/"..activity.getPackageName().."/无图模式.xml","关闭")

      --id.ColorFilter=文字
      view.getSettings().setLoadsImagesAutomatically(true)

     else
      写入文件("/data/data/"..activity.getPackageName().."/无图模式.xml","打开")
      --id.ColorFilter=转0x(一般强调色)
      view.getSettings().setLoadsImagesAutomatically(false)

    end

    --[[elseif 文本=="打开网页缩放" then
    写入文件("/data/data/"..activity.getPackageName().."/网页缩放.xml","打开")
   elseif 文本=="关闭网页缩放" then
    写入文件("/data/data/"..activity.getPackageName().."/网页缩放.xml","关闭")]]
   elseif 文本=="调用其他浏览器" then
    if view.url then
      import "android.content.Intent"
      import "android.net.Uri"
      url=view.url
      viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
      activity.startActivity(viewIntent)
     else
      print("没有加载网页")
    end
   elseif 文本=="悬浮窗" then
    运行代码含读取文件("xuanfuchuang")
    showWindow(view.url)
   elseif 文本=="网页调试" then
    if JS储存 then
      加载Js(JS储存)
      view.reload()--刷新页面
      JS储存=nil
     else
      JS储存=io.open("/data/data/"..activity.getPackageName().."/JS储存.xml"):read("*a")
      view.evaluateJavascript([[(function (){
if(document.getElementById('mxvConsole2')){

}else{


//https://www.w3cways.com/demo/vconsole/vconsole.min.js?v=2.2.0


var version="3.2.0";function getCache(type){try{const local=JSON.parse(window.localStorage[type]);return local.data?local:null;}catch(e){return null;}}function setCache(type,data){if(!data){return;}window.localStorage[type]=JSON.stringify({version,data});}async function getVconsole(){const cache=getCache('vconsole');if(cache&&cache.version==version){return cache.data;}return window.fetch('//cdn.bootcss.com/vConsole/'+version+'/vconsole.min.js').then(res=>res.text()).then(data=>{setCache('vconsole',data);return data;});}async function buildVconsole(){const data=await getVconsole();writeJs(data);const vConsole=new VConsole();}function writeJs(text){var link=document.createElement("script");link.innerHTML=text;document.getElementsByTagName('head').item(0).appendChild(link);}function init(){getVconsole();buildVconsole();}init();
}
var pans= document.createElement('b');		
pans.id='mxvConsole2';
document.body.appendChild(pans);
})();]],nil)
    end
   elseif 文本=="强力前进后退" then
    if 强力前进后退 then
      强力前进后退=false
     else
      强力前进后退=true
    end
   elseif 文本=="横竖屏切换" then
    pop=PopupMenu(activity,id)
    menu=pop.Menu
    menu.add("横屏").onMenuItemClick=function(a)
      --横屏
      activity.setRequestedOrientation(0);

      关闭对话框()
    end
    menu.add("竖屏").onMenuItemClick=function(a)
      --横屏
      activity.setRequestedOrientation(1);

      关闭对话框()
    end
    menu.add("自动").onMenuItemClick=function(a)
      --自动切换横竖屏
      activity.setRequestedOrientation(4);

      关闭对话框()
    end
    pop.show()--显示@音六站长～
   elseif 文本=="浏览器日志" then
    activity.newActivity("mods/logcat")
   elseif 文本=="翻页器" then
    --创建了有数据的列表
    aw3={
      "上下滑动翻页",
      "翻页按钮",
    }
    Checked列表={
      是否上下滑动翻页,
      是否翻页按钮,
    }
    Checked列表2={
      "是否上下滑动翻页",
      "是否翻页按钮",
    }
    对话框标题="翻页器"
    运行代码含读取文件("mods/dialog/liebiaoduihuakuang")
    list.setOnItemClickListener(AdapterView.OnItemClickListener{
      onItemClick=function(parent,v,pos,id)
        if _G[Checked列表2[id]] then
          _G[Checked列表2[id]]=false
         else
          _G[Checked列表2[id]]=true
        end
        v.Tag.mSwitch.Checked=_G[Checked列表2[id]]
        if Checked列表2[id]=="是否翻页按钮" then
          if _G[Checked列表2[id]] then
            显示控件(翻页按钮)
           else
            隐藏控件(翻页按钮)
          end
        end
    end})
   elseif 文本=="刷新网页" then
    if 网页加载状态列表[当前窗口] then
      view.reload()--刷新页面
      刷新状态="刷新"
     elseif 网页加载状态列表[当前窗口]==false then
      view.stopLoading()
    end
   elseif 文本=="网页后退" then
    网页后退()
   elseif 文本=="网页前进" then

    网页前进()
   elseif 文本=="新建窗口" then
    webviewp:openNewUrl()
    创建关联页面的页面=当前窗口
   elseif 文本=="搜索" then
    弹出搜索()
   elseif 文本=="网页信息" then
    网页信息()
   elseif 文本=="主页" then
    返回主页f()
   else
    文件名称="工具脚本保存"
    内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
    for t,c in 内容:gmatch("【项目】(.-)【项目】") do
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      if t:match("【标题】(.-)【标题】")==文本 then
        loadstring(t:match("【内容】(.-)【内容】"))()
      end
    end
  end
end
工具长按菜单=function(parent,v,pos,id)
  文本=v.Tag.标题.Text
  pop=PopupMenu(activity,v)
  menu=pop.Menu
  if 文本=="网页源码" then
    menu.add("在悬浮窗中打开").onMenuItemClick=function(a)
      import "xuanfuchuang"
      showWindow("view-source:"..view.Url)
    end
    menu.add("-")
   elseif 文本=="翻译网页" then
    menu.add("在悬浮窗中打开").onMenuItemClick=function(a)
      if view.url then
        import "java.lang.String"
        import "javax.crypto.Cipher"
        import "javax.crypto.spec.IvParameterSpec"
        import "javax.crypto.spec.SecretKeySpec"
        import "android.util.Base64"
        import "java.net.URLEncoder"
        翻译链接="http://fanyi.baidu.com/transpage?query="..URLEncoder.encode(view.Url).."&from=auto&to=zh&source=url&ie=utf8&render=1"
        import "xuanfuchuang"
        showWindow(翻译链接)
       else
        print("没有加载网页")
      end
    end
    menu.add("-")
   elseif 文本=="书签" then
    menu.add("在悬浮窗中打开(还没做)").onMenuItemClick=function(a)
    end
    menu.add("-")
   elseif 文本=="更换背景色" then
    menu.add("恢复").onMenuItemClick=function(a)
      qwe="iop"
      当前颜色=""
      asd=""
      加载Js(asd)
      --写入文件("/data/data/"..activity.getPackageName().."/背景色.xml",asd)
      写入文件("/data/data/"..activity.getPackageName().."/背景色颜色码.xml",当前颜色)
      view.reload()--刷新页面
    end
    menu.add("-")
   elseif 文本=="获取Cookie" then
    menu.add("清除Cookie(还没做)").onMenuItemClick=function(a)
    end
    menu.add("-")
   elseif 文本=="页内查找" then
    menu.add("粘贴并查找").onMenuItemClick=function(a)
      if view.url then
        页内查找EditText.text=tostring(activity.getSystemService(Context.CLIPBOARD_SERVICE).getText())
        浏览器菜单(文本)
       else
        print("没有加载网页")
      end
    end
    menu.add("-")
   elseif 文本=="悬浮窗" then
    menu.add("在悬浮窗搜索").onMenuItemClick=function(a)
      import "xuanfuchuang"
      showWindow(翻译链接)
      悬浮窗弹出搜索()
    end
    menu.add("-")
   elseif 文本=="添加书签" then
    menu.add("添加至主页").onMenuItemClick=function(a)
      添加至主页(view.title,view.Url)
    end
    menu.add("添加至桌面(还没做)").onMenuItemClick=function(a)
    end
    menu.add("-")
    --[[elseif 文本=="书签" then
    menu.add("多选").onMenuItemClick=function(a)
    end
    menu.add("-")]]
  end
  menu.add("设置为低栏按钮长按事件(还没做)").onMenuItemClick=function(a)
  end
  menu.add("设置为低栏上滑事件").onMenuItemClick=function(a)
    写入文件("/data/data/"..activity.getPackageName().."/菜单按钮上滑功能.xml",文本)
  end
  menu.add("添加到悬浮工具栏快捷工具").onMenuItemClick=function(a)
    滑动菜单工具=io.open("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml"):read("*a")
    if 滑动菜单工具=="" or 滑动菜单工具==nil then
      滑动菜单工具={}
     else
      滑动菜单工具=string2tab(滑动菜单工具)
    end
    滑动菜单工具[#滑动菜单工具+1]=文本
    写入文件("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml",dump(滑动菜单工具))
  end
  pop.show()--显示@音六站长～
end
function 获取itemc(高度)
  if activity.getWidth()<activity.getHeight() then
    圆环大小=activity.getWidth()/100*10
    高度=activity.getWidth()/100*25
   else--info=land
    圆环大小=activity.getHeight()/100*10
    高度=activity.getHeight()/100*25
  end
  return{
    LinearLayout,
    layout_width='-1';
    layout_height=高度;
    orientation="vertical",--布局方向
    Gravity="center",
    -- onTouchListener=点击监听,--动画效果

    --   onTouchListener=点击监听,--动画效果
    {
      FrameLayout,
      layout_width=圆环大小;
      layout_height=圆环大小,
      --Gravity="center",
      id="CardView",
      --backgroundDrawable=边框(圆环大小/2,"#00000000",边框2,dp2px("1.5"));
      {
        LinearLayout,
        layout_width="fill";
        layout_height="fill",
        Gravity="center",
        {
          ImageView;
          layout_height="24dp";
          src="png/kadb.png";
          id="图标";
          ColorFilter=文字;--图片颜色
          layout_width="24dp";
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
      textSize="14sp";
      textColor=文字123;
      --   Typeface=字体("Product");
      id="标题";
      Gravity="center",
      paddingTop="5dp";
      padding="8dp",
    };
  };
end
--[[function SavePicture(name,bm)
  if bm then
    import "java.io.FileOutputStream"
    import "java.io.File"
    import "android.graphics.Bitmap"
    name=tostring(name)
    f = File(name)
    out = FileOutputStream(f)
    bm.compress(Bitmap.CompressFormat.PNG,90, out)
    out.flush()
    out.close()
    return true
   else
    return false
  end
end]]
if 滑动菜单模式=="打开" then
 else
  function 打开菜单2()
    底部弹窗({
      GridView;
      fastScrollEnabled=true;
      layout_width="fill";
      background=背景2,
      --padding="8dp";
      clipToPadding=false;
      ScrollBarStyle=ScrollView.SCROLLBARS_OUTSIDE_OVERLAY;
      -- layout_height="40%w";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
      --这里是分割线的意思
      numColumns=4;--每排显示网格数
      id="list3";
      paddingTop="18dp";
      paddingBottom="18dp";
      layout_weight="1";
    },
    {
      LinearLayout;
      Orientation='horizontal';
      layout_gravity='right|center';
      id="右下角菜单";
      {
        FrameLayout,
        --  Orientation='vertical';
        layout_width='44dp';
        layout_height='44dp';
        --BackgroundColor=背景2;
        id="菜单刷新FrameLayout";
        {
          LinearLayout;
          layout_width='fill';
          layout_height='fill';
          Gravity="center",
          id="菜单刷新";
          --onTouchListener=点击监听,--动画效果
          onClick=function()
            if 网页加载状态=="完成" then
              view.reload()--刷新页面
              刷新状态="刷新"
             elseif 网页加载状态=="末完成" then
              view.stopLoading()
            end
            关闭对话框()
          end,
          {
            ImageView;
            layout_height="26dp";
            id="菜单刷新ImageView";
            ColorFilter=文字,--图片颜色
            layout_width="26dp";
            -- layout_marginRight="17dp";
          };
        };
      };
      {
        FrameLayout,
        --  Orientation='vertical';
        layout_width='44dp';
        layout_height='44dp';
        --BackgroundColor=背景2;
        layout_marginRight="8dp";
        id="全屏模式3";
        {
          LinearLayout;
          layout_width='fill';
          layout_height='fill';
          Gravity="center",
          id="全屏模式";
          --onTouchListener=点击监听,--动画效果
          onClick=function()
            if 全屏模式状态=="关闭" then
              全屏模式状态="打开"
              隐藏控件(底部栏2)
              隐藏控件(mToolbar3)
              隐藏控件(顶部代替paddingTop)
              --控件可视
              悬浮按钮.setVisibility(View.VISIBLE)
              写入文件("/data/data/"..activity.getPackageName().."/是否全屏.xml","打开")
              --同理设置高度
              linearParams = 页内查找LinearLayout.getLayoutParams()
              linearParams.height =dp2px(164)+height
              页内查找LinearLayout.setLayoutParams(linearParams)
              ftb.setVisibility(View.VISIBLE)
             else
              全屏模式状态="关闭"
              显示控件(底部栏2)
              if 是否显示标题栏 then
                显示控件(mToolbar3)
                显示控件(顶部代替paddingTop)
              end
              --控件不可视
              悬浮按钮.setVisibility(View.INVISIBLE)
              写入文件("/data/data/"..activity.getPackageName().."/是否全屏.xml","关闭")
              --同理设置高度
              linearParams = 页内查找LinearLayout.getLayoutParams()
              width,height=getwh(查找提示区)
              linearParams.height =dp2px(88)+height
              页内查找LinearLayout.setLayoutParams(linearParams)
            end
            关闭对话框()
          end,
          {
            ImageView;
            layout_height="26dp";
            id="全屏模式2";
            src="png/__ic_fltbtn3.png";
            ColorFilter=文字,--图片颜色
            layout_width="26dp";
            -- layout_marginRight="17dp";
            --layout_gravity='center';
          };
        };
      };
    }
    )
    --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
    datas={}

    --创建了三个有数据的列表
    aic={}
    --"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")


    --循环添加匹配有数据的列表到
    --nj只是一个变量，你可以用其他变量代替
    --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
    --就相当于  for  1,3   do
    for nj=1,#mmpqwe2 do
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      table.insert(datas,{图标=aw3菜单2[nj],标题={text=mmpqwe2[nj]}})
    end


    --
    --table.insert(datas,{图标=aw3菜单2[nj],标题={text=mmpqwe2[nj]}})
    --创建适配器，将datas里面的数据匹配给itemc小项目
    local itemc=获取itemc()
    yuxuan_adpqy=LuaAdapter(activity,datas,itemc)

    --将小项目匹配给大list
    list3.Adapter=yuxuan_adpqy
    --datas[1].标题["text"]="fgh"
    list3.setOnItemClickListener(AdapterView.OnItemClickListener{
      onItemClick=function(parent,v,pos,id)
        关闭对话框()
        浏览器菜单(v.Tag.标题.Text,false,v)
    end})
    list3.onItemLongClick=工具长按菜单
  end
  function 打开工具箱()
    底部弹窗({
      GridView;
      fastScrollEnabled=true;
      layout_width="fill";
      background=背景2,
      --padding="8dp";
      clipToPadding=false;
      ScrollBarStyle=ScrollView.SCROLLBARS_OUTSIDE_OVERLAY;
      -- layout_height="40%w";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
      --这里是分割线的意思
      numColumns=4;--每排显示网格数
      id="list3";
      paddingTop="18dp";
      --paddingBottom="18dp";
      Gravity="center",
      layout_weight="1";
    })
    无图模式=io.open("/data/data/"..activity.getPackageName().."/无图模式.xml"):read("*a")

    --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
    datas={}

    --创建了三个有数据的列表
    aic={}
    --循环添加匹配有数据的列表到
    --nj只是一个变量，你可以用其他变量代替
    --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
    --就相当于  for  1,3   do

    for nj=1,#mmpea do
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      local a=mmpe开关[nj]
      if a then
        if a() then
          table.insert(datas,{图标={src=aw3工具箱[nj],ColorFilter=转0x(一般强调色)},标题={text=mmpea[nj]},TextView图标={Visibility=View.GONE}})
         else
          table.insert(datas,{图标={src=aw3工具箱[nj]},标题=mmpea[nj],TextView图标={Visibility=View.GONE}})
        end
       else
        table.insert(datas,{图标={src=aw3工具箱[nj]},标题=mmpea[nj],TextView图标={Visibility=View.GONE}})
      end
    end
    文件名称="工具脚本保存"
    内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
    for t,c in 内容:gmatch("【项目】(.-)【项目】") do
      if view.Url==t:match("【使用对象】(.-)【使用对象】") or t:match("【使用对象】(.-)【使用对象】")=="*" then
        if t:match("【是否开启脚本】(.-)【是否开启脚本】")=="打开" then
          table.insert(datas,{标题=t:match("【标题】(.-)【标题】"),图标={Visibility=View.GONE},TextView图标={Text=t:match("【标题】(.-)【标题】")}})
        end
      end
    end
    --table.insert(datas[10].图标,{colorFilter="#ffff7300"})
    --
    local itemc=获取itemc()
    --创建适配器，将datas里面的数据匹配给itemc小项目
    yuxuan_adpqy=LuaAdapter(activity,datas,itemc)

    --将小项目匹配给大list
    list3.Adapter=yuxuan_adpqy
    --  list3.numColumns=5
    -- 网络使用量显示.setVisibility(View.INVISIBLE)
    --list3.verticalSpacing="5%w";
    list3.setOnItemClickListener(AdapterView.OnItemClickListener{
      onItemClick=function(parent,v,pos,id)
        文本=v.Tag.标题.Text
        if 文本=="保存网页" then
         elseif 文本=="切换UA" then
         elseif 文本=="横竖屏切换" then
         else
          关闭对话框()
        end
        浏览器菜单(文本,false,v)
    end})
    list3.onItemLongClick=工具长按菜单
  end
end

--[[[ 08-14 19:14:27.145  4334: 4334 I/lua      ]
    datas={
      [1] = {
        ["图标"] = "png/fhvpfxgj.png" ;
        ["标题"] = {
          ["text"] = "添加书签" ;
        } ;
      } ;
      [2] = {
        ["图标"] = "png/bookmarks_black.png" ;
        ["标题"] = {
          ["text"] = "书签" ;
        } ;
      } ;
      [3] = {
        ["图标"] = "png/timelap.png" ;
        ["标题"] = {
          ["text"] = "历史记录" ;
        } ;
      } ;
      [4] = {
        ["图标"] = "png/gnjs2x.png" ;
        ["标题"] = {
          ["text"] = "下载管理" ;
        } ;
      } ;
      [5] = {
        ["图标"] = "png/mmm.png" ;
        ["标题"] = {
          ["text"] = "页内查找" ;
        } ;
      } ;
      [6] = {
        ["图标"] = "png/settings.png" ;
        ["标题"] = {
          ["text"] = "设置" ;
        } ;
      } ;
      [7] = {
        ["图标"] = "png/inbox_black.png" ;
        ["标题"] = {
          ["text"] = "工具箱" ;
        } ;
      } ;
      [8] = {
        ["图标"] = "png/highlight_off_black.png" ;
        ["标题"] = {
          ["text"] = "退出" ;
        } ;
      } ;
    } ;]]