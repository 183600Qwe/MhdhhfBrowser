st=(loadlayout("layout/st2layout"))
设置在屏幕旋转事件列表中的位置=#onConfigurationChangedList+1
onConfigurationChangedList[设置在屏幕旋转事件列表中的位置]=function(是否横屏)
  是否横屏=是否横屏
end
标题栏承载器.addView(loadlayout(获取标题栏("设置",设置背景外,"设置",设置在屏幕旋转事件列表中的位置)))--添加控件
隐藏控件(菜单)
右标题栏承载器.addView(loadlayout(获取标题栏("",设置背景外,"设置",设置在屏幕旋转事件列表中的位置)))--添加控件
隐藏控件(返回)
隐藏控件(菜单)
主页.addView(st)--添加控件
页面列表["设置"]=true
设置背景外=设置背景外
function 文件反转(v,id,记录文件的列表)
  if io.open("/data/data/"..activity.getPackageName().."/"..记录文件的列表[id]..".xml"):read("*a")=="打开" then
    写入文件("/data/data/"..activity.getPackageName().."/"..记录文件的列表[id]..".xml","关闭")
    v.Tag.mSwitch.Checked=false
    --加载列表()
   else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
    写入文件("/data/data/"..activity.getPackageName().."/"..记录文件的列表[id]..".xml","打开")
    v.Tag.mSwitch.Checked=true
    --加载列表()
  end
end
function 设置文件反转点击事件(id,记录文件的列表)
  id.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      文件反转(v,id,记录文件的列表)
  end})
end
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"

--页面进入动画(设置背景)
Switch颜色=Color.parseColor(一般强调色)

local item={
  FrameLayout,
  layout_width="fill",
  layout_height='56dp';
  {
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    layout_height='fill';
    layout_marginRight='52dp';
    {
      ImageView;
      --src=图标;
      layout_width='24dp';
      layout_height='24dp';
      layout_gravity='left|center';
      layout_marginLeft='36dp';
      id='Image2';
      ColorFilter=文字;--设置图片着色
      Alpha=0.8,
    };
    {
      TextView;
      -- layout_width='wrap';
      layout_height='fill';
      layout_marginLeft='22dp';
      Gravity='left|center';
      textColor=文字;
      text='关于';
      id="srct",
      textSize='16sp';
    };
  };
  {
    Switch;
    gravity='right|center';
    id="mSwitch";
    layout_marginRight='6dp';
    layout_width="fill",
    layout_height='fill';
    focusable=false;
    clickable=false;
    focusableInTouchMode=false;
  };
}
--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表
图片列表={"png/tbs.png","png/settings_ethernet_black.png","png/list_alt_black.png","png/home_black.png","png/style_black.png","png/palette_black.png","png/tune_black.png","png/lou.png"}
aw3={"浏览设置","操作设置","数据管理","主页","个性化","主题","杂项","关于"}

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw3 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw3[nj],Image2=图片列表[nj],mSwitch={Visibility=View.GONE}})
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,item)

--将小项目匹配给大list
设置list.Adapter=yuxuan_adpqy
function 打开关闭反转(d)
  d=io.open("/data/data/"..activity.getPackageName().."/"..d..".xml"):read("*a")
  if d=="打开" then
    return "关闭"
   else
    return "打开"
  end
end
function 打开关闭反转并转换为允许或不允许(d)
  d=io.open("/data/data/"..activity.getPackageName().."/"..d..".xml"):read("*a")
  if d=="打开" then
    return "不允许"
   else
    return "允许"
  end
end
function 打开关闭反转并转换为显示或不显示(d)
  d=io.open("/data/data/"..activity.getPackageName().."/"..d..".xml"):read("*a")
  if d=="打开" then
    return "不显示"
   else
    return "显示"
  end
end
function 关闭转不(d)
  d=io.open("/data/data/"..activity.getPackageName().."/"..d..".xml"):read("*a")
  if d=="打开" then
    return "不"
   else
    return ""
  end
