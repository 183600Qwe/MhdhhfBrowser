右菜单布局="layout/zhuye/huadongcaidan"
if 打开滑动菜单所需的按钮显示位置=="center|left" then
  右菜单右承载器.addView(loadlayout(右菜单布局))
 else
  右菜单左承载器.addView(loadlayout(右菜单布局))
end
隐藏控件(右菜单)



--[[function 只显示要显示的内容(id2)
  --print(1)
  for k,v in pairs(id列表) do
    if id2==v then
      显示控件(v)
     elseif (v.Visibility==View.VISIBLE) then
      隐藏控件(v)
    end
  end
  if 是否为多窗口2==true then
    显示控件(滑动菜单多窗口list)
    隐藏控件(右菜单菜单LinearLayout)
   elseif 是否为多窗口2==false then
    显示控件(右菜单菜单LinearLayout)
    隐藏控件(滑动菜单多窗口list)
   else
    隐藏控件(右菜单菜单LinearLayout)
    隐藏控件(滑动菜单多窗口list)
  end
end]]
--下面的这个比上面更快一些
--但是如果之前有多个控件同时显示的话这个只能隐藏最后一个
--上面的就不需要担心这个问题
function 只显示要显示的内容(id2)
  if id8 then
    隐藏控件(id8)
  end
  id8=id2
  显示控件(id8)
end
--[[d=loadlayout({
    LinearLayout,
    orientation="horizontal",
    layout_width='fill';
    --id="mLinearLayout",
    {
      LinearLayout,
      orientation="horizontal",
      layout_width='fill';
      id="mLinearLayout",
    };
  })]]
--[[local function 添加项目(b)
    if 类型==图标型 then
      标题.Text=tostring(文件夹内容)
     else
      标题.Text=tostring(d)
    end
    图标.ColorFilter=文字123
    --设置的图片也可以输入路径
    --Image2.setImageBitmap(loadbitmap("png/folder_open_black.png"))
    波纹({列表按钮内},"方",文字) 隐藏控件(TextView图标)
  end
  function 工具滑动菜单添加项目()
  end]]
local function 设置滑动菜单(
  id,
  列表,
  id2,
  事件,
  点击事件,--有时为下滑
  长按事件,
  是否滑动菜单,
  是否为多窗口,
  id3,
  点击事件2
  )

  状态=false
  if 是否滑动菜单 then
    隐藏控件(右菜单菜单工具箱GridView)
    状态=false
    隐藏控件(右菜单)
    id.onLongClick=function()
      长按事件()
      状态5=true
      task(500,function()
        状态5=false
      end)
    end
    --[[id.onClick=function(v,event)

    end]]
    w2=dp2px(30)
    if 打开滑动菜单所需的按钮显示位置=="center|left" then
      idgetX=打开滑动菜单所需的按钮距离屏幕左侧边缘的距离2
     else
      idgetX=AWidth-打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2-w2
    end
    local idgetY=id.getY()
    --这个不是手指挪到一个按钮再松开来打开项目的代码
    --之后的那个才是
    id.onClick=function()
      if not(状态5) then
        点击事件2()
        --print(12)
      end
    end
    --是否为多窗口2=是否为多窗口
    --右菜单w,右菜单h=getwh(右菜单)
    id.onTouch=function(v,event)
      if event.getAction()==MotionEvent.ACTION_DOWN then
        downX2 = event.getRawX()
        downY2 = event.getRawY()
        --y=event.getY()+idgetY
        --print(downY2,y,idgetY)
        --状态=true
        --是否为多窗口2=是否为多窗口
        --if (右菜单.Visibility==View.GONE) then
        只显示要显示的内容(id2)
        --end
       elseif event.getAction()==MotionEvent.ACTION_MOVE then
        --[[moveX = event.getRawX()
        moveY = event.getRawY()
        downX = moveX
        downY = moveY]]
        downX = event.getRawX()
        downY = event.getRawY()
        --if event.getY()+idgetY-y<-1 or downX>idgetY then
        --状态=false
        --end
        --downY2:最初的downY
        --print(1)
        if downX>idgetX+w2 and (downY)<(downY2+dp2px(64)) then
          震动(20)
          if 打开滑动菜单所需的按钮显示位置~="center|left" then
            网页前进()
           else
            网页后退()
          end
         elseif downY>downY2+tointeger(菜单CardViewWidth/21) and not 状态5 then
          --下滑事件
          import "android.content.Context"
          震动(25)
          点击事件()
          隐藏控件(右菜单)
          状态5=true
          task(200,function()
            状态5=false
          end)
        end
       elseif event.getAction()==MotionEvent.ACTION_UP then
        --print(idgetX,downX)
        --w2,h2=getwh(id)
        -- print((downY),(idgetY+dp2px(88)))
        --local 状态3=true
        --状态=false
        --状态2=false
        downY2=nil
        downY=nil
      end
    end
   else
    w2=dp2px(30)
    if 打开滑动菜单所需的按钮显示位置=="center|left" then
      local idgetX=打开滑动菜单所需的按钮距离屏幕左侧边缘的距离2
     else
      local idgetX=AWidth-打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2-w2
    end
    --LinearLayout2H=getwh(LinearLayout2)
    idgetY=id.getY()
    id.onTouch=function(v,event)
      if event.getAction()==MotionEvent.ACTION_DOWN then
        是否为多窗口2=是否为多窗口
        只显示要显示的内容(id2)
        w,h=getwh(右菜单外)
        右菜单x=(activity.width-w-打开滑动菜单所需的按钮距离屏幕右侧边缘的距离2-w2)
        右菜单y=(AHeight-h)/2
        downX = event.getRawX()
        downX2 = downX
        downY = event.getRawY()
        y=event.getY()+idgetY
        显示控件(右菜单)
        状态=true
        task(200,function()
          if 状态 then
            状态2=true
            if 长按事件~=false then
              长按事件()
              隐藏控件(右菜单)
            end
          end
        end)

       elseif event.getAction()==MotionEvent.ACTION_MOVE then
        --[[moveX = event.getRawX()
        moveY = event.getRawY()
        downX = moveX
        downY = moveY]]
        downX = event.getRawX()
        downY = event.getRawY()
        if event.getY()+idgetY-y<-1 or downX>idgetY then
          状态=false
        end
       elseif event.getAction()==MotionEvent.ACTION_UP then
        --print(downX-右菜单.x)
        隐藏控件(右菜单)
        --print((downY),(idgetY+dp2px(88)))
        if downX>idgetX and (downX-idgetX)>(w2) then
          if 打开滑动菜单所需的按钮显示位置~="center|left" then
            网页前进()
           else
            网页后退()
          end
         else
          local 状态3=true
          --右菜单x=idgetX
          if downX2-downX<菜单CardViewWidth/2.5 and downX2-downX>w2 then
            --手松开并落到相应的位置执行事件
            事件(tonumber(string.sub(tostring((downY-(右菜单y-dp2px(16)))/dp2px(36)),1,1)))
           else
            if 状态2 then
             elseif 状态3 then
              if 点击事件 then
                点击事件()
              end
            end
          end
          状态=false
          状态2=false
        end
      end
      return true
    end
  end
