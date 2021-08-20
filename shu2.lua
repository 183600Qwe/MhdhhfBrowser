
--import "com.michael.NoScrollListView"--导入可以嵌套在Scrollview里的列表
--listlayout=
--[[import "android.view.animation.TranslateAnimation"
import "android.util.Base64"
import "java.lang.*"
import "android.util.*"
import "android.content.*"
function encode(data)--编码
  local Base64=luajava.bindClass("android.util.Base64")
  return Base64.encodeToString(String(data).getBytes(),Base64.NO_WRAP);
end

function decode(data)--解码
  local Base64=luajava.bindClass("android.util.Base64")
  return String(Base64.decode(data,Base64.DEFAULT)).toString()
end

import "java.lang.String"
import "javax.crypto.Cipher"
import "javax.crypto.spec.IvParameterSpec"
import "javax.crypto.spec.SecretKeySpec"
import "android.util.Base64"
import "java.net.URLEncoder"]]

import "android.view.animation.TranslateAnimation"

主页图片背景=io.open("/data/data/"..activity.getPackageName().."/主页图片背景.xml"):read("*a")
function 删除(d,v,是否多选,是否为文件夹,d2)
  if 是否为文件夹 then

    内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")

    文件夹列表=string2tab(内容:match("【文件夹列表】(.-)【文件夹列表】")) or {}

    文件夹列表2=文件夹列表
    此文件夹项目列表=文件夹列表2[d2] or {}


    table.remove(此文件夹项目列表[2],d)
    文件夹列表2[d2]=此文件夹项目列表
    内容=""
    for k,v in ipairs(title2) do --遍历
      local 标题=title2[k]
      链接=bookId2[k]
      内容=内容..获取内容(标题,链接)
    end
    内容=内容.."【文件夹列表】"..dump(文件夹列表2).."【文件夹列表】"
    写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
    隐藏控件2(v)
    --关闭对话框a()
   else
    if 是否为主页项目 then
      内容2=""
      主页项目5={}
      for t,c in 主页项目:gmatch("【项目】(.-)【项目】") do
        --给空的datas添加所有的数据
        --格式为  table.insert(空列表名称,{id=数据列表[nj]})
        --table.insert(datas,{标题=t:match("【标题】(.-)【标题】"),图标=t:match("【标题】(.-)【标题】"),srcb=t:match("【链接】(.-)【链接】")})
        主页项目5[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
      end
      for k,v in pairs(主页项目5) do --遍历
        if d==k then
         else
          local 标题=k
          链接=v
          内容2=内容2..获取内容(标题,链接)
        end
      end
      写入文件("/data/data/"..activity.getPackageName().."/主页项目.xml",内容2)
     else
      title2={}
      bookId2={}
      内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
      for t,c in 内容:gmatch("【项目】(.-)【项目】") do
        table.insert(title2,t:match("【标题】(.-)【标题】"))
        table.insert(bookId2,t:match("【链接】(.-)【链接】"))
      end
      内容2=""
      if 是否多选 then
        for k in ipairs(title2) do --遍历
          if 待操作列表[k] then
           else
            local 标题=title2[k]
            链接=bookId2[k]
            内容2=内容2..获取内容(标题,链接)
          end
        end
       else
        for k,v in ipairs(title2) do --遍历
          if d==k then
           else
            local 标题=title2[k]
            链接=bookId2[k]
            内容2=内容2..获取内容(标题,链接)
          end
        end
      end
      写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容2)
    end
    if v then
      隐藏控件(v)
    end
  end
end
function 文件夹长按菜单(id,v,text2)
  local pop=PopupMenu(activity,v)
  menu=pop.Menu
  menu.add("修改文件夹名称").onMenuItemClick=function(a)
    对话框({
      标题="修改文件夹名称",
      点击事件=function(text)
        文件夹列表2=文件夹列表
        此文件夹=文件夹列表2[id] or {}
        此文件夹[1]=text
        文件夹列表2[id]=此文件夹
        内容=""
        for k,v in ipairs(title2) do --遍历
          local 标题=title2[k]
          链接=bookId2[k]
          内容=内容..获取内容(标题,链接)
        end
        内容=内容.."【文件夹列表】"..dump(文件夹列表2).."【文件夹列表】"
        写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
        --showDataDialog(name,title,是否悬浮窗)
        text2.text=text
      end,
      是否显示取消按钮=true,
      HINT="名称",
      输入框文本=文件夹列表[id][1]
    })
  end
  menu.add("单独导出").onMenuItemClick=function(a)
    导出(文件夹列表[d],d)
  end
  menu.add("发送至桌面").onMenuItemClick=function(a)
    createShortcut(d)
  end
  menu.add("删除文件夹").onMenuItemClick=function(a)
    --内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
    --内容=string.gsub(内容,获取内容(view.Tag.text.Text,bookId2[view.Tag.text.Text]),"")
    文件夹列表2=文件夹列表
    文件夹列表2[id]=nil
    内容=""
    for k,v in ipairs(title2) do --遍历
      local 标题=title2[k]
      链接=bookId2[k]
      内容=内容..获取内容(标题,链接)
    end
    内容=内容.."【文件夹列表】"..dump(文件夹列表2).."【文件夹列表】"
    写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
    if #title2-1==0 then
      --activity.recreate()
    end


    隐藏控件(v)
  end
  pop.show()--显示
