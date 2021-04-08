package com.mycompany.myapp.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {
	
    public static String upload(MultipartFile multipartFile, HttpServletRequest request) {
       
    	String uploadedFileUrl = null;
        /*String rootPath = request.getSession().getServletContext().getRealPath("/");
        String realUploadPath = rootPath + "resources/imgUpload";
        System.out.println("루트경로 : "+rootPath);
        System.out.println("실제 업로드 경로 : "+realUploadPath);*/
        String realUploadPath = "http://13.124.60.145:8080/SpringProject/hanjang";
        
        File dir = new File(realUploadPath);
        if (!dir.exists())
            dir.mkdirs();
        File file = new File(dir.getAbsolutePath() + File.separator + multipartFile.hashCode()
                + multipartFile.getOriginalFilename());
        try {
            multipartFile.transferTo(file);
            uploadedFileUrl = dir.getAbsolutePath() + File.separator + multipartFile.hashCode()
            + multipartFile.getOriginalFilename();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uploadedFileUrl;
    }
	
}