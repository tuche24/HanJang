package com.mycompany.myapp.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {
	
    public static String upload(MultipartFile multipartFile, HttpServletRequest request) {
       
    	String uploadedFileUrl = null;
        //String rootPath = request.getSession().getServletContext().getRealPath("/");
        //String realUploadPath = rootPath + "resources/imgUpload";
        int hashcode = multipartFile.hashCode();
        
        String realUploadPath = "http://13.124.60.145:8080/SpringProject/resources/imgUpload";
        
        File dir = new File(realUploadPath);
    
        if (!dir.exists())
            dir.mkdirs();
        File file = new File(realUploadPath+File.separator+hashcode+multipartFile.getOriginalFilename());
        try {
            multipartFile.transferTo(file);
            
            // 파일 없을 시 none.png로 저장되게 설정
    		if(multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {
    			uploadedFileUrl = File.separator+"imgUpload"+File.separator+hashcode+multipartFile.getOriginalFilename();
    		} else {
    			uploadedFileUrl = File.separator+"imgUpload"+File.separator+"none.png";
    		}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uploadedFileUrl;
    }
	
}