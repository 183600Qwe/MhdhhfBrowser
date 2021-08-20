InputLayout={
  ListView;
  --layout_height="fill";
  id="list";
  layout_width="fill";
  dividerHeight="0";
};
对话框({
  标题=对话框标题,
  点击事件=function()
  end,
  是否显示取消按钮=false,
})
内容ScrollView外.addView(loadlayout(InputLayout))
--控件隐藏
内容LinearLayout外.setVisibility(View.GONE)
local item={
  FrameLayout,
  layout_width="fill",
  layout_height='56dp';
  {
    TextView;
    -- layout_width='wrap';
    layout_height='fill';
    layout_marginLeft='22dp';
    Gravity='left|center';
    textColor=文字;
    --text='关于';
    id="srct",
    textSize='16sp';
    layout_marginRight='52dp';
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
}
--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}


--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw3 do
  if 记录文件的列表[nj]~=nil then
    local a=打开关闭转TF带读取文件(记录文件的列表[nj])
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=aw3[nj],mSwitch={Checked=a,Visibility=View.VISIBLE}})
   else
    --给空的datas添加所有的数据
    --格式为  table.insert(空列表名称,{id=数据列表[nj]})
    table.insert(datas,{srct=aw3[nj],mSwitch={Checked=false,Visibility=View.GONE}})
  end
end

--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,item)

--将小项目匹配给大list
list.Adapter=yuxuan_adpqy
