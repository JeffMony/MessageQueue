cmake_minimum_required(VERSION 3.4.1)

# 开启汇编
enable_language(ASM)

set(-DCMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Wall -s -Wdeprecated-declarations")
set(-DCMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Wall -s -Wdeprecated-declarations")

#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Oz -flto -fdata-sections -ffunction-sections")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Oz -flto -fdata-sections -ffunction-sections")
#set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -O3 -flto  -Wl,--gc-sections -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/version_script.txt") #version_script.txt 与当前 CMakeLists.txt 同目录

set(PATH_TO_MEDIACORE ${CMAKE_SOURCE_DIR})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# include source header
set(EVENT_DIR ${CMAKE_SOURCE_DIR})
include_directories(${EVENT_DIR})


file (GLOB event_source
        handler.cc
        handler_thread.cc
        looper.cc
        message.cc
        message_queue.cc
        thread_utils.cc
        time_utils.cc )

# 添加编译库的名字, 动态库和源码
add_library(
        jm_message
        SHARED
        ${event_source}
)

target_link_libraries(
        jm_message
        android
        log
        z
        m
        dl
)
