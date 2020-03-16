package com.chenhao.cms.util;

import org.apache.commons.codec.digest.DigestUtils;

public class Md5Util {
	private static String sqlt="qwer123";
	public static String encode(String password) {
		String md5Hex = DigestUtils.md5Hex(password+sqlt);
		return md5Hex;
	}
}
