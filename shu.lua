


  a={
    LinearLayout;--线性布局
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    id='书签背景外外';
    Focusable=true,
    FocusableInTouchMode=true,
    onClick=function()
    end;
    {
      LinearLayout;--线性布局
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      BackgroundColor=背景3;
      id='书签背景外';
      Orientation='vertical';--布局方向
      {
        LinearLayout;--线性布局
        id='标题栏承载器';
        layout_width='fill';--布局宽度
        Orientation='vertical';--布局方向
      };
      {
        FrameLayout;--线性布局
        layout_width='fill';--布局宽度
        layout_height='fill';--布局高度
        --BackgroundColor=背景3;
        id='list承载器';
      };
    };
  };
  书签布局=
  {
    LinearLayout;--线性布局
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    id='书签背景外外外';

  };
  书签布局=loadlayout(书签布局)
  书签背景外外外.addView(loadlayout(a))--添加控件

  --动画
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
  --页面进入动画(书签背景外外)
  vngggggg0=vngggggg
  showDataDialog(名称,"书签")
  vngggggg.BackgroundColor=0
  if 名称=="网页收藏" then
     标题2="书签"
    是否访问过书签=true
    vngggggg书签=vngggggg
   elseif 名称=="历史记录保存" then
     标题2="历史记录"
    是否访问过历史记录=true
    vngggggg历史记录=vngggggg
  end
  vngggggg=vngggggg0
  标题栏承载器.addView(loadlayout(获取标题栏(标题2,书签背景外,"书签",true)))--添加控件
  菜单.onClick=function(v)
    pop=PopupMenu(activity,v)
    menu=pop.Menu
    menu.add("统计").onMenuItemClick=function(a)
      对话框({
        标题="统计",
        点击事件=function()end,
        文本内容="项目数量为"..tostring(#title2).."条",
        是否显示取消按钮=false,
      })
    end
    menu.add("新建书签").onMenuItemClick=function(a)
      保存收藏("","",true)
    end
    menu.add("新建文件夹").onMenuItemClick=function(a)
      新建文件夹()
    end
    menu.add("多选").onMenuItemClick=function(a)
      function 多选(icdChecked,是否为反选)
        多选状态=true
        if 是否为反选 then
         else
          待操作列表={}
        end
        local item={
          FrameLayout,
          layout_width="fill",
          id="列表按钮外",
          {
            FrameLayout,
            layout_width="fill",
            layout_height='fill';
            id="列表按钮较暗色背景",
            background=较暗色2,
            Alpha=0.27,
          };
          {
            LinearLayout,
            orientation="horizontal",
            layout_width="fill",
            id="列表按钮",
            {
              CheckBox;
              id="icd";
              focusable=false;
              clickable=false;
              focusableInTouchMode=false;
              layout_gravity="right|center";
              layout_margin='10dp';
              layout_marginLeft='18dp';
            };
            {
              TextView,
              id="text",
              textColor=主页文字颜色;
              textSize="14sp",
              layout_margin="16dp",
              layout_marginLeft="8dp";
              layout_gravity="center",
              MaxLines=2,
            },
          },
        }
        local adpd=adapterData(title2,文件夹列表,icdChecked,是否为反选)
        table.insert(adpd,{
          text={
            Text=tostring(""),
          },
          列表按钮较暗色背景={
            Visibility=View.VISIBLE,
          },
          icd={
            Visibility=View.GONE,
          },
          Image2={
            src="a",
            ColorFilter=0xFF74A8FF,
          }
        })
        local items=LuaAdapter(this,adpd,item)
        list.Adapter=items
        list.setOnItemClickListener(AdapterView.OnItemClickListener{
          onItemClick=function(parent,v,pos,id)
            if id<=table.size(文件夹列表) and 名称=="网页收藏" then
              if v.Tag.icd.Checked then
                v.Tag.icd.Checked=false
                for k,v in ipairs(待操作列表) do --遍历
                  if v.Tag.text.Text==d then--如果表的一项的内容包含(find)就怎么怎么样
                    table.remove(待操作列表,k)
                  end
                end
               else
                v.Tag.icd.Checked=true
                table.insert(待操作列表,v.Tag.text.Text.Text)
              end
             else
              if v.Tag.icd.Checked then
                v.Tag.icd.Checked=false
                待操作列表[id]=false
               else
                v.Tag.icd.Checked=true
                待操作列表[id]=true
              end
            end
          end,
        })
        显示控件(选择时显示的顶部菜单)
        显示控件(选择时显示的底部菜单)
      end
      多选(false)
    end
    menu.add("排序").onMenuItemClick=function(a)
      pop=PopupMenu(activity,v)
      menu=pop.Menu
      menu.add("按文件内容").onMenuItemClick=function(a)
        写入文件("/data/data/"..activity.getPackageName().."/排序.xml","按文件内容")
        刷新书签()
        local adpd=adapterData(title2)
        local items=LuaAdapter(this,adpd,item)
        list.Adapter=items
      end
      menu.add("按名称").onMenuItemClick=function(a)
        写入文件("/data/data/"..activity.getPackageName().."/排序.xml","按名称")
        刷新书签()
        table.sort(title2,function(a,b)
          return ((a)>(b))
        end)
        table.sort(bookId2,function(a,b)
          return ((a)>(b))
        end)
        local adpd=adapterData(title2)
        local items=LuaAdapter(this,adpd,item)
        list.Adapter=items
      end
      pop.show()--显示@音六站长～
    end
    menu.add("显示在侧栏").onMenuItemClick=function(a)
      --设置宽度
      linearParams = 书签背景外外.getLayoutParams()
      linearParams.height =AWidth2-getwh(底部栏2)+100
      书签背景外外.setLayoutParams(linearParams)
      书签背景外外外.removeAllViewsInLayout()
      侧栏.removeAllViewsInLayout()
      侧栏.addView(书签背景外外)
      显示控件(侧栏)
    end
    menu.add("数据管理").onMenuItemClick=function(a)
      浏览器菜单("设置")
      print("点击数据管理")
    end
    pop.show()--显示@音六站长～
  end
  标题.text=标题2
  list承载器.addView(listlayout)--添加控件
  主页.addView(书签布局)--添加控件
  页面列表["书签"]=true


  --控件不可视
  主页搜索2.setVisibility(View.GONE)
  返回.onClick=function()
    if 多选状态 then
      待操作列表=nil
      多选状态=false
      隐藏控件(选择时显示的顶部菜单)
      隐藏控件(选择时显示的底部菜单)
      adpd={}
      local adpd=adapterData(title2,文件夹列表)
      local items=LuaAdapter(this,adpd,item)
      list.Adapter=items
      设置点击事件()
     else
      --上升动画
      --相关参数，请自行手册查询
      --定义动画,500为上升高度。
      yuxuandh3=TranslateAnimation(0,AWidth,0,0)
      --动画时间，也就是上升动画的快慢
      yuxuandh3.setDuration(100)
      --动画开始执行
      书签背景外外.startAnimation(yuxuandh3);
      import "android.view.animation.Animation$AnimationListener"
      yuxuandh3.setAnimationListener(AnimationListener{
        onAnimationEnd=function()
          隐藏控件(书签背景外外外)
      end})
      --设置动画的属性
      透明动画=AlphaAnimation(1,0)
      透明动画.setDuration(100)--设置动画时间
      透明动画.setFillAfter(true)--设置动画后停留位置
      透明动画.setRepeatCount(0)--设置无限循环
      --绑定动画
      书签背景外.startAnimation(透明动画)
    end
  end;
