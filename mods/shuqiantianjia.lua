function 保存收藏(标题,链接,是否强制显示链接输入框)
  function 显示添加书签对话框(是否强制显示链接输入框)
    --输入对话框
    InputLayout={
      LinearLayout;
      orientation="vertical";
      Focusable=true,
      FocusableInTouchMode=true,
      layout_width="fill";
      id="mLinearLayout";
      {
        LinearLayout;
        layout_width="fill";
        orientation="vertical";
        id="mLinearLayout2";
      };
      {
        LinearLayout,--线性布局
        orientation="horizontal",--布局方向
        layout_width="fill",--布局宽度
        {
          CheckBox;
          id="记录阅读位置CheckBox";
          layout_margin="10dp";
          text='记录阅读位置';
          Checked=true;
        };
        {
          CheckBox;
          id="可视部分截图CheckBox";
          layout_margin="10dp";
          text='可视部分截图';
          Checked=false;
        };
      };
    };
    对话框({
      标题="添加书签",
      --[[点击事件=function()
        内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
        写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容..获取内容(标题qwe.text,链接qwe.text))
        if 记录阅读位置CheckBox.Checked then
          for t,c in 内容:gmatch("【项目】(.-)【项目】") do
            c2=c
          end
          local 内容=string2tab(io.open("/data/data/"..activity.getPackageName().."/阅读位置储存.xml"):read("*a"))
          内容[c2+1]=view.ScrollY
          写入文件("/data/data/"..activity.getPackageName().."/阅读位置储存.xml",dump(内容))
        end
        adapterData({标题qwe.text},{链接qwe.text})
      end,]]
      是否显示取消按钮=true,
      输入框可用=true,
    })
    内容ScrollView外.addView(loadlayout(InputLayout))
    项目列表={
      {"标题",标题,"标题qwe"},
      {"链接",链接,"链接qwe"},
    }
    if not 读取记录项目("书签添加器在已自动填充链接时显示链接") and not 是否强制显示链接输入框 then
      table.remove(项目列表,2)
    end
     a={
      LinearLayout;
      layout_width="fill";
      {
        EditText;
        layout_marginTop="0";
        layout_marginBottom="0";
        layout_margin="10dp";
        layout_width="fill";
        layout_gravity="center",
        textSize="16sp";
        textColor=文字;
      };
    };
    for _,内容 in pairs(项目列表) do
      a[2].hint=内容[1]
      a[2].id=内容[3]
      a[2].Text=内容[2]
      mLinearLayout2.addView(loadlayout(a))
    end
    mLinearLayout.addView(选择保存目录弹窗(nil,nil,nil,标题,链接))
    隐藏控件(内容ScrollView)
  end
  显示添加书签对话框(是否强制显示链接输入框)
  --  showDataDialog(名称,名称)
