local ValueAnimator=luajava.bindClass "android.animation.ValueAnimator"
 ids={}

 view=loadlayout(
{
  FrameLayout;

  id="ftb_five";
  layout_height="56dp";
  layout_width="56dp";
  {
    ImageView;
    layout_height="24dp";
    layout_width="24dp";
    layout_gravity="center";
    colorFilter=文字123;
    elevation="0dp";
    id="icon",
    src="png/check_box_outline_blank_black.png";
  },
  {
    TextView;
    -- colorFilter=0xFFffffff;
    text="1";
    textColor=文字123;
    layout_gravity="center";
    gravity="center";
    textSize="12sp";
    layout_width="fill",--布局宽度
    layout_height="fill",--布局高度
    id="text";
  };

},ids)

local function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end


local api={
  setText=function(text)
    ids.text.text=text

    ValueAnimator.ofFloat({-dp2px(4),dp2px(1.9),0})
    .addUpdateListener{
      onAnimationUpdate=function(a)
        local ys=(a.getAnimatedValue())
        ids.text.y=ys
        ids.icon.y=ys
      end,
    }
    .setDuration(400)
    .start()
  end

}



function bulid(args)
  _G[args.id]=table.clone(api)
  return lambda k:view  
end


return bulid