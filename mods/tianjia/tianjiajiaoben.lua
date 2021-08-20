  mLuaEditortext=""
  --输入对话框
  local InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    layout_width="fill";
    {
      TextView;
      -- colorFilter=0xFFffffff;
      text="标题:";
      textSize="16sp";
      textColor=文字qwe;
      layout_margin="10dp";
      layout_marginBottom="0";
    };
    {
      EditText;
      hint="标题";
      layout_marginTop="0";
      layout_marginBottom="5dp";
      layout_margin="10dp";
      layout_width="fill";
      layout_gravity="center",
      id="标题qwe";
      textSize="16sp";
      textColor=文字;
    };
    {
      TextView;
      -- colorFilter=0xFFffffff;
      text="使用对象:";
      textSize="16sp";
      textColor=文字qwe;
      layout_margin="10dp";
      layout_marginBottom="0";
    };
    {
      EditText;
      hint="链接或域名或*";
      layout_marginTop="0";
      layout_marginBottom="5dp";
      layout_margin="10dp";
      layout_width="fill";
      layout_gravity="center",
      id="使用对象";
      textSize="16sp";
      textColor=文字;
    };
    {
      LinearLayout;
      Elevation='-1';
      layout_width='fill';
      --layout_height='52dp';
      -- radius='8dp';
      id='按钮';

      onClick=function()
        InputLayout2=
        {
          LuaEditor;
          layout_width='fill';--布局宽度
          layout_height=activity.getHeight()/2-dp2px(14);
          id='mLuaEditor';
          text=mLuaEditortext;
        }


        对话框({
          标题="设置执行的Lua代码",
          点击事件=function()
            mLuaEditortext=mLuaEditor.text
          end,
          是否显示取消按钮=true,
          对话框布局=loadlayout(InputLayout2),
          输入框可用=true,
        })
      end,
      {
        TextView;
        -- layout_width='wrap';
        --layout_height='fill';
        --layout_marginLeft='22dp';
        layout_margin='16dp';
        Gravity='left|center';
        textColor=文字;
        text='设置执行的Lua代码';
        id="设置执行的Lua代码TextView",
        textSize='16sp';
      };
    };
    {
      LinearLayout;
      Elevation='-1';
      layout_width='fill';
      --layout_height='52dp';
      -- radius='8dp';
      id='按钮';

      onClick=function()
        对话框({
          标题="设置执行的Js代码",
          点击事件=function(a)
            --print(a)
            mLuaEditortext=mLuaEditortext..[=[
                        加载Js([[]=]..a..[=[]])]=]
          end,
          是否显示取消按钮=true,
          输入框可用=true,
          HINT="Js代码",
        })
      end,
      {
        TextView;
        layout_margin='16dp';
        Gravity='left|center';
        textColor=文字;
        text='设置执行的Js代码';
        id="设置执行的Js代码TextView",
        textSize='16sp';
      };
    };
    {
      LinearLayout;
      Elevation='-1';
      layout_width='fill';
      --layout_height='52dp';
      -- radius='8dp';
      id='按钮';

      onClick=function()
        if 关闭脚本TextView.text=="开启脚本" then
          滑动显示隐藏操作栏="关闭"
          关闭脚本TextView.text='关闭脚本'
         else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
          关闭脚本TextView.text='开启脚本'
        end
      end,
      {
        TextView;
        -- layout_width='wrap';
        --layout_height='fill';
        --layout_marginLeft='22dp';
        layout_margin='16dp';
        Gravity='left|center';
        textColor=文字;
        text='关闭脚本';
        id="关闭脚本TextView",
        textSize='16sp';
      };
    };
  
      {
        TextView;
        layout_margin='16dp';
         textColor=文字qwe;
        text='不要添加拦截广告的脚本';
        id="不要添加拦截广告的脚本提示TextView",
         textSize='22sp';
      };
  };
  if 是否为修改脚本 then
    对话框标题="修改脚本"
   else
    对话框标题="添加脚本"
  end
  对话框({
    标题=对话框标题,
    点击事件=function()
      if 是否为修改脚本 then
        内容2=""
        次数=0
        内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
        for t,c in 内容:gmatch("【项目】(.-)【项目】") do
          次数=次数+1
          if 次数==id then
            if 关闭脚本TextView.text=="开启脚本" then
              滑动显示隐藏操作栏="关闭"
              是否开启脚本='关闭'
             else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
              是否开启脚本='打开'
            end
            内容2=内容2..获取脚本内容(标题qwe.text,mLuaEditortext,是否开启脚本,使用对象.text)
            v.Tag.srct.Text=标题qwe.text
            v.Tag.srct2.Text=打开关闭反转(是否开启脚本)
           else
            local 标题=t:match("【标题】(.-)【标题】")
            local mLuaEditortext=t:match("【内容】(.-)【内容】")
            local 使用对象=t:match("【使用对象】(.-)【使用对象】")
            local 是否开启脚本=t:match("【是否开启脚本】(.-)【是否开启脚本】")
            if 使用对象 then
              内容2=内容2..获取脚本内容(标题,mLuaEditortext,是否开启脚本,使用对象)
            end
          end
        end
        写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容2)

       else
        内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
        if 关闭脚本TextView.text=="开启脚本" then
          滑动显示隐藏操作栏="关闭"
          是否开启脚本='关闭'
         else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
          是否开启脚本='打开'
        end
        写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容..获取脚本内容(标题qwe.text,mLuaEditortext,是否开启脚本,使用对象.text))
      end
    end,
    是否显示取消按钮=true,
    对话框布局=loadlayout(InputLayout),
    输入框可用=true,
  })
不要添加拦截广告的脚本提示TextView.getPaint().setFakeBoldText(true)
InputLayout=nil
