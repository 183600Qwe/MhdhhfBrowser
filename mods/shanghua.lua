w2=dp2px(30)
idgetXa=打开菜单.getX()
function 上滑事件()
  弹出搜索(true)
end
低栏按钮onTouch=function(v,event)
  if event.getAction()==MotionEvent.ACTION_DOWN then
    --模拟点击
    --5.0.16 android10 miui12.5
    --查了java浏览器，搜了LinearLayout，又搜了Touch
    --以下不可用
    --打开菜单.requestFocusFromTouch()
    --打开菜单.buildTouchDispatchChildList()
    --以下可用
    --打开菜单.callOnClick()
    --打开菜单.performClick()
    --以下不可用
    --打开菜单.setContextClickable(true)
    --打开菜单.setContextClickable(false)
    --打开菜单.setContextClickable(true)
    --打开菜单.setContextClickable(false)
    downX = event.getRawX()
    downY = event.getRawY()
    idgetY=打开菜单.getY()
    y=event.getY()+idgetY
    downY2 = downY
    downX2 = downX
    状态=true
   elseif event.getAction()==MotionEvent.ACTION_MOVE then
    moveX = event.getRawX()
    moveY = event.getRawY()
    downX = moveX
    downY = moveY
    idgetY=v.getY()
    if event.getY()+idgetY-y<-1 or downX>idgetY then
      状态=false
    end
    --downY2:最初的downY
    if
      downY<downY2 and
      downY2-downY>tointeger(菜单CardViewWidth/21) and
      (downY)<(AHeight-低栏高度)
      then
      --print("上滑事件")
      if 上滑事件 and not 状态a then
        --下滑事件
        import "android.content.Context"
        震动(20)
        状态a=true
        上滑事件()
        隐藏控件(右菜单)
        状态5=true
        task(200,function()
          状态5=false
        end)
      end
     elseif downX>downX2+w2 and (downY)>(AHeight-低栏高度) and not 状态a then
      --print("右滑事件")
      if 当前窗口-1<=#weblist then
        webapi:select(当前窗口-1)
        震动(20)
       else
        震动(35)
      end
      状态a=true
     elseif downX<downX2-w2 and (downY)>(AHeight-低栏高度) and not 状态a then
      --print("左滑事件")
      震动(20)
      if 当前窗口+1<=#weblist then
        webapi:select(当前窗口+1)
        震动(20)
       else
        震动(35)
      end
      状态a=true
    end
   elseif event.getAction()==MotionEvent.ACTION_UP then
    --打开菜单.requestDisallowInterceptTouchEvent(false)
    状态a=false
    状态=false
    --状态2=false
    downY2=nil
    downY=nil
  end
end

打开网页列表.onTouch=低栏按钮onTouch
网页后退LinearLayout.onTouch=低栏按钮onTouch
打开菜单.onTouch=低栏按钮onTouch
返回主页.onTouch=低栏按钮onTouch
网页前进3.onTouch=低栏按钮onTouch