end
设置list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    local v2=v
    if v.Tag.srct.Text=="主题" then
      if 页面列表["主题"] then
        显示控件(主题ScrollView)
       else
        import "sts/zhuti"
      end
     elseif v.Tag.srct.Text=="关于" then
      if 页面列表["关于"] then
        显示控件(关于scrollView)
       else
        import "sts/guan"
      end
     else
      if 文件夹内容弹窗内容名称==v.Tag.srct.Text then
        文件夹内容弹窗内容名称=nil
        if pop then
          pop.dismiss()
        end
       else
        文件夹内容弹窗内容名称=v.Tag.srct.Text
        datas={}
        --创建了三个有数据的列表
        图片列表={}
        if v.Tag.srct.Text=="浏览设置" then
          aw3={"网页打开外部应用设置",
            "网页定位",
            "滑动显示隐藏操作栏",
            "设置网页字体大小",
            "标题内容设置",
            "保存表单数据",
            "脚本管理",
            "跳转到另一个网页（所有的）时",
            "发起新搜索时新建一次窗口",
            "不接受第三方cookie",
          }
          记录文件的列表={
            nil,
            "定位",
            "滑动显示隐藏操作栏",
            nil,
            nil,
            "是否保存表单数据",
            nil,
            nil,
            "是否在发起新搜索时新建一次窗口",
            "是否不接受第三方cookie",
          }
         elseif v.Tag.srct.Text=="数据管理" then
          aw3={

            "清理浏览数据",
            --"设置备份路径(没做好)",
            "全部数据",
            "书签",
            "历史记录",
            "主页项目",
            "脚本管理",
            "工具脚本管理",
            "垂直搜索(快速搜索)管理",
            "程序启动事件",
            "UA",
            "其他数据",
          }
          记录文件的列表={
          }
         elseif v.Tag.srct.Text=="操作设置" then
          aw3={
            "滑动返回",
            "把标题栏放到底栏中",
            "长按事件设置",
            "菜单按钮上滑功能设置",
            "悬浮工具栏设置与说明",
            "把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口",
            "隐藏网页前进按钮",
            "隐藏网页后退按钮",
            "隐藏切换窗口按钮",
            "将网页前进按钮和网页后退按钮改为书签按钮和历史按钮",
            "隐藏快速输入网址器",
            "书签设置",
            "双悬浮按钮设置",
          }
          记录文件的列表={
            "滑动返回",
            "是否把标题栏放到底栏中",
            nil,
            nil,
            nil,
            "是否把标题栏放到底栏中时不需要点击切换窗口按钮就可以切换窗口",
            "是否隐藏网页前进按钮",
            "是否隐藏网页后退按钮",
            "是否隐藏切换窗口按钮",
            "是否将网页前进按钮和网页后退按钮改为书签按钮和历史按钮",
            "是否隐藏快速输入网址器",
          }
         elseif v.Tag.srct.Text=="主页" then
          aw3={"主页设置",
            "修改主页搜索栏样式",
            "主页图片背景",
            "修改主页图片背景",
          }
          记录文件的列表={
            nil,
            nil,
            "主页图片背景",
            nil,
          }
         elseif v.Tag.srct.Text=="个性化" then
          aw3={"输入框诗句",
            "修改底栏样式",
            "控件阴影",
            "浏览器页面标题居中",
            "浏览器页面标题栏背景为白色(在查看自带的不是收藏、收藏(搜索栏修改)、仅搜索栏的主页时始终标题栏背景为浅灰色)",
            "浏览器页面标题边框",
            "白色背景",
            "隐藏搜索快速输入网址器",
            "操作栏自动变色",
          }
          记录文件的列表={
            "输入框诗句",
            nil,
            "控件阴影",
            "主页标题是否居中",
            "浏览器页面标题栏背景是否为白色",
            "浏览器页面标题边框",
            "白色背景",
            "是否隐藏快速输入网址器",
            "是否操作栏自动变色",
          }
         elseif v.Tag.srct.Text=="杂项" then
          aw3={"垂直搜索(快速搜索)管理",
            "搜索引擎选择",
            "程序启动事件",
            "选择下载器",
            "清理浏览数据",
            "工具脚本管理",
          }
          记录文件的列表={}
        end
        --mmp={}
        if 是否横屏 then
          --PopupWindow(自己写的菜单)布局
          Popup_layout={
            LinearLayout;
            {
              CardView;
              CardElevation="6dp";
              CardBackgroundColor=backgroundc;
              Radius="2dp";
              layout_width="fill";
              layout_height="-1";
              layout_margin="18dp";
              layout_marginLeft="0dp";
              {
                LinearLayout,
                orientation="vertical",--布局方向
                layout_width="fill",
                layout_height="fill",
                id="Popup_list2";
                {
                  TextView;
                  text="没有书签";
                  id="没有书签";
                  textColor=文字123;--给图标上色
                  textSize="20dp";
                  layout_gravity="center";
                  gravity="center";
                  layout_margin="18dp";
                  --BackgroundColor=背景2;
                };
                {
                  GridView;
                  --layout_height="-1";
                  layout_width="-1";
                  NumColumns=1;
                  id="Popup_list";
                };
              };
            };
          };

          --PopupWindow
          pop=PopupWindow(activity)
          --PopupWindow加载布局
          pop.setContentView(loadlayout(Popup_layout))
          --pop.setWidth(dp2px(192))
          pop.setWidth(-1)
          pop.setHeight(-2)

          pop.setOutsideTouchable(true)
          pop.setBackgroundDrawable(ColorDrawable(0x00000000))

          --[[pop.onDismiss=function()
          --消失事件
          --文件夹内容弹窗是否正在显示=false
        end]]

          --print(dump(文件夹内容))
          --if 是否有书签 then

          隐藏控件(没有书签)
          --end
          mlist=Popup_list
          pop.showAsDropDown(v)
         else
          mlist=右设置list
          标题.Text=v.Tag.srct.Text
        end
        --菜单点击事件
        mlist.setOnItemClickListener(AdapterView.OnItemClickListener{
          onItemClick=function(parent, v, pos,id)
            控件ID=v.Tag.srct
            文本=控件ID.Text
            if 文本=="设置网页字体大小" then
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
                标题="设置字体大小",
                点击事件=function()
                  字体大小t=tostring(seekBar.getProgress()+45)
                  写入文件("/data/data/"..activity.getPackageName().."/网页字体大小.xml",字体大小t)
                end,
                是否显示取消按钮=true,
                对话框布局=loadlayout(InputLayout),
              })
              seekBar.setMax(135)
              seekBar.setProgress(55)
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
                  textView.text="字体大小"..tostring(seekBar.getProgress()+45)..""
                  textView.textSize=(dp2px(8)/100*(seekBar.getProgress()+45))
              end}
              --状态改变
              textView.text="字体大小"..tostring(seekBar.getProgress()+45)..""
              textView.textSize=(dp2px(8)/100*(seekBar.getProgress()+45))
              拖动条颜色(seekBar,Color.parseColor(一般强调色))
             elseif 文本=="标题内容设置" then
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("网页标题").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/标题显示内容.xml","网页标题")
              end
              menu.add("网页域名").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/标题显示内容.xml","网页域名")
              end
              menu.add("网页链接").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/标题显示内容.xml","网页链接")
              end
              pop.show()--显示@音六站长～
             elseif 文本=="主页设置" then
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("设置为链接").onMenuItemClick=function(a)
                对话框({
                  标题="设置为链接",
                  HINT="链接",
                  点击事件=function(text)
                    写入文件("/data/data/"..activity.getPackageName().."/主页链接.xml",text)
                  end,
                  是否显示取消按钮=true,
                  输入框文本=主页链接
                })
              end
              menu.add("设置为收藏").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/主页链接.xml","收藏")
              end
              menu.add("设置为收藏(搜索栏修改)").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/主页链接.xml","收藏带搜索栏")
              end
              menu.add("设置为搜索栏加常用网站").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/主页链接.xml","仅搜索栏")
              end
              pop.show()--显示@音六站长～
             elseif 文本=="修改主页搜索栏样式" then
              运行代码含读取文件('sts/so')
             elseif 文本=="修改底栏样式" then
              运行代码含读取文件('sts/dilan')
             elseif 文本=="搜索引擎选择" then
              切换搜索引擎(控件ID)

             elseif 文本=="垂直搜索(快速搜索)管理" and 返回数据=="数据管理"==false then
              --切换搜索引擎(控件ID)
              --渐变动画效果的，中间是安卓跳转动画代码

              数据传送="搜索引擎管理"
              运行代码含读取文件("sts/gongxian")
             elseif 文本=="程序启动事件" then
              运行代码含读取文件('sts/qidong')
             elseif 文本=="选择下载器" then
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("Mhdhhf浏览器").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/下载器.xml","Mhdhhf浏览器")
              end
              menu.add("系统下载器").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/下载器.xml","系统下载器")
              end
              menu.add("调用其他浏览器下载").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/下载器.xml","调用其他浏览器下载")
              end
              pop.show()--显示@音六站长～
             elseif 文本=="清理浏览数据" then
              清除项目列表()
             elseif 文本=="长按事件设置" then
              InputLayout={
                LinearLayout;
                orientation="horizontal";
                layout_width="fill";
                {
                  LinearLayout;
                  orientation="horizontal";
                  layout_width="fill";
                  layout_height="56dp",--布局高度
                  layout_margin="10dp";
                  layout_marginTop="16dp";
                  layout_marginBottom="20dp";
                  {
                    LinearLayout;
                    layout_weight="1",--重力分配
                    id="网页后退",
                    layout_height="fill",--布局高度
                    gravity="center",--重力居中
                    onClick=function()
                      显示选择功能对话框("网页后退",nil,"长按功能")
                    end,
                    {
                      ImageView,--图片框控件
                      layout_weight="1",--重力分配
                      layout_width="56dp",--布局宽度
                      layout_height="25dp",--布局高度
                      src=("png/gfwzu.png"),--视图路径
                      colorFilter=文字,--图片颜色
                    },
                  };
                  {
                    LinearLayout;
                    layout_weight="1",--重力分配
                    id="网页前进",
                    layout_height="fill",--布局高度
                    gravity="center",--重力居中
                    onClick=function()
                      显示选择功能对话框("网页前进",nil,"长按功能")
                    end,
                    {
                      ImageView,--图片框控件
                      layout_weight="1",--重力分配
                      layout_width="56dp",--布局宽度
                      layout_height="25dp",--布局高度
                      src=("png/chevron_right.png"),--视图路径
                      colorFilter=文字,--图片颜色
                    },
                  };
                  {
                    LinearLayout;
                    layout_weight="1",--重力分配
                    id="打开菜单",
                    --Elevation="2dp";
                    layout_height="fill",--布局高度
                    gravity="center",--重力居中
                    onClick=function()
                      显示选择功能对话框("打开菜单",nil,"长按功能")
                    end,
                    {
                      ImageView,--图片框控件
                      layout_weight="1",--重力分配
                      layout_width="56dp",--布局宽度
                      layout_height="26dp",--布局高度
                      src="png/ic_menu.png",--视图路径
                      colorFilter=文字,--图片颜色
                    },
                  };
                  {
                    FrameLayout,--线性布局
                    layout_weight="1",--重力分配
                    layout_height="fill",--布局高度
                    id="打开网页列表",
                    onClick=function()
                      显示选择功能对话框("打开网页列表",nil,"长按功能")
                    end,
                    {
                      ImageView,--图片框控件
                      --  layout_weight="1",--重力分配
                      layout_width="56dp",--布局宽度
                      layout_height="23dp",--布局高度
                      layout_gravity="center";
                      src="png/check_box_outline_blank_black.png",--视图路径
                      colorFilter=文字,--图片颜色
                    },
                    {
                      TextView;
                      -- colorFilter=0xFFffffff;
                      text="1";
                      textColor=文字;
                      layout_gravity="center";
                      gravity="center";
                      textSize="12sp";
                      layout_width="fill",--布局宽度
                      layout_height="fill",--布局高度
                      id="网页列表数量显示";
                    };
                  };
                  {
                    LinearLayout;
                    layout_weight="1",--重力分配
                    layout_height="fill",--布局高度
                    gravity="center",--重力居中
                    id="返回主页",
                    onClick=function()
                      显示选择功能对话框("返回主页",nil,"长按功能")
                    end,
                    {
                      ImageView,--图片框控件
                      layout_weight="1",--重力分配
                      layout_width="56dp",--布局宽度
                      layout_height="25dp",--布局高度
                      src="png/home_black.png",--视图路径
                      colorFilter=文字,--图片颜色
                    },
                  },
                },
              };
              对话框({
                标题="长按事件设置",
                点击事件=function()
                end,
                是否显示取消按钮=false,
                对话框布局=loadlayout(InputLayout),
              })
             elseif 文本=="菜单按钮上滑功能设置" then
              --PopupWindow(自己写的菜单)布局
              Popup_layout={
                LinearLayout;
                {
                  CardView;
                  CardElevation="6dp";
                  CardBackgroundColor=backgroundc;
                  Radius="2dp";
                  layout_width="-1";
                  --layout_height="-1";
                  layout_margin="8dp";
                  {
                    ScrollView;--线性布局
                    layout_width='fill';--布局宽度
                    layout_height='wrap';--布局高度
                    id='scrollView';--布局高度
                    {
                      LinearLayout;
                      Elevation='-1';
                      layout_width='fill';
                      Orientation='vertical';--布局方向
                      {
                        GridView;
                        --layout_height="-1";
                        layout_width="-1";
                        NumColumns=1;
                        id="Popup_list";
                      };
                      {
                        LinearLayout;
                        Elevation='-1';
                        layout_width='fill';
                        layout_height='52dp';
                        -- radius='8dp';
                        id='菜单按钮上滑功能开关LinearLayout';
                        onClick=function()
                          if io.open("/data/data/"..activity.getPackageName().."/是否启用菜单按钮上滑功能.xml"):read("*a")=="打开" then
                            写入文件("/data/data/"..activity.getPackageName().."/是否启用菜单按钮上滑功能.xml","关闭")
                            滑动显示隐藏操作栏="关闭"
                            菜单按钮上滑功能开关TextView.text=打开关闭反转("是否启用菜单按钮上滑功能")..'菜单按钮上滑功能'
                           else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
                            写入文件("/data/data/"..activity.getPackageName().."/是否启用菜单按钮上滑功能.xml","打开")
                            滑动显示隐藏操作栏="打开"
                            菜单按钮上滑功能开关TextView.text=打开关闭反转("是否启用菜单按钮上滑功能")..'菜单按钮上滑功能'
                          end
                        end,
                        {
                          TextView;
                          -- layout_width='wrap';
                          layout_height='fill';
                          layout_marginLeft='22dp';
                          Gravity='left|center';
                          textColor=文字;
                          text=打开关闭反转("是否启用菜单按钮上滑功能")..'菜单按钮上滑功能';
                          id="菜单按钮上滑功能开关TextView",
                          textSize='16sp';
                        };
                      };
                      {
                        LinearLayout;
                        Elevation='-1';
                        layout_width='fill';
                        layout_height='52dp';
                        -- radius='8dp';
                        id='菜单按钮上滑功能设置LinearLayout';
                        onClick=function()
                          显示选择功能对话框(nil,true,"菜单按钮上滑功能")
                        end,
                        {
                          TextView;
                          -- layout_width='wrap';
                          layout_height='fill';
                          layout_marginLeft='22dp';
                          Gravity='left|center';
                          textColor=文字;
                          text='菜单按钮上滑功能设置';
                          id="菜单按钮上滑功能设置TextView",
                          textSize='16sp';
                        };
                      };
                    };
                  };

                };
              };

              --PopupWindow
              pop=PopupWindow(activity)
              --PopupWindow加载布局
              pop.setContentView(loadlayout(Popup_layout))
              --pop.setWidth(dp2px(192))
              pop.setHeight(-2)

              pop.setOutsideTouchable(true)
              pop.setBackgroundDrawable(ColorDrawable(0x00000000))

              pop.onDismiss=function()
                --消失事件
                --文件夹内容弹窗是否正在显示=false
              end

              pop.showAsDropDown(控件ID)
             elseif 文本=="悬浮工具栏设置与说明" then
              运行代码含读取文件("mods/xuanfugongjulanshezhijiaocheng")
             elseif 文本=="脚本管理" and 返回数据=="数据管理"==false then
              数据传送="脚本管理"
              运行代码含读取文件("sts/gongxian")
             elseif 文本=="工具脚本管理" and 返回数据=="数据管理"==false then
              数据传送="工具脚本管理"
              运行代码含读取文件("sts/gongxian")
             elseif 文本=="修改主页图片背景" then
              import "android.content.Intent"
              local intent= Intent(Intent.ACTION_PICK)
              intent.setType("image/*")
              this.startActivityForResult(intent,1)
             elseif 文本=="书签"
              then
              路径="书签保存"
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("导出").onMenuItemClick=function(a)
                title2={}
                bookId2={}
                列表={}
                内容=io.open("/data/data/"..activity.getPackageName().."/"..路径..".xml"):read("*a")
                for t,c in 内容:gmatch("【项目】(.-)【项目】") do
                  列表[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
                  --bookId2[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
                end
                文件夹列表=string2tab(内容:match("【文件夹列表】(.-)【文件夹列表】")) or {}
                导出(列表,文本,文件夹列表)
              end
              menu.add("导入").onMenuItemClick=function(a)
                导入(控件ID,路径)
              end
              menu.add("清除").onMenuItemClick=function(a)
                对话框({
                  标题="提示",
                  点击事件=function()
                    写入文件("/data/data/"..activity.getPackageName().."/"..路径..".xml","")
                    print("清除好了")
                  end,
                  文本内容="是否清除书签？",
                  是否显示取消按钮=true,
                })
              end
              pop.show()--显示@音六站长～
             elseif 文本=="历史记录"
              or 文本=="主页项目"
              or 文本=="脚本管理"
              or 文本=="工具脚本管理"
              or 文本=="垂直搜索(快速搜索)管理"
              then
              if 文本=="书签" then
                路径="书签保存"
               elseif 文本=="历史记录" then
                路径="历史记录保存"
               elseif 文本=="主页项目" then
                路径="主页项目"
               elseif 文本=="脚本管理" then
                路径="脚本保存"
               elseif 文本=="工具脚本管理" then
                路径="工具脚本保存"
               elseif 文本=="垂直搜索(快速搜索)管理" then
                路径="搜索引擎保存"
              end

              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("导出").onMenuItemClick=function(a)
                title2={}
                bookId2={}
                列表={}
                内容=io.open("/data/data/"..activity.getPackageName().."/"..路径..".xml"):read("*a")
                for t,c in 内容:gmatch("【项目】(.-)【项目】") do
                  列表[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
                  --bookId2[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
                end
                导出(列表,文本)
              end
              menu.add("导入").onMenuItemClick=function(a)
                导入(控件ID,路径)
              end
              menu.add("清除").onMenuItemClick=function(a)
                对话框({
                  标题="提示",
                  点击事件=function()
                    写入文件("/data/data/"..activity.getPackageName().."/"..路径..".xml","")
                    print("清除好了")
                  end,
                  文本内容="是否清除？",
                  是否显示取消按钮=true,
                })
              end
              pop.show()--显示@音六站长～
             elseif 文本=="程序启动事件"
              or 文本=="UA"
              then
              if 文本=="程序启动事件" then
                路径="程序启动事件.lua"
               elseif 文本=="UA" then

                路径="UA储存.xml"

              end

              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("导出").onMenuItemClick=function(a)
                title2={}
                bookId2={}
                列表={}
                内容=io.open("/data/data/"..activity.getPackageName().."/"..路径):read("*a")
                if 文本=="程序启动事件" then
                  写入文件(backup..os.date("%Y-%m-%d %H:%M:%S")..文本.."导出.lua",内容)
                 else
                  写入文件(backup..os.date("%Y-%m-%d %H:%M:%S")..文本.."书签导出.txt",内容)
                end
              end
              menu.add("导入").onMenuItemClick=function(a)
                导入(控件ID,路径,true)
              end
              menu.add("清除").onMenuItemClick=function(a)
                对话框({
                  标题="提示",
                  点击事件=function()
                    if 文本=="程序启动事件" then
                      写入文件("/data/data/"..activity.getPackageName().."/"..路径,"--lua代码")
                     else
                      写入文件("/data/data/"..activity.getPackageName().."/"..路径,"")
                    end
                    print("清除好了")
                  end,
                  文本内容="是否清除书签？",
                  是否显示取消按钮=true,
                })
              end
              pop.show()--显示@音六站长～
             elseif 文本=="全部数据" then
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("导出").onMenuItemClick=function(a)
                内容=""
                状态=true
                for k,v in pairs(初始化列表) do
                  if 状态 then
                    v2=io.open("/data/data/"..activity.getPackageName().."/"..k..".xml"):read("*a")
                    内容=内容..k.."\n"..v2
                    状态=false
                   else
                    v2=io.open("/data/data/"..activity.getPackageName().."/"..k..".xml"):read("*a")
                    内容=内容.."\n"..k.."\n"..v2
                  end
                end
                写入文件(backup..os.date("%Y-%m-%d %H:%M:%S").."全部数据导出.txt",内容)
              end
              menu.add("导入").onMenuItemClick=function(a)
                ChoiceFile("/sdcard/",function(文件路径)
                  状态=true
                  文件内容=io.open(文件路径):read("*a")
                  c2=""
                  for c in io.lines(文件路径) do
                    if 状态==true then
                      文件名=c
                      状态=false
                     elseif c=="  } ;" then
                      c2=c2.."\n"..c
                      写入文件("/data/data/"..activity.getPackageName().."/"..(文件名)..".xml",(c2))
                      c2=""
                      状态=true
                     elseif c=="{" or 状态==4 then
                      c2=c2.."\n"..c
                      状态=4
                     else
                      写入文件("/data/data/"..activity.getPackageName().."/"..(文件名)..".xml",(c))
                      状态=true
                    end
                  end
                end)
              end
              menu.add("复位（仅开关）").onMenuItemClick=function(a)
                对话框({
                  标题="复位",
                  点击事件=function()
                    for k,v in pairs(初始化列表) do
                      if k=="历史记录保存"
                        or k=="主页项目"
                        or k=="脚本管理"
                        or k=="工具脚本管理"
                        or k=="垂直搜索(快速搜索)管理"
                        or k=="程序启动事件"
                        or k=="书签保存"
                        or k=="UA"
                        then
                       else
                        写入文件("/data/data/"..activity.getPackageName().."/"..k..".xml",初始化列表[k])
                      end
                    end
                    print("复位好了")
                  end,
                  文本内容="是否复位开关？",
                  是否显示取消按钮=true,
                })
              end
              menu.add("复位（全部）").onMenuItemClick=function(a)
                对话框({
                  标题="复位",
                  点击事件=function()
                    for k,v in pairs(初始化列表) do
                      写入文件("/data/data/"..activity.getPackageName().."/"..k..".xml",初始化列表[k])
                    end
                    print("复位好了")
                  end,
                  文本内容="是否复位全部数据？",
                  是否显示取消按钮=true,
                })
              end
              pop.show()--显示@音六站长～
             elseif 文本=="设置备份路径(没做好)" then
              print("没做好")
             elseif 文本=="网页打开外部应用设置" then
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("直接打开").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/允许网页打开外部应用.xml","打开")
              end
              menu.add("询问").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/允许网页打开外部应用.xml","询问")
              end
              menu.add("拦截").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/允许网页打开外部应用.xml","拦截")
              end
              pop.show()--显示@音六站长～
             elseif 文本=="跳转到另一个网页（所有的）时" then
              local 路径="跳转到另一个网页所有的时.xml"
              pop=PopupMenu(activity,控件ID)
              menu=pop.Menu
              menu.add("创建新窗口打开此网页").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/"..路径,"创建新窗口打开此网页")
              end
              menu.add("创建能在下次跳转到另一个网页时更新的新窗口打开此网页").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/"..路径,"创建能在下次跳转到另一个网页时更新的新窗口打开此网页")
              end
              menu.add("在当前窗口打开").onMenuItemClick=function(a)
                写入文件("/data/data/"..activity.getPackageName().."/"..路径,"在当前窗口打开")
              end
              pop.show()--显示@音六站长～
             elseif 文本=="书签设置" then
              --创建了有数据的列表
              aw3={
                "书签添加器在已自动填充链接时显示链接",
              }
              Checked列表={
                打开关闭转TF带读取文件("书签添加器在已自动填充链接时显示链接"),
              }
              对话框标题="书签设置"
              运行代码含读取文件("mods/dialog/liebiaoduihuakuang")
              设置文件反转点击事件(list)
             elseif 文本=="双悬浮按钮设置" then
              --创建了有数据的列表
              aw3={
                "左侧按钮",
                "右侧按钮",
                "双悬浮按钮模式",
                "右侧按钮工具设置",
              }
              记录文件的列表={
                "双悬浮按钮中的左侧按钮",
                "双悬浮按钮中的右侧按钮",
                "双悬浮按钮模式",
              }
              对话框标题="双悬浮按钮设置"
              运行代码含读取文件("mods/dialog/liebiaoduihuakuang")
              设置文件反转点击事件(list,记录文件的列表)
              --yuxuan_adpqy.add({srct={text="双悬浮按钮设置",textSize="14sp"},mSwitch={Visibility=View.GONE}})
              local InputLayout=
              {
                TextView;
                -- layout_width='wrap';
                layout_height='fill';
                Gravity='left|center';
                textColor=文字;
                text='左侧按钮上下滑动切换标签页，左滑打开书签，右滑打开历史记录；右侧按钮上下滑动搜索，左滑打开工具，右滑网页后退。';
                id="srct",
                textSize='15sp';
                padding='22dp';
                --paddingBottom='15dp';
              };
              内容ScrollView外.addView(loadlayout(InputLayout))
             else
              if io.open("/data/data/"..activity.getPackageName().."/"..记录文件的列表[pos+1]..".xml"):read("*a")=="打开" then
                写入文件("/data/data/"..activity.getPackageName().."/"..记录文件的列表[pos+1]..".xml","关闭")
                v.Tag.mSwitch.Checked=false
                --加载列表()
               else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
                写入文件("/data/data/"..activity.getPackageName().."/"..记录文件的列表[pos+1]..".xml","打开")
                v.Tag.mSwitch.Checked=true
                --加载列表()
              end
            end
            --是否重载页面参数=true
          end,
        })
        --循环添加匹配有数据的列表到
        --nj只是一个变量，你可以用其他变量代替
        --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
        --就相当于  for  1,3   do
        for nj=1,#aw3 do
          if 记录文件的列表[nj] then
            --给空的datas添加所有的数据
            --格式为  table.insert(空列表名称,{id=数据列表[nj]})
            table.insert(datas,{srct=aw3[nj],srcf=图片列表[nj],mSwitch={Visibility=View.VISIBLE,Checked=打开关闭转TF带读取文件(记录文件的列表[nj])}})
           else
            --给空的datas添加所有的数据
            --格式为  table.insert(空列表名称,{id=数据列表[nj]})
            table.insert(datas,{srct=aw3[nj],srcf=图片列表[nj],mSwitch={Visibility=View.GONE,Checked=false}})
          end
        end
        --
        --创建适配器，将datas里面的数据匹配给itemc小项目
        yuxuan_adpqy=LuaAdapter(activity,datas,item)

        --将小项目匹配给大list
        mlist.Adapter=yuxuan_adpqy
      end
    end
end})




