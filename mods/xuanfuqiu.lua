--使用模板务必备注保留版权信息©aiTools

local function 转分辨率(sdp)
  import "android.util.TypedValue"
  dm=this.getResources().getDisplayMetrics()
  types={px=0,dp=1,sp=2,pt=3,["in"]=4,mm=5}
  n,ty=sdp:match("^(%-?[%.%d]+)(%a%a)$")
  return TypedValue.applyDimension(types[ty],tonumber(n),dm)
end

local function 位移动画(控件,方向,位移,时间)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(控件,方向,位移).setDuration(时间).start()
end
ftb.onTouch=function(view,event)
  if 底栏样式=="搜索样式" then
    --设置的图片也可以输入路径
    第1个按钮.setImageBitmap(loadbitmap("png/gfwzu.png"))
  end
  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN
    ftb.Elevation=dp2px(4);
    --控件不可视
    ftb_two.setVisibility(View.VISIBLE)
    --控件不可视
    ftb_three.setVisibility(View.VISIBLE)
    --控件不可视
    ftb_four.setVisibility(View.VISIBLE)
    --控件不可视
    ftb_five.setVisibility(View.VISIBLE)
    --控件不可视
    ftb_six.setVisibility(View.VISIBLE)

    ftb_img.setVisibility(View.GONE)

    sss=ftb.getY()

    ccc=ftb.getX()

    aaa=转分辨率("25dp")

    one_a=ccc-activity.getWidth()*.25
    one_b=sss
    one_c=ccc-activity.getWidth()*.25+转分辨率("50dp")
    one_d=sss+转分辨率("50dp")

    two_a=ccc-math.sqrt((activity.getWidth()*.25)^2/2)
    two_b=sss-math.sqrt((activity.getWidth()*.25)^2/2)
    two_c=ccc-math.sqrt((activity.getWidth()*.25)^2/2)+转分辨率("50dp")
    two_d=sss-math.sqrt((activity.getWidth()*.25)^2/2)+转分辨率("50dp")

    three_a=ccc
    three_b=sss-activity.getWidth()*.25
    three_c=ccc+转分辨率("50dp")
    three_d=sss-activity.getWidth()*.25+转分辨率("50dp")

    four_a=ccc+math.sqrt((activity.getWidth()*.25)^2/2)
    four_b=sss-math.sqrt((activity.getWidth()*.25)^2/2)
    four_c=ccc+math.sqrt((activity.getWidth()*.25)^2/2)+转分辨率("50dp")
    four_d=sss-math.sqrt((activity.getWidth()*.25)^2/2)+转分辨率("50dp")

    five_a=ccc+activity.getWidth()*.25
    five_b=sss
    five_c=ccc+activity.getWidth()*.25+转分辨率("50dp")
    five_d=sss+转分辨率("50dp")

    位移动画(ftb_two,"X",{ccc,ccc-activity.getWidth()*.25},50)

    位移动画(ftb_three,"X",{ccc,ccc+activity.getWidth()*.25},250)

    位移动画(ftb_four,"Y",{sss,sss-activity.getWidth()*.25},150)

    位移动画(ftb_five,"X",{ccc,ccc-math.sqrt((activity.getWidth()*.25)^2/2)},100)
    位移动画(ftb_five,"Y",{sss,sss-math.sqrt((activity.getWidth()*.25)^2/2)},100)

    位移动画(ftb_six,"X",{ccc,ccc+math.sqrt((activity.getWidth()*.25)^2/2)},200)
    位移动画(ftb_six,"Y",{sss,sss-math.sqrt((activity.getWidth()*.25)^2/2)},200)

   case MotionEvent.ACTION_MOVE

    sss_x=event.getX()+ccc

    sss_y=event.getY()+sss

   case MotionEvent.ACTION_UP
    ftb.Elevation=dp2px(2);
    --控件不可视
    task(200,function()
      ftb_two.setVisibility(View.INVISIBLE)
      ftb_three.setVisibility(View.INVISIBLE)
      ftb_four.setVisibility(View.INVISIBLE)
      ftb_five.setVisibility(View.INVISIBLE)
      ftb_six.setVisibility(View.INVISIBLE)
    end)

    import "android.content.Context"
    --导入包
    vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
    vibrator.vibrate(long{0,30} ,-1)
    --{等待时间,振动时间,等待时间,振动时间,…}
    --{0,1000,500,1000,500,1000}
    --别忘了申明权限

    ftb_img.setVisibility(View.VISIBLE)

    ftb_txt.setText("")

    位移动画(ftb_two,"X",{ccc-activity.getWidth()*.25,ccc},220)

    位移动画(ftb_three,"X",{ccc+activity.getWidth()*.25,ccc},220)

    位移动画(ftb_four,"Y",{sss-activity.getWidth()*.25,sss},220)

    位移动画(ftb_five,"X",{ccc-math.sqrt((activity.getWidth()*.25)^2/2),ccc},220)
    位移动画(ftb_five,"Y",{sss-math.sqrt((activity.getWidth()*.25)^2/2),sss},220)

    位移动画(ftb_six,"X",{ccc+math.sqrt((activity.getWidth()*.25)^2/2),ccc},220)
    位移动画(ftb_six,"Y",{sss-math.sqrt((activity.getWidth()*.25)^2/2),sss},220)

    sss_x=event.getX()+ccc

    sss_y=event.getY()+sss
    view=webView
    --网页列表数量显示2.text=网页列表数量显示.text
    if sss_x>=one_a and sss_y>=one_b and sss_x<=one_c and sss_y<=one_d then
      if 底栏样式=="一般样式" then
        弹出搜索()
       elseif 底栏样式=="搜索样式" then
        网页后退()
      end
      ftb_two.CardBackgroundColor=Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
     elseif sss_x>=two_a and sss_y>=two_b and sss_x<=two_c and sss_y<=two_d then
      if 底栏样式=="一般样式" then
        showChoose()
       elseif 底栏样式=="书签样式" then
        activity.newActivity('shu')
       elseif 底栏样式=="搜索样式" then
        弹出搜索()
      end
      ftb_three.CardBackgroundColor=Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
     elseif sss_x>=three_a and sss_y>=three_b and sss_x<=three_c and sss_y<=three_d then
      打开菜单2()
      ftb_four.CardBackgroundColor=Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
     elseif sss_x>=four_a and sss_y>=four_b and sss_x<=four_c and sss_y<=four_d then
      返回主页f()
      ftb_five.CardBackgroundColor=Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
     elseif sss_x>=five_a and sss_y>=five_b and sss_x<=five_c and sss_y<=five_d then
      网页前进()
      ftb_six.CardBackgroundColor=Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
    end

  end

  return true

