import "android.util.Base64"
import "android.net.Uri"
import "android.content.Intent"
function base64(text)
  local base64Text=Base64.encodeToString(String(text).getBytes(),Base64.DEFAULT)
  return base64Text
end
function qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
  local shareId=分享ID
  local jumpUrl=base64(跳转链接)
  local previewImgUrl=base64(预览图链接)
  local imgUrl=base64(图片链接)
  local title=base64(标题)
  local description=base64(描述)
  local mqqapi="mqqapi://share/to_fri?file_type=news&src_type=web&version=1&share_id="..shareId.."&url="..jumpUrl.."&previewimageUrl="..previewImgUrl.."&image_url="..imgUrl.."&title="..title.."&description="..description.."&callback_type=scheme&thirdAppDsplayName="..title.."&app_name="..title.."&cflag=0&shareType=0"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqapi)))
end
function 分享链接2(Title,Url,list3,关闭对话框)
  local item={
    LinearLayout,
    layout_height="match_parent",
    layout_width="wrap_content",
    orientation="vertical",
    --layout_weight="1.0",
    gravity="center",
    {
      FrameLayout,
      layout_height="match_parent",
      layout_width="match_parent",
      layout_Gravity="center",
      {
        LinearLayout,
        layout_height="match_parent",
        layout_width="match_parent",
        Gravity="center",
        {
          ImageView;
          layout_width="52dp",
          layout_height="52dp",
          src="png/4.png";
          id="Image2",
          layout_margin='18dp';
          layout_marginBottom='9dp';
          --style="?android:attr/borderlessButtonStyle";
        },
      };
      {
        LinearLayout,
        layout_height="match_parent",
        layout_width="match_parent",
        Gravity="center",
        {
          LinearLayout,
          layout_width=圆环大小;
          layout_height=圆环大小,
          layout_Gravity="center",
          Gravity="center",
          id="CardView",
          layout_margin='18dp';
          layout_marginBottom='9dp';
          backgroundDrawable=边框(圆环大小/2,"#00000000",边框2,dp2px("1.5"));
          {
            ImageView;
            layout_height="22dp";
            src="png/kadb.png";
            id="图标";
            ColorFilter=文字;--图片颜色
            layout_width="22dp";
            layout_Gravity="center",
          };
        };
      };
    },
    {
      TextView,
      layout_height="wrap_content",
      layout_width="25%w",
      gravity="center",
      id="srct",
      textColor="#ff7a7a7a",
    },
  }
  --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
  datas={}

  --创建了三个有数据的列表
  图片列表={"png/1.png","png/qrcode.png","png/__ic_fltbtn2.png"}
  aw3={"QQ","二维码","更多"}
  mmp={}

  --循环添加匹配有数据的列表到
  --nj只是一个变量，你可以用其他变量代替
  --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
  --就相当于  for  1,3   do
  for nj=1,#aw3 do
    if aw3[nj]=="二维码" or aw3[nj]=="更多" then
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      table.insert(datas,{srct=aw3[nj],图标=图片列表[nj],Image2={Visibility=View.INVISIBLE}})
     else
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      table.insert(datas,{srct=aw3[nj],Image2=图片列表[nj],srcb=mmp[nj],CardView={Visibility=View.GONE}})
    end
  end
  --
  --创建适配器，将datas里面的数据匹配给itemc小项目
  yuxuan_adpqy=LuaAdapter(activity,datas,item)

  --将小项目匹配给大list
  list3.Adapter=yuxuan_adpqy
  --菜单点击事件
  list3.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent, v, pos,id)


      文本=v.Tag.srct.Text
      关闭对话框()
      if 文本=="QQ" then
        if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.mobileqq",0) end) or pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.tim",0) end) or pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.qqlite",0) end) then
          local 分享ID=1107753219
          local 跳转链接=Url
          local 预览图链接="http://img03.sogoucdn.com/app/a/100520146/7d397d8bdc41d94a8c260e2c40ba81d0"
          local 图片链接="http://img03.sogoucdn.com/app/a/100520146/7d397d8bdc41d94a8c260e2c40ba81d0"
          local 标题=Title
          local 描述=""
          qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
         else
          print("你没有安装QQ")
          --关闭对话框()
        end elseif 文本=="二维码" then
        local gt3={
          LinearLayout,
          orientation="vertical",
          layout_height='fill';
          layout_width='fill';
          --gravity="bottom|center";
          id='idmlz外';
          {
            FrameLayout,
            layout_height='fill';
            layout_width='fill';
            id='idmlz';
            {
              FrameLayout,
              layout_height='fill';
              layout_width='fill';
              background=菜单背景,
              id='菜单背景FrameLayout';
            };
            {
              CardView;
              Elevation='8dp';
              layout_width=菜单CardViewWidth;
              radius='30dp';
              --layout_gravity="bottom|center";
              layout_marginTop='-30dp';
              id='菜单CardView';
              {
                LinearLayout;
                Orientation='vertical';
                layout_width='fill';
                --layout_height='420dp';
                layout_marginBottom='0dp';
                layout_marginTop="30dp";
                BackgroundColor=背景2;
                {
                  LinearLayout;
                  Orientation='vertical';
                  layout_width='fill';

                  {
                    LinearLayout;
                    Orientation='vertical';
                    layout_width=菜单CardViewWidth;
                    layout_height=菜单CardViewWidth/1.5;
                    gravity='center';
                    {
                      ImageView;
                      id="img";
                      --  colorFilter=0x55ffffff;
                      layout_width=菜单CardViewWidth/2;
                      layout_height=菜单CardViewWidth/2;
                      layout_gravity='center';
                    };
                  };
                  {
                    FrameLayout,
                    --  Orientation='vertical';
                    layout_width='fill';
                    layout_height='44dp';
                    BackgroundColor=背景2;
                    {
                      LinearLayout;
                      Orientation='vertical';
                      layout_width='fill';
                      layout_height='44dp';
                      Gravity="center",
                      id="关闭";
                      -- onTouchListener=点击监听,--动画效果
                      {
                        ImageView;
                        layout_height="30dp";
                        src="png/kadb.png";
                        id="关闭图标";
                        ColorFilter=文字,--图片颜色
                        layout_width="30dp";
                      };
                    };
                    {
                      LinearLayout;
                      Orientation='horizontal';
                      layout_gravity='right|center';
                      id="右下角菜单";
                      {
                        FrameLayout,
                        --  Orientation='vertical';
                        layout_width='44dp';
                        layout_height='44dp';
                        --BackgroundColor=背景2;
                        layout_marginRight="8dp";
                        id="保存二维码3";
                        {
                          LinearLayout;
                          Orientation='vertical';
                          layout_width='fill';
                          layout_height='fill';
                          Gravity="center",
                          id="保存二维码";
                          --onTouchListener=点击监听,--动画效果
                          onClick=function()
                            local function SavePicture(bm,name)
                              if bm then
                                import "java.io.FileOutputStream"
                                import "java.io.File"
                                import "android.graphics.Bitmap"
                                name=tostring(name)
                                f = File(name)
                                out = FileOutputStream(f)
                                bm.compress(Bitmap.CompressFormat.PNG,90, out)
                                out.flush()
                                out.close()
                                return true
                               else
                                return false
                              end
                            end
                            bol=SavePicture(MainActivity.Create2DCode(view.Url),"/sdcard/Pictures/MhdhhfBrowser/二维码.png")
                            if bol then
                              print("保存成功")
                             else
                              print("保存失败")
                            end
                            关闭对话框二维码()
                          end,
                          {
                            ImageView;
                            layout_height="26dp";
                            id="保存二维码ImageView";
                            src="png/syvg.png";
                            ColorFilter=文字,--图片颜色
                            layout_width="26dp";
                            -- layout_marginRight="17dp";
                            layout_gravity='center';
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        };

        local dialog1=弹窗2(loadlayout(gt3))
        w,h=getwh(菜单CardView)
        --上升动画
        --相关参数，请自行手册查询
        --定义动画,500为上升高度。
        yuxuandh3=TranslateAnimation(0,0,-h,0)
        --动画时间，也就是上升动画的快慢
        yuxuandh3.setDuration(120)
        --动画开始执行
        菜单CardView.startAnimation(yuxuandh3);
        --动画结束回调
        --设置动画的属性
        透明动画=AlphaAnimation(0,1)
        透明动画.setDuration(120)--设置动画时间
        透明动画.setFillAfter(true)--设置动画后停留位置
        透明动画.setRepeatCount(0)--设置无限循环
        --绑定动画
        菜单背景FrameLayout.startAnimation(透明动画)
        --波纹(gfwz,0xffff0000)
        --波纹(hhbgvbg,0xffff0000)
        function 关闭对话框二维码()
          yuxuandh4=TranslateAnimation(0,0,0,-h)
          yuxuandh4.setDuration(75)
          菜单CardView.startAnimation(yuxuandh4);
          import "android.view.animation.Animation$AnimationListener"
          yuxuandh4.setAnimationListener(AnimationListener{
            onAnimationEnd=function()
              return dialog1 and dialog1.dismiss()
          end})
          --设置动画的属性
          透明动画=AlphaAnimation(1,0)
          透明动画.setDuration(75)--设置动画时间
          透明动画.setFillAfter(true)--设置动画后停留位置
          透明动画.setRepeatCount(0)--设置无限循环
          --绑定动画
          菜单背景FrameLayout.startAnimation(透明动画)
        end
        isAnimaing = false
        dialog1.setOnKeyListener{
          onKey = function(dl,c,v)
            if c == 4 and v.getAction() == MotionEvent.ACTION_DOWN then
              if isAnimaing == false then
                isAnimaing = true
                --弹出消息("返回键")
                关闭对话框二维码()
              end
              return true
            end

          end
        }
        关闭对话框b=关闭对话框二维码
        关闭.onClick=function()
          关闭对话框二维码()
        end
        idmlz.onClick=function()
          关闭对话框二维码()
        end
        波纹({关闭,
        },"方",文字)--0xFF7F7F7F
        import "com.my.sc.*"
        tb=MainActivity.Create2DCode(Url)
        img.setImageBitmap(tb)
       elseif 文本=="更多" then
        import "android.content.*"

        text=Title..Url
        intent=Intent(Intent.ACTION_SEND);
        intent.setType("text/plain");
        intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
        intent.putExtra(Intent.EXTRA_TEXT, text);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        activity.startActivity(Intent.createChooser(intent,"分享到:"));
      end
  end})
end
function 分享链接(Title,Url)
  InputLayout={
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    {
      GridView;
      fastScrollEnabled=true;
      layout_width="fill";
      --background=背景2,
      --padding="8dp";
      clipToPadding=false;
      ScrollBarStyle=ScrollView.SCROLLBARS_OUTSIDE_OVERLAY;
      -- layout_height="40%w";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
      --这里是分割线的意思
      numColumns=4;--每排显示网格数
      id="list3";
      Gravity="center",

      layout_marginBottom='18dp';
    };
  };
  对话框({
    标题="分享",
    点击事件=function()
      字体大小t=tostring(seekBar.getProgress()+45)
      写入文件("/data/data/"..activity.getPackageName().."/网页字体大小.xml",字体大小t)
    end,
    是否显示取消按钮=true,
    对话框布局=loadlayout(InputLayout),
  })
  分享链接2(Title,Url,list3,关闭对话框a)
end
function 制造一个新的浏览器(Url,onPageFinished)
  mLuaWebView2=loadlayout({
    LuaWebView;
    id="mLuaWebView";
  })
  newSetting(mLuaWebView,true)
  mLuaWebView.loadUrl(Url)
  mLuaWebView.setWebViewClient{
    shouldOverrideUrlLoading=function(view,url)
    end,
    onPageStarted=function(view,url,favicon)
    end,
    onPageFinished=onPageFinished,
    onReceivedError=function(view,var2,var3,var4)
      进度条.setVisibility(0)
      标题t.text="网页加载失败"
      weblist2[weblist3[view.id]].title="网页加载失败"
  end}
end
function Sharing(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName=FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  intent = Intent()
  intent.setAction(Intent.ACTION_SEND)
  intent.setType(Mime)
  file = File(path)
  uri = Uri.fromFile(file)
  intent.putExtra(Intent.EXTRA_STREAM,uri)
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(Intent.createChooser(intent, "分享到:"))
end