--回调
function onActivityResult(requestCode,resultCode,intent)
  if intent then
    local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
    cursor.moveToFirst()
    import "android.provider.MediaStore"
    local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
    fileSrc = cursor.getString(idx)
    bit=nil
    --fileSrc回调路径路径
    import "android.graphics.BitmapFactory"
    -- bit =BitmapFactory.decodeFile(fileSrc)
    --  iv.setImageBitmap(bit)
    LuaUtil.copyDir(fileSrc,"/sdcard/MhdhhfBrowser/主页背景.png")
  end
end--nirenr


function removeCookie() --删除cookie
  pref=this.getSharedPreferences("Cookie",0)
  CookieManager.getInstance().setCookie(url_main,"")
  CookieManager.getInstance().removeAllCookie()
end --定义注销
function 清除项目列表()
  local InputLayout=
  {
    LinearLayout,
    orientation="vertical",--布局方向
    layout_width="fill",
    id="list外",
    {
      ListView,
      id="list",
      fastScrollEnabled=true;
      dividerHeight="0";
      layout_width="fill",
    },
  };
  对话框({
    标题="清理浏览数据",
    点击事件=function()
      for k,v in ipairs(待操作列表) do --遍历
        if v=="清除缓存数据" then
          view.clearCache(true);
          --removeCookie()
          view.reload();
          task(200,function()
            view.clearCache(false);
            view.reload()
            print("清除好了")
          end)
         elseif v=="清除历史记录" then
          写入文件("/data/data/"..activity.getPackageName().."/历史记录保存.xml","")
          print("清除好了")
         elseif v=="清除表单数据" then
          view.clearFormData()
          print("清除好了")
        end
      end
    end,
    是否显示取消按钮=true,
    对话框布局=loadlayout(InputLayout),
  })
  item={
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    id="按钮";
    {
      CheckBox;
      id="icd";
      focusable=false;
      clickable=false;
      focusableInTouchMode=false;
      layout_gravity='left|center';
      layout_margin='10dp';
      layout_marginLeft='18dp';
    };
    {
      TextView,
      id="text",
      textColor=文字;
      textSize="16sp",
      layout_margin="16dp",
      layout_marginLeft="8dp";
      layout_gravity="center",
    },
  }
  --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
  datas={}


  --创建了一个有数据的列表
  mmp={"清除缓存数据","清除历史记录","清除表单数据"}
  --循环添加匹配有数据的列表到
  --nj只是一个变量，你可以用其他变量代替
  --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
  --就相当于  for  1,3   do
  for nj=1,#mmp do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{text=mmp[nj]})
  end
  --
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,item)

  --将小项目匹配给大list
  list.Adapter=yuxuan_adpqy
  待操作列表={}
  list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(v,o,i,d)
      views=(o.Tag.按钮)--模拟点击
      -- print(d)
      if o.Tag.icd.Checked then
        o.Tag.icd.Checked=false
        for k,v in ipairs(待操作列表) do --遍历
          if o.Tag.text.Text==v then--如果表的一项的内容包含(find)就怎么怎么样
            table.remove(待操作列表,k)
          end
        end
       else
        o.Tag.icd.Checked=true
        table.insert(待操作列表,o.Tag.text.Text)
      end
    end
  })
  width,height=getwh(list外)
  --同理设置高度
  linearParams = list外.getLayoutParams()
  linearParams.height =height*3
  list外.setLayoutParams(linearParams)

