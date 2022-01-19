if a=="按照日期查找" then
  InputLayout={
    LinearLayout,
    orientation="vertical",
    layout_width="fill";
    {
      DatePicker;
      id="myDatePicker";
    };
    {
      HorizontalListView;
      layout_width="fill";
      id="myHorizontalListView";
      layout_height="56dp";
    };
  };
  对话框({
    标题="选择日期",
    是否显示取消按钮=true,
    对话框布局=loadlayout(InputLayout),
  })
  local itema={
    TextView,
    id="text",
    textColor=文字;
    textSize="16sp",
    padding="16dp",
    gravity="center",
    layout_width="56dp";
    layout_height="56dp";
  }
  local datas={
    {text="年"},
    {text="月"},
    {text="日"},
  }
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,itema)

  --将小项目匹配给大list
  myHorizontalListView.Adapter=yuxuan_adpqy
  myHorizontalListView.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      关闭对话框a()
      local a=datas[id].text
      结果列表={}
      if a=="年" then
        local 年=tostring(myDatePicker.getYear())--获取选择的年份
        for d,a in pairs(时间表) do
          if string.sub(a,1,4)==年 then
            table.insert(结果列表,list.Adapter.Data[d])
          end
        end
       elseif a=="月" then
        local 月=myDatePicker.getMonth()+1--获取选择的月份
        for d,a in pairs(时间表) do
          if tointeger(string.sub(a,6,7))==月 then
            table.insert(结果列表,list.Adapter.Data[d])
          end
        end
       elseif a=="日" then
        local 日=myDatePicker.getDayOfMonth()--获取选择的天数
        for d,a in pairs(时间表) do
          if tointeger(string.sub(a,9,10))==日 then
            table.insert(结果列表,list.Adapter.Data[d])
          end
        end
      end
      --print(dump(结果列表))
      a={}
      st=(loadlayout("layout/anzhaoriqichazhao",a))
      a.标题栏承载器.addView(loadlayout(获取标题栏("按照日期查找",a.设置背景外,"按照日期查找")))--添加控件
      主页.addView(st)--添加控件
      页面列表["按照日期查找"]=true
      --创建适配器，将datas里面的数据匹配给itemc小项目
      yuxuan_adpqy=LuaAdapter(activity,结果列表,item)

      --将小项目匹配给大list
      a.设置list.Adapter=yuxuan_adpqy
      a.设置list.setOnItemClickListener(AdapterView.OnItemClickListener{
        onItemClick=function(parent,v,pos,id)
          返回.performClick()
          listOnItemClick(parent,v,pos,id)
        end,
      })
  end})
  --[[InputLayout={
                        TimePicker;
                        id="myTimePicker";
                      }
                      对话框({
                        标题="定时刷新",
                       点击事件=function()

                        end,
                        是否显示取消按钮=true,
                        对话框布局=loadlayout(InputLayout),
                      })
                      --时间改变监听器
                      import "android.widget.TimePicker$OnTimeChangedListener"
                      myTimePicker.setOnTimeChangedListener{
                        onTimeChanged=function(view,时,分)
                          print(时,分)
                      end}

                      --部分API
                      时=myTimePicker.getCurrentHour()--获取小时
                      分=myTimePicker.getCurrentMinute()--获取分钟
                      myTimePicker.setIs24HourView(Boolean(true))--设置24小时制]]
  --elseif a=="按照域名查找" then
 elseif a=="关闭的标签页" then
  local datas={}
  local 关闭的标签页=io.open("/data/data/"..activity.getPackageName().."/关闭的标签页.xml"):read("*a")
  local 关闭的标签页=string2tab(关闭的标签页)
  for d,a in pairs(关闭的标签页) do
    table.insert(datas,{
      text={
        Text=a.当前页面.title,
      },
      列表按钮较暗色背景={
        Visibility=View.VISIBLE,
      },
      icd={
        Visibility=View.VISIBLE,
      },
      Imagea={
        src="png",
        Visibility=View.GONE,
      },
      Image2={
        src=图标,
        ColorFilter=0xFF74A8FF,
      }
    })
  end
  a={}
  st=(loadlayout("layout/anzhaoriqichazhao",a))
  a.标题栏承载器.addView(loadlayout(获取标题栏("关闭的标签页",a.设置背景外,"关闭的标签页"),a))--添加控件
  主页.addView(st)--添加控件
  页面列表["关闭的标签页"]=true
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,item)

  --将小项目匹配给大list
  a.设置list.Adapter=yuxuan_adpqy
  a.设置list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      a.返回.performClick()
      返回.performClick()
      webviewp:openNewUrl()
    end,
  })
 elseif a=="搜索" then
  弹出搜索()
end