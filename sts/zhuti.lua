--import "android.webkit.*"
function 设置主题(一般强调色2)
  写入文件("/data/data/"..activity.getPackageName().."/一般强调色.xml",一般强调色2)
  写入文件("/data/data/"..activity.getPackageName().."/标题栏色.xml",一般强调色2)
  写入文件("/data/data/"..activity.getPackageName().."/标题栏组件是否暗色.xml","浅色")
end
a={}
st=(loadlayout("layout/st2layout",a))
a.标题栏承载器.addView(loadlayout(获取标题栏("主题",a.设置背景外,"主题")))--添加控件
主页.addView(st)--添加控件
页面列表["主题"]=true
item={
  FrameLayout,
  layout_width="fill",
  layout_height='56dp';
  {
    LinearLayout;
    layout_width='fill';
    layout_height='fill';
    -- radius='8dp';
    {
      CardView,
      layout_width="28dp",
      layout_height="28dp",
      radius="14dp";
      layout_gravity='center|left';
      Elevation="0dp";
      id='mCardView';
      layout_marginLeft="18dp";
    };
    {
      TextView;
      -- layout_width='wrap';
      layout_height='fill';
      layout_marginLeft='22dp';
      Gravity='left|center';
      textColor=文字;
      id='srct';
      textSize='16sp';
      layout_weight="1";
      layout_marginRight='52dp';
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
};
--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了有数据的列表
CardViewbackground={
  0xff939393,
  0xFF33A7AA,
  0xFF6FAF77,
  0xFF8EC6C0,
  0xFF009688,
  0xFF2979FF,
  0xFF5D99FF,
  0xFFF44236,
  0xfffa7298,
  0xffFFEB3B,--#FDD835
}
background={
  "#ff939393",
  "#FF33A7AA",
  "#FF6FAF77",
  "#FF8EC6C0",
  "#FF009688",
  "#FF2979FF",
  "#FF5D99FF",
  "#FFF44236",
  "#fffa7298",
  "#ffFFEB3B",--#FDD835
}
aw3={"灰色","青色","绿色","浅绿","鸭绿","蓝色","浅蓝","红色","粉色","黄色"}
mmp={}

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw3 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{
    srct=aw3[nj],
    mCardView={
      backgroundColor=CardViewbackground[nj],
      Visibility=View.VISIBLE,
    },
    mSwitch={
      Visibility=View.GONE,
    },
  })
end

aw32={
  "自定义",
  "控件阴影",
  "暗色模式",
  "暗色模式跟随系统",
  --[["标题栏彩色背景",]]
}
记录文件的列表={
  nil,
  "控件阴影",
  "暗色模式",
  "暗色模式跟随系统",
}
for nj=1,#aw32 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  if aw32[nj]=="自定义" then
    mVisibility=View.GONE
    mChecked=true
   else
    mVisibility=View.VISIBLE
    mChecked=打开关闭转TF带读取文件(记录文件的列表[nj])
  end
  table.insert(datas,{
    srct=aw32[nj],
    mCardView={
      backgroundColor=0,
      Visibility=View.GONE,
    },
    mSwitch={
      Visibility=mVisibility,
      Checked=mChecked
    },
  })
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,item)

--将小项目匹配给大list
a.设置list.Adapter=yuxuan_adpqy
a.设置list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    if id<=#aw3 then
      设置主题(background[id])
     elseif 记录文件的列表[id-#aw3] then
      if io.open("/data/data/"..activity.getPackageName().."/"..记录文件的列表[id-#aw3]..".xml"):read("*a")=="打开" then
        写入文件("/data/data/"..activity.getPackageName().."/"..记录文件的列表[id-#aw3]..".xml","关闭")
        --加载列表()
        v.Tag.mSwitch.Checked=false
       else--if io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")=="关闭" then
        写入文件("/data/data/"..activity.getPackageName().."/"..记录文件的列表[id-#aw3]..".xml","打开")
        --加载列表()
        v.Tag.mSwitch.Checked=true
      end
     elseif aw32[id-#aw3]=="自定义" then
      --输入对话框
      InputLayout={
        LinearLayout;
        orientation="vertical";
        --Focusable=true,
        --FocusableInTouchMode=true,
        layout_width="fill";
        id="mLinearLayout";
        {
          CheckBox;
          id="标题栏组件是否暗色CheckBox";
          layout_height='fill';
          layout_margin="10dp";
          text='标题栏组件暗色';
          layout_marginBottom="0dp";
          layout_width="fill";
          Checked=false;
        };
      };
      对话框({
        标题="自定义",
        点击事件=function()
          写入文件("/data/data/"..activity.getPackageName().."/一般强调色.xml",一般强调色.text)
          写入文件("/data/data/"..activity.getPackageName().."/标题栏色.xml",标题栏色.text)
          if 标题栏组件是否暗色CheckBox.Checked then
            写入文件("/data/data/"..activity.getPackageName().."/标题栏组件是否暗色.xml","暗色")
           else
            写入文件("/data/data/"..activity.getPackageName().."/标题栏组件是否暗色.xml","浅色")
          end
        end,
        是否显示取消按钮=true,
        输入框可用=true,
        对话框布局=loadlayout(InputLayout),
      })
      项目列表={
        {"一般强调色",io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a")},
        {"标题栏色",io.open("/data/data/"..activity.getPackageName().."/标题栏色.xml"):read("*a")},
      }
      b={
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        {
          TextView;
          -- colorFilter=0xFFffffff;
          textSize="16sp";
          textColor=文字qwe;
          layout_margin="10dp";
          layout_marginBottom="0";
        };
        {
          LinearLayout;
          orientation="horizontal";
          layout_width="fill";
          {
            EditText;
            layout_marginTop="0";
            --layout_marginBottom="22dp";
            layout_margin="10dp";
            layout_weight="1";
            textSize="16sp";
            textColor=文字;
          };
          {
            CardView,
            layout_width="28dp",
            layout_height="28dp",
            radius="14dp";
            layout_gravity='center|left';
            Elevation="0dp";
            id='mCardView';
            --layout_marginBottom="22dp";
            layout_margin="10dp";
          };
        };
      };
      for _,内容 in pairs(项目列表) do
        b[2].text=内容[1].."："
        b[3][2].hint=内容[1]
        b[3][2].text=内容[2]
        b[3][2].id=内容[1]
        b[3][3].backgroundColor=内容[2]
        mLinearLayout.addView(loadlayout(b))
      end
    end
end})