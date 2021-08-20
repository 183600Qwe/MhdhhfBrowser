

--[[
Build.VERSION.SDK_INT >= 23 是因为安卓6.0以下没有统一判断悬浮窗权限的方法
当安卓版本大于6.0且有悬浮窗权限时返回true
当安卓版本大于6.0且无悬浮窗权限时返回false
当安卓版本小于6.0时无法判断返回nil
]]

function showWindow(url) --显示
  function changeWindow()
    if isMax==false then
      isMax=true
      --揭露动画一定要设置延时，并在延时事件里启动
      wmManager.removeView(minWindow)
      wmManager.addView(mainWindow,wmParams)
      --控件不可视
      win_mainview.setVisibility(View.INVISIBLE)
      task(1,function()
        --控件可视
        win_mainview.setVisibility(View.VISIBLE)
        --设置揭露动画，对于参数为(ID,动画圆心X轴，动画圆心Y轴,动画开始时半径,动画结束时半径)
        揭露动画 = ViewAnimationUtils.createCircularReveal(win_mainview,0,0,0,300)
        揭露动画.setDuration(200)--设置动画时间
        揭露动画.start()--开始动画
      end)
     else
      isMax=false
      --揭露动画一定要设置延时，并在延时事件里启动
      task(1,function()
        --设置揭露动画，对于参数为(ID,动画圆心X轴，动画圆心Y轴,动画开始时半径,动画结束时半径)
        揭露动画 = ViewAnimationUtils.createCircularReveal(win_mainview,0,0,300,0)
        揭露动画.setDuration(200)--设置动画时间
        揭露动画.start()--开始动画
        task(50,function()
          wmManager.removeView(mainWindow)
          wmManager.addView(minWindow,wmParams)
        end)
      end)
    end
  end
  function close(v) --关闭

    --揭露动画一定要设置延时，并在延时事件里启动
    task(1,function()
      --设置揭露动画，对于参数为(ID,动画圆心X轴，动画圆心Y轴,动画开始时半径,动画结束时半径)
      揭露动画 = ViewAnimationUtils.createCircularReveal(win_mainview,v.x,0,300,0)
      揭露动画.setDuration(200)--设置动画时间
      揭露动画.start()--开始动画
      task(50,function()
        HasLaunch=false
        wmManager.removeView(mainWindow)
        close=nil
        changeWindow=nil
      end)
    end)
    --wmParams=nil
    --mainWindow=nil
    --wmManager=nil
  end
  if HasLaunch==true then
    close()
    return
   else
    HasLaunch=true
    import "android.provider.Settings"
    local function 判断悬浮窗权限()
      if (Build.VERSION.SDK_INT >= 23 and not Settings.canDrawOverlays(this)) then
        return false
       elseif Build.VERSION.SDK_INT < 23 then
        return nil
       else
        return true
      end
    end
    local ret={pcall(function()

        isMax=true --状态

        local centerView={
          FrameLayout,
          id="win_centerview",
          layout_weight="1",
          layout_height="-1",
          --orientation="vertical",
          {
            FrameLayout,
            layout_width="-1",
            layout_height="-1",
            id="win_centerview内",
            {
              LuaWebView,--浏览器控件
              layout_width="fill",--布局宽度
              layout_height="fill",--布局高度
              id="悬浮窗webView",
            },
             {
            FrameLayout,
            layout_width="-1",
            layout_height="-1",
            id="搜索外",
            };
          };

          {
            TextView,
            -- layout_width="fill",--布局宽度
            layout_height="3dp",--布局高度
            backgroundColor=一般强调色,--背景颜色
            id="悬浮窗进度条",
          },--结束
          {
            FrameLayout,
            layout_width="-1",
            layout_height="-1",
            id='悬浮窗菜单scrollView外';--布局高度
            BackgroundColor=背景;
            {
              LinearLayout,
              layout_width="fill",--布局宽度
              layout_height="fill",--布局高度
              orientation="vertical",
              id='悬浮窗菜单scrollView外2';--布局高度
              {
                ScrollView;--线性布局
                layout_width='fill';--布局宽度
                layout_height='fill';--布局高度
                id='悬浮窗菜单scrollView';--布局高度
                BackgroundColor=背景;
                {
                  LinearLayout,
                  layout_width="-1",
                  layout_height="-1",
                  orientation="vertical",
                  id="悬浮窗菜单",
                };
              };
            };
          };
          {
            FrameLayout;--线性布局
            layout_width='fill';--布局宽度
            layout_height='fill';--布局高度
            id='悬浮窗收藏LinearLayout外';--布局高度
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-1",
              orientation="vertical",
              id="悬浮窗收藏2",
            };
            {
              LinearLayout;
              orientation="vertical";
              Focusable=true,
              FocusableInTouchMode=true,
              layout_width="fill",--布局宽度
              layout_height="fill",--布局高度
              id='悬浮窗收藏LinearLayout';--布局高度
              BackgroundColor=背景;
              {
                TextView;
                text="收藏";
                textColor=文字123;
                textSize="20sp";
                layout_margin="12dp";
                layout_marginLeft="18dp";
              };
              {
                EditText;
                hint="标题";
                layout_marginTop="0";
                layout_marginBottom="5dp";
                layout_margin="10dp";
                layout_width="fill";
                layout_gravity="center",
                id="悬浮窗收藏标题qwe";
                --Typeface=字体("Product");
              };
              {
                EditText;
                hint="链接";
                layout_marginTop="0dp";
                --layout_marginBottom="22dp";
                layout_margin="10dp";
                layout_width="fill";
                layout_gravity="center",
                id="悬浮窗收藏链接qwe";
                --Typeface=字体("Product");
              };
              {
                FrameLayout;
                layout_width="fill",--布局宽度
                {
                  LinearLayout;
                  orientation="horizontal";
                  layout_gravity="end";
                  {
                    TextView;
                    text="取消";
                    id="悬浮窗收藏取消";
                    textColor=一般强调色;
                    textSize="15sp";
                    padding="12dp";
                    onClick=function()
                      yuxuandh4=TranslateAnimation(0,0,0,activity.height)
                      yuxuandh4.setDuration(150)
                      悬浮窗收藏LinearLayout.startAnimation(yuxuandh4);
                      import "android.view.animation.Animation$AnimationListener"
                      yuxuandh4.setAnimationListener(AnimationListener{
                        onAnimationEnd=function()
                          --控件不可视
                          悬浮窗收藏LinearLayout外.setVisibility(View.INVISIBLE)
                      end})
                    end
                  };
                  {
                    TextView;
                    text="确定";
                    id="悬浮窗收藏确定";
                    textColor=一般强调色;
                    textSize="15sp";
                    padding="12dp";
                    layout_marginRight="18dp";
                    onClick=function()
                      内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
                      写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容..获取内容(悬浮窗收藏标题qwe.text,悬浮窗收藏链接qwe.text))
                    end
                  };
                };
              };
            };
          },
        }

        local winlay={
          LinearLayout,
          layout_width=activity.getWidth(),
          layout_height=activity.getHeight(),
          {
            CardView,
            id="win_mainview",
            layout_width=activity.getWidth()/1.5,
            layout_height=activity.getWidth(),
            layout_margin="6dp",
            CardElevation="3dp",
            radius="8dp",
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-1",
              orientation="vertical",
              {
                CardView,
                layout_width="-1",
                layout_height="30dp",
                background=标题栏色,
                radius=0,
                id="悬浮窗标题栏",
                {
                  LinearLayout,
                  layout_width="-1",
                  layout_height="-1",
                  id="悬浮窗标题栏LinearLayout",
                  {
                    CardView,
                    layout_weight="1",
                    layout_height="-1",
                    layout_margin="3dp",
                    radius="12dp",
                    Elevation="0",
                    background="#00000000",
                    id="悬浮窗搜索CardView",
                    {
                      LinearLayout,
                      layout_width="-1",
                      layout_height="-1",
                      id="悬浮窗搜索LinearLayout",
                      backgroundDrawable=边框(dp2px(12),"#00000000",边框2,dp2px("1.5"));
                      {
                        LinearLayout,
                        layout_width="-1",
                        layout_height="-1",
                        id="悬浮窗搜索",
                        onClick="悬浮窗弹出搜索",
                        {
                          LinearLayout,
                          layout_weight="1",
                          layout_height="-1",
                          {
                            TextView,
                            text="主页",
                            id="win_move",
                            layout_width="-1",
                            layout_height="-1",
                            paddingLeft="8.1dp",
                            gravity="left|center",
                            textColor=文字,
                            singleLine=true;--设置单行
                            textSize="11sp";
                          },
                        };
                        {
                          LinearLayout,
                          layout_width="24dp",
                          layout_height="24dp",
                          id="悬浮窗搜索图标",
                          onClick=function()
                            if 悬浮窗网页加载状态=="完成" then
                              悬浮窗webView.reload()--刷新页面
                              刷新状态="刷新"
                             elseif 悬浮窗网页加载状态=="末完成" then
                              悬浮窗webView.stopLoading()
                            end
                          end,
                          {
                            ImageView,
                            layout_width="22dp",
                            layout_height="22dp",
                            scaleType="centerCrop",
                            padding="3dp",
                            src="png/mklj.png",
                            ColorFilter=文字,
                            layout_gravity="center",
                            id="悬浮窗搜索图标ImageView",
                          },
                        },
                      },
                    };
                  };
          {
                    LinearLayout,
                    layout_height="-1",
                    layout_width="-2",
                    id="移动",
                    {
                      TextView,
                      gravity="center",
                      layout_width="-1",
                      layout_height="-1",
                      padding="3dp",
                      textColor=文字,
                      text="移动",
                      textSize="11sp";
                      id="移动TextView",
                    },
                  },
                  {
                    LinearLayout,
                    layout_height="-1",
                    layout_width="-2",
                    id="最小化",
                    onClick="changeWindow",
                    {
                      TextView,
                      gravity="center",
                      layout_width="-1",
                      layout_height="-1",
                      padding="3dp",
                      textColor=文字,
                      text="最小化",
                      textSize="11sp";
                      id="最小化TextView",
                    },
                  },
                  {
                    LinearLayout,
                    layout_height="30dp",
                    layout_width="30dp",
                    id="关闭悬浮窗",
                    onClick="close",
                    {
                      ImageView,
                      layout_width="24dp",
                      layout_height="24dp",
                      scaleType="centerCrop",
                      padding="3dp",
                      src="png/close.png",
                      ColorFilter=文字,
                      layout_gravity="center",
                      id="关闭悬浮窗ImageView",
                    },
                  },
                };
              },
              centerView, --这里是悬浮窗中间的布局
              {
                CardView,
                layout_width="-1",
                layout_height="30dp",
                --background="#ffffff",
                id="悬浮窗底栏",
                Elevation="0";
                {
                  LinearLayout,
                  layout_width="-1",
                  layout_height="-1",
                  {
                    LinearLayout,
                    layout_height="-1",
                    layout_weight="1",
                    {
                      LinearLayout,--线性布局
                      orientation="horizontal",--水平方向
                      layout_width="fill",--布局宽度
                      layout_height="30dp",--布局高度
                      gravity="center",--重力居中
                      id="悬浮窗底部栏2",
                      --background=底栏,--布局背景
                      --Elevation="6dp";
                      {
                        LinearLayout;
                        layout_weight="1",--重力分配
                        id="悬浮窗网页后退",
                        layout_height="fill",--布局高度
                        gravity="center",--重力居中
                        {
                          ImageView,--图片框控件
                          layout_weight="1",--重力分配
                          layout_width="20dp",--布局宽度
                          layout_height="20dp",--布局高度
                          src=("png/gfwzu.png"),--视图路径
                          id="悬浮窗网页后退ImageView",
                          colorFilter=文字,--图片颜色
                        },
                        onClick=function()
                          if(view.canGoBack())then
                            view.goBack()--网页后退
                           else
                            if(是否正在查看布局页面 or view.Url==主页链接)then
                              close()
                             else
                              悬浮窗返回主页f()
                            end
                          end
                        end
                      };
                      {
                        LinearLayout;
                        layout_weight="1",--重力分配
                        id="悬浮窗网页前进3",
                        layout_height="fill",--布局高度
                        gravity="center",--重力居中
                        {
                          ImageView,--图片框控件
                          layout_weight="1",--重力分配
                          layout_width="20dp",--布局宽度
                          layout_height="20dp",--布局高度
                          src=("png/chevron_right.png"),--视图路径
                          colorFilter=文字,--图片颜色
                          id="悬浮窗网页前进ImageView",
                        },
                        onClick=function()
                          if(view.canForward())then
                            view.goForward()--网页前进
                           else
                            离开布局页面()
                          end
                        end,
                      };
                      {
                        LinearLayout;
                        layout_weight="1",--重力分配
                        id="悬浮窗打开菜单",
                        layout_height="fill",--布局高度
                        gravity="center",--重力居中
                        {
                          ImageView,--图片框控件
                          layout_weight="1",--重力分配
                          layout_width="20dp",--布局宽度
                          layout_height="20dp",--布局高度
                          src="png/ic_menu.png",--视图路径
                          colorFilter=文字,--图片颜色
                          id="悬浮窗打开菜单ImageView",
                        },
                      };
                      {
                        LinearLayout;
                        layout_weight="1",--重力分配
                        layout_height="fill",--布局高度
                        gravity="center",--重力居中
                        id="悬浮窗返回主页",
                        {
                          ImageView,--图片框控件
                          layout_weight="1",--重力分配
                          layout_width="20dp",--布局宽度
                          layout_height="20dp",--布局高度
                          src="png/home_black.png",--视图路径
                          colorFilter=文字,--图片颜色
                          id="悬浮窗返回主页ImageView",
                        },
                      };

                      {
                        LinearLayout;
                        layout_weight="1",--重力分配
                        layout_height="fill",--布局高度
                        gravity="center",--重力居中
                        id="win_worh",
                        {
                          ImageView,--图片框控件
                          layout_weight="1",--重力分配
                          layout_width="20dp",--布局宽度
                          layout_height="20dp",--布局高度
                          src="png/horw.png",--视图路径
                          colorFilter=文字123,--图片颜色
                          id="win_worhImageView",
                        },
                      };
                    },--线性布局 结束
                  },
                },
                {
                  FrameLayout,
                  --  Orientation='vertical';
                  layout_width='fill';
                  layout_height='30dp';
                  id="关闭外2";
                  {
                    FrameLayout,
                    --  Orientation='vertical';
                    layout_width='fill';
                    layout_height='fill';
                    BackgroundColor=背景2;
                    id="关闭外";
                    {
                      LinearLayout;
                      Orientation='vertical';
                      layout_width='fill';
                      layout_height='30dp';
                      Gravity="center",
                      id="关闭";
                      onClick="关闭a",
                      -- onTouchListener=点击监听,--动画效果
                      {
                        ImageView;
                        layout_height="26dp";
                        src="png/kadb.png";
                        id="关闭图标";
                        ColorFilter=文字,--图片颜色
                        layout_width="26dp";
                      };
                    };
                  },
                },
              },
            },
          },
        }
        minlay={
          LinearLayout,
          layout_width=dp2px(62),
          layout_height=dp2px(62),
          --id="Win_minWindow",
          {
            CardView,
            layout_width=dp2px(62),
            layout_height=dp2px(62),
            background="#00000000",
            layout_margin="0",
            radius=dp2px(31),
            CardElevation="0",
            id="Win_minWindow",
          },
        }
        import "android.content.Context"

        do
          wmManager=activity.getSystemService(Context.WINDOW_SERVICE) --获取窗口管理器
          HasFocus=true --是否有焦点
          wmParams =WindowManager.LayoutParams() --对象
          wmParams.type =WindowManager.LayoutParams.TYPE_SYSTEM_ALERT --设置悬浮窗方式
          import "android.graphics.PixelFormat" --导入
          wmParams.format =PixelFormat.RGBA_8888 --设置背景
          wmParams.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE--焦点设置
          wmParams.gravity = Gravity.LEFT| Gravity.TOP --重力设置
          wmParams.x = activity.getWidth()/6
          wmParams.y = activity.getHeight()/5
          wmParams.width =WindowManager.LayoutParams.WRAP_CONTENT
          wmParams.height =WindowManager.LayoutParams.WRAP_CONTENT
          mainWindow=loadlayout(winlay)
          minWindow=loadlayout(minlay)
        end

        function Win_minWindow.OnTouchListener(v,event) --移动
          if event.getAction()==MotionEvent.ACTION_DOWN then
            firstX=event.getRawX()
            firstY=event.getRawY()
            wmX=wmParams.x
            wmY=wmParams.y
           elseif event.getAction()==MotionEvent.ACTION_MOVE then
            wmParams.x=wmX+(event.getRawX()-firstX)
            wmParams.y=wmY+(event.getRawY()-firstY)
            wmManager.updateViewLayout(minWindow,wmParams)
           elseif event.getAction()==MotionEvent.ACTION_UP then
            --changeWindow()
          end
          return false
        end

        --移动
        function 移动.OnTouchListener(v,event) --移动
          if event.getAction()==MotionEvent.ACTION_DOWN then
            firstX=event.getRawX()
            firstY=event.getRawY()
            wmX=wmParams.x
            wmY=wmParams.y
           elseif event.getAction()==MotionEvent.ACTION_MOVE then
            wmParams.x=wmX+(event.getRawX()-firstX)
            wmParams.y=wmY+(event.getRawY()-firstY)
            wmManager.updateViewLayout(mainWindow,wmParams)
           elseif event.getAction()==MotionEvent.ACTION_UP then
          end
          return true
        end


        --放大缩小
        winParams=win_mainview.getLayoutParams() --获取params
        function win_worh.OnTouchListener(v,event) --放大缩小
          if event.getAction()==MotionEvent.ACTION_DOWN then
            firstX=event.getRawX()
            firstY=event.getRawY()
            wmX=winParams.width
            wmY=winParams.height
           elseif event.getAction()==MotionEvent.ACTION_MOVE then
            winParams.width=wmX+(event.getRawX()-firstX)
            winParams.height=wmY+(event.getRawY()-firstY)
            win_mainview.setLayoutParams(winParams)
           elseif event.getAction()==MotionEvent.ACTION_UP then
          end
          return true
        end


        function Win_minWindow.onClick(v)
          changeWindow()
        end
        function Win_minWindow.onLongClick(v)
          changeWindow()
          悬浮窗弹出搜索()
        end


        


        if 主页链接=="仅搜索栏" then
          主页搜索2高="fill"
          主页搜索CardViewlayout_margin="16dp"
          主页搜索CardViewlayout_marginTop="-44dp"--0
         else
          主页搜索2高="wrap_content"
          主页搜索CardViewlayout_margin="16dp"
          主页搜索CardViewlayout_marginTop='16dp'
        end
        主页搜索padding="6dp"
        local view=悬浮窗webView
        波纹({关闭悬浮窗,
          最小化,
          悬浮窗搜索,
          悬浮窗网页后退,
          悬浮窗网页前进3,
          悬浮窗打开菜单,
          悬浮窗返回主页,
          悬浮窗收藏取消,
          悬浮窗收藏确定,
          悬浮窗搜索图标,
        },"方",文字)
        悬浮窗webView.loadUrl(url)
        wmManager.addView(mainWindow,wmParams)
        搜索外.addView(loadlayout(pop窗口布局()))
        关闭弹窗外.addView(loadlayout({
          LinearLayout;
          gravity="center";
          layout_width="44dp";
          layout_height="44dp";
          id="关闭弹窗";
          onClick="悬浮窗弹出搜索",
          {
            ImageView;
            layout_height="22dp";
            src="png/qwetyi.png";
            -- id="Sideslip1";
            colorFilter=文字123,--图片颜色
            -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
            layout_width="22dp";
            id="关闭弹窗ImageView";
          };
        }))
        波纹({文字2},"方",文字)
       -- yuxuanpop外=yuxuanpop2
        yuxuanpop外.setBackgroundColor(Color.parseColor(背景2))
        搜索mToolbar外.Elevation=0
        --控件不可视
        yuxuanpop外.setVisibility(View.INVISIBLE)
        yuxuanpop显示状态="不可视"
        搜索2(nil,悬浮窗webView,true)
        悬浮窗webView.onLongClick=function(v)
          hitTestResult = v.getHitTestResult()
          if (hitTestResult.getType() == WebView.HitTestResult.IMAGE_TYPE or hitTestResult.getType() == WebView.HitTestResult.SRC_IMAGE_ANCHOR_TYPE)then
            items={"保存图片","保存动态图片","搜狗识图","查看图片","复制图片链接"}
            gbvvvv=AlertDialog.Builder(this)
            gbvvvv.setTitle("")
            gbvvvv.setNegativeButton("",nil)
            gbvvvv.setItems(items,{onClick=function(l,v)
                if v==0 then
                  picUrl = hitTestResult.getExtra()
                  Http.download(picUrl,picture..os.date("%Y-%m-%d-%H-%M-%S")..".png",function(a)
                    print("图片已保存于"..picture)
                  end)
                end
                if v==1 then
                  picUrl = hitTestResult.getExtra()
                  Http.download(picUrl,picture..os.date("%Y-%m-%d-%H-%M-%S")..".gif",function(a)
                    print("图片已保存于"..picture)
                  end)
                end

                if v==2 then
                  picUrl = hitTestResult.getExtra()
                  v.loadUrl("https://pic.sogou.com/pic/ris_searchList.jsp?statref=home&v=5&ul=1&keyword="..picUrl)
                  print("正在识图....")
                end
                if v==3 then
                  picUrl = hitTestResult.getExtra()
                  v.loadUrl(picUrl)
                end
                if v==4 then
                  picUrl = hitTestResult.getExtra()
                  --先导入包
                  import "android.content.*"
                  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(picUrl)
                  print("已复制")
                end
            end})
            显示=gbvvvv.show()
           elseif hitTestResult.getType() == WebView.HitTestResult.SRC_ANCHOR_TYPE or hitTestResult.getType() == WebView.HitTestResult.SRC_IMAGE_ANCHOR_TYPE then
            items={"复制链接"}
            gbvvvv=AlertDialog.Builder(this)
            gbvvvv.setTitle("")
            gbvvvv.setNegativeButton("",nil)
            gbvvvv.setItems(items,{onClick=function(l,v)
                if v==0 then
                  picUrl = hitTestResult.getExtra()
                  --先导入包
                  import "android.content.*"
                  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(picUrl)
                  print("已复制")
                end
            end})
            显示=gbvvvv.show()
          end
        end
        --addTab(悬浮窗webView)
        --进度改变事件
        --[[悬浮窗webView.setWebChromeClient(LuaWebChrome(LuaWebChrome.IWebChrine{
        onProgressChanged=function(view, newProgress)
          --事件
          悬浮窗进度条.Width=activity.Width/100*newProgress
          if newProgress==100
            --控件不可视
            悬浮窗进度条.setVisibility(View.INVISIBLE)
           else
            --控件可视
            悬浮窗进度条.setVisibility(View.VISIBLE)
          end
          -- pbar.Progress=newProgress
          --print(newProgress)
        end,
      }));]]
        local function 离开布局页面()
        end
        悬浮窗webView.setWebViewClient({
          shouldOverrideUrlLoading=function(view,url,uh)
            悬浮窗进度条.setVisibility(0)--显示进度条
            if url:find("http") or url:find("ftp") then
             else
              if 是否允许网页打开外部应用=="打开" then
                import "android.content.Intent"
                intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME);
                intent.setComponent(nil);
                this.startActivity(intent)
               else
                view.stopLoading()--拦截打开app行为
              end
            end
          end,
          onPageStarted=function(view,url,favicon)
            if #view.getTitle()>1 then
              if view.Url==主页链接 then--判断是否主页
               else
                悬浮窗刷新标题()
              end
            end
            --控件可视
            悬浮窗搜索CardView.setVisibility(View.VISIBLE)
            newSetting(悬浮窗webView)
            悬浮窗webView.getSettings().setTextZoom(80)--字体大小
            url=tostring(悬浮窗webView.Url)
            是否正在查看布局页面=false
            悬浮窗搜索图标ImageView.setImageBitmap(loadbitmap("png/qwetyi.png"))
            --控件不可视
            vngggggg悬浮窗.setVisibility(View.INVISIBLE)
            if view.Url==主页链接 then--判断是否主页
              悬浮窗网页加载状态="末完成"
              win_move.text="主页"
             else
              悬浮窗网页加载状态="末完成"
              无痕模式=io.open("/data/data/"..activity.getPackageName().."/无痕模式.xml"):read("*a")
              if 无痕模式=="打开" then
               else
                内容=io.open("/data/data/"..activity.getPackageName().."/历史记录保存.xml"):read("*a")
                写入文件("/data/data/"..activity.getPackageName().."/历史记录保存.xml",获取内容(悬浮窗webView.title,悬浮窗webView.Url)..内容)
              end
              悬浮窗底部栏2.setBackgroundColor(Color.parseColor(底栏))
              if 浏览器页面标题栏背景是否为白色=="打开" then
                悬浮窗标题栏.setBackgroundColor(Color.parseColor(底栏))
              end
            end
          end,
          onReceivedError=function(view,var2,var3,var4)
            --控件不可视
            悬浮窗进度条.setVisibility(View.INVISIBLE)
            win_move.text="网页加载失败"
          end,
          onLoadResource=function(view,url)
          end,
          onPageFinished=function(view,url)--这个回调非常坑
            --控件不可视
            悬浮窗进度条.setVisibility(View.INVISIBLE)
            view.evaluateJavascript(io.open("/data/data/"..activity.getPackageName().."/JS储存.xml"):read("*a"),nil)
            悬浮窗刷新标题()
            悬浮窗网页加载状态="完成"
            --删除进度条
            悬浮窗webView.removeView(view.getChildAt(0))
            悬浮窗搜索图标ImageView.setImageBitmap(loadbitmap("png/mklj.png"))
        end})
                --控件不可视
        悬浮窗菜单scrollView外.setVisibility(View.INVISIBLE)
        悬浮窗菜单列表={"添加书签","书签","下载管理","暗色模式","在一般的页面浏览网页"}
        悬浮窗菜单图标列表={"png/fhvpfxgj.png","png/bookmarks_black.png","png/gnjs2x.png","png/black.png","png/__ic_fltbtn3.png"}
        for d,内容 in pairs(悬浮窗菜单列表) do
          itemc2=loadlayout(获取itemc2())
          title.Text=内容
          --设置的图片也可以输入路径
          icon.setImageBitmap(loadbitmap(悬浮窗菜单图标列表[d]))
          悬浮窗菜单.addView(itemc2)
          列表LinearLayout.onClick=function(v)
            yuxuandh4=TranslateAnimation(0,0,0,activity.height)
            yuxuandh4.setDuration(150)
            悬浮窗菜单scrollView.startAnimation(yuxuandh4);
            import "android.view.animation.Animation$AnimationListener"
            yuxuandh4.setAnimationListener(AnimationListener{
              onAnimationEnd=function()
                --控件不可视
                悬浮窗菜单scrollView外.setVisibility(View.INVISIBLE)
            end})
            浏览器菜单(内容,true,v,true)
          end
        end
        悬浮窗打开菜单.onClick=function()
          if 悬浮窗菜单scrollView外.Visibility==View.INVISIBLE then
            --上升动画
            --相关参数，请自行手册查询
            --定义动画,500为上升高度。
            yuxuandh3=TranslateAnimation(0,0,activity.height,0)
            --动画时间，也就是上升动画的快慢
            yuxuandh3.setDuration(150)
            --动画开始执行
            悬浮窗菜单scrollView外.startAnimation(yuxuandh3);
            --控件可视
            悬浮窗菜单scrollView外.setVisibility(View.VISIBLE)
           else
            yuxuandh4=TranslateAnimation(0,0,0,activity.height)
            yuxuandh4.setDuration(150)
            悬浮窗菜单scrollView外.startAnimation(yuxuandh4);
            import "android.view.animation.Animation$AnimationListener"
            task(50,function()
              --控件不可视
              悬浮窗菜单scrollView外.setVisibility(View.INVISIBLE)
            end)
          end
        end
        名称="网页收藏"
        showDataDialog(名称,名称,true)
        win_centerview内.addView(listlayout)--添加控件
        书签内.onClick=function()
          浏览器菜单("书签",true,v,true)
        end
        历史记录内.onClick=function()
          浏览器菜单("历史记录",true,v,true)
        end
        --主页搜索2.setVisibility(View.GONE)
        local function 悬浮窗返回主页f(view)
          if 主页链接=="收藏" then
            是否正在查看布局页面=true
            --控件可视
            vngggggg悬浮窗.setVisibility(View.VISIBLE)
            win_move.text="主页"
            悬浮窗底部栏2.setBackgroundColor(Color.parseColor(背景2))
            if 浏览器页面标题栏背景是否为白色=="打开" then
              悬浮窗标题栏.setBackgroundColor(Color.parseColor(背景2))
            end
            主页搜索2.setVisibility(View.GONE)
           elseif 主页链接=="收藏带搜索栏" then
            是否显示标题栏=false
            是否正在查看布局页面=true
            --控件可视
            vngggggg悬浮窗.setVisibility(View.VISIBLE)
            --控件可视
            主页搜索2.setVisibility(View.VISIBLE)
            悬浮窗底部栏2.setBackgroundColor(Color.parseColor(背景2))
            if 浏览器页面标题栏背景是否为白色=="打开" then
              悬浮窗标题栏.setBackgroundColor(Color.parseColor(背景2))
            end
            --控件不可视
            悬浮窗搜索CardView.setVisibility(View.INVISIBLE)
           elseif 主页链接=="仅搜索栏" then
            是否显示标题栏=false
            是否正在查看布局页面=true
            --控件可视
            vngggggg悬浮窗.setVisibility(View.VISIBLE)
            --控件可视
            主页搜索2.setVisibility(View.VISIBLE)
            悬浮窗底部栏2.setBackgroundColor(Color.parseColor(背景2))
            if 浏览器页面标题栏背景是否为白色=="打开" then
              悬浮窗标题栏.setBackgroundColor(Color.parseColor(背景2))
            end
            --控件不可视
            悬浮窗搜索CardView.setVisibility(View.INVISIBLE)
           else
            是否正在查看布局页面=false
            view.loadUrl(主页链接)
            vngggggg悬浮窗.setVisibility(View.INVISIBLE)
          end
        end
        悬浮窗返回主页.onClick=function()
          悬浮窗返回主页f(悬浮窗webView)
        end
        悬浮窗返回主页f(悬浮窗webView)
        --控件不可视
        悬浮窗收藏LinearLayout外.setVisibility(View.INVISIBLE)
        悬浮窗标题栏.setBackgroundColor(Color.parseColor(标题栏色))
        悬浮窗底栏.setBackgroundColor(Color.parseColor(标题栏色))
        控件边框(Win_minWindow,dp2px(62),"#60838383","#AA838383",dp2px(10))
        --设置动画的属性
        透明动画=AlphaAnimation(0,1)
        透明动画.setDuration(150)--设置动画时间
        透明动画.setFillAfter(true)--设置动画后停留位置
        透明动画.setRepeatCount(0)--设置无限循环
        --绑定动画
        win_mainview.startAnimation(透明动画)
        --控件不可视
        关闭外2.setVisibility(View.INVISIBLE)
        yuxuanpop显示状态="不可视"
        function 悬浮窗弹出搜索()
          if yuxuanpop显示状态=="不可视" then
            --控件可视
            yuxuanpop外.setVisibility(View.VISIBLE)
            yuxuanpop显示状态="可视"
            --设置动画的属性
            透明动画=AlphaAnimation(0,1)
            透明动画.setDuration(160)--设置动画时间
            透明动画.setFillAfter(true)--设置动画后停留位置
            透明动画.setRepeatCount(0)--设置无限循环
            --绑定动画
            搜索外.startAnimation(透明动画)
            task(1,function()
              activity.getSystemService(Context.INPUT_METHOD_SERVICE).showSoftInput(edit,0)
            end)
           else
            --控件不可视
            yuxuanpop外.setVisibility(View.INVISIBLE)
            yuxuanpop显示状态="不可视"
          end
        end
        主页搜索LinearLayout.onClick=悬浮窗弹出搜索
        粘贴TextView.onClick=function()
          悬浮窗弹出搜索()
          光标前的位置=edit.getSelectionStart()
          光标后的位置=edit.getSelectionEnd()
          粘贴()
        end
    end)}
    if ret[1]==false then
      print("运行出错，可能是没有权限 (注意：在MIUI上需要在设置中打开本应用的”显示悬浮窗”开关，并且重启应用，否则悬浮窗只能显示在本应用界面内，不能显示在手机桌面上。)")
      print(ret[2])
    end
    import "android.net.Uri"
    import "android.content.Intent"
    import "android.provider.Settings"

    function 获取悬浮窗权限()
      intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
      intent.setData(Uri.parse("package:" .. activity.getPackageName()));
      activity.startActivityForResult(intent, 100);
    end
    if 判断悬浮窗权限() then
     else
      --调用示例
      获取悬浮窗权限()
    end
  end
  showWindow=nil
end