end
function 书签长按菜单(标题,链接,v,是否为主页项目,d,text,是否为文件夹,d2,popadp_text)
  local pop=PopupMenu(activity,v)
  menu=pop.Menu
  menu.add("修改书签").onMenuItemClick=function(a)
    --输入对话框
    InputLayout={
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
        text=标题;
      };
      {
        TextView;
        -- colorFilter=0xFFffffff;
        text="链接:";
        textSize="16sp";
        textColor=文字qwe;
        layout_margin="10dp";
        layout_marginBottom="0";
      };
      {
        EditText;
        hint="链接";
        layout_marginTop="0";
        --layout_marginBottom="22dp";
        layout_margin="10dp";
        layout_width="fill";
        layout_gravity="center",
        id="链接qwe";
        textSize="16sp";
        textColor=文字;
        text=链接;
      };
    };
    对话框({
      标题="修改书签",
      输入框可用=true,
      点击事件=function()
        if 是否为文件夹 then

          文件夹列表2=文件夹列表
          此文件夹项目列表=文件夹列表2[d2] or {}
          此文件夹项目列表[2][d]={标题qwe.text,链接qwe.text}
          此文件夹项目列表={此文件夹项目列表[1],此文件夹项目列表[2]}

          文件夹列表2[d2]=此文件夹项目列表
          title2={}
          bookId2={}
          内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
          for t,c in 内容:gmatch("【项目】(.-)【项目】") do
            table.insert(title2,t:match("【标题】(.-)【标题】"))
            table.insert(bookId2,t:match("【链接】(.-)【链接】"))
          end
          内容=""
          for k,v in ipairs(title2) do --遍历
            local 标题=title2[k]
            链接=bookId2[k]
            内容=内容..获取内容(标题,链接)
          end
          内容=内容.."【文件夹列表】"..dump(文件夹列表2).."【文件夹列表】"
          写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
          text.text=标题qwe.text
          --关闭对话框a()
         else
          --内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
          --写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容..获取内容(标题qwe.text,链接qwe.text))
          内容=""
          if 是否为主页项目 then
            主页项目5={}
            for t,c in 主页项目:gmatch("【项目】(.-)【项目】") do
              --给空的datas添加所有的数据
              --格式为  table.insert(空列表名称,{id=数据列表[nj]})
              --table.insert(datas,{标题=t:match("【标题】(.-)【标题】"),图标=t:match("【标题】(.-)【标题】"),srcb=t:match("【链接】(.-)【链接】")})
              主页项目5[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
            end
            for k,v in pairs(主页项目5) do --遍历
              if d==k then
                local 标题=标题qwe.text
                链接=链接qwe.text
                内容=内容..获取内容(标题,链接)
               else
                local 标题=k
                链接=v
                内容=内容..获取内容(标题,链接)
              end
            end
           else
            for k,v in ipairs(title2) do --遍历
              if d==k then
                local 标题=标题qwe.text
                链接=链接qwe.text
                内容=内容..获取内容(标题,链接)
               else
                local 标题=title2[k]
                链接=bookId2[k]
                内容=内容..获取内容(标题,链接)
              end
            end
          end
          if 是否为主页项目 then
            写入文件("/data/data/"..activity.getPackageName().."/主页项目.xml",内容)
           else
            写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
          end
          text.text=标题qwe.text
        end
      end,
      是否显示取消按钮=true,
      对话框布局=loadlayout(InputLayout),
    })
  end
  menu.add("复制链接").onMenuItemClick=function(a)
    --先导入包
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(链接)
    print("已复制")
  end
  menu.add("分享书签").onMenuItemClick=function(a)
    import "mods.fenxiang"
    分享链接(标题,链接)
  end
  menu.add("书签信息").onMenuItemClick=function(a)
    对话框({
      标题="信息",
      点击事件=function()end,
      文本内容="标题:"..标题.."\n链接:"..链接,
      是否显示取消按钮=false,
    })
  end
  menu.add("发送至桌面").onMenuItemClick=function(a)
    createShortcut(标题)
  end
  menu.add("在悬浮窗打开").onMenuItemClick=function(a)
    import "xuanfuchuang"
    showWindow(链接)
  end
  menu.add("在新窗口打开").onMenuItemClick=function(a)
    webviewp:openNewUrl(链接)
    创建关联页面的页面=当前窗口
  end
  menu.add("在后台打开网页").onMenuItemClick=function(a)
    webviewp:openNewUrl(链接,true)
    创建关联页面的页面=#weblist
  end
  menu.add("删除书签").onMenuItemClick=function(a)
    删除(d,v,false,是否为文件夹,d2)
  end
  pop.show()--显示
