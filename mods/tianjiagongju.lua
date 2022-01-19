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
          layout_width="-1";
          layout_height="-1";
          layout_margin="18dp";
          {
            ScrollView;--线性布局
            layout_width='fill';--布局宽度
            layout_height='wrap';--布局高度
            id='scrollView';--布局高度
            {
              LinearLayout;
              Orientation='vertical';--布局方向
              layout_width="-1";
              id="工具设置列表LinearLayout";

              {
                LinearLayout;
                layout_gravity='right|center';
                id="添加工具";
                onClick=function(v)
                  滑动菜单工具=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
                  if 滑动菜单工具=="" or 滑动菜单工具==nil then
                    滑动菜单工具={}
                   else
                    滑动菜单工具=string2tab(滑动菜单工具)
                  end

                  显示选择功能对话框(#滑动菜单工具+1,false,文件名称,true)
                end,
                {
                  ImageView;
                  src="png/fhvpfxgj.png";
                  layout_width='22dp';
                  layout_height='22dp';
                  layout_margin='10dp';
                  layout_marginLeft='18dp';
                  id='Image2';
                  ColorFilter=转0x(一般强调色);--设置图片着色
                };
              };
            };
          };
        };
      };

      --PopupWindow
      pop=PopupWindow(activity)
      --PopupWindow加载布局
      pop.setContentView(loadlayout(Popup_layout))
      pop.setWidth(-1)
      pop.setHeight(-2)

      pop.setOutsideTouchable(true)
      pop.setBackgroundDrawable(ColorDrawable(0x00000000))

      pop.onDismiss=function()
        --消失事件
        --文件夹内容弹窗是否正在显示=false
      end

      --PopupWindow列表项布局
      Popup_list_item={
        LinearLayout,
        orientation="horizontal",
        layout_width="fill",
        id="列表按钮",
        {
          ImageView;
          --src=图标;
          layout_width='22dp';
          layout_height='22dp';
          layout_gravity='left|center';
          layout_margin='10dp';
          layout_marginLeft='18dp';
          id='Image2';
          ColorFilter=转0x(一般强调色);--设置图片着色
        };
        {
          TextView,
          id="popadp_text",
          textColor=文字;
          textSize="14sp",
          layout_margin="16dp",
          --layout_width="fill",
          --  layout_width="304dp",
          --textIsSelectable=true,
          layout_marginLeft="8dp";
          layout_gravity="center",
        },
      }
      --PopupWindow列表适配器
      --print(dump(文件夹内容))
      内容=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
      --print(内容)
      function 菜单(s,v,i)

        local pop=PopupMenu(activity,v)
        menu=pop.Menu

        menu.add("删除").onMenuItemClick=function(a)
          --内容=io.open("/data/data/"..activity.getPackageName().."/书签保存.xml"):read("*a")
          --内容=string.gsub(内容,获取内容(view.Tag.text.Text,bookId2[view.Tag.text.Text]),"")

          滑动菜单工具=io.open("/data/data/"..activity.getPackageName().."/"..文件名称..".xml"):read("*a")
          if 滑动菜单工具=="" or 滑动菜单工具==nil then
            滑动菜单工具={}
           else
            滑动菜单工具=string2tab(滑动菜单工具)
          end
          滑动菜单工具[i]=nil
          --table.remove(滑动菜单工具,i)
          滑动菜单工具=dump(滑动菜单工具)
          写入文件("/data/data/"..activity.getPackageName().."/"..文件名称..".xml",滑动菜单工具)



        end
        pop.show()--显示
      end
      if 内容=="" or 内容==nil then
       else
        内容=string2tab(内容)
        次数=0
        for d,文件夹内容 in pairs(内容) do
          次数=次数+1
          --table.insert(title2,t:match("【标题】(.-)【标题】"))
          for d,文件夹内容2 in pairs(mmpqwe) do

            if 文件夹内容2==文件夹内容 then
              状态=true
              工具设置列表LinearLayout.addView(loadlayout(Popup_list_item))
              popadp_text.Text=文件夹内容
              --设置的图片也可以输入路径
              Image2.setImageBitmap(loadbitmap(aw3菜单[d]))
              local 次数2=次数
              列表按钮.onClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
              列表按钮.onLongClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
            end
          end
          for d,文件夹内容2 in pairs(mmpe) do


            if 文件夹内容2==文件夹内容 then
              状态=true
              工具设置列表LinearLayout.addView(loadlayout(Popup_list_item))
              popadp_text.Text=文件夹内容
              --设置的图片也可以输入路径
              Image2.setImageBitmap(loadbitmap(aw3工具箱[d]))



              local 次数2=次数
              列表按钮.onClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
              列表按钮.onLongClick=function(v)
                菜单(文件夹内容,v,次数2)
              end
            end
          end
          if 状态 then
           else
            工具设置列表LinearLayout.addView(loadlayout(Popup_list_item))
            popadp_text.Text=文件夹内容
            --设置的图片也可以输入路径
            --Image2.setImageBitmap(loadbitmap(aw3工具箱[d]))



            local 次数2=次数
            列表按钮.onClick=function(v)
              菜单(文件夹内容,v,次数2)
            end
            列表按钮.onLongClick=function(v)
              菜单(文件夹内容,v,次数2)
            end
          end
          状态=false
        end
      end
      pop.showAsDropDown(控件ID2)
    end