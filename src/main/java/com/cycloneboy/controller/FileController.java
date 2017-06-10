package com.cycloneboy.controller;


import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by CycloneBoy on 2017/5/28.
 */
@Controller
public class FileController {


    // 文件上传Get请求
    @RequestMapping(value = "/admin/files/upload",method = RequestMethod.GET)
    public String upload(ModelMap modelMap){

        String showMessage = " 请选择文件上传";
        modelMap.addAttribute("showmessage",showMessage);

        return  "file/upload";
    }

    // 文件上传相关
    @RequestMapping(value = "/admin/files/upload",method = RequestMethod.POST)
    public String uploadP(@RequestParam MultipartFile[] myfiles
                         ) throws
            IOException{

        for(MultipartFile file : myfiles){

            if(file.isEmpty()){
                System.out.println("文件未上传！");
            }else {
                String fileName = file.getOriginalFilename();

                String filePath =  new SimpleDateFormat("yyyyMMddHHmmss").
                        format(new Date())  + "_" + fileName ;

                System.out.println("文件上传路径：" + filePath);

                File localFile = new File(filePath) ;
                file.transferTo(localFile);
            }
        }

        return "file/uploadSuccess";
    }

    // 文件上传Get请求
    @RequestMapping(value = "/admin/files/upload/photo",method = RequestMethod.GET)
    public String updatePhoto(ModelMap modelMap){

        String showMessage = " 请选择文件上传";
        modelMap.addAttribute("showmessage",showMessage);

        return  "file/fileInput";
    }


}
