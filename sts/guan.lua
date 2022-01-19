import "android.R$id"
import "android.net.Uri"
import "android.graphics.drawable.GradientDrawable$Orientation"
import "android.graphics.ColorFilter"
import "android.content.Intent"
import "com.michael.NoScrollListView"--导入可以嵌套在Scrollview里的列表
import "wenben"
--import "layout"
import "android.graphics.drawable.ColorDrawable"
包名=this.getPackageManager().getPackageInfo(this.getPackageName(),((32552732/2/2-8183)/10000-6-231)/9)
版本=tostring(包名.versionName)
版本号=tonumber(包名.versionCode)
--一般强调色=io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a")
--[[if 标题栏色=="#FF191919"
  装饰色="#ff4b4b4b"
 else
  装饰色=标题栏色
end]]
itemc={
  LinearLayout,
  orientation="horizontal",
  layout_width="fill",
  layout_height='52dp';
  {
    TextView,
    id="srct",
    textColor=文字;
    textSize="15sp",
    layout_margin="10dp",
    layout_marginLeft="17dp";
    layout_gravity="center",
  },
  {
    TextView,
    id="srcb",
    textSize="0sp",
    layout_width="304dp",
    layout_marginLeft="3dp";
    layout_gravity="center",
  },
}


uuuu=(loadlayout("layout/guanlayout"))
标题栏承载器.addView(loadlayout(获取标题栏("关于",关于scrollView,"关于")))--添加控件
主页.addView(uuuu)--添加控件
页面列表["关于"]=true
--[[scrollView.onScrollChange=function(v,u,p)
  --print(p)
  if p<dp2px(170)
    --设置标题栏阴影
    activity.ActionBar.setElevation(0)
   else
    --设置标题栏阴影
    activity.ActionBar.setElevation(获取控件阴影())
  end
end
]]
--一个小list模板已搭建好了，下面开始匹配数据

--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表
--aic={}
aw3={"qq:183600(3025385472)","酷安:qwe12345678","","官方Q群","开源许可","源码和历史版本(包括其他应用的)","用户协议","隐私政策","显示首次启动页","更新日志","贡献者名录"}
--mmp={"导出导入 添加 删改","导出为xml","当前为"}
--"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw3 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw3[nj]})
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,itemc)

--将小项目匹配给大list
list3.Adapter=yuxuan_adpqy
list3.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    v=pos+1
    if v==1 then
      if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.mobileqq",0) end) then
          url="mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=3025385472"
          activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
         else
          print("未安装")
        end
      elseif v==2 then
url="http://www.coolapk.com/u/1910517"
        activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
    elseif v==4 then
      --调用
      if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.mobileqq",0) end) then
        QQ群("798400036")
       else
        print("未安装")
      end
    elseif v==5 then
            数据传送="开源许可"
    运行代码含读取文件("sts/gongxian")
    elseif v==6 then
      加载("http://www.iyuji.cn/iyuji/s/RWlIQnNReFJrWmxONjREaWEvR2hBUT09/1580171453352562")
    elseif v==7 then
      提示(用户协议)
    elseif v==8 then
      提示(隐私政策)
    elseif v==9 then
  import "shouciqidongyie"
    显示首次启动页()
    elseif v==10 then
    数据传送="更新日志"
    运行代码含读取文件("sts/gongxian")
elseif v==11 then
    数据传送="贡献者名录"
    运行代码含读取文件("sts/gongxian")
    end
  end
})
function onResult(name,...)
  返回参数=...
  activity.result{返回参数}
end
function QQ群(h)
  url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin="..h.."&card_type=group&source=qrcode"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end

--Mhedhf浏览器.getPaint().setFakeBoldText(true)
--版本.getPaint().setFakeBoldText(true)

--设置TypeFace
--import "android.graphics.Typeface"
--版本.getPaint().setTypeface(Typeface.MONOSPACE)
