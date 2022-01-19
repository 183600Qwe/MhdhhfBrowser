function 获取脚本内容(标题,内容,是否开启脚本,使用对象)
  return [==[【项目】【标题】]==]..标题..[==[【标题】【内容】]==]..内容..[==[【内容】【是否开启脚本】]==]..是否开启脚本..[==[【是否开启脚本】【使用对象】]==]..使用对象..[==[【使用对象】【项目】]==]

end


local itemc={
  LinearLayout,
  orientation="horizontal",
  layout_width="fill",
  {
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    id='列表项目背景外';
    {
      LinearLayout,
      orientation="horizontal",
      layout_width="fill",
      layout_margin='25dp';
      id='列表项目背景';
      layout_marginTop="0";
      {
        LinearLayout;
        layout_width="fill";
        --  layout_height="120dp";
        orientation="vertical";
        gravity='center';
        layout_margin="6dp";
        {
          LinearLayout,
          orientation="horizontal",
          layout_width="fill",
          layout_margin="3.7dp";
          {
            TextView;
            id="srct";
            layout_weight="1",--重力分配
            textColor=文字,
            gravity="left",
            textSize="20sp",
            layout_gravity='center';
          };
          {
            TextView;
            id="srct2";
            textColor=文字,
            gravity="right",
            textSize="20sp",
            layout_gravity='center';
          };
        };
        {
          TextView;
          id="srcb";
          layout_width="fill";
          textColor=文字123,
          gravity="left",
          layout_marginTop="6dp";
          layout_gravity='center';
        };
      };
    };
  };
}


uuuu=(loadlayout("layout/diaoyongliebiaolayout"))
文本=数据传送
文本2=文本
if 文本=="更新日志" then
  --标题
  Title=('更新日志(可能有遗漏)')
  import "wenben"
 elseif 文本==nil then
 else
  --标题
  Title=(文本)

end
标题栏承载器.addView(loadlayout(获取标题栏(Title,更新日志FrameLayout,"更新日志")))--添加控件
主页.addView(uuuu)--添加控件
页面列表["更新日志"]=true
--一个小list模板已搭建好了，下面开始匹配数据

--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表
aic={}

--"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do

function 打开关闭反转(d)
  if d=="打开" then
    return "关闭"
   else
    return "打开"
  end
end