end
function showDataDialog(name,title,是否悬浮窗)
  if name=="网页收藏" then
    文件名称="书签保存"
   else
    文件名称=name
  end
  title2={}
  bookId2={}
  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
    table.insert(title2,t:match("【标题】(.-)【标题】"))
    table.insert(bookId2,t:match("【链接】(.-)【链接】"))
  end
  排序=io.open("/data/data/"..activity.getPackageName().."/排序.xml"):read("*a")
  if 排序=="按名称" then
    table.sort(title2,function(a,b)
      return ((a)>(b))
    end)
    table.sort(bookId2,function(a,b)
      return ((a)>(b))
    end)
  end
  if name=="历史记录保存" then
   else
    if 内容:find("【文件夹列表】")then
     else
      内容=内容.."【文件夹列表】{}【文件夹列表】"
      写入文件("/data/data/"..activity.getPackageName().."/书签保存.xml",内容)
    end
  end
  if 文件是否存在("/data/data/"..activity.getPackageName().."/是否恢复之前的文件夹.xml")==false then
    写入文件("/data/data/"..activity.getPackageName().."/是否恢复之前的文件夹.xml","a")
    local 旧内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
    写入文件("/data/data/"..activity.getPackageName().."/"..文件名称.."备份.xml",内容)
    文件夹列表=string2tab(旧内容:match("【文件夹列表】(.-)【文件夹列表】")) or {}
    local 新文件夹列表={}
    for d,旧文件夹内容 in pairs(文件夹列表) do
      新文件夹内容={}
      for d,旧文件夹内容 in pairs(旧文件夹内容) do
        table.insert(新文件夹内容,{d,旧文件夹内容})
      end
      table.insert(新文件夹列表,{d,新文件夹内容})
    end
    新内容="【文件夹列表】"..dump(新文件夹列表).."【文件夹列表】"
    title2={}
    bookId2={}
    local 内容2=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
    for t,c in 内容2:gmatch("【项目】(.-)【项目】") do
      table.insert(title2,t:match("【标题】(.-)【标题】"))
      table.insert(bookId2,t:match("【链接】(.-)【链接】"))
    end
    for k,v in ipairs(title2) do --遍历
      标题=title2[k]
      链接=bookId2[k]
      新内容=新内容..获取内容(标题,链接)
    end
    写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",新内容)
   else
    if name~="历史记录保存" then--判断是否主页
      文件夹列表=string2tab(内容:match("【文件夹列表】(.-)【文件夹列表】")) or {}
    end
  end
  --print(dump(文件夹列表))
  --[[遍历打印table
  for i,v in ipairs(内容2) do
    --print(v.title,v.bookId)
    table.insert(title2,v.title)
    bookId2[v.title]=v.bookId
  end]]
  if name=="历史记录保存" then
    图标="png/timelap.png"
   else
    图标="png/fglkg.png"
  end
  if 主页图片背景=="打开" then
    function 取颜色亮度(color)
      local r=utf8.sub(color,3,4)
      local g=utf8.sub(color,5,6)
      local b=utf8.sub(color,7,8)
      function toint(e)--封装函数
        import 'java.lang.Long'
        return Long.parseLong(e, 16)
      end
      local grayLevel = toint(r) * 0.299 + toint(g) * 0.587 + toint(b) * 0.114;--RGB 模式转换成 YUV 模式，而 Y 是明亮度（灰阶），因此只需要获得 Y 的值而判断他是否足够亮就可以了
      if (grayLevel <= 192) then
        return true --黑
       else
        return false--白
      end
    end
    主页背景="/sdcard/MhdhhfBrowser/主页背景.png"
    Bitmap2=loadbitmap(主页背景)
    zbg=取小数点后面的n位(Bitmap2.height/2,1)
    zbk=取小数点后面的n位(Bitmap2.width/2,1)
    y=Bitmap2.getPixel(zbk,zbg)
    xpcall(function()
      if 取颜色亮度(y) then
        --判断图片比较暗
        主页文字颜色=0xFFffffff
        主页文字颜色3=0xFFffffff
        主页卡片颜色=0x9cffffff
        主页底栏颜色="#c4ffffff"
        主页文字颜色2=0x9cffffff
        边框2="#27ffffff"
       else
        --判断图片比较亮
        主页文字颜色=0xff2c2c2c
        主页文字颜色3=0xff2c2c2c
        主页卡片颜色=0x9c000000
        主页底栏颜色="#c4000000"
        主页文字颜色2=0xff8b8b8b
        边框2="#FFF0F0F0"
      end
      end,function(e)
      --判断图片比较暗
      主页文字颜色=0xFFffffff
      主页文字颜色3=0xFFffffff
      主页卡片颜色=0x9cffffff
      主页底栏颜色="#c4ffffff"
      主页文字颜色2=0x9cffffff
    end)
    if 夜间模式=="打开" then
      主页文字颜色=文字
      主页文字颜色2=文字123
      主页文字颜色3=转0x(一般强调色)
      主页卡片颜色=卡片
      主页底栏颜色=底栏
      边框2="#ffffffff"
      主页背景3BackgroundColor=("#66191919")
     else
      主页背景3BackgroundColor=nil
      边框2="#FFF0F0F0"
    end
   else
    主页背景=nil
    主页背景3BackgroundColor=nil
    主页文字颜色=文字
    主页文字颜色2=文字qwe
    主页文字颜色3=转0x(一般强调色)
    主页卡片颜色=卡片
    主页底栏颜色=底栏
  end

  --  local dlb=AlertDialog.Builder(this)
  -- dlb.setTitle(title)
  local dl
  if 是否悬浮窗 then
    背景id="vngggggg悬浮窗"
    文字大小="12dp"
    图标大小="18dp"
    padding="12dp"
    文字大小2="12dp"
    padding2="12dp"
   else
    背景id="vngggggg"
    文字大小="16dp"
    图标大小="25dp"
    padding="16dp"
    文字大小2="15dp"
    padding2="22dp"
  end
  if 目前页面=="主页" then
    if 主页链接=="收藏" then
      文件夹列表LinearLayoutpaddingTop="16dp"
     else
      文件夹列表LinearLayoutpaddingTop="0"
    end
   else
    文件夹列表LinearLayoutpaddingTop="16dp"
  end
  主页链接=io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")
  if (title=="书签")==false and (title=="历史记录")==false then--判断是否主页
    if 主页链接=="仅搜索栏" then
      主页搜索2高="fill"
      主页搜索CardViewlayout_margin="16dp"
      主页搜索CardViewlayout_marginTop="-44dp"--0
      主页背景3gravity="center"
     else
      主页搜索2高="wrap_content"
      主页搜索CardViewlayout_margin="16dp"
      主页搜索CardViewlayout_marginTop='46dp'
      主页背景3gravity=nil
    end
   else
    主页搜索2高="fill"
    主页搜索CardViewlayout_margin="0"
    主页搜索CardViewlayout_marginTop="-44dp"--0
    主页背景3gravity=nil
  end
  if (主页链接=="仅搜索栏")==false then
    主页搜索2高="wrap_content"
    主页搜索CardViewlayout_margin2="16dp"
    主页搜索CardViewlayout_margin="0"
    主页搜索CardViewlayout_marginTop='46dp'
  end


  listlayout=
  {
    FrameLayout,
    --orientation="vertical",--布局方向
    layout_width="fill",
    layout_height="fill",
    BackgroundColor=背景2;
    id=背景id;
    {
      ImageView,
      layout_width="fill",
      layout_height="fill",
      src=主页背景,--视图路径
      scaleType="centerCrop",
    };
    {
      FrameLayout;--卡片控件
      layout_width="fill";
      layout_gravity="center";
      layout_height="fill";
      BackgroundColor=0x00000000;
      id="vngggggg内";
      padding=主页搜索CardViewlayout_margin;
      {
        TextView;
        text="没有"..title;
        id="tittled";
        textColor=主页文字颜色2;--给图标上色
        textSize="20dp";
        layout_gravity="center";
        gravity="center";
        --BackgroundColor=背景2;
      };
      {
        LinearLayout,
        orientation="vertical",--布局方向
        layout_width="fill",
        layout_height="fill",
        BackgroundColor=主页背景3BackgroundColor;
        id="主页背景3";
        gravity=主页背景3gravity;
        {
          LinearLayout,
          orientation="vertical",--布局方向
          layout_width="fill",
          id="主页搜索2外",
          --gravity="center";
          {
            LinearLayout,
            orientation="vertical",--布局方向
            layout_width="fill",
            id="主页搜索2",
            layout_height=主页搜索2高,
            gravity="center";
            {
              TextView;
              id="主页搜索CardView顶部";
              textSize="0";
              layout_gravity="center";
              layout_height=主页搜索CardViewlayout_marginTop;
            };
            {
              CardView,
              layout_width="match_parent",
              --layout_height="56dp",
              Elevation="6dp",--3dp
              radius="46dp";--8dp
              layout_marginTop=0;
              layout_margin=主页搜索CardViewlayout_margin2;
              --BackgroundColor=0x00000000;
              BackgroundColor=背景2;
              id="主页搜索CardView",
              {
                LinearLayout,
                layout_width="match_parent",
                Elevation="0";--2.5dp
                id="主页搜索LinearLayout",
                {
                  TextView,
                  textSize=文字大小2,
                  --Background=波纹2(文字);
                  hint=主页搜索hint,
                  padding=padding2,
                  paddingRight="0dp";
                  layout_width="fill",
                  textColor=文字;
                  hintTextColor=主页文字颜色2;
                  id="主页搜索",
                  layout_weight="1",--重力分配
                },
                {
                  TextView,
                  textSize=文字大小,
                  --Background=波纹2(文字);
                  text="粘贴",
                  padding=padding,
                  textColor=主页文字颜色;
                  hintTextColor=主页文字颜色2;
                  id="粘贴TextView",
                  Background=转波纹(文字);
                  onClick=function()
                    弹出搜索(true,true)
                  end,
                },
              },
            },
            {
              LinearLayout,
              orientation="horizontal",--水平方向
              layout_width="fill",
              layout_marginTop="16dp";
              id="书签和历史记录";
              {
                LinearLayout;
                layout_width='fill';--布局宽度
                layout_height="fill",
                orientation="horizontal";
                backgroundDrawable=边框(圆角大小,"#00000000",边框2,dp2px("1.5"));
                layout_marginTop="0";
                id="书签";
                layout_weight="1",--重力分配
                {
                  LinearLayout;
                  layout_width='fill';--布局宽度
                  orientation="horizontal";
                  id="书签内";
                  padding=padding,
                  {
                    ImageView;
                    layout_height=图标大小;
                    src="png/fglkg.png";
                    id="书签图标";
                    ColorFilter="#FF7C7C7C",--图片颜色
                    -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
                    layout_width=图标大小;
                    Alpha=0.5,
                  };
                  {
                    TextView,
                    textSize=文字大小,
                    --Background=波纹2(文字);
                    layout_width="fill",
                    textColor=主页文字颜色;
                    text="书签";
                    id="书签TextView",
                    layout_marginLeft=padding,
                    layout_gravity="center";
                  },
                },
              };
              {
                LinearLayout,
                orientation="horizontal",--水平方向
                layout_width="18dp",
              };
              {
                LinearLayout;
                layout_width='fill';--布局宽度
                orientation="horizontal";
                backgroundDrawable=边框(圆角大小,"#00000000",边框2,dp2px("1.5"));
                layout_marginTop="0";
                id="历史记录";
                layout_weight="1",--重力分配
                {
                  LinearLayout;
                  layout_width='fill';--布局宽度
                  orientation="horizontal";
                  id="历史记录内";
                  padding=padding,
                  {
                    ImageView;
                    layout_height=图标大小;
                    src="png/timelap.png";
                    id="历史记录图标";
                    ColorFilter="#FF7C7C7C",--图片颜色
                    -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
                    layout_width=图标大小;
                    Alpha=0.5,
                  };
                  {
                    TextView,
                    textSize=文字大小,
                    --Background=波纹2(文字);
                    layout_width="fill",
                    textColor=主页文字颜色;
                    text="历史记录";
                    id="历史记录TextView",
                    layout_marginLeft=padding,
                    layout_gravity="center";
                  },
                },
              };
            };
            {
              GridView;
              fastScrollEnabled=true;
              layout_width="fill";
              --background=背景2,
              --padding="8dp";
              clipToPadding=false;
              ScrollBarStyle=ScrollView.SCROLLBARS_OUTSIDE_OVERLAY;
              -- layout_height="40%w";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
              --这里是分割线的意思
              numColumns=4;--每排显示网格数
              id="list3";
              layout_marginTop="16dp";
              Gravity="center",
            };
          },
        };
        {
          FrameLayout;--卡片控件
          layout_width="fill";
          layout_gravity="center";
          layout_height="fill";
          id='收藏列表ScrollView外';--布局高度
          {
            ScrollView;--线性布局
            layout_width='fill';--布局宽度
            layout_height='wrap';--布局高度
            id='收藏列表ScrollView';--布局高度
            {
              LinearLayout,
              orientation="vertical",--布局方向
              layout_width="fill",
              {
                LinearLayout,
                orientation="vertical",--布局方向
                layout_width="fill",
                id='文件夹列表LinearLayout';--布局高度
                paddingTop=文件夹列表LinearLayoutpaddingTop;
                paddingBottom="-16dp";
              };
              {
                LinearLayout,
                orientation="vertical",--布局方向
                layout_width="fill",
                id='收藏列表';--布局高度
                paddingBottom="47dp";
              };
            };
          };
          {
            FrameLayout;--卡片控件
            layout_width="fill";
            id="list外",
            {
              ListView,
              id="list",
              fastScrollEnabled=true;
              layout_marginTop="0dp",
              --items={"3","2","5","5","2","7","3","2"},
              dividerHeight="0";
              layout_width="fill",
              --DividerHeight=true,--设置无隔断线
            },
          };
          {
            LinearLayout,
            orientation="horizontal",--布局方向
            layout_gravity="right";
            BackgroundColor=背景5;
            id='选择时显示的顶部菜单';--布局高度
            {
              TextView,
              textSize=文字大小,
              textColor=主页文字颜色;
              text="全不选";
              gravity="center";
              layout_height="fill";
              padding="11dp";
              Background=转波纹(文字);
              onClick=function()
                多选(false)
              end

            },
            {
              TextView,
              textSize=文字大小,
              textColor=主页文字颜色;
              text="反选";
              gravity="center";
              layout_height="fill";
              padding="11dp";
              Background=转波纹(文字);
              onClick=function()
                多选(false,true)
              end
            },
            {
              TextView,
              textSize=文字大小,
              textColor=主页文字颜色;
              text="全选";
              gravity="center";
              layout_height="fill";
              padding="11dp";
              Background=转波纹(文字);
              onClick=function()
                多选(true)
              end
            },
          };
          {
            LinearLayout,
            orientation="horizontal",--布局方向
            layout_width="fill",
            layout_gravity="bottom|center";
            layout_height="47dp";
            BackgroundColor=背景5;
            id='选择时显示的底部菜单';--布局高度
            {
              TextView,
              textSize=文字大小,
              textColor=主页文字颜色;
              text="复制";
              layout_weight="1",--重力分配
              gravity="center";
              Background=转波纹(文字);
              layout_height="fill";
              onClick=function()
                InputLayout={
                  LinearLayout;
                  orientation="vertical";
                  Focusable=true,
                  FocusableInTouchMode=true,
                  layout_width="fill";
                  id="mLinearLayout";
                };
                对话框({
                  标题="复制书签",
                  点击事件=function()
                  end,
                  是否显示取消按钮=true,
                  输入框可用=true,
                })
                内容ScrollView外.addView(loadlayout(InputLayout))
                local a=function(添加)
                  title2={}
                  bookId2={}
                  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
                  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
                    table.insert(title2,t:match("【标题】(.-)【标题】"))
                    table.insert(bookId2,t:match("【链接】(.-)【链接】"))
                  end
                  for d,是否被选 in pairs(待操作列表) do
                    if 是否被选 then
                      local 标题=title2[d]
                      链接=bookId2[d]
                      添加(标题,链接)
                    end
                  end
                end
                mLinearLayout.addView(选择保存目录弹窗(
                a,
                a,
                nil,nil,nil,
                a))
              end
            },
            {
              TextView,
              textSize=文字大小,
              textColor=主页文字颜色;
              text="移动";
              gravity="center";
              layout_weight="1",--重力分配
              layout_height="fill";
              Background=转波纹(文字);
              onClick=function()
                InputLayout={
                  LinearLayout;
                  orientation="vertical";
                  Focusable=true,
                  FocusableInTouchMode=true,
                  layout_width="fill";
                  id="mLinearLayout";
                };
                对话框({
                  标题="移动书签",
                  点击事件=function()
                  end,
                  是否显示取消按钮=true,
                  输入框可用=true,
                })
                内容ScrollView外.addView(loadlayout(InputLayout))
                local a=function(添加)
                  title2={}
                  bookId2={}
                  内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
                  for t,c in 内容:gmatch("【项目】(.-)【项目】") do
                    table.insert(title2,t:match("【标题】(.-)【标题】"))
                    table.insert(bookId2,t:match("【链接】(.-)【链接】"))
                  end
                  for d,是否被选 in pairs(待操作列表) do
                    if 是否被选 then
                      local 标题=title2[d]
                      链接=bookId2[d]
                      添加(标题,链接)
                    end
                  end
                  删除(nil,nil,true)
                end
                mLinearLayout.addView(选择保存目录弹窗(
                a,
                a,
                nil,nil,nil,
                a))
              end
            },
            {
              TextView,
              textSize=文字大小,
              textColor=主页文字颜色;
              text="删除";
              layout_weight="1",--重力分配
              gravity="center";
              layout_height="fill";
              Background=转波纹(文字);
              onClick=function()
                对话框({
                  标题="是否删除",
                  点击事件=function()
                    删除(nil,nil,是否多选)
                  end,
                  文本内容="是否删除这些内容",
                })
              end,
            };
          };
        };
      };
      {
        LinearLayout,
        id="悬浮工具栏设置与教程卡片外",
        layout_gravity="bottom";
        layout_width="fill",
      };
    },
  }

  listlayout=(loadlayout(listlayout))
  隐藏控件(选择时显示的顶部菜单)
  隐藏控件(选择时显示的底部菜单)
  if io.open("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml"):read("*a")=="大圆角" then
    控件边框(主页搜索CardView,heightt/2,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
   elseif io.open("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml"):read("*a")=="圆角大小" then
    控件边框(主页搜索CardView,圆角大小,"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
   else
    控件边框(主页搜索CardView,io.open("/data/data/"..activity.getPackageName().."/主页搜索栏圆角.xml"):read("*a"),"#00000000",边框2,dp2px("1.5"))--id，度数，内框透明，边框颜色
  end
  if #title2>0 then
    tittled.text="正在显示"
  end
  if 主页链接=="仅搜索栏" and (title=="书签")==false and (title=="历史记录")==false then
    隐藏控件(收藏列表ScrollView外)
  end
  task(1,function()
    if (title=="书签")==false and (title=="历史记录")==false then--判断是否主页
      if 主页链接=="收藏" or 主页链接=="收藏带搜索栏" then
        a=true
       elseif 主页链接=="仅搜索栏" then
        隐藏控件(主页搜索CardView顶部)
        if 是否悬浮窗 then
         else
          书签内.onClick=function()
            打开书签()
          end
          历史记录内.onClick=function()
            打开历史()
          end
        end
      end
      if 是否悬浮窗 then
        adpd悬浮窗=adpd2
       else
        adpd=adpd2
      end
     elseif (title=="书签") then
      a=true
     elseif (title=="历史记录") then

      tittled.text="没有历史记录"
      a=true
    end


    item={
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
          LinearLayout,
          layout_width='22dp';
          id="列表按钮左距LinearLayout",
          Visibility=View.GONE,
        };
        {
          ImageView;
          layout_width='22dp';
          layout_height='22dp';
          layout_gravity='left|center';
          layout_margin='10dp';
          layout_marginLeft='18dp';
          id='Image2';
          ColorFilter=0xFF74A8FF;--设置图片着色
          Alpha=0.5,
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
    item书签=item
    if #title2>0 and (title=="书签") or (title=="历史记录") then
      文件夹内容弹窗是否正在显示=false

      function 文件夹内容弹窗(文件夹内容,v,d)
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
              layout_width="fill";
              layout_height="-1";
              layout_margin="18dp";
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

          pop.onDismiss=function()
            --消失事件
            --文件夹内容弹窗是否正在显示=false
          end
          if 文件夹内容==nil or 文件夹内容=={} then
           else
            隐藏控件(没有书签)
            local function adapterData(data)
              adpd={}
              for d in pairs(data) do
                table.insert(adpd,{
                  text={
                    Text=tostring(data[d][1]),
                  },
                  列表按钮较暗色背景={
                    Visibility=View.VISIBLE,
                  },
                  icd={
                    Visibility=View.VISIBLE,
                  },
                  Image2={
                    src=图标,
                    ColorFilter=0xFF74A8FF,
                  }
                })
              end
              return adpd
            end
            adpd={}
            local adpd=adapterData(文件夹内容)
            local items=LuaAdapter(this,adpd,item)
            Popup_list.Adapter=items
            items=nil
            local function 书签和历史记录列表按钮点击事件(d)
              if 是否悬浮窗 then
                悬浮窗webView.loadUrl(文件夹内容[d][2])
                关闭a()
               else
                view.loadUrl(文件夹内容[d][2])
                if 书签背景外 then
                  隐藏控件(书签背景外)
                end
              end
            end
            Popup_list.setOnItemClickListener(AdapterView.OnItemClickListener{
              onItemClick=function(parent,v,pos,id)
                if name=="历史记录保存" then
                  书签和历史记录列表按钮点击事件(id)
                  --elseif id<=table.size(文件夹内容) then
                  --文件夹内容弹窗(文件夹列表[id][2],v,id)
                 else
                  书签和历史记录列表按钮点击事件(id--[[-table.size(文件夹内容)]])
                  mid=id
                  local 内容=string2tab(io.open("/data/data/"..activity.getPackageName().."/阅读位置储存.xml"):read("*a"))
                  mScrollY=内容["folder"][d-1][id]
                  当前正在查看的页面的id={id,d}
                end
              end,
            })
            Popup_list.onItemLongClick=function(parent,v,pos,id)
              --[[if id<=table.size(文件夹列表) then
                local d=id
                文件夹长按菜单(id,v)
               else]]
              local d=id-table.size(文件夹列表)
              书签长按菜单(title2[d],bookId2[d],v,false,d,text2)
              --end
            end
            --[[for i=1,#文件夹内容 do
                --是否有书签=true
                Popup_list2.addView(loadlayout(item书签))
                text.Text=tostring(文件夹内容[i][1])
                local text2=text
                列表按钮.onClick=function()
                  pop.dismiss()
                  local s=文件夹内容[i][2]
                  if 目前页面=="主页" then
                    viewy.loadUrl(s)
                    if 书签背景外 then
                      隐藏控件(书签背景外)
                    end
                   else
                    activity.result{s}
                  end
                end
                列表按钮.onLongClick=function(v)
                  书签长按菜单(文件夹内容[i][1],文件夹内容[i][2],v,false,i,text,true,d,列表按钮)
                end
                波纹({列表按钮},"方",文字)
              end]]
          end
          pop.showAsDropDown(v)
        end
      end
      function adapterData(data,文件夹列表,icdChecked,是否为反选)
        adpd={}
        if name~="历史记录保存" then
          for i=1,#文件夹列表 do
            table.insert(adpd,{
              text={
                Text=tostring(文件夹列表[i][1]),
              },
              列表按钮较暗色背景={
                Visibility=View.GONE,
              },
              Image2={
                src="png/folder_open_black.png",
                ColorFilter=0xFFFFCA6A,
              }
            })
          end
        end
        for d in pairs(data) do
          table.insert(adpd,{
            text={
              Text=tostring(data[d]),
            },
            列表按钮较暗色背景={
              Visibility=View.VISIBLE,
            },
            icd={
              Visibility=View.VISIBLE,
            },
            Image2={
              src=图标,
              ColorFilter=0xFF74A8FF,
            }
          })
        end
        return adpd
      end
      adpd={}
      local adpd=adapterData(title2,文件夹列表)
      local items=LuaAdapter(this,adpd,item)
      list.Adapter=items
      items=nil
      function 书签和历史记录列表按钮点击事件(d)
        if 是否悬浮窗 then
          悬浮窗webView.loadUrl(bookId2[d])
          关闭a()
         else
          viewy.loadUrl(bookId2[d])
          if 书签背景外外外.Visibility==View.VISIBLE then
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
        end
      end
      function 设置点击事件()
        list.setOnItemClickListener(AdapterView.OnItemClickListener{
          onItemClick=function(parent,v,pos,id)
            if name=="历史记录保存" then
              书签和历史记录列表按钮点击事件(id)
             elseif id<=table.size(文件夹列表) and 名称=="网页收藏" then
              文件夹内容弹窗(文件夹列表[id][2],v,id+1)
             else
              书签和历史记录列表按钮点击事件(id-table.size(文件夹列表))
              local 内容=string2tab(io.open("/data/data/"..activity.getPackageName().."/阅读位置储存.xml"):read("*a"))
              mid=id
              mScrollY=内容[id]
              当前正在查看的页面的id={id,收藏分类.root}
            end
          end,
        })
        list.onItemLongClick=function(parent,v,pos,id)
          if id<=table.size(文件夹列表) and 名称=="网页收藏" then
            文件夹长按菜单(id,v,v.Tag.text.text)
           else
            local d=id-table.size(文件夹列表)
            书签长按菜单(title2[d],bookId2[d],v,false,d,text2)
          end
        end
      end
      设置点击事件()
      --adpd2=adapterData(title2,bookId2,文件夹列表)
      滑动显示隐藏操作栏=io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")
      if 滑动显示隐藏操作栏=="打开" then
        width,height=getwh(主页搜索2)
        --linearParams = 主页搜索2.getLayoutParams()
        主页搜索2height = height
        width,height=getwh(主页背景3)
        主页背景3height = height
        记录=0
        function 刷新()
          task(100,function()
            if 是否正在查看布局页面 then--判断是否主页
              if 记录==0
                --同理设置高度
                linearParams = 主页搜索2.getLayoutParams()
                linearParams.height =主页搜索2height
                主页搜索2.setLayoutParams(linearParams)
                显示控件2(底部栏2)
               elseif 记录<收藏列表ScrollView.getScrollY() and 收藏列表ScrollView.getScrollY()-记录>dp2px(50)
                --隐藏控件(mToolbar3)
                if 是否在主页显示搜索栏=="打开"
                  --同理设置高度
                  linearParams = mToolbar3.getLayoutParams()
                  linearParams.height =dp2px(16)
                  mToolbar3.setLayoutParams(linearParams)
                 else
                  隐藏控件2(主页搜索2)
                end
                隐藏控件2(底部栏2)
               elseif 记录>收藏列表ScrollView.getScrollY() and 记录-收藏列表ScrollView.getScrollY()>dp2px(50)
                if 动画是否正在执行 then
                 else
                  --同理设置高度
                  linearParams = 主页搜索2.getLayoutParams()
                  linearParams.height =主页搜索2height
                  主页搜索2.setLayoutParams(linearParams)
                  显示控件2(底部栏2)
                  --相关参数，请自行手册查询
                  --定义动画,500为上升高度。
                  yuxuandh3=TranslateAnimation(0,0,-主页搜索2height,0)
                  --动画时间，也就是上升动画的快慢
                  yuxuandh3.setDuration(150)
                  yuxuandh3.setRepeatCount(0)
                  --动画开始执行
                  主页搜索2外.startAnimation(yuxuandh3);
                  --动画开始执行
                  --收藏列表ScrollView.startAnimation(yuxuandh3);

                  动画是否正在执行=true
                  task(500,function()
                    动画是否正在执行=false
                  end)
                  --动画结束回调
                  --相关参数，请自行手册查询
                  --定义动画,500为上升高度。
                  yuxuandh3=TranslateAnimation(0,0,dp2px(44),0)
                  --动画时间，也就是上升动画的快慢
                  yuxuandh3.setDuration(150)
                  yuxuandh3.setRepeatCount(0)
                  --动画开始执行
                  底部栏2.startAnimation(yuxuandh3);
                end
              end
              记录=收藏列表ScrollView.getScrollY()
              tittled2.text=(tostring(记录))
            end
            刷新()
          end)
        end
      end
      --[[if (activity.Title=="书签")==false and (activity.Title=="历史记录")==false then--判断是否主页
        滑动显示隐藏操作栏=io.open("/data/data/"..activity.getPackageName().."/滑动显示隐藏操作栏.xml"):read("*a")
        if 滑动显示隐藏操作栏=="打开"
          刷新()
        end
      end]]
      --控件不可视
      tittled.setVisibility(View.INVISIBLE)
     else
      if (title=="书签")==false and (title=="历史记录")==false then--判断是否主页
        if 主页链接=="仅搜索栏" then
          --控件不可视
          tittled.setVisibility(View.INVISIBLE)
         else
          --控件可视
          tittled.setVisibility(View.VISIBLE)
        end
       else
        --控件可视
        tittled.setVisibility(View.VISIBLE)
      end
    end
  end)
  波纹({
    主页搜索LinearLayout,
    书签内,
    历史记录内,
  },"方",文字)
  if activity.getWidth()<activity.getHeight() then
    圆环大小=activity.getWidth()/100*12
    圆环大小2="12%w"
   else--info=land
    圆环大小=activity.getHeight()/100*12
    圆环大小2="12%h"
  end
  function 刷新主页项目()
    主页itemc={
      LinearLayout,
      --layout_width='-1';
      layout_height=高度;
      orientation="vertical",--布局方向
      Gravity="center",
      -- onTouchListener=点击监听,--动画效果

      --   onTouchListener=点击监听,--动画效果
      {
        LinearLayout,
        layout_width=圆环大小2;
        layout_height=圆环大小2,
        layout_Gravity="center",
        Gravity="center",
        id="CardView",
        backgroundDrawable=边框(圆环大小/2,"#00000000",边框2,dp2px("1.5"));
        gravity="center";
        {
          TextView;
          -- colorFilter=0xFFffffff;
          --layout_gravity="center";
          textSize="12sp";
          textColor=主页文字颜色;
          --   Typeface=字体("Product");
          id="图标";
          Gravity="center",
          MaxEms=1,
          MaxLines=1,
        };
      };
      {
        TextView;
        -- colorFilter=0xFFffffff;
        text=activity.Title;
        layout_gravity="center";
        textSize="12sp";
        textColor=主页文字颜色;
        --   Typeface=字体("Product");
        id="text";
        Gravity="center",
        paddingTop="5dp";
        padding="8dp",
        MaxLines=1,
      };
    };
    主页项目=nil
    主页项目=io.open("/data/data/"..activity.getPackageName().."/主页项目.xml"):read("*a")
    if 主页项目=="" or 主页项目==nil then
     else
      是否恢复之前的书签=io.open("/data/data/"..activity.getPackageName().."/是否恢复之前的书签.xml"):read("*a")
      if 是否恢复之前的书签=="打开" then
        pcall(function()
          主页项目2=string2tab(主页项目)
          for d,链接 in pairs(主页项目2) do
            主页项目=主页项目..获取内容(d,链接)
          end
          写入文件("/data/data/"..activity.getPackageName().."/主页项目.xml",主页项目)
        end)
        写入文件("/data/data/"..activity.getPackageName().."/是否恢复之前的书签.xml","关闭")
        主页项目=io.open("/data/data/"..activity.getPackageName().."/主页项目.xml"):read("*a")
      end
    end
    if (title=="书签")==false and (title=="历史记录")==false and 主页链接=="仅搜索栏" then--判断是否主页
      --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
      主页项目datas={}

      --创建了三个有数据的列表
      图片列表={"png/tbs.png","png/fglkg.png","png/timelap.png","png/style_black.png","png/palette_black.png","png/tune_black.png","png/lou.png"}
      if 主页项目=="" or 主页项目==nil then
       else
        主页项目5={}
        mmp={}

        --循环添加匹配有数据的列表到
        --nj只是一个变量，你可以用其他变量代替
        --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
        --就相当于  for  1,3   do
        for t,c in 主页项目:gmatch("【项目】(.-)【项目】") do
          --给空的datas添加所有的数据
          --格式为  table.insert(空列表名称,{id=数据列表[nj]})
          table.insert(主页项目datas,{text=t:match("【标题】(.-)【标题】"),图标=t:match("【标题】(.-)【标题】"),srcb=t:match("【链接】(.-)【链接】")})
          主页项目5[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
        end

        --print(dump(主页项目5))
        --
        --创建适配器，将datas里面的数据匹配给itemc小项目
        yuxuan_adpqy=LuaAdapter(activity,主页项目datas,主页itemc)

        --将小项目匹配给大list
        list3.Adapter=yuxuan_adpqy
        --菜单点击事件
        list3.setOnItemClickListener(AdapterView.OnItemClickListener{
          onItemClick=function(parent, v, pos,id)
            local 标题文本=v.Tag.text.Text
            if 是否悬浮窗 then
              悬浮窗webView.loadUrl(主页项目5[标题文本])
             else
              view.loadUrl(主页项目5[标题文本])
            end
            内容=string2tab(io.open("/data/data/"..activity.getPackageName().."/阅读位置储存.xml"):read("*a"))
            mid=id
            b=内容["homepage"]
            mScrollY=b[id]
            当前正在查看的页面的id={id,收藏分类.homepage}
          end,
        })
        list3.onItemLongClick=function(l,v,p,i)
          local 标题文本=v.Tag.text.Text
          --书签长按菜单(标题文本,主页项目5[标题文本],v,true)
          书签长按菜单(标题文本,主页项目5[标题文本],v,true,标题文本,v.Tag.标题)

        end
        list333=list3
      end
    end
  end
  刷新主页项目()
end

