package com.jeffmony.nativeevent;

/**
 * @author jeffli
 */
public class NativeEvent {

    private static boolean sLoadLibrary = false;

    public static void loadLibrary() {
        if (sLoadLibrary) {
            return;
        }
        try {
            System.loadLibrary("c++_shared");
            System.loadLibrary("message_queue");
            sLoadLibrary = true;
        } catch (Throwable e) {
            throw e;
        }
    }
}