end
function 显示选择功能对话框(项目名称,a,保存文件,b)
  local InputLayout={
    ListView;
    --layout_height="fill";
    id="list";
    layout_width="fill";
    dividerHeight="0";
  };
  对话框({
    标题="选择功能",
    点击事件=function()
    end,
    是否显示取消按钮=false,
  })
  内容ScrollView外.addView(loadlayout(InputLayout))
  --同理设置高度
  linearParams = 内容ScrollView外.getLayoutParams()
  linearParams.height =activity.getHeight()*0.6
  内容ScrollView外.setLayoutParams(linearParams)
  --控件隐藏
  内容LinearLayout外.setVisibility(View.GONE)
  item={
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    id="按钮";
    {
      RadioButton;
      id="icd";
      focusable=false;
      clickable=false;
      focusableInTouchMode=false;
      layout_gravity='left|center';
      layout_margin='10dp';
      layout_marginLeft='18dp';
    };
    {
      ImageView;
      --src=图标;
      layout_width='24dp';
      layout_height='24dp';
      layout_gravity='left|center';
      layout_marginLeft='18dp';
      id='Image2';
      ColorFilter=文字;--设置图片着色
    };
    {
      TextView,
      id="text",
      textColor=文字;
      textSize="16sp",
      layout_margin="16dp",
      layout_marginLeft="8dp";
      layout_gravity="center",
    },
  }
  工具=mmpe
  工具[3]=nil
  工具2=mmpqwe

  当前的功能=io.open("/data/data/"..activity.getPackageName().."/"..保存文件..".xml"):read("*a")
  if a then
    o=当前的功能
   else
    当前的功能=string2tab(当前的功能)
  end

  --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
  datas={}


  --循环添加匹配有数据的列表到
  --nj只是一个变量，你可以用其他变量代替
  --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
  --就相当于  for  1,3   do
  function 加载(列表,图标列表)
    for d,工具名称 in pairs(列表) do
      if o==工具名称 then
        icdChecked=true
        目前的长按功能的RadioButton=icd
       else
        icdChecked=false
      end
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      --local 项目编号=(table.find(mmpqwe,工具名称) or table.find(mmpe,工具名称))
      --local 项目编号=图标列表[d]
      table.insert(datas,{text=工具名称,Image2=图标列表[d],TextView图标={Visibility=View.VISIBLE},icd={Checked=icdChecked}})
      if not 图标列表[d] then
        table.insert(datas,{text=工具名称,Image2="png/a",TextView图标={Visibility=View.VISIBLE},icd={Checked=icdChecked}})
      end
    end
  end
  加载(工具2,aw3菜单)
  加载(工具,aw3工具箱)
  --
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,item)

  --将小项目匹配给大list
  list.Adapter=yuxuan_adpqy
  list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      if 目前的长按功能的RadioButton then
        if not b then
          目前的长按功能的RadioButton.Checked=false
        end
      end
      v.Tag.icd.Checked=true
      目前的长按功能的RadioButton=icd
      长按功能=io.open("/data/data/"..activity.getPackageName().."/"..保存文件..".xml"):read("*a")
      if a then
        写入文件("/data/data/"..activity.getPackageName().."/"..保存文件..".xml",工具名称)
       else
        长按功能=string2tab(长按功能)
        长按功能[项目名称]=工具名称
        写入文件("/data/data/"..activity.getPackageName().."/"..保存文件..".xml",dump(长按功能))
      end
  end})
  --[[function 加载(名称)
    for d,工具名称 in pairs(名称) do

      加载单个项目(d,工具名称)
    end
  end
  加载(工具2)
  加载(工具)]]
  文件名称="工具脚本保存"
  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
  d=0
  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
    d=d+1
    加载单个项目(d,t:match("【标题】(.-)【标题】"))
  end


  width,height=getwh(内容ScrollView)
  if height>activity.getHeight()*0.6 then
    --同理设置高度
    linearParams = 内容ScrollView.getLayoutParams()
    linearParams.height =activity.getHeight()*0.6
    内容ScrollView.setLayoutParams(linearParams)
    --控件隐藏
    内容TextViewpaddingTop.setVisibility(View.GONE)
  end