end
width,height=getwh(右菜单)
if 常用网页滑动菜单=="打开" or 滑动菜单模式=="打开" then
  loadlayout(主页itemc2)
  local item={
    LinearLayout,
    orientation="horizontal",
    --layout_width="fill",
    layout_height="36dp";
    id="列表按钮",
    {
      ImageView;
      src="png/fglkg.png";
      layout_width='22dp';
      layout_height='22dp';
      layout_margin='8dp';
      layout_marginLeft='15dp';
      id='Image2';
      ColorFilter=转0x(一般强调色);--设置图片着色
    };
    {
      TextView,
      id="text",
      textColor=文字;
      textSize="12sp",
      singleLine=true;
      layout_marginLeft="8dp";
      layout_marginRight='15dp';
      layout_gravity="center",
      --MaxLines=2,
    },
  }
  主页项目datas={}
  主页项目5={}
  for t,c in 主页项目:gmatch("【项目】(.-)【项目】") do
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(主页项目datas,{text=t:match("【标题】(.-)【标题】"),图标=t:match("【标题】(.-)【标题】"),srcb=t:match("【链接】(.-)【链接】")})
    主页项目5[t:match("【标题】(.-)【标题】")]=t:match("【链接】(.-)【链接】")
  end
  --
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,主页项目datas,item)

  --将小项目匹配给大list
  右菜单GridView.Adapter=yuxuan_adpqy
  设置滑动菜单(ftb2,nil,右菜单GridView,function(项目)
    mmp={}
    local 次数=0


    --循环添加匹配有数据的列表到
    --nj只是一个变量，你可以用其他变量代替
    --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
    --就相当于  for  1,3   do
    for d,链接 in pairs(主页项目5) do
      次数=次数+1
      if 次数==项目 then
        view.loadUrl(主页项目5[d])
      end
    end
    end,function()
    打开书签()
    end,function()
    保存收藏(view.title,view.Url)
  end,nil)
 else
  隐藏控件(ftb2)
