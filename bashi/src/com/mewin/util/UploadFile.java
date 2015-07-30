package com.mewin.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import com.mewin.entity.User;

public class UploadFile  {
	
	/**
	 * 上传文件
	 * @param file
	 * @param path
	 * @return 文件保存后的名称
	 */
	public static String upload(File file,String fileName,String path){
		
		
		if(file != null){
			String[] refex = fileName.split("[.]");
			fileName = UUID.randomUUID().toString()+"."+refex[refex.length-1];
			File savefile = new File(new File(path), fileName);
            double size = ((double)file.length())/1024/1024;
            try {
				FileUtils.copyFile(file, savefile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
		}
		
		return fileName;
	}
	
	public static void upload(File file,String fileName,String path,String fname){
		
		
		if(file != null){
			String[] refex = fileName.split("[.]");
			fileName = fname+"."+refex[refex.length-1];
			File savefile = new File(new File(path), fileName);
			try {
				FileUtils.copyFile(file, savefile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
		}
		
	}
	
}
