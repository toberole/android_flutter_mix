package com.zw.android_flutter_mix.kotlin_demo

class Test_Kotlin {
    /*
       public static final class Demo {
          public final void test() {
          }
       }
     */
    class Demo {
        fun test() {}
    }

    /*
       public final class Demo1 {
          public final void test() {
          }
      }
     */
    inner class Demo1 {
        fun test() {}
    }

    /*
     public static class Demo_xxxx {
        public static void demo() {

        }
     }
     */
    companion object Demo_xxxx {
        fun demo() {}
    }
}