end
滑动菜单工具=io.open("/data/data/"..activity.getPackageName().."/滑动菜单工具.xml"):read("*a")
if 滑动菜单工具=="" or 滑动菜单工具==nil then
 else
  滑动菜单工具=string2tab(滑动菜单工具)
  if 工具滑动菜单=="打开" or 滑动菜单模式=="打开" then
    datas={}
    for d,名称 in pairs(滑动菜单工具) do
      --给空的datas添加所有的数据
      local 项目编号=(table.find(mmpqwe,名称) or table.find(mmpe,名称))
      table.insert(datas,{text=名称,图标=aw3工具箱[项目编号],TextView图标={Visibility=View.VISIBLE}})
      if not 项目编号 then
        table.insert(datas,{text=名称,图标="png/a",TextView图标={Visibility=View.VISIBLE}})
      end
    end
    --
    --创建适配器，将datas里面的数据匹配给itemc小项目
    yuxuan_adpqy=LuaAdapter(activity,datas,主页itemc2)

    --将小项目匹配给大list
    右菜单工具GridView.Adapter=yuxuan_adpqy
    设置滑动菜单(常用工具ftb2,滑动菜单工具,右菜单工具GridView,function(项目)
      mmp={}
      次数=0
      项目=(项目 or 0)+1
      --循环添加匹配有数据的列表到
      --nj只是一个变量，你可以用其他变量代替
      --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
      --就相当于  for  1,3   do
      for d,a in pairs(滑动菜单工具) do
        次数=次数+1
        if 次数==项目 then
          项目2=项目

          浏览器菜单(a,false,常用工具ftb2,true)--LinearLayout2
        end
      end
    end,nil,false)
   else
    隐藏控件(常用工具ftb2)
  end
end


if 菜单滑动菜单=="打开" or 滑动菜单模式=="打开" then
  是否删除掉一部分滑动菜单的菜单=io.open("/data/data/"..activity.getPackageName().."/是否删除掉一部分滑动菜单的菜单.xml"):read("*a")
  if 是否删除掉一部分滑动菜单的菜单=="打开" then
    mmpqwe滑动菜单={"历史记录","下载管理","暗色模式","设置","退出"}
   else
    aw3菜单={"png/fhvpfxgj.png","png/bookmarks_black.png","png/timelap.png","png/gnjs2x.png","png/settings.png","png/inbox_black.png","png/highlight_off_black.png"}
  end
  table.insert(mmpqwe滑动菜单,"刷新网页")
  --table.insert(mmpqwe滑动菜单,"搜索")
  table.insert(mmpqwe滑动菜单,"网页信息")
  table.insert(mmpqwe滑动菜单,"主页")
  --table.remove(mmpqwe滑动菜单,8)
  if 是否删除掉一部分滑动菜单的菜单=="打开" then
    aw3菜单={"png/timelap.png","png/gnjs2x.png","png/black.png","png/settings.png","png/highlight_off_black.png"}
   else
    local aw3菜单2=table.clone(aw3菜单)
    --table.remove(aw3菜单2,8)
    local aw3菜单=table.clone(aw3菜单2)

  end
  --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
  datas={}

  --创建了三个有数据的列表
  aic={}
  --循环添加匹配有数据的列表到
  --nj只是一个变量，你可以用其他变量代替
  --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
  --就相当于  for  1,3   do
  for nj=1,#mmpqwe滑动菜单 do
    if aw3菜单[nj] then
      图片=aw3菜单[nj]
     else
      for d2,文件夹内容2 in pairs(mmpe) do
        if 文件夹内容2==mmpqwe滑动菜单[nj] then
          图片=aw3工具箱[d2]
        end
      end
    end
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{图标=图片,text=mmpqwe滑动菜单[nj]})
  end
  --
  --table.insert(datas,{图标=aw3菜单2[nj],标题={text=mmpqwe2[nj]}})
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,主页itemc2)

  --将小项目匹配给大list
  右菜单菜单GridView.Adapter=yuxuan_adpqy
  function 事件(项目)
    浏览器菜单(项目,false,常用工具ftb2,true)--LinearLayout2
  end
  右菜单菜单GridView.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      隐藏控件(右菜单)
      事件(v.Tag.text.Text)
  end})
  右菜单菜单GridView.onItemLongClick=工具长按菜单
  右菜单菜单工具箱GridView.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      隐藏控件(右菜单)
      事件(v.Tag.text.Text)
  end})
  右菜单菜单工具箱GridView.onItemLongClick=工具长按菜单

  设置滑动菜单(菜单ftb2,mmpqwe滑动菜单,右菜单菜单LinearLayout,function(_)


    --浏览器菜单(项目,false,常用工具ftb2,true)--LinearLayout2
    end,function()
    弹出搜索(true)
    end,function()
    显示控件(右菜单)
    显示控件(右菜单菜单工具箱GridView)
    隐藏控件(右菜单菜单GridView)
    --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
    datas={}

    --创建了三个有数据的列表
    aic={}
    --循环添加匹配有数据的列表到
    --nj只是一个变量，你可以用其他变量代替
    --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
    --就相当于  for  1,3   do
    无图模式=io.open("/data/data/"..activity.getPackageName().."/无图模式.xml"):read("*a")
    for nj=1,#mmpe do
      if aw3工具箱[nj] then
        图片=aw3工具箱[nj]
       else
        for d2,文件夹内容2 in pairs(mmpe) do
          if 文件夹内容2==列表[nj] then
            图片=aw3工具箱[d2]
          end
        end
      end
      if mmpe[nj]=="刷新网页" then
       elseif mmpe[nj]=="网页后退" then
       elseif mmpe[nj]=="网页前进" then
       elseif mmpe[nj]=="新建窗口" then
       elseif mmpe[nj]=="搜索" then
       elseif mmpe[nj]=="网页信息" then
       elseif mmpe[nj]=="主页" then
       elseif mmpe[nj]=="无痕模式" and 无痕模式=="打开" then
        table.insert(datas,{图标={src=aw3工具箱[nj],ColorFilter=转0x(一般强调色)},text={text=mmpe[nj]},TextView图标={Visibility=View.GONE}})
       elseif mmpe[nj]=="页内查找" and 页内查找CardView.Visibility==View.VISIBLE then
        table.insert(datas,{图标={src=aw3工具箱[nj],ColorFilter=转0x(一般强调色)},text={text=mmpe[nj]},TextView图标={Visibility=View.GONE}})
       elseif mmpe[nj]=="无图模式" and 无图模式=="打开" then
        table.insert(datas,{图标={src=aw3工具箱[nj],ColorFilter=转0x(一般强调色)},text={text=mmpe[nj]},TextView图标={Visibility=View.GONE}})
       else
        --给空的datas添加所有的数据
        --格式为  table.insert(空列表名称,{id=数据列表[nj]})
        table.insert(datas,{图标=图片,text={text=mmpe[nj]}})
      end
    end
    --
    --table.insert(datas,{图标=aw3菜单2[nj],标题={text=mmpqwe2[nj]}})
    --创建适配器，将datas里面的数据匹配给itemc小项目
    yuxuan_adpqy=LuaAdapter(activity,datas,主页itemc2)

    --将小项目匹配给大list
    右菜单菜单工具箱GridView.Adapter=yuxuan_adpqy

    end,true,false,nil,function()
    隐藏控件(右菜单菜单工具箱GridView)
    显示控件(右菜单菜单GridView)
    if (右菜单.Visibility==View.GONE) then
      显示控件(右菜单)
      --[[设置动画的属性
              
              w,h=getwh(右菜单)
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(100)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  右菜单外.startAnimation(透明动画)
  --上升动画
  --相关参数，请自行手册查询
  
  --定义动画,500为上升高度。
  yuxuandh3=TranslateAnimation(0,0,右菜单.y+dp2px(20),0)
  --动画时间，也就是上升动画的快慢
  yuxuandh3.setDuration(100)
  --动画开始执行
  右菜单外2.startAnimation(yuxuandh3);]]
     else
      隐藏控件(右菜单)
    end
  end)
  aw3菜单=aw3菜单2
 else
  隐藏控件(菜单ftb2)
