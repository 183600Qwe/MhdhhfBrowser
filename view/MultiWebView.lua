import "android.webkit.URLUtil"
local ids={}

parent=loadlayout({
  LinearLayout,
  id="parent",

},ids)




weblist={}

weblistidtofindfast={}


webapi={}


关联页面储存表={}


阅读进度记录id列表={}


网页列表表={}


webtmp={
  homeUrl="https://leftshine.gitee.io/viaindex/defaultpage/index.html"
}




function newSetting(view,是否不设置下载)
  --[[view.getSettings().setDisplayZoomControls(false); --隐藏自带的右下角缩放控件
  view.getSettings().setSupportZoom(true); --支持网页缩放
view.getSettings().setSupportZoom(true);
    --设置出现缩放工具
    view.getSettings().setBuiltInZoomControls(true);
    --扩大比例的缩放
    view.getSettings().setUseWideViewPort(true);]]
  view.getSettings().setDomStorageEnabled(true); --dom储存数据
  view.getSettings().setDatabaseEnabled(true); --数据库
  view.getSettings().setAppCacheEnabled(true); --启用缓存
  view.getSettings().setUseWideViewPort(true);
  view.getSettings().setAllowFileAccess(true);--允许访问文件
  -- view.getSettings().setBuiltInZoomControls(true); --支持缩放
  view.getSettings().setLoadWithOverviewMode(true);
  view.getSettings().setLoadsImagesAutomatically(true);--图片自动加载
  view.getSettings().setAllowContentAccess(true); --允许访问内容
  view.getSettings().setJavaScriptEnabled(true); --支持js脚本
  view.getSettings().supportMultipleWindows() --设置多窗口
  view.getSettings().setUseWideViewPort(true) --图片自适应
  view.setLayerType(View.LAYER_TYPE_HARDWARE,nil);--硬件加速
  view.getSettings().setPluginsEnabled(true)--支持插件
  -- view.getSettings().setUseWideViewPort(true)--自适应屏幕
  view.getSettings().setCacheMode(view.getSettings().LOAD_CACHE_ELSE_NETWORK);--设置缓存加载方式
  view.getSettings().setLayoutAlgorithm(view.getSettings().LayoutAlgorithm.SINGLE_COLUMN)--支持重新布局
  --  view.getSettings().setGeolocationEnabled(true);--启用地理定位
  view.getSettings().setUseWideViewPort(false)--调整图片自适  view.removeView(view.getChildAt(0))--删除自带进度条
  -- view.getSettings().setAcceptThirdPartyCookies(true) --接受第三方cookie
  view.getSettings().setTextZoom(tonumber(网页字体大小))--字体大小
  view.getSettings().setUserAgentString(io.open("/data/data/"..activity.getPackageName().."/UA储存.xml"):read("*a"))
  --[[if io.open("/data/data/"..activity.getPackageName().."/网页缩放.xml"):read("*a")==("打开")
    view.getSettings().setSupportZoom(true);
    --设置出现缩放工具
    view.getSettings().setBuiltInZoomControls(true);
    --扩大比例的缩放
    view.getSettings().setUseWideViewPort(true);
  end]]
  function Too_young()
    view.setDownloadListener{onDownloadStart=function(url,userAgent,contentDisposition,mimetype,contentLength)
        文件名=URLUtil.guessFileName(url, contentDisposition, mimeType);
        下载链接=url
        文件类型=mimetype
        文件大小=Formatter.formatFileSize(this, contentLength)
        if 文件名=="" or nil then
          文件名=os.date("%Y%m%d%H%M%S")
        end
        下载()
        function adm(url)
          if pcall(function ()activity.getPackageManager().getPackageInfo("com.dv.adm.pay",0) end ) then
            this.startActivity(Intent().setAction("android.intent.action.SEND").setType("text/*").putExtra("android.intent.extra.TEXT", url).setClassName("com.dv.adm.pay", "com.dv.adm.pay.AEditor"))
           else
            print("没有安装ADM")
          end
        end
    end}
  end
  if 是否不设置下载 then
   else
    Too_young()
  end
  view.getSettings().setGeolocationEnabled(打开关闭转TF带读取文件("定位"));--启用地理定位
  view.getSettings().setSaveFormData(打开关闭转TF带读取文件("是否保存表单数据")); --保存表单数据，就是输入框的内容，但并不是全部输入框都会储存
  view.getSettings().setAcceptThirdPartyCookies(打开关闭反转并转TF带读取文件("无痕模式") or 打开关闭转TF带读取文件("是否不接受第三方cookie")) --不接受第三方cookie
  view.getSettings().setLoadsImagesAutomatically(打开关闭反转并转TF带读取文件("无图模式"))
  --view.setDayOrNight(true)
