webviewp0外.addView(loadlayout("layout/zhuye/gongjulan"))
按钮列表={
  {"打开网页列表","打开网页列表"},
  {"网页后退LinearLayout","网页后退"},
  {"打开菜单","打开菜单"},
  {"返回主页","返回主页"},
  {"网页前进3","网页前进"},
}
长按功能=io.open("/data/data/"..activity.getPackageName().."/长按功能.xml"):read("*a")
长按功能=string2tab(长按功能)
for k,a in pairs(按钮列表) do
  _G[a[1]].onLongClick=function(v)
    浏览器菜单(长按功能[a[2]],false,v,true)--LinearLayout2
    震动(20)
  end
end
