## C++ 消息队列

具体原理见技术文章：[音视频SDK中C++端消息队列](https://juejin.cn/post/7054589752393072677)

- 引入头文件
```
#include "handler.h"
#include "handler_thread.h"
```

- 类实现thread::HandlerCallback
```
class BaseClass : public thread::HandlerCallback {
protected:
  void HandleMessage(thread::Message *msg) override;
}
```

- 初始化Handler和HandlerThread
```
handler_thread_ = thread::HandlerThread::Create(name);
handler_ = new thread::Handler(handler_thread_->GetLooper(), this);
```

- 发送消息
```
thread::Message *msg = new thread::Message();
msg->what = EGLMessage::kCreateEGL;
handler_->SendMessage(msg);
```

- 退出销毁
```
handler_thread_->QuitSafely();
SAFE_DELETE(handler_thread_)
SAFE_DELETE(handler_)
```