end
是否启用菜单按钮上滑功能=io.open("/data/data/"..activity.getPackageName().."/是否启用菜单按钮上滑功能.xml"):read("*a")
if 是否启用菜单按钮上滑功能=="打开" then
  --[[打开菜单.onTouch=function(view,event)
    if 底栏样式=="搜索样式" then
      --设置的图片也可以输入路径
      第1个按钮.setImageBitmap(loadbitmap("png/gfwzu.png"))
    end
    a=event.getAction()&255

    switch a

     case MotionEvent.ACTION_DOWN
      ftb.Elevation=dp2px(4);
      --控件不可视
      ftb_four.setVisibility(View.VISIBLE)


      ftb_img.setVisibility(View.GONE)

      sss=ftb.getY()

      ccc=ftb.getX()
      aaa=转分辨率("25dp")
      x=event.getX()+ccc

      y=event.getY()+sss
      状态=true
      task(200,function()
        if 状态 then
          状态2=true
          长按功能=io.open("/data/data/"..activity.getPackageName().."/长按功能.xml"):read("*a")
          长按功能=string2tab(长按功能)
          浏览器菜单(长按功能["打开菜单"],false,打开菜单,true)--LinearLayout2

        end
      end)




      three_a=ccc
      three_b=sss-activity.getWidth()*.25-转分辨率("50dp")
      three_c=ccc+转分辨率("50dp")
      three_d=sss-activity.getWidth()*.25





      位移动画(ftb_four,"Y",{sss,sss-activity.getWidth()*.25},150)


     case MotionEvent.ACTION_MOVE

      sss_x=event.getX()+ccc

      sss_y=event.getY()+sss
      if event.getY()+sss-y<-1 then
        状态=false
      end


     case MotionEvent.ACTION_UP
      ftb.Elevation=dp2px(2);
      --控件不可视
      task(200,function()
        ftb_four.setVisibility(View.INVISIBLE)
      end)

      import "android.content.Context"


      ftb_img.setVisibility(View.VISIBLE)

      ftb_txt.setText("")
      --print(event.getY()+sss-y)


      位移动画(ftb_four,"Y",{sss-activity.getWidth()*.25,sss},220)



      sss_x=event.getX()+ccc

      sss_y=event.getY()+sss
      view=webView
      --网页列表数量显示2.text=网页列表数量显示.text
      if event.getY()+sss-y<-1 then
        if sss_x>=three_a and sss_y>=three_b and sss_x<=three_c and sss_y<=three_d then
          菜单按钮上滑功能=io.open("/data/data/"..activity.getPackageName().."/菜单按钮上滑功能.xml"):read("*a")
          浏览器菜单(菜单按钮上滑功能,false,打开菜单,true)--LinearLayout2
          ftb_four.CardBackgroundColor=Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/一般强调色.xml"):read("*a"))
          --导入包
          vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
          vibrator.vibrate(long{0,30} ,-1)
          --{等待时间,振动时间,等待时间,振动时间,…}
          --{0,1000,500,1000,500,1000}
          --别忘了申明权限
        end
       else
        if 状态2 then
         else
          打开菜单2()
        end
      end
      状态=false
      状态2=false


    end

    return true

  end]]
  end