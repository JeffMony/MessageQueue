# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#-optimizationpasses 5
# 混淆时不使用大小写混合，混淆后的类名为小写
#-dontusemixedcaseclassnames
# 指定不去忽略非公共库的类
#-dontskipnonpubliclibraryclasses
# 指定不去忽略非公共库的成员
#-dontskipnonpubliclibraryclassmembers
# 混淆时不做预校验
#-dontpreverify
# 混淆时不记录日志
#-verbose
## 代码优化
##-dontshrink
## 不优化输入的类文件
##-dontoptimize
## 保留注解不混淆
#-keepattributes *Annotation*,InnerClasses
## 避免混淆泛型
#-keepattributes Signature
## 保留代码行号，方便异常信息的追踪
#-keepattributes SourceFile,LineNumberTable
## 混淆采用的算法
#-optimizations !code/simplification/cast,!field/*,!class/merging/*
## dump.txt文件列出apk包内所有class的内部结构
#-dump class_files.txt
## seeds.txt文件列出未混淆的类和成员
#-printseeds seeds.txt
## usage.txt文件列出从apk中删除的代码
#-printusage unused.txt
## mapping.txt文件列出混淆前后的映射
#-printmapping mapping.map

# 不混淆枚举
-keep enum com.shizhuang.imagerender.model.InputType { *; }
-keep enum com.shizhuang.imagerender.model.Rotation { *; }
-keep enum com.shizhuang.imagerender.model.MagnifierShape { *; }
-keep enum com.shizhuang.imagerender.model.StickerType { *; }

-keep interface com.shizhuang.imagerender.ImageEffect { *; }
-keep interface com.shizhuang.imagerender.ImageRender { *; }
-keep interface com.shizhuang.imagerender.listener.OnImageEffectListener { *; }
-keep interface com.shizhuang.imagerender.listener.OnImageRenderListener { *; }
-keep interface com.shizhuang.imagerender.text.OnTextEffectListener { *; }
-keep interface com.shizhuang.imagerender.text.TextEffect { *; }
-keep interface com.shizhuang.imagerender.Constants { *; }

-keep class com.shizhuang.imagerender.NativeEvent { *; }
-keep class com.shizhuang.imagerender.BuildConfig { *; }

# 文字
-keep class com.shizhuang.imagerender.text.TextEffectImpl { *; }

# 图片编辑
-keep class com.shizhuang.imagerender.model.StickerImage { *; }
-keep class com.shizhuang.imagerender.model.ImageInfo { *; }
-keep class com.shizhuang.imagerender.model.JNIImageInfo { *; }

-keep class com.shizhuang.imagerender.ImageEffectImpl { *; }
-keep class com.shizhuang.imagerender.ImageRenderImpl { *; }
-keep class com.shizhuang.imagerender.RenderManager { *; }


-keep class com.shizhuang.imagerender.text.TextResult {
    # 不混淆类中的方法名
    <methods>;
}

# 保留我们自定义控件（继承自View）不被混淆
-keep class com.shizhuang.imagerender.view.PreviewSurfaceView { *; }
-keep interface com.shizhuang.imagerender.view.PreviewSurfaceView$* { *; }

# 保留
#-keep class org.libpag.** { *; }
#-keep class org.libpag.**$* { *; }
#-keep class org.extra.relinker.elf.** { *; }
#-keep class org.extra.relinker.** { *; }
#-keep class org.extra.tools.** { *; }