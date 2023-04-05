//
// Created by jeffli on 2022/1/13.
//

#include "message.h"

namespace thread {

Message::Message()
  : what(-1)
  , arg1(-1)
  , arg2(-1)
  , arg3(-1)
  , arg4(-1)
  , arg5(-1)
  , arg6(-1)
  , arg7(-1)
  , arg8(1.0f)
  , arg9(1.0f)
  , flag1(false)
  , obj1(nullptr)
  , obj2(nullptr)
  , obj3(nullptr)
  , obj4(nullptr)
  , str1()
  , str2()
  , target(nullptr) {

}

Message::~Message() {
  /**
   * obj1
   * obj2
   * target
   * 不应该在Message析构函数中销毁, 应该由开发者决定是否销毁
   */
   if (obj1 != nullptr) {
     delete obj1;
     obj1 = nullptr;
   }
   if (obj2 != nullptr) {
     delete obj2;
     obj2 = nullptr;
   }
   if (obj3 != nullptr) {
     delete obj3;
     obj3 = nullptr;
   }
   if (obj4 != nullptr) {
     delete obj4;
     obj4 = nullptr;
   }
}

}