end


local function addOnLongClick(view,self)
  task(1,function()
    local z=loadlayout {
      View,

      layout_width="1",
      layout_height="1",
      Visibility=8,
    }
    view.addView(z)
    view.onTouch=function(v,e)
      z.x=e.x
      z.y=e.y+v.getScrollY()
    end
    view.onLongClick=function(v)
      hitTestResult = v.getHitTestResult()
      local pop=PopupMenu(activity,z)
      menu=pop.Menu
      if (hitTestResult.getType() == WebView.HitTestResult.IMAGE_TYPE or hitTestResult.getType() == WebView.HitTestResult.SRC_IMAGE_ANCHOR_TYPE)then
        --print(hitTestResult[1])
        menu.add("保存图片").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          Http.download(picUrl,picture..os.date("%Y-%m-%d-%H-%M-%S")..".png",function(a)
            print("图片已保存于"..picture)
          end)
        end
        menu.add("保存动图").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          Http.download(picUrl,picture..os.date("%Y-%m-%d-%H-%M-%S")..".gif",function(a)
            print("图片已保存于"..picture)
          end)
        end
        menu.add("搜狗识图").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          v.loadUrl("https://pic.sogou.com/pic/ris_searchList.jsp?statref=home&v=5&ul=1&keyword="..picUrl)
          print("正在识图....")
        end
                 menu.add("在当前标签页查看图片").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          v.loadUrl(picUrl)
        end
       menu.add("复制图片链接").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          --先导入包
          import "android.content.*"
          activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(picUrl)
          print("已复制")
        end
        menu.add("分享图片").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          Http.download(picUrl,picture..os.date("%Y-%m-%d-%H-%M-%S")..".png",function(a)
            Sharing(picture..os.date("%Y-%m-%d-%H-%M-%S")..".png")
          end)
        end
        menu.add("分享动图").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          Http.download(picUrl,picture..os.date("%Y-%m-%d-%H-%M-%S")..".gif",function(a)
            Sharing(picture..os.date("%Y-%m-%d-%H-%M-%S")..".gif")
          end)
        end
        pop.show()--显示
       elseif hitTestResult.getType() == WebView.HitTestResult.SRC_ANCHOR_TYPE or hitTestResult.getType() == WebView.HitTestResult.SRC_IMAGE_ANCHOR_TYPE then
                      menu.add("在新窗口打开").onMenuItemClick=function(a)
          --webview(hitTestResult.getExtra())
          webviewp:openNewUrl(hitTestResult.getExtra())
        end
        menu.add("后台打开").onMenuItemClick=function(a)
          --webview(hitTestResult.getExtra(),true)
          webviewp:openNewUrl(hitTestResult.getExtra(),true)
        end
    menu.add("——").onMenuItemClick=function(a)
        end
   menu.add("复制链接").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          --先导入包
          import "android.content.*"
          activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(picUrl)
          print("已复制")
        end
 menu.add("分享链接").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          制造一个新的浏览器(picUrl,function(view,url)
            分享链接(view.Title,picUrl)
          end)
        end
                menu.add("收藏链接").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          制造一个新的浏览器(picUrl,function(view,url)
            保存收藏(view.title,view.Url)
          end)
        end
        menu.add("保存所选网页").onMenuItemClick=function(a)
          picUrl = hitTestResult.getExtra()
          制造一个新的浏览器(picUrl,function(view,url)
            pop=PopupMenu(activity,z)
            menu=pop.Menu
            menu.add("保存网页(mht)").onMenuItemClick=function(a)
              mLuaWebView.saveWebArchive(websave..mLuaWebView.getTitle()..".mht")
              print("已保存到:"..websave..mLuaWebView.getTitle()..".mht")
            end
            menu.add("保存网页(图片)").onMenuItemClick=function(a)
              --代码由 Ayaka_ago 整理
              -- 对于安卓5.0以上，启用webView的整个网页绘制
              -- FA只能5.0以上用，所以其实不需要做判断
              -- 对于安卓5.0以下的，可使用webView的一个自带方法，详细自己百度
              if Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP then
                mLuaWebView.enableSlowWholeDocumentDraw()
                -- 这个方法不能在截图时才调用
                -- 如果不调用此方法，不可视的部分将无法截取到
              end
              savePicture(websave..mLuaWebView.getTitle()..".png",captureWeb(),false,true)
              print("已保存到:"..websave..mLuaWebView.getTitle()..".png")
              --注意
              --为避免踩雷，使用os.date应避免含有 / 的数值
              --比如%x
              --因为 / 会认定为是一个文件夹
            end
            pop.show()--显示@音六站长～
          end)
        end
        pop.show()--显示
        --print(tostring(hitTestResult.Class.getSimpleName()))
        --[[else
      print(hitTestResult.getText())]]
      end
    end
  end)
