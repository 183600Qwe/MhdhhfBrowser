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
   控件ID2=控件ID
    文件名称="滑动菜单工具"
              运行代码含读取文件("mods/tianjiagongju")
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
