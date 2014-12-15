package com.sanbao.it.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class FileUtil {
	
	public boolean isFileExists(String rootPath, String fileName){
		
		File file = new File(rootPath, fileName);
		boolean result = false;
		
		if(file.exists()){
			result = true;
		}
		
		return result;
	}
	
	public InputStream getInputStream(String parentPath, String fileName) throws IOException{
		
		InputStream stream = null;
		
		if(isFileExists(parentPath, fileName)){
			File file = new File(parentPath, fileName);
			stream = new FileInputStream(file);
		}
		
		return stream;
	}
}
