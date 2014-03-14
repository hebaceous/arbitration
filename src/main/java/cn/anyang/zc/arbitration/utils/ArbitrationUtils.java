package cn.anyang.zc.arbitration.utils;

import java.io.UnsupportedEncodingException;

public class ArbitrationUtils {

	public static String ISO2UTF (String string) {
		if(string == null){
			return null;
		}
		try {
			return new String(string.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("编码转换异常");
		}
		return null;
	}

	/**
	 * 解决 fn:split 不能得到空字符的问题(把每一个都加一个空格)
	 */
	public static String splitAndSpace (String string, int length) {
		if(string == null){
			return null;
		}
		StringBuilder sb = new StringBuilder();
		String[] strings = string.split(",");
		for(int i=0; i<strings.length; i++) {
			if(strings[i].trim().equals("")){
				sb.append(" ,");
			} else {
				sb.append(strings[i].trim() + ",");
			}
		}
		for(int i=strings.length; i<length; i++){
			sb.append(" ,");
		}
		String result =  sb.substring(0, sb.length()-1);
		return result;
	}

	/**
	 * 去除不必要的空格，存入数据库
	 */
	public static String deleteSpace(String string, int length) {
		if(string == null){
			return null;
		}
		StringBuilder sb = new StringBuilder();
		String[] strings = string.split(",");
		for(int i=0; i<strings.length; i++) {
			if(strings[i].trim().equals("")){
				sb.append(",");
			} else {
				sb.append(strings[i].trim() + ",");
			}
		}
		for(int i=strings.length; i<length; i++){
			sb.append(",");
		}
		String result =  sb.substring(0, sb.length()-1);
		return result;
	}

}