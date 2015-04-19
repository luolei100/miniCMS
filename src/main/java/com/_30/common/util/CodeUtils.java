package com._30.common.util;

public class CodeUtils {

    /**
     * 二位码处理
     * 
     * @param code
     * @return
     */
    public static String processCode(String code) {

        // 存在,是机器录入
    	if(code!=null&&code!=""){
        if (code.indexOf(",") > 0) {
            code = code.split(",")[1];
            code = code.substring(1);
        } else if (code.length() < 3) {
            int add = 3 - code.length();
            for (; add > 0; add--) {
                code = "0" + code;
            }

        }
    	}

        return code;
    }

}