if 文本=="更新日志" then
  import "wenben"
  for k,v in ipairs(版本表) do --遍历
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=v,srcb=更新日志表[v]})
  end
  --标题
  activity.setTitle('更新日志(可能有遗漏)')
  隐藏控件(ftb10)
 elseif 文本=="脚本管理" then
  文件名称="脚本保存"
  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=t:match("【标题】(.-)【标题】"),srcb={Visibility=View.GONE},列表项目背景={backgroundDrawable=边框(dp2px("15"),"#00000000",边框2,dp2px("1.5"))},srct2=打开关闭反转(t:match("【是否开启脚本】(.-)【是否开启脚本】"))})
  end
  显示控件(ftb10)
  ftb20.onClick=function()
    运行代码含读取文件("mods/tianjia/tianjiajiaoben")
  end
 elseif 文本=="工具脚本管理" then
  文件名称="工具脚本保存"
  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=t:match("【标题】(.-)【标题】"),srcb={Visibility=View.GONE},srct2=打开关闭反转(t:match("【是否开启脚本】(.-)【是否开启脚本】")),列表项目背景={backgroundDrawable=边框(dp2px("15"),"#00000000",边框2,dp2px("1.5"))}})
  end
  显示控件(ftb10)
  ftb20.onClick=function()
    运行代码含读取文件("mods/tianjia/tianjiajiaoben")
  end
 elseif 文本=="搜索引擎管理" then
  文件名称="搜索引擎保存"
  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=t:match("【标题】(.-)【标题】"),srcb={Visibility=View.GONE},srct2={Visibility=View.GONE}})
  end
  显示控件(ftb10)
  ftb20.onClick=function()
    运行代码含读取文件("mods/tianjia/tianjiasuosouyingqin")
  end
 elseif 文本=="贡献者名录" then
  datas={
    {srct="nirenr",srcb="此软件基于他的Androlua+，并使用Androlua+开发。"},
    {srct="qq@dingyi",srcb="此软件使用了他的多窗口，基于他的dingyi浏览器开发。"},
    {srct="qq@exception",srcb="提供了一些有关代码的建议。"},
    {srct="qq@寒歌",srcb="他开发了FusionApp，使我开始安卓开发。开发了一个木函，此软件开发时用了一个木函。"},
    {srct="qq@muk",srcb="此软件使用了他的web.dex来获取加载进度，开发手册、ui、部分代码"},
    {srct="FALua手册开发者",srcb="部分代码（？）"},
    {srct="小白菜",srcb="提供菜单的部分代码，此浏览器菜单基于Ta的关于修改。"},
    {srct="Pretend°",srcb="此软件可能使用了applua的顶栏模板。"},
    {srct="qq32552732",srcb="此软件的书签和历史使用了他的收藏夹，其他地方可能也用了这些代码。"},
  }
  显示控件(ftb10)
  ftb20.onClick=function()
    if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.mobileqq",0) end) then
      url="mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=3025385472"
      activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
     else
      print("未安装")
    end
  end
 else
  隐藏控件(ftb10)
  aw3={"Mhdhhf浏览器",
    "Material design icons",
    "MichaelCustomGridviewWithMultiSelectMode",
  }
  --Card Broswser是一个浏览器，我用了源码里面的清除缓存，和获取浏览器滑动位置。

  mmp={"本软件",
    "Material design icons is the official icon set from Google. The icons are designed under the material design guidelines.来自谷歌官方的 Material Design系统图标集。\nApache-2.0-Google",
    "NoScrollGridView and NoScrollListView with Multi select mode.可嵌套 ScrollView的 ScrollView与 ListView。\nzhxhcoder",
  }
  for nj=1,#aw3 do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=aw3[nj],srcb=mmp[nj]})
  end
  function a(文本2)
    if 文本2=="Mhdhhf浏览器" then
      return("这个项目的源码不使用任何开源许可证！并且可以自由使用。")
     elseif 文本2=="Material design icons" then
      return("https://github.com/google/material-design-icons")
     elseif 文本2=="MichaelCustomGridviewWithMultiSelectMode" then
      return("https://github.com/zhxhcoder/MichaelCustomGridviewWithMultiSelectMode/")
    end
  end
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,itemc)

