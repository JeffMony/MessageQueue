//
// Created by jeffli on 2022/1/13.
//

#ifndef THREAD_HANDLER_H_
#define THREAD_HANDLER_H_

#include "looper.h"
#include "message.h"

namespace thread {

class Looper;
class Message;

/**
 * 消息处理回调
 */
class HandlerCallback {
public:
  virtual void HandleMessage(Message *msg) {}

  virtual void DispatchRemoveMessage(Message *msg) {}
};

class Handler {
public:
  Handler(Looper *looper, HandlerCallback *callback);

  ~Handler();

  /**
   * 发送消息, 默认放在队尾
   * @param msg
   */
  void SendMessage(Message *msg);

  /**
   * 发送消息, 放到队头
   * @param msg
   */
  void SendMessageAtFront(Message *msg);

  /**
   * looper中调用此方法回调
   * @param msg
   */
  void DispatchMessage(Message *msg);

  /**
   * RomoveMessage时触发的回调
   * @param msg
   */
  void DispatchRemoveMessage(Message *msg);

  /**
   * 销毁消息队列中msg.what = what的消息
   * @param what
   */
  void RemoveMessage(int what);

  /**
   * 消息队列中消息数
   * @return
   */
  int Size();

private:
  Looper *looper_;
  HandlerCallback *callback_;
};

}  // namespace thread

#endif  // THREAD_HANDLER_H_