end
--print(io.open("/data/data/"..activity.getPackageName().."/阅读位置储存.xml"):read("*a"))
收藏分类={
  folder=0,
  homepage=1,
  root=2,
}
function 选择保存目录弹窗(主页项目按钮点击事件,文件夹按钮点击事件,是否在文件夹,标题,链接,书签根目录按钮点击事件)
  local InputLayout=
  {
    LinearLayout,
    orientation="vertical",--布局方向
    layout_width="fill",
    id='选择保存目录列表';--布局高度
    layout_height="fill",
    {
      ListView,
      id="推荐保存目录list",
      fastScrollEnabled=true;
      layout_marginTop="0dp",
      layout_marginBottom="0";
      --items={"3","2","5","5","2","7","3","2"},
      dividerHeight="0";
      layout_width="fill",
      --DividerHeight=true,--设置无隔断线
      layout_margin='9dp';
    },
    {
      ListView,
      id="选择保存目录list",
      fastScrollEnabled=true;
      layout_marginTop="0dp",
      --items={"3","2","5","5","2","7","3","2"},
      dividerHeight="0";
      layout_width="fill",
      --DividerHeight=true,--设置无隔断线
      layout_height="fill",
    },
  };
  InputLayout=loadlayout(InputLayout)
  --同理设置高度
  linearParams = 内容ScrollView外.getLayoutParams()
  linearParams.height =activity.getHeight()*0.6
  内容ScrollView外.setLayoutParams(linearParams)
  --控件隐藏
  内容TextViewpaddingTop.setVisibility(View.GONE)
  if 按下取消之后是否显示添加书签对话框 then
    按下取消之后是否显示添加书签对话框=false
    bu1.onClick=function()
      关闭对话框a()
      task(100,function()
        显示添加书签对话框()
      end)
    end
  end
  隐藏控件(确定floatbuttonm)

  function 浏览器主页()
    table.insert(adpd,{
      text={
        Text="浏览器主页",
      },
      列表按钮较暗色背景={
        Visibility=View.GONE,
      },
      列表按钮左距LinearLayout={
        Visibility=View.GONE,
      },
      Imagea={
        Visibility=View.GONE,
      },
      Image2={
        src="png/home_black.png",
        ColorFilter=文字,
      }
    })
  end
  function 书签根目录()
    table.insert(adpd,{
      text={
        Text="书签根目录",
      },
      列表按钮较暗色背景={
        Visibility=View.GONE,
      },
      列表按钮左距LinearLayout={
        Visibility=View.GONE,
      },
      Imagea={
        Visibility=View.GONE,
      },
      Image2={
        src="png/fglkg.png",
        ColorFilter=文字,
      }
    })
  end
  function 文件夹(i)
    table.insert(adpd,{
      text={
        Text=tostring(文件夹列表[i][1]),
      },
      列表按钮较暗色背景={
        Visibility=View.GONE,
      },
      列表按钮左距LinearLayout={
        Visibility=View.GONE,
      },
      Imagea={
        Visibility=View.GONE,
      },
      Image2={
        src="png/folder_open_black.png",
        ColorFilter=0xFFFFCA6A,
      }
    })
  end
  带边框item={
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    {
      LinearLayout,
      orientation="horizontal",
      layout_width="fill",
      id="列表按钮",
      layout_margin='9dp';
      layout_marginTop='0';
      layout_marginBottom="0";
      backgroundDrawable=边框(圆角大小,"#00000000",边框2,dp2px("1.5"));
      {
        LinearLayout,
        orientation="horizontal",
        layout_width="fill",
        id="列表按钮内",
        {
          ImageView;
          layout_width='22dp';
          layout_height='22dp';
          layout_gravity='left|center';
          layout_margin='10dp';
          layout_marginLeft='18dp';
          id='Image2';
          Alpha=0.5,
        };
        {
          TextView,
          id="text",
          textColor=文字;
          textSize="14sp",
          layout_margin="16dp",
          layout_marginLeft="8dp";
          layout_gravity="center",
        },
      },
    },
  }上次添加到的地方="浏览器主页"
  if 上次添加到的地方 then
    adpd={}
    if 上次添加到的地方=="浏览器主页" then
      浏览器主页()
     elseif 上次添加到的地方=="书签根目录" then
      书签根目录()
     else
      文件夹(上次添加到的地方)
    end
    items=LuaAdapter(this,adpd,带边框item)
    推荐保存目录list.Adapter=items
  end
  adpd={}
  浏览器主页()
  书签根目录()
  for i=1,#文件夹列表 do
    文件夹(i)
  end
  local items=LuaAdapter(this,adpd,item)
  选择保存目录list.Adapter=items
  monItemClick=function(parent,v,pos,id)
    if 可视部分截图CheckBox.Checked then
      if 文件是否存在(picture2..view.getTitle()..".png")==false then
      图片编号=0
        savePicture(picture2..view.getTitle()..".png",getViewBitmap(view),false,true)
       else
        图片编号=1
        while 文件是否存在(websave..view.getTitle().."("..图片编号..").png") do
          图片编号=图片编号+1
        end
        savePicture(picture2..view.getTitle().."("..图片编号..").png",getViewBitmap(view),false,true)
      end
    end
    if v.Tag.text.Text=="浏览器主页" then
      添加至主页(标题,链接,记录阅读位置CheckBox.Checked)
     elseif v.Tag.text.Text=="书签根目录" then
      内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
      function 添加(标题,链接)
        if 可视部分截图CheckBox.Checked then
          内容=内容..获取内容(标题,链接,图片编号)
         else
          内容=内容..获取内容(标题,链接)
        end
      end
      if 书签根目录按钮点击事件 then
        书签根目录按钮点击事件(添加)
       else
        添加(标题,链接)
      end
      写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
      if 记录阅读位置CheckBox.Checked then
        a=0
        for t,c in 内容:gmatch("【项目】(.-)【项目】") do
          a=a+1
        end
        保存当前阅读位置(收藏分类.root,a+1,view.ScrollY)
      end
      adapterData({标题},{链接})
      上次添加到的地方=v.Tag.text.Text
     else
      上次添加到的地方=v
      local 文件名称="书签保存"
      local id=id-2
      文件夹列表2=文件夹列表
      此文件夹项目列表=文件夹列表2[id]
      --此文件夹项目列表[1]=nil
      function 添加(标题,链接)
        if 可视部分截图CheckBox.Checked then
          table.insert(此文件夹项目列表[2],{标题,链接,图片编号})
         else
          table.insert(此文件夹项目列表[2],{标题,链接,图片编号})
        end
      end
      if 文件夹按钮点击事件 then
        文件夹按钮点击事件(添加)
       else
        添加(标题,链接)
      end
      文件夹列表2[id]=此文件夹项目列表
      内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
      内容2=""
      for t,c in 内容:gmatch("【项目】(.-)【项目】") do
        标题=t:match("【标题】(.-)【标题】")
        链接=t:match("【链接】(.-)【链接】")
        内容2=内容2..获取内容(标题,链接)
      end
      内容2=内容2.."【文件夹列表】"..dump(文件夹列表2).."【文件夹列表】"
      写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容2)
      if 收藏分类.folder then
        保存当前阅读位置(收藏分类.folder,#(此文件夹项目列表[2]),view.ScrollY,id)
      end
    end
    关闭对话框a()
  end
  选择保存目录list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=monItemClick})
  推荐保存目录list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=monItemClick})
  return InputLayout
