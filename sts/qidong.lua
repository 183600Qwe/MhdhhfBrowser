
st=(loadlayout("layout/qidonglayout"))
标题栏承载器.addView(loadlayout(获取标题栏("程序启动事件",程序启动事件,"程序启动事件")))--添加控件
主页.addView(st)--添加控件
页面列表["程序启动事件"]=true
设置背景外=设置背景外
luapath=("/data/data/"..activity.getPackageName().."/程序启动事件.lua")
function 保存内容()
  task(200,function()
    写入文件(luapath,程序启动事件LuaEditor.text)
    保存内容()
  end)
end
保存内容()