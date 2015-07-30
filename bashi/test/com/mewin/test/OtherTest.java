package com.mewin.test;

public class OtherTest {
	public static void main(String[] args) {
		String r = "北京|密云|怀柔|&1,2,3,#云南|大理|丽江|傣族自治州|昆明|&7,8,9,16,31,#福建|厦门|福州|&13,14,15,#华东|杭州|无锡|&17,18,19,#山东|青岛|&20,21,#河南|开封|洛阳|&22,23,24,#东北|哈尔滨|&25,26,#西藏|拉萨|&27,28,#海南|三亚|&29,30,#内蒙古|呼和浩特出发|&32,33,#";
		String []s = r.split("#");
		for(String s1 :s){
//			System.out.println(s1);
			
			String [] s2 = s1.split("&");
			
//			System.out.println(s2[0]);
//			System.out.println(s2[1]);
			
			String [] s3 = s2[0].split("\\|");
			String [] s4 = s2[1].split(",");
			
//			for(String s5 : s3){
//				System.out.println(s5);
//			}
//			for(String s5 : s4){
//				System.out.println(s5);
//			}
//			
			for(int i = 0;i<s3.length;i++){
				System.out.println(s3[i]+":"+s4[i]);
			}
			
//			for(String s5 :s2){
//				System.out.println(s5);
//			}
			
		}
	}
}