end
function 保存当前阅读位置(当前收藏分类,id,值,文件夹id)
  内容=string2tab(io.open("/data/data/"..activity.getPackageName().."/阅读位置储存.xml"):read("*a"))
  if 当前收藏分类==收藏分类.folder then
    a=内容["folder"]
    a[文件夹id]=a[文件夹id] or {}
    a[文件夹id][id]=值
   elseif 当前收藏分类==收藏分类.root then
    内容[id]=值
   elseif 当前收藏分类==收藏分类.homepage then
    b=内容["homepage"]
    b[id]=值
  end
  写入文件("/data/data/"..activity.getPackageName().."/阅读位置储存.xml",dump(内容))
  当前收藏分类=当前收藏分类
end
function 新建文件夹(是否在选择保存目录列表添加)
  对话框({
    标题="新建文件夹",
    HINT="文件夹名称",
    点击事件=function(text)
      文件夹列表2=文件夹列表
      table.insert(文件夹列表2,{text,{}})
      内容2=""
      刷新书签()
      for k,v in ipairs(title2) do --遍历
        标题=title2[k]
        链接=bookId2[k]
        内容2=内容2..获取内容(标题,链接)
      end
      内容2=内容2.."【文件夹列表】"..dump(文件夹列表2).."【文件夹列表】"
      --print(内容)
      写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容2)
      文件夹列表5={}
      文件夹列表5[text]={}
      adapterData({},{},文件夹列表5)
      if 是否在选择保存目录列表添加 then
        添加文件夹类型的项目(text)
      end
    end,
    是否显示取消按钮=true,
    输入框文本=当前搜索的内容 or "新建文件夹"
  })
end
function 添加至主页(标题,链接,是否记录阅读位置)
  主页项目=io.open("/data/data/"..activity.getPackageName().."/主页项目.xml"):read("*a")
  function 添加(标题,链接)
    if 可视部分截图CheckBox.Checked then
      主页项目=主页项目..获取内容(标题,链接,图片编号)
     else
      主页项目=主页项目..获取内容(标题,链接)
    end
  end
  if 主页项目按钮点击事件 then
    主页项目按钮点击事件(添加)
   else
    添加(标题,链接)
  end
  写入文件("/data/data/"..activity.getPackageName().."/主页项目.xml",主页项目)
  --刷新主页项目("网页收藏")
import "com.androlua.LuaAdapter"
  table.insert(list3.Adapter.Data,主页项目项目列表(标题,链接))
  上次添加到的地方="主页项目"
  if 是否记录阅读位置 then
    a=0
    for t,c in 主页项目:gmatch("【项目】(.-)【项目】") do
      a=a+1
    end
    保存当前阅读位置(收藏分类.homepage,a,view.ScrollY)
  end
end