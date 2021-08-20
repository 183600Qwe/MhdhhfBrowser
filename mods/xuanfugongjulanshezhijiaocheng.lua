local InputLayout={
  LinearLayout;
  Orientation='vertical';--布局方向
  layout_width="fill";
  {
    LinearLayout;
    Orientation='vertical';--布局方向
    layout_width="fill";
    layout_margin='18dp';
    backgroundDrawable=边框(圆角大小,"#00000000",边框2,dp2px("1.5"));
    {
      TextView;
      textColor=一般强调色;
      text='悬浮工具栏设置';
      --Typeface=字体("Product");
      layout_margin='22dp';
      layout_marginBottom='0dp';
      --id='颜色设置提示文字';
    };
    {
      LinearLayout;
      Orientation='vertical';--布局方向
      layout_width="fill";
      id='滑动菜单设置';
    };
  };
  {
    LinearLayout;
    Orientation='vertical';--布局方向
    layout_width="fill";
    layout_margin='18dp';
    backgroundDrawable=边框(圆角大小,"#00000000",边框2,dp2px("1.5"));
    layout_marginTop="0";
    {
      TextView;
      textColor=一般强调色;
      text='悬浮工具栏说明';
      --Typeface=字体("Product");
      layout_margin='22dp';
      layout_marginBottom='0dp';
      --id='颜色设置提示文字';
    };
    {
      TextView;
      layout_width="fill";
      id="内容TextView";
      textColor=文字;
      layout_height="fill";
      textSize="16sp";
      padding="16dp";
      paddingLeft='22dp';
      --paddingTop="0";
      text=[[1.把手按在右边的第1个小条上，就会显示主页项目，然后让手指在想用的功能松开，就可以访问那个主页项目的网页点击打开书签长按添加书签或主页项目。
2.右边的第2个小条像上面那样操作可可以使用常用工具，常用工具可以到设置里面的操作设置中的滑动菜单设置中的工具设置来更改。点击或长按会有像上面那样的效果。
3.点击右边的第3个按钮，可以打开菜单长按可以打开工具箱，下滑可以搜索。
4.点击右边的第4个按钮可以切换窗口，长按可新建窗口。
这几个按钮往右滑可以返回上一个网页。]];
      textIsSelectable=true,
    };
  };
};
local InputLayout=loadlayout(InputLayout)
local function 滑动菜单按钮点击事件(文本,控件ID,文本控件ID,d)
  if 文本=="打开滑动菜单所需的按钮显示位置设置" then
    pop=PopupMenu(activity,控件ID)
    menu=pop.Menu
    menu.add("center|right").onMenuItemClick=function(a)
      写入文件("/data/data/"..activity.getPackageName().."/打开滑动菜单所需的按钮显示位置.xml","center|right")
    end
    menu.add("center|left").onMenuItemClick=function(a)
      写入文件("/data/data/"..activity.getPackageName().."/打开滑动菜单所需的按钮显示位置.xml","center|left")
    end
    pop.show()--显示@音六站长～
   elseif 文本=="工具设置" then
    if 文件夹内容弹窗是否正在显示 then
      文件夹内容弹窗是否正在显示=false
      pop.dismiss()
     else
      文件夹内容弹窗是否正在显示=true
      --PopupWindow(自己写的菜单)布局
      Popup_layout={
        LinearLayout;
        {
          CardView;
          CardElevation="6dp";
          CardBackgroundColor=backgroundc;
          Radius="2dp";
          layout_width="-1";
          layout_height="-1";
          layout_margin="18dp";
          {
            ScrollView;--线性布局
            layout_width='fill';--布局宽度
            layout_height='wrap';--布局高度
            id='scrollView';--布局高度
            {
              LinearLayout;
              Orientation='vertical';--布局方向
              layout_width="-1";
              id="工具设置列表LinearLayout";

              {
                LinearLayout;
                layout_gravity='right|center';
                id="添加工具";
                onClick=function(v)
                  滑动菜单工具=io.open("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml"):read("*a")
                  if 滑动菜单工具=="" or 滑动菜单工具==nil then
                    滑动菜单工具={}
                   else
                    滑动菜单工具=string2tab(滑动菜单工具)
                  end

                  显示选择功能对话框(#滑动菜单工具+1,false,"滑动菜单工具",true)
                end,
                {
                  ImageView;
                  src="png/fhvpfxgj.png";
                  layout_width='22dp';
                  layout_height='22dp';
                  layout_margin='10dp';
                  layout_marginLeft='18dp';
                  id='Image2';
                  ColorFilter=转0x(一般强调色);--设置图片着色
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
      pop.setWidth(-1)
      pop.setHeight(-2)

      pop.setOutsideTouchable(true)
      pop.setBackgroundDrawable(ColorDrawable(0x00000000))

      pop.onDismiss=function()
        --消失事件
        --文件夹内容弹窗是否正在显示=false
      end

      --PopupWindow列表项布局
      Popup_list_item={
        LinearLayout,
        orientation="horizontal",
        layout_width="fill",
        id="列表按钮",
        {
          ImageView;
          --src=图标;
          layout_width='22dp';
          layout_height='22dp';
          layout_gravity='left|center';
          layout_margin='10dp';
          layout_marginLeft='18dp';
          id='Image2';
          ColorFilter=转0x(一般强调色);--设置图片着色
        };
        {
          TextView,
          id="popadp_text",
          textColor=文字;
          textSize="14sp",
          layout_margin="16dp",
          --layout_width="fill",
          --  layout_width="304dp",
          --textIsSelectable=true,
          layout_marginLeft="8dp";
          layout_gravity="center",
        },
      }
      --PopupWindow列表适配器
      --print(dump(文件夹内容))
      内容=io.open("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml"):read("*a")
      --print(内容)
      function 菜单(s,v,i)

        local pop=PopupMenu(activity,v)
        menu=pop.Menu

        menu.add("删除").onMenuItemClick=function(a)
          --内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
          --内容=string.gsub(内容,获取内容(view.Tag.text.Text,bookId2[view.Tag.text.Text]),"")

          滑动菜单工具=io.open("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml"):read("*a")
          if 滑动菜单工具=="" or 滑动菜单工具==nil then
            滑动菜单工具={}
           else
            滑动菜单工具=string2tab(滑动菜单工具)
          end
          滑动菜单工具[i]=nil
          --table.remove(滑动菜单工具,i)
          滑动菜单工具=dump(滑动菜单工具)
          写入文件("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml",滑动菜单工具)



        end
        pop.show()--显示
      end
      if 内容=="" or 内容==nil then
       else
        内容=string2tab(内容)
        次数=0
        for d,文件夹内容 in pairs(内容) do
          次数=次数+1
          --table.insert(title2,t:match("【标题】(.-)【标题】"))
          for d,文件夹内容2 in pairs(mmpqwe) do

            if 文件夹内容2==文件夹内容 then
              状态=true
              工具设置列表LinearLayout.addView(loadlayout(Popup_list_item))
              popadp_text.Text=文件夹内容
              --设置的图片也可以输入路径
              Image2.setImageBitmap(loadbitmap(aw3菜单[d]))
              local 次数2=次数
              列表按钮.onClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
              列表按钮.onLongClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
            end
          end
          for d,文件夹内容2 in pairs(mmpe) do


            if 文件夹内容2==文件夹内容 then
              状态=true
              工具设置列表LinearLayout.addView(loadlayout(Popup_list_item))
              popadp_text.Text=文件夹内容
              --设置的图片也可以输入路径
              Image2.setImageBitmap(loadbitmap(aw3工具箱[d]))



              local 次数2=次数
              列表按钮.onClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
              列表按钮.onLongClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
            end
          end
          if 状态 then
           else
            工具设置列表LinearLayout.addView(loadlayout(Popup_list_item))
            popadp_text.Text=文件夹内容
            --设置的图片也可以输入路径
            --Image2.setImageBitmap(loadbitmap(aw3工具箱[d]))



            local 次数2=次数
            列表按钮.onClick=function(v)
              菜单(文件夹内容,v,次数2)
            end
            列表按钮.onLongClick=function(v)
              菜单(文件夹内容,v,次数2)
            end
          end
          状态=false
        end
      end
      pop.showAsDropDown(控件ID)
    end
   else
    if io.open("/data/data/"..activity.getPackageName().."/"..文件列表[d]..".xml"):read("*a")=="打开" then
      写入文件("/data/data/"..activity.getPackageName().."/"..文件列表[d]..".xml","关闭")
      --加载列表()
     else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
      写入文件("/data/data/"..activity.getPackageName().."/"..文件列表[d]..".xml","打开")
      --加载列表()
    end
    滑动菜单设置.removeAllViews()
    刷新title2()
  end
end
local itemc=
{
  FrameLayout;
  Elevation='-1';
  layout_width='fill';
  id='按钮LinearLayout';
  {
    TextView;
    layout_marginLeft='22dp';
    layout_margin='16dp';
    Gravity='left|center';
    textColor=文字;
    id="srct",
    textSize='16sp';
    layout_height='fill';
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
};
文件列表={"滑动菜单模式",
  "打开滑动菜单所需的按钮距离屏幕右侧边缘的距离",
  nil,
  "常用网页滑动菜单",
  "工具滑动菜单",
  "菜单滑动菜单",
  nil,
  "多窗口滑动菜单",
}
function 刷新title2()
  title2={'悬浮工具栏模式',
    '打开滑动菜单所需的按钮距离屏幕右侧边缘的距离',
    "打开滑动菜单所需的按钮显示位置设置",
    '常用网页',
    '工具',
    '菜单',
    '工具设置',
    '多窗口',
  }
  for d in pairs(title2) do
    滑动菜单设置.addView(loadlayout(itemc))
    srct.Text=tostring(title2[d])
    波纹({按钮LinearLayout,
    },"方",文字)
    local 按钮LinearLayout=按钮LinearLayout
    local srct=srct
    按钮LinearLayout.onClick=function(a)
      滑动菜单按钮点击事件(title2[d],按钮LinearLayout,srct,d)
    end
    if 文件列表[d] then
      local a=打开关闭转TF带读取文件(文件列表[d])
      mSwitch.Checked=a
      if a then
        Switch颜色=Color.parseColor(一般强调色)
       else
        Switch颜色=开关关闭
      end
      if a then
        --修改Switch颜色
        mSwitch.ThumbDrawable.setColorFilter(PorterDuffColorFilter(Switch颜色,PorterDuff.Mode.SRC_ATOP));
        mSwitch.TrackDrawable.setColorFilter(PorterDuffColorFilter(Switch颜色,PorterDuff.Mode.SRC_ATOP))
      end
     else
      隐藏控件(mSwitch)
    end
  end
end
刷新title2()
对话框({
  标题="悬浮工具栏设置与说明",
  点击事件=function()
  end,
  是否显示取消按钮=false,
  对话框布局=InputLayout,
})
