function createShortcut2(m)
  --xpcall(function()
  import "android.view.animation.Animation$AnimationListener"
  import "android.graphics.BitmapFactory"
  import "android.content.Context"
  import "android.content.Intent"
  import "android.app.NotificationManager"
  import "android.widget.LinearLayout"
  import "android.content.IntentFilter"
  import "android.net.Uri"
  import "android.content.ComponentName"
  import "android.content.IntentSender"
  import "android.content.ServiceConnection"
  import "android.content.pm.ShortcutInfo"
  import "android.content.pm.ShortcutManager"
  import "android.graphics.drawable.Icon"
  import "android.content.ComponentName"
  local intent = Intent("android.intent.action.MAIN");
  intent.addCategory("android.intent.category.DEFAULT");
  intent.setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"));
  intent.setData(Uri.parse(""..tostring(m)))
  if (Build.VERSION.SDK_INT >= 22) then
    intent.addFlags(524288);
    intent.addFlags(0x08000000);
  end
  if (Build.VERSION.SDK_INT >= 26) then
    import "android.graphics.Paint"
    import "android.graphics.Canvas"
    bmp = Bitmap.createBitmap(599, 599, Bitmap.Config.ARGB_8888);
    canvas =Canvas(bmp);
    paint = Paint(Paint.ANTI_ALIAS_FLAG);
    paint.setColor(0xffffffff/2)
    import "android.text.TextPaint"
    mTextPaint=TextPaint(paint)
    mTextPaint.setTextSize(367);
    mTextPaint.setColor(0xFF505050);
    fontMetrics = mTextPaint.getFontMetrics();
    mTextPaint.clearShadowLayer();
    import "java.lang.Math"
    canvas.drawText(m,Math.abs(0), Math.abs(397), mTextPaint);

    mIcon=Icon.createWithBitmap(bmp)
    --xpcall(function()
    activity.getSystemService("shortcut")
    .requestPinShortcut(ShortcutInfo.Builder(activity, m)
    .setIcon(mIcon)
    .setShortLabel(m)
    .setIntent(intent).build(),nil);
    --[[end,function(e)
        print("添加快捷方式出错")
      end)]]
   else
    local intent2 = Intent("com.android.launcher.action.INSTALL_SHORTCUT");
    local fromContext = Intent.ShortcutIconResource.fromContext(activity, 0x7f010000);
    intent2.putExtra("android.intent.extra.shortcut.NAME", m);
    intent2.putExtra("android.intent.extra.shortcut.INTENT", intent);
    intent2.putExtra("duplicate", 0);
    intent2.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", fromContext);
    intent2.putExtra("android.intent.extra.shortcut.ICON", BitmapFactory.decodeResource(activity.getApplicationContext().getResources(),R.drawable.icon));
    activity.sendBroadcast(intent2);
    print("已添加快捷方式")
  end
  --[[end,function(e)
  end)]]
end