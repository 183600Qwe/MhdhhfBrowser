task(1,function()

  --标题,HINT,点击事件,中立按钮,中立按钮点击事件
  function 对话框(返回参数)
    if AWidth<AHeight then
      菜单CardViewWidth =AWidth-dp2px(10)*2
     else
      菜单CardViewWidth =AHeight-dp2px(10)*2
    end
    --对话框
    local InputLayout={
      LinearLayout,
      orientation="vertical",
      layout_width="fill";
      layout_height="fill";
      gravity="bottom|center";
      id='idmlz外';
      {
        FrameLayout,
        layout_width="fill";
        layout_height="fill";
        id='idmlz';
        {
          FrameLayout,
          layout_width="fill";
          layout_height="fill";
          background=菜单背景,
          id='菜单背景FrameLayout';
        };
        {
          CardView;
          Elevation='5dp';
          layout_width=菜单CardViewWidth;
          layout_height='wrap';
          radius='10dp';
          layout_gravity="center";
          id='菜单CardView';
          layout_margin="10dp";
          Focusable=true,
          FocusableInTouchMode=true,
          onClick=function()
          end;
          {
            LinearLayout;
            orientation="vertical";
            id="对话框背景LinearLayout";
            BackgroundColor=背景2;
            layout_width="fill";
            layout_height="fill";
            {
              TextView;
              layout_width="fill";
              id="标题b";
              --  gravity="center";
              textColor=文字;--卡片背景颜色
              layout_height="fill";
              textSize="18sp";
              --onClick=关闭对话框;
              padding="22dp";
              paddingBottom="0dp";
              text=返回参数.标题;
            };
            {
              LinearLayout;
              orientation="vertical";
              layout_width="fill";
              --layout_height="fill";
              id="内容ScrollView外";
              layout_weight="1";
              {
                ScrollView;--线性布局
                layout_width='fill';--布局宽度
                layout_height='wrap';--布局高度
                id='内容ScrollView';--布局高度
                {
                  LinearLayout;
                  orientation="vertical";
                  layout_width="fill";
                  --layout_height="fill";
                  id="内容LinearLayout外";
                  layout_margin="7dp";
                  {
                    LinearLayout;
                    orientation="vertical";
                    layout_width="fill";
                    --layout_height="fill";
                    layout_marginTop="16dp";
                    layout_marginBottom="16dp";
                    id="内容LinearLayout";
                    {
                      EditText;
                      hint=返回参数.HINT;
                      layout_width="fill";
                      layout_gravity="center",
                      id="edit";
                      layout_margin="10dp";
                      layout_marginTop="16dp";
                      layout_marginBottom="20dp";
                      text=返回参数.输入框文本;
                      textColor=文字;
                      textSize="16sp";
                    };
                    {
                      LinearLayout;
                      orientation="vertical";
                      layout_width="fill";
                      layout_height="16dp";
                      id="内容TextViewpaddingTop";
                    };
                    {
                      TextView;
                      layout_width="fill";
                      id="内容TextView";
                      textColor=文字;
                      --layout_height="fill";
                      textSize="16sp";
                      padding="15dp";
                      paddingTop="0";
                      text=返回参数.文本内容;
                      textIsSelectable=true,
                    };
                  };
                };
              };
            };
            {
              FrameLayout;
              layout_width="fill";
              {
                LinearLayout;
                --layout_gravity="end";
                {
                  CardView;--卡片控件
                  id="中立floatbuttonm";
                  --  layout_gravity="right|bottom";
                  CardElevation='0dp';--卡片阴影
                  --adjustViewBounds=true,
                  -- layout_margin="24dp",
                  layout_width='-2';--卡片宽度
                  layout_height='-2';--卡片高
                  radius='4dp';--卡片圆角
                  CardBackgroundColor=0;--卡片背景颜色--#F17F42
                  -- Gravity="center",
                  layout_marginRight="18dp";
                  layout_marginTop="0";
                  layout_marginBottom="18dp";
                  layout_marginLeft="8dp";
                  {
                    TextView;
                    layout_width="fill";
                    id="bu0";
                    gravity="center";
                    text="中立";
                    textColor=文字;--卡片背景颜色--#F17F42
                    layout_height="fill";
                    textSize="14sp";
                    --  onClick=中立按钮点击事件;
                    paddingRight="16dp";
                    paddingLeft="16dp";
                    paddingTop="10dp";
                    paddingBottom="10dp";
                    text=返回参数.中立按钮
                  };
                };
              };
              {
                LinearLayout;
                layout_gravity="end";
                --layout_width="fill";
                {
                  CardView;--卡片控件
                  id="取消floatbuttonm";
                  --  layout_gravity="right|bottom";
                  CardElevation='0dp';--卡片阴影
                  --adjustViewBounds=true,
                  -- layout_margin="24dp",
                  layout_width='-2';--卡片宽度
                  layout_height='-2';--卡片高
                  radius='4dp';--卡片圆角
                  CardBackgroundColor=0;--卡片背景颜色--#F17F42
                  -- Gravity="center",
                  layout_marginRight="18dp";
                  layout_marginTop="0";
                  layout_marginBottom="18dp";
                  {
                    TextView;
                    layout_width="fill";
                    id="bu1";
                    gravity="center";
                    text="取消";
                    textColor=文字;--卡片背景颜色--#F17F42
                    layout_height="fill";
                    textSize="14sp";
                    paddingRight="16dp";
                    paddingLeft="16dp";
                    paddingTop="10dp";
                    paddingBottom="10dp";
                  };
                };
                {
                  CardView;--卡片控件
                  id="确定floatbuttonm";
                  --  layout_gravity="right|bottom";
                  CardElevation='4dp';--卡片阴影
                  --adjustViewBounds=true,
                  -- layout_margin="24dp",
                  layout_width='-2';--卡片宽度
                  layout_height='-2';--卡片高
                  radius='4dp';--卡片圆角
                  CardBackgroundColor=强调色;--卡片背景颜色--#F17F42
                  -- Gravity="center",
                  layout_marginRight="18dp";
                  layout_marginTop="0";
                  layout_marginBottom="18dp";
                  {
                    TextView;
                    layout_width="fill";
                    id="bu2";
                    gravity="center";
                    text="确定";
                    textColor="#ffffff";
                    layout_height="fill";
                    textSize="14sp";
                    --onClick=点击事件;
                    paddingRight="16dp";
                    paddingLeft="16dp";
                    paddingTop="10dp";
                    paddingBottom="10dp";
                  };
                };
              };
            };
          };
        };
      };
    }
    if 返回参数.HINT or 返回参数.输入框可用 then
      popa=弹窗(loadlayout(InputLayout),true)
     else
      popa=弹窗(loadlayout(InputLayout),false)
    end
    --设置动画的属性
    透明动画=AlphaAnimation(0,1)
    透明动画.setDuration(67)--设置动画时间
    透明动画.setFillAfter(true)--设置动画后停留位置
    透明动画.setRepeatCount(0)--设置无限循环
    --绑定动画
    idmlz外.startAnimation(透明动画)

    function 关闭对话框a()
      关闭对话框b=关闭对话框
      页面状态="没有页面"
      --设置动画的属性
      透明动画=AlphaAnimation(1,0)
      透明动画.setDuration(67)--设置动画时间
      透明动画.setFillAfter(true)--设置动画后停留位置
      透明动画.setRepeatCount(0)--设置无限循环
      --绑定动画
      idmlz外.startAnimation(透明动画)
      task(100,function()
        popa.dismiss()
      end)
    end
    关闭对话框b=关闭对话框a
    bu1.onClick=关闭对话框a
    菜单背景FrameLayout.onClick=关闭对话框a
    -- DialogButtonFilter(tDialog,1,io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a"))
    import "android.graphics.PorterDuffColorFilter"
    import "android.graphics.PorterDuff"
    --修改编辑框颜色
    --edit.getBackground().setColorFilter(PorterDuffColorFilter(强调色,PorterDuff.Mode.SRC_ATOP));
    波纹({bu1,bu2,bu0},"方",文字)
    --设置加粗
    bu1.getPaint().setFakeBoldText(true)
    --设置加粗
    标题b.getPaint().setFakeBoldText(true)
    --设置加粗
    bu0.getPaint().setFakeBoldText(true)
    --设置加粗
    bu2.getPaint().setFakeBoldText(true)
    if 返回参数.中立按钮 then
     else
      --控件隐藏
      中立floatbuttonm.setVisibility(View.GONE)
    end
    if 返回参数.HINT then
      edit.onKey=function(_,b)
        if b==4 then
          关闭对话框a()
          --[[elseif b==67 then
      print("删除")]]
         elseif b==66 then
          点击事件=返回参数.点击事件
          点击事件(edit.text)
          关闭对话框a()
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
     else
      --控件隐藏
      edit.setVisibility(View.GONE)
    end
    if 返回参数.文本内容 then
     else
      --控件隐藏
      内容TextView.setVisibility(View.GONE)
    end
    if 返回参数.是否显示取消按钮==false then
      --控件隐藏
      取消floatbuttonm.setVisibility(View.GONE)
    end
    if 返回参数.对话框布局 then
      内容LinearLayout外.addView(返回参数.对话框布局)
      --控件隐藏
      内容LinearLayout.setVisibility(View.GONE)
    end
    bu2.onClick=function()
      点击事件=返回参数.点击事件
      点击事件(edit.text)
      关闭对话框a()
    end
    bu0.onClick=function()
      中立按钮点击事件=返回参数.中立按钮点击事件
      中立按钮点击事件(edit.text)
      if 返回参数.中立按钮 then
       else
        关闭对话框a()
      end
    end
    width,height=getwh(内容ScrollView)
    if height>activity.getHeight()*0.8 then
      --同理设置高度
      linearParams = 内容ScrollView.getLayoutParams()
      linearParams.height =activity.getHeight()*0.8
      内容ScrollView.setLayoutParams(linearParams)
      --控件隐藏
      内容TextViewpaddingTop.setVisibility(View.GONE)
    end
    --控件边框(bu1,dp2px("4"),"#00000000",边框2,dp2px("1.5"))
  end
end)
--例
--[[对话框({
  标题="标题",
  --HINT="HINT",
  点击事件=function()end,
  中立按钮="中立按钮",
  文本内容="飞絮飞花何处是，层冰积雪摧残，疏疏一树五更寒。",
  中立按钮点击事件=function()end,
  是否显示取消按钮=false,
})]]