end
是否为多窗口=nil
if 多窗口滑动菜单=="打开" or 滑动菜单模式=="打开" then
  设置滑动菜单(多窗口ftb2,{},滑动菜单多窗口list,function(项目)
    end,function()
    if 上一个窗口id then
      webviewp:select(上一个窗口id)
    end
    end,function()
    webviewp:openNewUrl()
    end,true,true,nil,function()
    if (右菜单.Visibility==View.GONE) then
      显示控件(右菜单)
      --[[设置动画的属性
              
              w,h=getwh(右菜单)
  透明动画=AlphaAnimation(0,1)
  透明动画.setDuration(100)--设置动画时间
  透明动画.setFillAfter(true)--设置动画后停留位置
  透明动画.setRepeatCount(0)--设置无限循环
  --绑定动画
  右菜单外.startAnimation(透明动画)
  --上升动画
  --相关参数，请自行手册查询
  
  --定义动画,500为上升高度。
  yuxuandh3=TranslateAnimation(0,0,右菜单.y+dp2px(20),0)
  --动画时间，也就是上升动画的快慢
  yuxuandh3.setDuration(100)
  --动画开始执行
  右菜单外2.startAnimation(yuxuandh3);]]
     else
      隐藏控件(右菜单)
    end
  end)
  滑动菜单多窗口list.Adapter=adp
  滑动菜单多窗口list.onItemClick=function(_,_,_,l)
    webviewp:select(l)
    隐藏控件(右菜单)
  end

  滑动菜单多窗口list.onItemLongClick=function(_,_,_,l)
    窗口切换长按菜单(l,v)
  end
 else
  隐藏控件(多窗口ftb2)
end