end


function newWebViewClient(view,self)
  task(1,function()
    view.setWebViewClient{
      shouldOverrideUrlLoading=function(view,url)
        pcall(self.imp.webchange,view,{icon=view.getFavicon(),id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
        if 跳转到另一个网页所有的时=="创建能在下次跳转到另一个网页时更新的新窗口打开此网页" then
          关联页面储存表内是否有当前窗口=nil
          此项目关联页面储存表内是否有当前窗口=nil
          for d,此项目关联页面储存表 in pairs(关联页面储存表) do
            if d==当前窗口 then
              关联页面储存表内是否有当前窗口=true
              此项目关联页面储存表2=此项目关联页面储存表
            end
            --[[for d,d2 in pairs(此项目关联页面储存表) do
          if d2==当前窗口 then
            要切换到的窗口=此项目关联页面储存表[d]+1
          end
        end]]
          end
          if 关联页面储存表内是否有当前窗口 then
            --if 此项目关联页面储存表内是否有当前窗口 then
            if #此项目关联页面储存表2~=0 then
              webapi:select(此项目关联页面储存表2[1])
              webView.loadUrl(url)
             else
              webviewp:openNewUrl(url)
            end
            view.stopLoading()
          end
         elseif 跳转到另一个网页所有的时=="创建新窗口打开此网页" then
          webviewp:openNewUrl(url)
        end
        进度条.setVisibility(0)--显示进度条
        if string.sub(url,1,7)=="http://" or
          string.sub(url,1,8)=="https://" or
          string.sub(url,1,7)=="file://" or
          string.sub(url,1,6)=="ftp://" or
          string.sub(url,1,12)=="view-source:" then
         else
          if 是否允许网页打开外部应用=="打开" then
            import "android.content.Intent"
            intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME);
            intent.setComponent(nil);
            this.startActivity(intent)
           elseif 是否允许网页打开外部应用=="询问" then
            对话框({
              标题="是否打开应用",
              点击事件=function()
                import "android.content.Intent"
                intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME);
                intent.setComponent(nil);
                this.startActivity(intent)
              end,
              文本内容="链接"..url,
              是否显示取消按钮=false,
            })
          end
        end
      end,
      onPageStarted=function(view,url,favicon)
        task(1,function()
          --     pcall(self.imp.webchange,view,{icon=view.getFavicon(),id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
          if view.getFavicon() and 是否显示主页列表[当前窗口]==false then
            pcall(self.imp.webchange,view,{icon={src=favicon},id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
            --设置的图片也可以输入路径
            底栏窗口切换列表id表[当前窗口].icon2.setImageBitmap(favicon)
            底栏窗口切换列表id表[当前窗口].icon2.setColorFilter(0)
           else
            pcall(self.imp.webchange,view,{icon={src=loadbitmap("png/tbs.png"),colorFilter=文字},id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
            --设置的图片也可以输入路径
            底栏窗口切换列表id表[当前窗口].icon2.setImageBitmap(loadbitmap("png/tbs.png"))
            底栏窗口切换列表id表[当前窗口].icon2.ColorFilter=文字
          end

          url=tostring(view.Url)
          local 网页列表=网页列表表[当前窗口].网页列表
          网页列表表[当前窗口].当前查看的页面=当前查看的页面+1
          if 网页列表表[当前窗口].当前查看的页面<#网页列表 then
            local 网页列表2={}
            --修改网页列表里的链接
            for d in pairs(网页列表) do
              table.insert(网页列表2,d)
              if d==当前查看的页面 then
                table.insert(网页列表2,view.url)
              end
            end
            网页列表=nil
            网页列表=网页列表2
            网页列表2=nil
           else
            table.insert(网页列表,view.url)
          end
          是否正在查看布局页面=false
          if view==weblist[当前窗口] then
            离开布局页面()
            设置右上角按钮图标("png/qwetyi.png")
            if #view.getTitle()>1 then
              刷新标题()
            end
           else
            是否显示主页列表[当前窗口]=false
          end
          网页加载状态列表[当前窗口]=false
        end)
        if mScrollY then
          view.ScrollY=mScrollY
          mScrollY=nil
          阅读进度记录id列表[当前查看的页面]=当前正在查看的页面的id
        end
      end,
      onPageFinished=function(view,url)
        if view==weblist[当前窗口] then
          设置右上角按钮图标("png/mklj.png")
          自动变色()
          刷新标题()
        end
        task(20,function()
          if 是否显示主页列表[当前窗口]==false then
            if view.getFavicon() then
              底栏窗口切换列表id表[当前窗口].title2.text=view.getTitle()
              pcall(self.imp.webchange,view,{icon={src=view.getFavicon(),ColorFilter=0},id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
              --设置的图片也可以输入路径
              底栏窗口切换列表id表[当前窗口].icon2.setImageBitmap(view.getFavicon())
              底栏窗口切换列表id表[当前窗口].icon2.setColorFilter(0)
             else
              底栏窗口切换列表id表[当前窗口].title2.text=view.getTitle()
              pcall(self.imp.webchange,view,{icon={src=loadbitmap("png/tbs.png"),colorFilter=文字},id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
              --设置的图片也可以输入路径
              底栏窗口切换列表id表[当前窗口].icon2.setImageBitmap(loadbitmap("png/tbs.png"))
              底栏窗口切换列表id表[当前窗口].icon2.ColorFilter=文字
            end
          end
        end)
        无痕模式=io.open("/data/data/"..activity.getPackageName().."/无痕模式.xml"):read("*a")
        if 无痕模式=="关闭" then
          内容=io.open("/data/data/"..activity.getPackageName().."/历史记录保存.xml"):read("*a")
          写入文件("/data/data/"..activity.getPackageName().."/历史记录保存.xml",获取历史记录项目内容(view.title,Url)..内容)
        end
        进度条.Width=0
        网页加载状态列表[当前窗口]=true
        --adp.getData()[窗口]={icon=view.getFavicon(),id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()}

        view.evaluateJavascript(io.open("/data/data/"..activity.getPackageName().."/JS储存.xml"):read("*a"),nil)
        内容=io.open("/data/data/"..activity.getPackageName().."/脚本保存.xml"):read("*a")

        local function 加载Js(JavaScript代码)
          --view.loadUrl([[javascript:dataBox(']]..JavaScript代码..[[');]])--加载js代码
          view.evaluateJavascript(JavaScript代码,nil)
        end
        if 夜间模式=="打开" then
          加载Js([[{css=document.createElement("link");var t='html,body,form,nav,header{background-image:none !important;background-color: #363c47 !important;color:#c3bdbc!important;border-color:#212533!important;box-shadow:0 0 0!important;text-shadow: 0 0 0!important;}div,html *{background-color: #000000 !important;color:#c3bdbc!important;border-color:#212533!important;box-shadow:0 0 0!important;text-shadow: 0 0 0!important;}p,span{background-color: transparent !important;color:#c3bdbc!important;border-color:#212533!important;box-shadow:0 0 0!important;text-shadow: 0 0 0!important;}div:empty,div[id="x-video-button"],div[class="x-advert"]{background-color:transparent !important;}input,select,button,textarea{box-shadow:0 0 0!important;color:#c3bdbc!important;background-color: #293037 !important;border-color:#212533!important;}a,a *{background-color: transparent !important;color:#b5a598!important;text-decoration:none!important;border-color:#212533!important;text-shadow: 0 0 0!important;}a:visited,a:visited *{color:#757170!important;}';css.href=t;var o=document.getElementsByTagName("head");if(o[0].appendChild(css)){var a=document.createElement("style");a.appendChild(document.createTextNode(t)),document.documentElement.appendChild(a)}};]]);
        end
        for t,c in 内容:gmatch("【项目】(.-)【项目】") do
          if view.Url==t:match("【使用对象】(.-)【使用对象】") or t:match("【使用对象】(.-)【使用对象】")=="*" then
            if t:match("【是否开启脚本】(.-)【是否开启脚本】")=="打开" then
              loadstring(t:match("【内容】(.-)【内容】"))()
            end
          end
        end
      end,
      onReceivedError=function(_,_,var3,var4)
        var32=var3
        主页.addView(loadlayout("layout/jiazaicuowu"))--添加控件
        错误信息.text=(tostring(var3).."\n"..var4)
        网页加载失败页面=true
    end}
    view.setWebChromeClient(luajava.override(luajava.bindClass "android.webkit.WebChromeClient",{
      --[[onReceivedTitle=function(super,view,title)
        --pcall(self.imp.webchange,view,{icon=view.getFavicon(),id=self:findWebView(view),title=title,progress=view.getProgress()})

      end,]]
      onReceivedIcon=function(super,view,title)
        if 是否显示主页列表[当前窗口]==false then
          pcall(self.imp.webchange,view,{icon={src=view.getFavicon(),ColorFilter=0},id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()})
          --设置的图片也可以输入路径
          底栏窗口切换列表id表[当前窗口].icon2.setImageBitmap(super)
          底栏窗口切换列表id表[当前窗口].icon2.setColorFilter(0)
        end
      end,
    }))
    --删除进度条
    view.removeView(view.getChildAt(0))
    --导包
    import "com.lua.*"
    --进度改变事件
    view.setWebChromeClient(LuaWebChrome(LuaWebChrome.IWebChrine{
      onProgressChanged=function(_, newProgress)
        --事件
        进度条.Width=activity.Width/100*newProgress
  --a=ScaleAnimation(1, 1, 1, int pivotXType, float pivotXValue, int pivotYType, float pivotYValue)
--a.repeatCount=(1)
        if newProgress==100 then
          --控件不可视
          进度条.setVisibility(View.INVISIBLE)
         else
          --控件可视
          进度条.setVisibility(View.VISIBLE)
        end
        -- pbar.Progress=newProgress
        --print(newProgress)
      end,
      onJsConfirm=function(_,_,str,_)
        对话框({
          标题="来自网页的提示",
          点击事件=function()end,
          文本内容=str,
          是否显示取消按钮=false,
        })
        return true;
      end,
    }));
  end)
end



function webapi:newWebView()
  local web=loadlayout{
    LuaWebView,
    layout_width="-1",
    layout_height="-1",
    id="",
  }
  newSetting(web)

  newWebViewClient(web,self)

  return web
end



--[[function webapi.findHomeUrl()
  return webapi.homeUrl
end






function webapi:getWebView(url)
  return parent.getChildAt(0)
end]]
function webapi:findWebView(view)
  return table.find(weblistidtofindfast,view.getId())
end
function webapi:select(id)
  上一个窗口id=当前窗口


  pcall(function()
    parent.removeAllViewsInLayout()
    parent.addView(weblist[id])
  end)
  view=weblist[id]

  viewy=weblist[id]


  当前窗口=id
  if 是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口=="打开" then
    底栏窗口切换列表id表[上一个窗口id].列表LinearLayout内2.Background=标签栏中其他的的背景
    底栏窗口切换列表id表[当前窗口].列表LinearLayout内2.Background=标签栏中当前的的背景
  end
  if 网页加载状态列表[当前窗口] then
    设置右上角按钮图标("png/mklj.png")
   else
    设置右上角按钮图标("png/qwetyi.png")
  end
  --view=weblistidtofindfast[当前窗口]
  if 是否显示主页列表[id] then
    返回主页f(id)
   else
    --if #view.getTitle()>1 then
    if view.Url==主页链接 then--判断是否主页
      标题t.text="主页"
     else
      刷新标题()
    end
    --end
    --[[if 滑动菜单模式=="关闭" then
      if 全屏模式状态=="关闭" then
        if 是否把标题栏放到底栏中=="关闭" then
          if AWidth<AHeight then
            是否显示标题栏=true
            显示控件2(mToolbar3)
            显示控件2(顶部代替paddingTop)
          end
        end
      end
      底部栏2.setBackgroundColor(Color.parseColor(底栏))
      if 浏览器页面标题栏背景是否为白色=="打开" then
        mToolbar3.setBackgroundColor(Color.parseColor(底栏))
      end
    end]]

    --控件不可视
    vngggggg.setVisibility(View.INVISIBLE)
    是否显示主页列表[id]=false
    自动变色()
  end
  保存阅读进度()
end


function webapi:destroy()
  while #weblist>1 do
    self:remove(#weblist,true)
  end

end


function webapi:remove(id,f)

  local view=weblist[id]
  if f~=true pcall(self.imp.webdele,view,{icon=title,id=self:findWebView(view),title=view.getTitle(),progress=view.getProgress()}) end
  view.stopLoading()
  view.loadDataWithBaseURL(nil, "", "text/html", "utf-8", nil);
  view.clearHistory()
  view.onPause();
  view.removeAllViews();
  view.destroy()
  parent.removeAllViews()
  table.remove(weblist,id)
  table.remove(weblistidtofindfast,id)
  if #weblist<1 and f~=true then
    self:openNewUrl(nil)
  end
  if f~=true self:select((function(id)if id>1 then return id-1 else return id end end)(id))

    pcall(function()_G[webtmp.multiText].setText(#weblist.."")end)
  end
end
function webapi:multiChoose()
  self.imp.multi()
end


function webapi:setOnMultiChoose(func)
  self.imp.multi=func
end

function webapi:setOnWebViewAdd(func)
  self.imp.webadd=func
end


function webapi:setOnWebViewDelete(func)
  self.imp.webdele=func
end

function webapi:setOnWebViewChange(func)
  self.imp.webchange=func
end


function webapi:openNewUrl(url,istrue)
  self2=self
  webView=self:newWebView()
  addOnLongClick(webView,self)
  table.insert(weblist,webView)
  table.insert(网页列表表,{网页列表={},当前查看的页面=1})
  table.insert(weblistidtofindfast,webView.getId())
  if not(istrue) then
    parent.removeAllViewsInLayout()
    parent.addView(webView)
    上一个窗口id=当前窗口
    当前窗口=#weblist
    --上一个窗口id=当前窗口
    if 网页加载状态列表[当前窗口] then
      if 底栏Sideslip1 then
        设置右上角按钮图标("png/mklj.png")
       else
        设置右上角按钮图标("png/qwetyi.png")
      end
    end
  end
  pcall(self.imp.webadd,webView,{icon=webView.getFavicon(),id=self:findWebView(webView),title=webView.getTitle(),progress=webView.getProgress(),istrue=istrue})
  pcall(function()_G[webtmp.multiText].setText(#weblist.."")end)
  view=weblist[当前窗口]

  viewy=weblist[当前窗口]
  webView=view
  import "com.androlua.LuaWebView$JsInterface"
  webView.addJsInterface(JsInterface{
    execute=function()end
  },"androlua")
  if url then
    webView.loadUrl(url)
  end
end




webapi.imp={}


function build(args)
  _G[args.id]=table.clone(webapi)
  webtmp["multiText"]=args["multiText"]
  _G[args.id]:openNewUrl(nil)
  return lambda k:parent
end

return build