end



function 导入(控件ID,路径,a)

  pop=PopupMenu(activity,控件ID)
  menu=pop.Menu
  menu.add("覆盖当前").onMenuItemClick=function(a)
    书签=""
    主页项目={}
    ChoiceFile("/sdcard/",function(文件路径)
      文件内容=io.open(文件路径):read("*a")
      for t,c in 文件内容:gmatch([[<DT><A(.-)A>]]) do
        链接=t:match([[HREF="(.-)"]])
        标题=t:match([[">(.-)</]])
        内容=获取内容(标题,链接)
        书签=书签..内容
      end
      写入文件("/data/data/"..activity.getPackageName().."/"..路径..".xml",书签)
    end)
  end
  if a then
   else
    menu.add("保留当前").onMenuItemClick=function(a)
      书签=io.open("/data/data/"..activity.getPackageName().."/"..路径..".xml"):read("*a")
      ChoiceFile("/sdcard/",function(文件路径)
        文件内容=io.open(文件路径):read("*a")
        for t,c in 文件内容:gmatch([[<DT><A(.-)A>]]) do
          链接=t:match([[HREF="(.-)"]])
          标题=t:match([[">(.-)</]])
          内容=获取内容(标题,链接)
          书签=书签..内容
        end
        写入文件("/data/data/"..activity.getPackageName().."/"..路径..".xml",书签)
      end)
    end
  end
  pop.show()--显示@音六站长～
end
function ChoiceFile(StartPath,callback)
  --创建ListView作为文件列表
  lv=loadlayout({ListView;
    layout_height='fill';--布局高度
    FastScrollEnabled=true;
    --这里是分割线的意思
    dividerHeight="0";
  })
  --ListView(activity).setFastScrollEnabled(true)
  --创建路径标签
  cp=loadlayout({
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    {
      EditText;
      id="edit2";
      layout_weight="1";
      --paddingRight="6dp";
    },
    {
      TextView;
      --id="edit2";
      Text="跳转";
      id="跳转";
      paddingLeft="12dp";
      paddingRight="6dp";
      layout_height='fill';--布局高度
      gravity="center",--重力居中
      onClick=function()
        SetItem(edit2.Text)
      end
    },
    {
      TextView;
      --id="edit2";
      Text="确定";
      id="确定";
      paddingLeft="6dp";
      paddingRight="12dp";
      layout_height='fill';--布局高度
      gravity="center",--重力居中
      onClick=function()
        callback(edit2.Text)
      end
    },
  })
  lay=LinearLayout(activity).setOrientation(1).addView(cp).addView(lv)

  对话框({
    标题="选择文件",
    点击事件=function()

    end,
    输入框可用=true,
    --对话框布局=lay,
  })
  内容ScrollView外.addView(lay)
  --同理设置高度
  linearParams = 内容ScrollView外.getLayoutParams()
  linearParams.height =activity.getHeight()*0.6
  内容ScrollView外.setLayoutParams(linearParams)
  --控件隐藏
  内容TextViewpaddingTop.setVisibility(View.GONE)
  adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1)
  lv.setAdapter(adp)
  function SetItem(path)
    path=tostring(path)
    adp.clear()--清空适配器
    edit2.Text=tostring(path)--设置当前路径
    if path~="/" then--不是根目录则加上../
      adp.add("../")
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
     else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then--如果是文件夹则
        adp.add(c.Name.."/")
       else--如果是文件则
        adp.add(c.Name)
      end
    end
  end
  lv.onItemClick=function(l,v,p,s)--列表点击事件
    项目=tostring(v.Text)
    if tostring(edit2.Text)=="/" then
      路径=ls[p+1]
     else
      路径=ls[p]
    end

    if 项目=="../" then
      SetItem(File(edit2.Text).getParentFile())
     elseif 路径.isDirectory() then
      SetItem(路径)
     elseif 路径.isFile() then
      callback(tostring(路径))
      关闭对话框a()
    end
  end
  SetItem(StartPath)
  波纹({跳转,
    确定,


  },"方",文字)
end
