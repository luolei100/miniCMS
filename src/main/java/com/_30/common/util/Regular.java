package com._30.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regular {
	
	 public  static String checkLoginMethods(String idcard_phone_tdcode)
	 {
		 String str="tdcode";//默认是 二维码
		
		 
		 //Pattern idcard= Pattern.compile("\\d{15}|\\d{17}[x|X]");  //身份证
		 //Matcher isidcard = idcard.matcher(idcard_phone_tdcode);  
		 
		 
		 if(idcard_phone_tdcode.length()==15||idcard_phone_tdcode.length()==18)
		 {
			str="idcard";
		 }
		 
		 
		     
		Pattern p = Pattern.compile("^((13[0-9])|(15[0-9])|(18[0-9]))\\d{8}$");       
		 Matcher m = p.matcher(idcard_phone_tdcode);       
		 if(m.matches())
		 {
			 str="phone";
		 }
		 
		             
		 
		 
		 return str;
		 
		 
		 
	 }
	 
	 
	 
	 public static void main(String[] args) {
		
		System.out.println(checkLoginMethods("18620729816"));
		System.out.println(checkLoginMethods("440105198802133063"));
		 
	}

}
