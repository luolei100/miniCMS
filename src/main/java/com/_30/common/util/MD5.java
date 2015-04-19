package com._30.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
*
* @author 作者:lance wang, E-mail:42448514@qq.com
*/ 
public class MD5 {

	public static String encode(final String src) {
		try {
			final MessageDigest md = MessageDigest.getInstance("MD5");
			return MD5.hex(md.digest(src.getBytes()));
		} catch (final NoSuchAlgorithmException e) {
			throw new IllegalStateException(e.getMessage(), e);
		}
	}

	private static String hex(final byte[] bytes) {
		final StringBuffer buffer = new StringBuffer(bytes.length * 2);
		for (final byte element : bytes) {
			if ((element & 0xff) < 0x10) {
				buffer.append("0");
			}
			buffer.append(Long.toString(element & 0xff, 16));
		}
		return buffer.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(MD5.encode("529659"));
	}

}
