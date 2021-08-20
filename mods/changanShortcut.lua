
      写入文件("/data/data/"..activity.getPackageName().."/添加快捷方式数字记录.xml","4")
      xpcall(function()
        import "android.net.Uri"
        import "android.content.ComponentName"
        import "android.content.Intent"
        import "android.content.pm.ShortcutInfo"
        import "java.util.ArrayList"
        import "android.graphics.drawable.Icon"
        --创建Intent对象
        intent1 = Intent(Intent.ACTION_MAIN);
        --ComponentName设置应用之间跳转      包名(这里直接获取程序包名),   包名+类名(AndroLua打包后还是这个)
        intent1.setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"));
        intent1.setData(Uri.parse("num1"));
        --创建Intent对象
        intent2 = Intent(Intent.ACTION_MAIN);
        --ComponentName设置应用之间跳转      包名(这里直接获取程序包名),   包名+类名(AndroLua打包后还是这个)
        intent2.setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"));
        intent2.setData(Uri.parse("num2"));
        --创建Intent对象
        intent3 = Intent(Intent.ACTION_MAIN);
        --ComponentName设置应用之间跳转      包名(这里直接获取程序包名),   包名+类名(AndroLua打包后还是这个)
        intent3.setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"));
        intent3.setData(Uri.parse("num3"));
        --创建Intent对象
        intent4 = Intent(Intent.ACTION_MAIN);
        --ComponentName设置应用之间跳转      包名(这里直接获取程序包名),   包名+类名(AndroLua打包后还是这个)
        intent4.setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"));
        intent4.setData(Uri.parse("num4"));
        --id,快捷方式名字,快捷方式被点击后执行的intent,快捷方式的图标地址
        SHORTCUT_TABLE={

          {"ID5","搜索",intent2,activity.getLuaDir().."/png/mmm.png"},
          {"ID4","书签",intent1,activity.getLuaDir().."/png/fglkg.png"},
          {"ID6","历史",intent3,activity.getLuaDir().."/png/timelap.png"},
          {"ID7","悬浮窗",intent4,activity.getLuaDir().."/png/open_in_browser_black.png"},
        }

        --动态的Shortcut,获取ShortcutManager,快捷方式管理器
        --提供了添加,移除,更新,禁用,启动,获取静态快捷方式,获取动态快捷方式,获取固定在桌面的快捷方式等方法
        scm = activity.getSystemService(activity.SHORTCUT_SERVICE);

        --循环添加到对象ArrayList
        infos = ArrayList();
        for k,v in pairs(SHORTCUT_TABLE) do
          si = ShortcutInfo.Builder(this,v[1])
          --设置图标
          .setIcon(Icon.createWithBitmap(loadbitmap(v[4])))
          --快捷方式添加到桌面显示的标签文本
          .setShortLabel(v[2])
          --长按图标快捷方式显示的标签文本(既快捷方式名字)
          .setLongLabel(v[2])
          .setIntent(v[3])
          .build();
          infos.add(si);
        end

        --添加快捷方式
        scm.setDynamicShortcuts(infos);
      end,function(e)
      end)