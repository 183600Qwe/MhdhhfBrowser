function 添加搜索引擎(是否为修改搜索引擎,id,v)
  function 显示添加书签对话框(是否为修改搜索引擎,id,v)
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
        hint=[["搜索内容"为搜索的内容]];
        layout_marginTop="0";
        --layout_marginBottom="22dp";
        layout_margin="10dp";
        layout_width="fill";
        layout_gravity="center",
        id="链接qwe";
        textSize="16sp";
        textColor=文字;
      };
    };
    对话框({
      标题="添加搜索引擎",
      点击事件=function()
        if 是否为修改搜索引擎 then

          内容2=""
          次数=0
          内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
          for t,c in 内容:gmatch("【项目】(.-)【项目】") do
            次数=次数+1
            if 次数==id then
              内容2=内容2..获取内容(标题qwe.text,链接qwe.text)
              v.Tag.srct.Text=标题qwe.text
             else
              local 标题=t:match("【标题】(.-)【标题】")
              local 链接=t:match("【链接】(.-)【链接】")
              内容2=内容2..获取内容(标题,链接)
            end
          end
          写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容2)

         else
          内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
          写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",内容..获取内容(标题qwe.text,链接qwe.text))


        end
      end,
      是否显示取消按钮=true,
      对话框布局=loadlayout(InputLayout),
      输入框可用=true,

    })
  end
  显示添加书签对话框(是否为修改搜索引擎,id,v)
  --  showDataDialog(名称,名称)
end