package com._30.common.util;

/**
 * 
 * 判断客户的当前状态，签到，中签之类
 * 
 * @author luolei
 * 
 */
public class StatusUtils {

    private StatusUtils() {

    }

    /**
     * 是否签到
     * 
     * @param status
     * @return
     */
    public static boolean isSignIn(String status) {
        return pattern(status, 0);
    }

    public static String setSignIn(String status) {
        return setSatus(status, 1);
    }

    /**
     * 中签签到
     * 
     * @param status
     * @return
     */
    public static boolean isZQSignIn(String status) {
        return pattern(status, 2);
    }

    public static String setZQSignIn(String status) {
        return setSatus(status, 3);
    }

    /**
     * 是否选房
     * 
     * @param status
     * @return
     */
    public static boolean isXF(String status) {
        return pattern(status, 3);
    }

    public static String setXF(String status) {
        return setSatus(status, 4);
    }

    /**
     * 财务确认
     * 
     * @param status
     * @return
     */
    public static boolean isCW(String status) {
        return pattern(status, 4);
    }

    public static String setCW(String status) {
        return setSatus(status, 5);
    }

    /**
     * 是否中签
     * 
     * @param status
     * @return
     */
    public static boolean isZQ(String status) {
        return pattern(status, 1);
    }

    public static String setZQ(String status) {
        return setSatus(status, 2);
    }

    private static boolean pattern(String status, int index) {

        char i = status.charAt(index);

        char s = '0';

        if (s == i) {
            return true;
        }
        return false;

    }

    /**
     * @param status
     * @param index
     *            start form 1
     * @return
     */
    private static String setSatus(String status, int index) {
        String[] chars = status.split("");
        chars[index] = "0";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < chars.length; i++) {
            String s = chars[i];
            sb.append(s);
        }

        return sb.toString();

    }

    /**改变指定位置的值
     * @param status
     * @param index
     *            start form 1
     * @return
     */
    public static String setStatus(String status,String newstatus, int index) {
        String[] chars = status.split("");
        chars[index] =newstatus;
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < chars.length; i++) {
            String s = chars[i];
            sb.append(s);
        }

        return sb.toString();

    }
    public static void main(String[] args) {

        String s = "11111";

        s = setSignIn(s);
        System.out.println(s);
        System.out.println(isSignIn(s));

        s = setZQSignIn(s);
        System.out.println(s);
        System.out.println(isZQSignIn(s));
        s = setCW(s);
        System.out.println(s);
        System.out.println(isCW(s));
        s = setZQ(s);
        System.out.println(s);
        System.out.println(isZQ(s));
        s = setXF(s);
        System.out.println(s);
        System.out.println(isXF(s));
        System.out.println(setStatus("11111","0",4));
    }

}