--将小项目匹配给大list
list3.Adapter=yuxuan_adpqy
list3.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    local 文本2=v.Tag.srct.Text
    if 文本=="更新日志" then
     elseif 文本=="脚本管理" or 文本=="工具脚本管理" then
      if v.Tag.srct2.Text=="打开" then
        v.Tag.srct2.Text="关闭"
       else
        v.Tag.srct2.Text="打开"
      end
      datas={}
      内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
      内容2=""
      次数=0
      for t,c in 内容:gmatch("【项目】(.-)【项目】") do
        次数=次数+1
        if 次数==id then
          标题=t:match("【标题】(.-)【标题】")
          mLuaEditortext=t:match("【内容】(.-)【内容】")
          使用对象=t:match("【使用对象】(.-)【使用对象】")
          是否开启脚本=打开关闭反转(v.Tag.srct2.Text)
          内容2=内容2..获取脚本内容(标题,mLuaEditortext,是否开启脚本,使用对象)
         else
          标题=t:match("【标题】(.-)【标题】")
          mLuaEditortext=t:match("【内容】(.-)【内容】")
          使用对象=t:match("【使用对象】(.-)【使用对象】")
          是否开启脚本=t:match("【是否开启脚本】(.-)【是否开启脚本】")
          if 使用对象 then
            内容2=内容2..获取脚本内容(标题,mLuaEditortext,是否开启脚本,使用对象)
          end
        end
      end
      写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容2)
     else
      b=a(v.Tag.srct.Text)
      if v.Tag.srct.Text=="Mhdhhf浏览器" then
        提示(b)
       else
        import "android.content.Intent"
        import "android.net.Uri"
        url=b
        viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
        activity.startActivity(viewIntent)
      end
    end
  end,
})
if 文本=="脚本管理" or
  文本=="工具脚本管理" or
  文本=="搜索引擎管理" then
  list3.onItemLongClick=function(parent,v,pos,id)

    id2=id
    local pop=PopupMenu(activity,v)
    menu=pop.Menu
    menu.add("修改信息").onMenuItemClick=function(a)
      次数=0
      内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
      for t,c in 内容:gmatch("【项目】(.-)【项目】") do

        次数=次数+1
        if 次数==id2 then
          if 文本2=="脚本管理" or 文本2=="工具脚本管理" then
            是否为修改脚本=true
            运行代码含读取文件("mods/tianjia/tianjiajiaoben")
            标题qwe.Text=t:match("【标题】(.-)【标题】")
            使用对象.Text=t:match("【使用对象】(.-)【使用对象】")
            mLuaEditortext=t:match("【内容】(.-)【内容】")
            是否开启脚本=t:match("【是否开启脚本】(.-)【是否开启脚本】")
            if 是否开启脚本=="打开" then
              关闭脚本TextView.text='关闭脚本'
             else
              关闭脚本TextView.text='开启脚本'
            end
           elseif 文本2=="搜索引擎管理" then
            是否为修改搜索引擎=true
            id=id2
            运行代码含读取文件("mods/tianjia/tianjiasuosouyingqin")
            标题qwe.Text=t:match("【标题】(.-)【标题】")
            链接qwe.Text=t:match("【链接】(.-)【链接】")
          end
        end
      end
    end
    menu.add("删除").onMenuItemClick=function(a)
      内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
      内容2=""
      次数=0
      for t,c in 内容:gmatch("【项目】(.-)【项目】") do
        次数=次数+1
        if 次数==id then
         else
          if 文本2=="脚本管理" or 文本2=="工具脚本管理" then
            标题=t:match("【标题】(.-)【标题】")
            mLuaEditortext=t:match("【内容】(.-)【内容】")
            使用对象=t:match("【使用对象】(.-)【使用对象】")
            是否开启脚本=t:match("【是否开启脚本】(.-)【是否开启脚本】")
            if 使用对象 then
              内容2=内容2..获取脚本内容(标题,mLuaEditortext,是否开启脚本,使用对象)
            end
           elseif 文本2=="搜索引擎管理" then
            local 标题=t:match("【标题】(.-)【标题】")
            local 链接=t:match("【链接】(.-)【链接】")
            内容2=内容2..获取内容(标题,链接)
          end
        end
      end
      写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容2)

      隐藏控件2(v.Tag.列表项目背景外)
    end
    pop.show()--显示
  end
 elseif 文本=="开源许可" then
  list3.onItemLongClick=function(parent,v,pos,id)

    id2=id
    local pop=PopupMenu(activity,v)
    menu=pop.Menu
    menu.add("复制名称").onMenuItemClick=function(a)
      --先导入包
      import "android.content.*"
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(v.Tag.srct)
      print("已复制")
    end
    menu.add("复制信息").onMenuItemClick=function(a)
      --先导入包
      import "android.content.*"
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(v.Tag.srcb)
      print("已复制")
    end
    if v.Tag.srct.Text=="Mhdhhf浏览器" then
      名称="复制内容"
     else
      名称="复制链接"
    end
    menu.add(名称).onMenuItemClick=function(a)
      b=tostring(a(v.Tag.srct.Text))
      --先导入包
      import "android.content.*"
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(b)
      print("已复制")
    end
    pop.show()--显示
  end
 elseif 文本=="贡献者名录" then


end
波纹({ftb20,
},"方",文字)
itemc=nil