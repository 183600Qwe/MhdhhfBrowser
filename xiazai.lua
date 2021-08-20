require "import"
import "android.widget.*"
import "android.view.*"
import "com.michael.NoScrollListView"--导入可以嵌套在Scrollview里的列表
import "com.nirenr.Color"
import "android.graphics.Color"
--标题
activity.setTitle('下载管理')
import "func"

Page2=0
滑动窗体状态=0
--import "huancun"
--import "android.webkit.*"
activity.ActionBar.show()

夜间模式=io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")
if 夜间模式=="打开" then
  背景=0xFF191919
  背景2="#FF191919"
  卡片="#FF212121"
  底栏="#FF191919"
  文字=0xFFffffff
  文字123=0x8bffffff
  activity.setTheme(android.R.style.Theme_Material)
 else
  背景=0xFFFAFAFA
  卡片="#FFF0F0F0"
  底栏="#FFffffff"
  文字=0xff333333
  文字123=0x8e000000
end
function 设置主题(一般强调色2)
  写入文件("/data/data/"..activity.getPackageName().."/一般强调色.xml",一般强调色2)
end
强调色=io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a")
function 加载内容()
  layout={
    LinearLayout;
    layout_height="fill";
    orientation="vertical";
    layout_width="fill";
    {
      LinearLayout;
      layout_height="5dp";
      layout_width="fill";
      background="#00ffffff";
    },
    {
      LinearLayout;
      layout_height="wrap";
      layout_width="fill";
      orientation="horizontal";
      gravity="center";
      {
        TextView;
        textSize="11sp";
        text="保存路径:/storage/emulated/0/Download/";
        gravity="center";
        id="保存路径";
        layout_width="fill";
        layout_marginLeft="16dp",
        layout_marginRight="16dp",
        --textStyle="bold",
      };
    },
    --[[{
    TextView;
    text="";
    textSize="15";
    textColor="#FF000000";
    layout_width="fill";
    layout_height="2dp";
    backgroundColor="#FFF3F3F3";
  };]]
    {
      FrameLayout;--滑动窗体
      id="slide";
      -- layout_height="fill",
      layout_weight="1";
      layout_height="-1";
      layout_width="-1";

      {
        ScrollView,
        layout_width="fill",
        layout_height="wrap",
        FillViewport=true,
        OverScrollMode=1,
        id='正在下载';
        {--滚动布局下必须有线性竖直布局
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          background=背景2;
          {
            TextView;
            textColor=一般强调色;
            text='正在下载';
            --Typeface=字体("Product");
            layout_margin='8dp';
            layout_marginLeft="18dp";
            --id='颜色设置提示文字';
          };
          {
            NoScrollListView;
            layout_height="fill";
            id="正在下载list";
            layout_width="fill";
            dividerHeight="0";
          };
          --[[  {
          NoScrollListView;
          layout_height="fill";
          id="文件list";
          layout_width="fill";
          dividerHeight="0";
        };]]
        };
      };
      {
        ScrollView,
        layout_width="fill",
        layout_height="wrap",
        FillViewport=true,
        OverScrollMode=1,
        id='已下载文件';
        {--滚动布局下必须有线性竖直布局
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          background=背景2;
          {
            TextView;
            textColor=一般强调色;
            text='已下载文件';
            --Typeface=字体("Product");
            layout_margin='8dp';
            layout_marginLeft="18dp";
            --id='颜色设置提示文字';
          };
          {
            NoScrollListView;
            layout_height="fill";
            id="文件list";
            layout_width="fill";
            dividerHeight="0";
          };
        };
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      layout_height="56dp";
      background=底栏,
      layout_gravity="center";
      orientation="horizontal";
      Elevation="10dp";
      layout_marginBottom="0dp";
      layout_gravity="center|bottom";
      id="底栏2";
      {
        LinearLayout;
        -- layout_width=w/4;
        layout_weight="1";
        layout_height="fill";
        background="#00000000";
        {
          LinearLayout;
          id="window0";
          gravity="center";
          orientation="vertical",
          layout_width="fill";
          layout_height="fill";
          onClick=function()
            --控件可视
            正在下载.setVisibility(View.VISIBLE)
            --控件不可视
            已下载文件.setVisibility(View.INVISIBLE)
            收藏.setColorFilter(Color.parseColor(强调色))--给图标上色
            工具.setColorFilter(文字123)--给图标上色
            Page2=0
          end,
          {
            ImageView;
            src="png/gnjs2x.png";
            layout_height="28dp";
            id="收藏";
            --padding="10dp";
            layout_width="28dp";
            layout_margin="0dp";
            ColorFilter=强调色;--给图标上色
            --找不到图标的老铁可以去酷安了解一下IconsLua+
            layout_gravity="center",
          };
        };
      };
      {
        LinearLayout;
        -- layout_width=w/4;
        layout_weight="1";
        layout_height="fill";
        background="#00000000";
        {
          LinearLayout;
          id="window1";
          gravity="center";
          orientation="vertical",
          layout_width="fill";
          layout_height="fill";
          onClick=function()
            --控件可视
            已下载文件.setVisibility(View.VISIBLE)
            --控件不可视
            正在下载.setVisibility(View.INVISIBLE)
            收藏.setColorFilter(文字123)--给图标上色
            工具.setColorFilter(Color.parseColor(强调色))--给图标上色
            Page2=1
          end,
          {
            ImageView;
            src="png/folder_open_black.png";
            layout_height="28dp";
            id="工具";
            --padding="10dp";
            layout_width="28dp";
            layout_margin="0dp";
            ColorFilter=文字123;--给图标上色
            --找不到图标的老铁可以去酷安了解一下IconsLua+
            layout_gravity="center",
          };
        };
      };
    };
  };



  activity.setContentView(loadlayout(layout))
  --控件可视
  正在下载.setVisibility(View.VISIBLE)
  --控件不可视
  已下载文件.setVisibility(View.INVISIBLE)

  import "android.content.res.ColorStateList"
  function 波纹(id,lx,color)
    xpcall(function()
      ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
      ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
      for index,content in ipairs(id) do
        if lx=="圆" then
          content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
        end
        if lx=="方" then
          content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
        end
        -- content.onTouchListener=点击监听--动画效果
      end
    end,function(e)end)
  end
  波纹({window0,
    window1,
    导出书签,
  },"方",文字)--0xFF7F7F7F
  itemcc={
    LinearLayout;
    layout_width="fill";
    orientation="vertical";
    {
      LinearLayout;
      layout_width="fill";
      layout_height="wrap";
      orientation="vertical";
      {
        LinearLayout;
        layout_width="fill";
        layout_height="wrap";
        orientation="horizontal";
        {
          ImageView;
          layout_width="22dp";
          layout_gravity="center";
          id="icon";
          layout_marginLeft="18dp";
          layout_margin="10dp";
          layout_height="22dp";
          ColorFilter=文字;--图片颜色
        };
        {
          TextView;
          text="name";
          id="name";
          layout_height="wrap";
          textColor=文字;
          layout_marginRight="8dp";
          layout_margin="16dp",
          layout_gravity="center";
        };
      };
      {
        TextView;
        text="Text";
        id="text";
        layout_height="wrap";
        --textColor=文字;
        layout_marginLeft="16dp",
        layout_marginRight="16dp",
        layout_margin="6dp",
        layout_width="fill",
        gravity="left";
      };
      {
        ProgressBar;
        layout_width="-1",
        layout_height="4dp",
        --layout_marginTop="0dp";
        id="progress",
        --长形进度条
        style="?android:attr/progressBarStyleHorizontal";
        layout_marginLeft="16dp",
        layout_marginRight="16dp",
      };
    };
  }
  import "com.androlua.LuaUtil"
  function getMD5(path)
    return tostring(LuaUtil.getFileMD5(tostring(path)))
  end
  function GetFilelastTime(path)
    f = File(path);
    cal = Calendar.getInstance();
    time = f.lastModified()
    cal.setTimeInMillis(time);
    return cal.getTime().toLocaleString()
  end
  function GetFileSize(path)
    import "java.io.File"
    import "android.text.format.Formatter"
    size=File(tostring(path)).length()
    Sizes=Formatter.formatFileSize(activity, size)
    return Sizes
  end
  adpp=LuaAdapter(activity,itemcc)
  function GetFileSize(path)
    import "java.io.File"
    import "android.text.format.Formatter"
    size=File(tostring(path)).length()
    Sizes=Formatter.formatFileSize(activity, size)
    return Sizes
  end
  function show(f)
    dir=f
    adpp.clear()
    ls=luajava.astable(f.listFiles() or String{})
    table.sort(ls,function(a,b)
      return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
    end)
    for n=1,#ls do
      if ls[n].isDirectory() then
        --  adpp.add{icon="png/folder_open_black.png",name=ls[n].Name,xx=GetFilelastTime(tostring(ls[n]))}
      end
    end
    for n=1,#ls do
      if ls[n].isDirectory() then
       else
        adpp.add{icon="png/insert_drive_file_black.png",name=ls[n].Name,xx=GetFilelastTime(tostring(ls[n])).."  "..GetFileSize(tostring(ls[n])),text={Visibility=View.GONE},progress={Visibility=View.GONE}}
      end
    end
  end
  文件list.Adapter=adpp
  import "java.io.File"
  thread(function()
    require "import"
    import "java.io.File"
    下载目录="/storage/emulated/0/Download/"
    call("show",File(下载目录))
  end)

  function OpenFile(path,文件类型)
    import "android.webkit.MimeTypeMap"
    import "android.content.Intent"
    import "android.net.Uri"
    import "java.io.File"
    FileName=tostring(File(path).Name)
    ExtensionName=FileName:match("%.(.+)")
    if 文件类型 then
      intent = Intent();
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      intent.setAction(Intent.ACTION_VIEW);
      intent.setDataAndType(Uri.fromFile(File(path)), 文件类型);
      activity.startActivity(intent);
     else
      print("找不到可以用来打开此文件的程序")
    end
  end
  function 取文件后缀(filename)
    dot = String(filename).lastIndexOf('.');
    if ((dot >-1) and (dot < (#filename - 1))) then
      return String(filename).substring(dot + 1);
    end
    return "";
  end

  文件list.onItemClick=function(l,v,p,i)
    local path = tostring(ls[i])

    local Type查询 = [[
<tdclass>.doc</td>
<td>application/msword</td>
<tdclass>.apk</td>
<td>application/vnd.android.package-archive</td>
<tdclass>.ipa</td>
<td>application/vnd.iphone</td>
<tdclass>.txt</td>
<td>text/plain</td>
<tdclass>.pdf</td>
<td>application/pdf</td>
<tdclass>.m4a</td>
<td>audio/mp4a-latm</td>
<tdclass>.mp3</td>
<td>audio/x-mpeg</td>
<tdclass>.flac</td>
<td>audio/x-mpeg</td>
<tdclass>.ape</td>
<td>audio/x-mpeg</td>
<tdclass>.mp4</td>
<td>video/mp4</td>
<tdclass>.ppt</td>
<td>application/vnd.ms-powerpoint</td>
<tdclass>.pptx</td>
<td>application/vnd.openxmlformats-officedocument.presentationml.presentation</td>
<tdclass>.rar</td>
<td>application/x-rar-compressed</td>
<tdclass>.rmvb</td>
<td>audio/x-pn-realaudio</td>
<tdclass>.swf</td>
<td>application/x-shockwave-flash</td>
<tdclass>.zip</td>
<td>application/zip</td>
<tdclass>.3gp</td>
<td>video/3gpp</td>
<tdclass>.docx</td>
<td>application/vnd.openxmlformats-officedocument.wordprocessingml.document</td>
<tdclass>.dwg</td>
<td>application/x-autocad</td>
<tdclass>.jpg</td>
<td>image/jpeg</td>
<tdclass>.jpeg</td>
<td>image/jpeg</td>
<tdclass>.png</td>
<td>image/png</td>
]]
    local 文件扩展名 = string.lower("."..取文件后缀(path))
    local 文件名位置 = string.find(Type查询, 文件扩展名)
    if 文件名位置 == -1 then
      return "application/octet-stream"
    end
    local mat = string.format("<tdclass>%s</td>\n<td>(.-)</td>", 文件扩展名)
    local 文件类型=string.match(Type查询,mat)
    OpenFile(path,文件类型)
    --[[  menu.add("删除文件").onMenuItemClick=function(a)
    local 文件名称=tostring(File(path).Name)
    对话框()
    .设置标题("删除文件")
    .设置消息("确认要删除吗？源文件也将被一并删除。")
    .设置积极按钮("确定",function()
      os.execute("rm -r "..path)
      print("已删除")
      adpp.remove(p)
      adpp.notifyDataSetChanged()
    end)
    .设置消极按钮("取消")
    .显示()
  end
  pop.show()]]
  end
end
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"

import "java.io.File"
function 写入文件(路径,内容)
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end

夜间模式=io.open("/data/data/"..activity.getPackageName().."/暗色模式.xml"):read("*a")
if 夜间模式=="打开" then
  背景=0xFF191919
  背景2="#FF191919"
  卡片="#FF212121"
  底栏="#FF191919"
  文字=0xFFffffff
  文字123=0x8bffffff
  activity.setTheme(android.R.style.Theme_Material)
 else
  背景=0xFFFAFAFA
  卡片="#FFF0F0F0"
  底栏="#FFffffff"
  文字=0xff2c2c2c
  文字123=0x8e000000
end
设置标题栏()
function onResult(name,...)
  返回参数=...
  activity.result{返回参数}
end
加载内容()
--[[正在下载列表={}
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,正在下载列表,itemcc)
yuxuan_adpqy.clear()--清空适配器
内容=io.open("/data/data/"..activity.getPackageName().."/下载记录.xml"):read("*a")
for t,c in 内容:gmatch("【项目】(.-)【项目】") do
  -- table.insert(title2,t:match("【标题】(.-)【标题】"))
  for k,v in ipairs(正在下载列表) do --遍历
    if t:match("【标题】(.-)【标题】")==v.name
      table.remove(正在下载列表,k)
    end
  end
  进度=tonumber(t:match("【进度】(.-)【进度】"))
  --进度条宽度=保存路径.width/100*进度
  if string.sub(t:match("【链接】(.-)【链接】"),#(t:match("【链接】(.-)【链接】"))-4,#(t:match("【链接】(.-)【链接】")))=="下载完成"
    table.insert(正在下载列表,{name=t:match("【标题】(.-)【标题】"),text={text=t:match("【链接】(.-)【链接】")},icon="png/gnjs2x.png",progress={progress=进度,Visibility=View.VISIBLE}})
   else
    table.insert(正在下载列表,{name=t:match("【标题】(.-)【标题】"),text={text=t:match("【链接】(.-)【链接】")},icon="png/gnjs2x.png",progress={progress=进度,Visibility=View.GONE}})
  end
end
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,正在下载列表,itemcc)

--将小项目匹配给大list
正在下载list.Adapter=yuxuan_adpqy
function 刷新内容()
  task(500,function()
    内容=io.open("/data/data/"..activity.getPackageName().."/下载记录.xml"):read("*a")
    for t,c in 内容:gmatch("【项目】(.-)【项目】") do
      进度=tonumber(t:match("【进度】(.-)【进度】"))
      --进度条宽度=保存路径.width/100*进度
      正在下载列表[c+1].text["text"]=t:match("【链接】(.-)【链接】")
      正在下载列表[c+1].progress["progress"]=进度
      if string.sub(t:match("【链接】(.-)【链接】"),#(t:match("【链接】(.-)【链接】"))-4,#(t:match("【链接】(.-)【链接】")))=="下载完成"
        正在下载列表[c+1].progress["Visibility"]=View.GONE
      end
    end
    刷新内容()
  end)
end
刷新内容()
]]
function 刷新内容()
  task(800,function()
    if Page2==0
      正在下载列表={}
      --创建适配器，将datas里面的数据匹配给itemc小项目
      yuxuan_adpqy=LuaAdapter(activity,正在下载列表,itemcc)
      yuxuan_adpqy.clear()--清空适配器
      内容=io.open("/data/data/"..activity.getPackageName().."/下载记录.xml"):read("*a")
      for t,c in 内容:gmatch("【项目】(.-)【项目】") do
        for k,v in ipairs(正在下载列表) do --遍历
          if t:match("【标题】(.-)【标题】")==v.name
            table.remove(正在下载列表,k)
          end
        end
        table.insert(正在下载列表,{name=t:match("【标题】(.-)【标题】"),
          text=t:match("【链接】(.-)【链接】"),
          icon="png/gnjs2x.png",
          progress={Progress=tonumber(t:match("【进度】(.-)【进度】"))},
        })
      end
      --创建适配器，将datas里面的数据匹配给itemc小项目
      yuxuan_adpqy=LuaAdapter(activity,正在下载列表,itemcc)

      --将小项目匹配给大list
      正在下载list.Adapter=yuxuan_adpqy
      收藏.setColorFilter(Color.parseColor(强调色))--给图标上色
      工具.setColorFilter(文字123)--给图标上色
     else
      收藏.setColorFilter(文字123)--给图标上色
      工具.setColorFilter(Color.parseColor(强调色))--给图标上色
    end
    刷新内容()
  end)
end
刷新内容()
