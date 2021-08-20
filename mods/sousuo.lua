function 粘贴()
  import"android.content.*"
  粘贴内容=tostring(activity.getSystemService(Context.CLIPBOARD_SERVICE).getText())
  edit.Text=string.sub(edit.Text,0,光标前的位置)..粘贴内容..string.sub(edit.Text,光标后的位置+1,#edit.Text)
  pcall(function()
    edit.setSelection(#粘贴内容+#(string.sub(edit.Text,0,光标前的位置)))
  end)
end
function 搜索2(q,view,是否在悬浮窗,是否粘贴,搜索内容)
  隐藏控件(清除输入框里的内容)
  view=view or webView
  是否隐藏快速输入网址器=io.open("/data/data/"..activity.getPackageName().."/是否隐藏快速输入网址器.xml"):read("*a")
  if 是否隐藏快速输入网址器=="打开" then
    隐藏控件(快捷列表HorizontalScrollView)
   else
    datas={}
    aw3={"粘贴","http://","https://","www.",".com",".cn","/","file://","ftp://",".html"}
    function 添加布局(i)
      布局= {
        LinearLayout;
        --layout_width='fill';--布局宽度
        --  layout_height="28dp";
        orientation="vertical";
        background=背景2;
        Gravity="center",
        {
          TextView;
          text=i;
          id="文字2";
          Gravity="center",
          --   layout_height="28dp";
          padding="10dp",
          onClick=function()
            --  edit.paste(文字.Text)
            光标前的位置=edit.getSelectionStart()
            光标后的位置=edit.getSelectionEnd()
            if i=="粘贴"
              粘贴()
             else
              edit.Text=string.sub(edit.Text,0,光标前的位置)..i..string.sub(edit.Text,光标后的位置+1,#edit.Text)
              edit.setSelection(#i+#(string.sub(edit.Text,0,光标前的位置)))
            end
          end
        };
      };
      return 布局
    end
    for nj=1,#aw3 do
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      --table.insert(datas,{文字=aw3[nj]})
      快捷列表.addView(loadlayout(添加布局(aw3[nj])))
      波纹({文字2},"方",文字)
    end
  end
  是否搜索书签历史=true
  edit.addTextChangedListener{
    onTextChanged=function()
      if(edit.text=="") then
        --相关参数，请自行手册查询
        --定义动画,500为上升高度。
        yuxuandh3=TranslateAnimation(0,dp2px(33),0,0)
        --动画时间，也就是上升动画的快慢
        yuxuandh3.setDuration(100)
        --动画开始执行
        清除输入框里的内容.startAnimation(yuxuandh3);
        task(100,function()
          --隐藏控件(立即搜索ImageView外)
        end)
        隐藏控件(清除输入框里的内容)
        pcall(function()
          --创建适配器，将datas里面的数据匹配给itemc小项目
          yuxuan_adpqy=LuaAdapter(activity,{},item)

          --将小项目匹配给大list
          list333.Adapter=yuxuan_adpqy
        end)
       elseif(是否搜索书签历史) then
        if(清除输入框里的内容.Visibility==View.GONE) then
          --显示控件(立即搜索ImageView外)
          --相关参数，请自行手册查询
          --定义动画,500为上升高度。
          yuxuandh3=TranslateAnimation(dp2px(33),0,0,0)
          --动画时间，也就是上升动画的快慢
          yuxuandh3.setDuration(100)
          --动画开始执行
          清除输入框里的内容.startAnimation(yuxuandh3);
          --动画结束回调
          显示控件(清除输入框里的内容)
        end
        title2={}
        bookId2={}
        搜索结果={}
        pcall(function()
          --创建适配器，将datas里面的数据匹配给itemc小项目
          yuxuan_adpqy=LuaAdapter(activity,搜索结果,item)
          yuxuan_adpqy.clear()--清空适配器
          function 读取(name,图标)
            内容=io.open("/data/data/"..activity.getPackageName().."/"..name..".xml"):read("*a")
            for t,c in 内容:gmatch("【项目】(.-)【项目】") do
              if (t:match("【标题】(.-)【标题】")):find(tostring(edit.Text))then
                table.insert(搜索结果,{
                  text={
                    Text=t:match("【标题】(.-)【标题】"),
                  },
                  列表按钮较暗色背景={
                    Visibility=View.VISIBLE,
                  },
                  icd={
                    Visibility=View.VISIBLE,
                  },
                  Image2={
                    src=图标,
                    ColorFilter=0xFF74A8FF,
                  }
                })
                table.insert(bookId2,t:match("【链接】(.-)【链接】"))
              end
              --bookId2[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
            end
          end
          内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
          文件夹列表=string2tab(内容:match("【文件夹列表】(.-)【文件夹列表】")) or {}
          for d,a in pairs(文件夹列表) do
            if a[1]:find(tostring(edit.Text))then
              table.insert(搜索结果,{
                text={
                  Text=a[1],
                },
                列表按钮较暗色背景={
                  Visibility=View.VISIBLE,
                },
                icd={
                  Visibility=View.VISIBLE,
                },
                Image2={
                  src="png/folder_open_black.png",
                  ColorFilter=0xFFFFCA6A,
                }
              })
              -- table.insert(bookId2,t:match("【链接】(.-)【链接】"))
            end
            for d,a2 in pairs(a[2]) do
              if a2[1]:find(tostring(edit.Text))then
                table.insert(搜索结果,{
                  text={
                    Text=a2[1].."（来自"..a[1].."）",
                  },
                  列表按钮较暗色背景={
                    Visibility=View.VISIBLE,
                  },
                  icd={
                    Visibility=View.VISIBLE,
                  },
                  Image2={
                    src="png/fglkg.png",
                    ColorFilter=0xFFFFCA6A,
                  }
                })
              end
            end
            --bookId2[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
          end
          读取("书签保存","png/fglkg.png")
          读取("历史记录保存","png/timelap.png")
          --创建适配器，将datas里面的数据匹配给itemc小项目
          yuxuan_adpqy=LuaAdapter(activity,搜索结果,item)

          --将小项目匹配给大list
          list333.Adapter=yuxuan_adpqy
        end)
        if(#搜索结果==0) then
          隐藏控件(list333)
         else
          显示控件(list333)
        end
      end
  end}
  list333.onItemClick=function(adp,v,position,id)--3255273 2
    view.loadUrl(bookId2[position+1])
    pop.dismiss()
  end
  task(1,function()
    activity.getSystemService(Context.INPUT_METHOD_SERVICE).showSoftInput(edit,0)
    if q or view.Url==nil then
      隐藏控件(编辑链接)
     else
      local Url=view.Url.."&"
      搜索URL=(io.open("/data/data/"..activity.getPackageName().."/搜索URL.xml"):read("*a"))
      if 搜索URL=="https://www.baidu.com/s?word=搜索内容" then
        结果=Url:match("word=(.+)&")
       elseif 搜索URL=="http://cn.bing.com/search?q=搜索内容" then
        结果=Url:match("q=(.+)&")
       elseif 搜索URL=="https://m.so.com/s?q=搜索内容" then
        结果=Url:match("q=(.+)&")
       elseif 搜索URL=="https://m.mijisou.com/?q=搜索内容&category_general=on&time_range=&language=zh-CN&pageno=1" then
        结果=Url:match("q=(.+)&category_general")
       elseif 搜索URL=="https://m.toutiao.com/search?keyword=搜索内容" then
        结果=Url:match("keyword=(.+)&")
      end
      if 结果--[[==nil]] then
        结果=URLDecoder.decode(结果)
        edit.text=结果
        for i=1,utf8.len(结果) do
          字数=i
        end
        edit.setSelection(字数)
       else
      end
    end
  end)
  --注:如果没效果请配合延迟使用,id是编辑框的id
  波纹({选择搜索引擎,
    编辑链接,
    清除输入框里的内容,
    立即搜索Imageiew外LinearLayout,
  },"方",文字)
  编辑链接.onClick=function()
    edit.text=tostring(view.Url)
    for i=1,utf8.len(tostring(view.Url)) do
      字数=i
    end
    edit.setSelection(字数)
  end
  function 搜索()
    if(string.sub(edit.text,1,7)=="http://") then
      Url=(edit.text)
     elseif(string.sub(edit.text,1,8)=="https://") then
      Url=(edit.text)
     elseif(string.sub(edit.text,1,7)=="file://") then
      Url=(edit.text)
     elseif(string.sub(edit.text,1,6)=="ftp://") then
      Url=(edit.text)
     elseif(string.sub(edit.text,1,12)=="view-source:") then
      Url=(edit.text)
     else
      -- view.loadUrl("https://www.baidu.com/s?word="..edit.text)
      Url=(tostring(string.gsub(io.open("/data/data/"..activity.getPackageName().."/搜索URL.xml"):read("*a"),"搜索内容",(edit.text))))
      当前搜索的内容=edit.text
    end
    if (是否正在查看布局页面) or 是否在发起新搜索时新建一次窗口=="打开" then
      view.loadUrl(Url)
     else
      webviewp:openNewUrl(Url)
    end
    if(是否在悬浮窗) then
      edit.text=""
      yuxuanpop2.setVisibility(View.INVISIBLE)
      yuxuanpop显示状态="不可视"
     else
      popw.dismiss()
    end
    -- edit.text=string.sub(edit.text,1,7)
  end
  立即搜索Imageiew外LinearLayout.onClick=搜索
  选择搜索引擎.onClick=function()
    切换搜索引擎(选择搜索引擎)
  end
  清除输入框里的内容.onClick=function()
    edit.text=""
  end
  if(是否粘贴) then
    光标前的位置=edit.getSelectionStart()
    光标后的位置=edit.getSelectionEnd()
    粘贴()
  end
  if(搜索内容) then
    edit.text=搜索内容
  end
  隐藏控件(list333)

  function 获取工具菜单布局()
    return{
      LinearLayout;
      layout_width="fill";
      orientation="horizontal";
      {
        FrameLayout;
        layout_width="fill";
        layout_weight="1";
        {
          FrameLayout;
          layout_width="fill";
          id="项目一背景";
        };
        {
          TextView;
          padding="5.7dp",
          layout_height="fill",
          textColor=文字;
          layout_gravity="center";
          gravity="center";
          layout_width="fill",--布局宽度
          id="项目一文字";
          textSize="14sp";
          backgroundDrawable=边框(dp2px("12"),背景2,背景2,dp2px(1.5));

          layout_margin="5.7dp";
        };
      };
    };
  end
  qwerty=0
  --if (是否第1次加载相机=="是") then
  工具ID列表={}
  文件名称="搜索引擎保存"
  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
  for t,c in 内容:gmatch("【项目】(.-)【项目】") do

    --if (qwerty==0) then
    快速搜索LinearLayout.addView(loadlayout(获取工具菜单布局()))
    --end
    项目一文字.text=t:match("【标题】(.-)【标题】")
    项目一文字.onClick=function()
      view.loadUrl(tostring(string.gsub(t:match("【链接】(.-)【链接】"),"搜索内容",(edit.text))))
      if 是否在悬浮窗 then
        edit.text=""
        yuxuanpop2.setVisibility(View.INVISIBLE)
        yuxuanpop显示状态="不可视"
       else
        popw.dismiss()
      end
    end
    项目一文字.Background=边框(dp2px("12"),背景2,背景2,dp2px(1.5));
    工具ID列表[t:match("【标题】(.-)【标题】")]=项目三背景
  end
  --end
  edit.onKey=function(_,b)
    if b==4 then
      popw.dismiss()
      --[[elseif b==67 then
      print("删除")]]
     elseif b==66 then
      搜索()
      --[[elseif b==21 then
      print("用输入法向前移动")
     elseif b==22 then
      print("用输入法向后移动")
      elseif b==19 then
      print("用输入法向前移动到开头")
     elseif b==20 then
      print("用输入法向后移动到末尾")
     else
      print(b)]]
    end
  end
end
function pop窗口布局()
  --pop窗口布局
  return {
    LinearLayout;
    layout_width='fill';--布局宽度
    layout_height="fill";
    orientation="vertical";
    id="yuxuanpop外",
    BackgroundColor=背景2;
    gravity="bottom|center";
    {
      ListView,
      id="list333",
      fastScrollEnabled=true;
      --items={"3","2","5","5","2","7","3","2"},
      dividerHeight="0";
      layout_width="fill",
      paddingBottom="20dp";
      layout_gravity="bottom|center";
      layout_marginBottom="-20dp";
     layout_weight="1";
       --DividerHeight=true,--设置无隔断线
      --layout_height="fill";
    },
    {
      LinearLayout;
      layout_width="fill";
      orientation="horizontal";
      layout_height="44dp";
      -- background=背景2;
      id='复制网页信息和编辑链接';
      gravity="right";
      -- elevation="3dp";
      {
        LinearLayout;
        id="关闭弹窗外";
      };
      {
        LinearLayout;
        gravity="center";
        layout_width="44dp";
        layout_height="44dp";
        id="编辑链接";
        {
          ImageView;
          layout_height="22dp";
          src="png/edit_black.png";
          -- id="Sideslip1";
          colorFilter=文字123,--图片颜色
          -- colorFilter=io.open("/data/data/"..activity.getPackageName      layout_width="22dp";
          id="编辑链接ImageView";
        };
      };
    };

    {
      CardView;
      layout_width='fill';--布局宽度
      --  layout_height="88dp";
      --orientation="vertical";
      background=背景2;
      Elevation="10dp";
      radius='20dp';
      id='搜索mToolbar外';
      layout_marginBottom="-20dp";
      {
        LinearLayout;
        layout_width='fill';--布局宽度
        --  layout_height="88dp";
        orientation="vertical";
        layout_marginTop='0dp';
        layout_marginBottom="20dp";
        {
          HorizontalScrollView;--HorizontalListView
          horizontalScrollBarEnabled=false,
          background=较暗色2;
          --layout_width='fill';--布局宽度
          {
            LinearLayout;
            --layout_width='fill';--布局宽度
            --layout_height="fill";
            orientation="horizontal";
            id='快速搜索LinearLayout';
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          orientation="horizontal";
          layout_height="56dp";
          id='mToolbar';
          background=背景2;
          {
            EditText;
            hint=主页搜索hint;
            textSize="16sp";
            id="edit";
            textColor=文字;
            layout_height="fill";
            layout_weight="1";
            background=背景2;
            paddingLeft="16dp";
            singleLine=true;
            -- imeOptions='actionSearch',
          };
          --  };
          --  };
          {
            LinearLayout;
            gravity="center";
            layout_width="45dp";
            layout_height="56dp";
            id="清除输入框里的内容";
            {
              ImageView;
              layout_height="22dp";
              src="png/qwetyi.png";
              -- id="Sideslip1";
              colorFilter=文字123,--图片颜色
              -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
              layout_width="22dp";
              id="清除输入框里的内容ImageView";
            };
          };
          {
            LinearLayout;
            gravity="center";
            layout_width="45dp";
            layout_height="56dp";
            id="选择搜索引擎";
            {
              ImageView;
              layout_height="22dp";
              src="png/ic_menu.png";
              -- id="Sideslip1";
              colorFilter=文字123,--图片颜色
              -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
              layout_width="22dp";
              id="清除输入框里的内容ImageView";
            };
          };
          {
            LinearLayout;
            gravity="center";
            layout_width="45dp";
            layout_height="56dp";
            id="立即搜索Imageiew外LinearLayout";
            {
              ImageView;
              layout_height="22dp";
              src="png/mmm.png";
              -- id="Sideslip1";
              colorFilter=文字123,--图片颜色
              -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
              layout_width="22dp";
              id="立即搜索Imageiew";
            };
          };
        };
        {
          HorizontalScrollView;--HorizontalListView
          horizontalScrollBarEnabled=false,
          id="快捷列表HorizontalScrollView";
          {
            LinearLayout;
            orientation="horizontal";
            id="快捷列表";
          };
        };
      };
    };
  };
end
function 弹出搜索(q,是否粘贴,搜索内容)
  --activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE)
  import "android.view.animation.LayoutAnimationController"
  import "android.view.animation.Animation"
  import "android.view.animation.AlphaAnimation"
  import "android.view.animation.TranslateAnimation"
  import "android.view.animation.AnimationSet"
  import "android.graphics.drawable.BitmapDrawable"

  --打印table
  --print(dump(activity.getContentView()))
  --定义一个弹窗为PopupWindow类型的弹窗
  pop=PopupWindow(activity)
  --给弹窗一个自定义布局
  pop.setContentView(loadlayout(pop窗口布局()))
  --修复bug,千万不能删除
  pop.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
  --设置显示宽度
  pop.setWidth(WindowManager.LayoutParams.FILL_PARENT)
  --设置显示高度
  pop.setHeight(WindowManager.LayoutParams.FILL_PARENT)
  --点击PopupWindow外面区域  true为消失
  pop.setOutsideTouchable(false)
  --修复bug,千万不能删
  pop.setBackgroundDrawable(BitmapDrawable(loadbitmap("1.jpg")))
  --设置pop可获得焦点
  pop.setFocusable(true)
  --设置pop可触摸
  pop.setTouchable(true)
  --设置弹窗显示位置
  pop.showAtLocation(view,Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL,0,0)

  popw=pop
  --[[上升动画
      --相关参数，请自行手册查询
      --定义动画,500为上升高度
      yuxuandh3=TranslateAnimation(0,0,activity.height,0)
      --动画时间，也就是上升动画的快慢
      yuxuandh3.setDuration(200)
      --动画开始执行
      --设置动画的属性
      平移动画=TranslateAnimation(666,0, 0, 0)
      平移动画.setDuration(800)--设置动画时间
      平移动画.setFillAfter(true)--设置动画后停留位置
      平移动画.setRepeatCount(0)--设置无限循环
      --绑定动画
      --Sideslipp.startAnimation(平移动画)
      --yuxuanpop.startAnimation(yuxuandh3);]]

  搜索2(q,nil,nil,是否粘贴,搜索内容)
  --[[设置动画的属性
    平移动画=TranslateAnimation(0,0,activity.height-dp2px(44)-activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().navigation_bar_height)-activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height),0)
    平移动画.setDuration(140)--设置动画时间
    平移动画.setFillAfter(false)--设置动画后停留位置
    平移动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    yuxuanpop.startAnimation(平移动画)]]
  --设置动画的属性
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(160)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  yuxuanpop外.startAnimation(透明动画)
end