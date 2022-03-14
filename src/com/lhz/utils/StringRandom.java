package com.lhz.utils;

import java.util.UUID;

public class StringRandom {
	
//	public static void main(String[] args) {
//		System.out.println(RandomId().length());
//	}
	//随机生成id号
	public static String RandomId() {
		String str = UUID.randomUUID().toString().replace("-", "").substring(0, 15);
		return str;
	}
	
	//对图片的进行处理
	 public static String randImgName(String imgName){
	        int index = imgName.lastIndexOf(".");
	        String str = imgName.substring(index,imgName.length());
	        return RandomId()+str;
	    }
	 
	//验证是否是图片
    public static Boolean checkImg(String imgName){
        Boolean flag = false;
        try{
            if(imgName!=null&&imgName.trim().length()!=0){
                int index = imgName.lastIndexOf(".");
                String str = imgName.substring(index+1,imgName.length());
                if("jpg".equals(str)||"jpeg".equals(str)||"png".equals(str)||"gif".equals(str)){
                    flag = true;
                }
            }else{
                return flag;
            }
        }catch (Exception e){
            return flag;
        }


        return flag;
    }
}
