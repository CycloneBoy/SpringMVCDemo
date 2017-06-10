package com.cycloneboy.controller;

import com.cycloneboy.commont.ToolUtils;
import com.cycloneboy.model.DocumentEntity;
import com.cycloneboy.model.DocumentFrom;
import com.cycloneboy.model.InstallEntity;
import com.cycloneboy.model.UserEntity;
import com.cycloneboy.repository.DocumentRepository;
import com.cycloneboy.repository.InstallRepository;
import com.cycloneboy.repository.UserRepository;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Constants;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by CycloneBoy on 2017/5/28.
 */
@Controller
@RequestMapping("/admin/documents")
public class DocumentController {

    @Autowired
    DocumentRepository documentRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    InstallRepository installRepository;

    public  Map<Integer,String> documentTypeMap;

    public DocumentController() {
        documentTypeMap = new HashMap<Integer,String>();
        documentTypeMap.put(1,"工具");
        documentTypeMap.put(2,"游戏软件");
        documentTypeMap.put(3,"视频软件");
        documentTypeMap.put(4,"音乐软件");
        documentTypeMap.put(5,"社交软件");
        documentTypeMap.put(6,"办公软件");
        documentTypeMap.put(7,"其他软件");
    }

    // 查看所有文档
    @RequestMapping(method = RequestMethod.GET)
    public String showDocuments(ModelMap modelMap){

        List<DocumentEntity> documentList = documentRepository.findAll();
        modelMap.addAttribute("documentList",documentList);

        return "admin/documents";

    }

    // 查看所有某种类型文档
    @RequestMapping(value = "/get/{type}", method = RequestMethod.GET)
    public String showDocumentsByType(@PathVariable("type") int type,ModelMap modelMap){

        List<DocumentEntity> documentList = documentRepository.findAllByType(type);
        modelMap.addAttribute("documentList",documentList);

        return "admin/documents";

    }

    // 添加文档 GET请求
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String addDocument(ModelMap modelMap){

        List<UserEntity> userList = userRepository.findAll();
        modelMap.addAttribute("userList",userList);

        modelMap.addAttribute("documentTypeMap",documentTypeMap);

        return "admin/addDocument";
    }

    // 文件上传POST 请求
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addDocumentP(@ModelAttribute("document") DocumentFrom documentEntity,
                               HttpSession session) throws  Exception{

        System.out.println("上传文件:" + documentEntity.getTitle() + "_" +
            documentEntity.getFilename() + "_" +
            documentEntity.getRemark() +"_" + documentEntity.getType() +"_" +
            documentEntity.getCreateDate());
        UserEntity userEntity = new UserEntity();
        userEntity.setId(3);
        documentEntity.setUserByUserId(userEntity);
        String path = session.getServletContext().getRealPath("/upload/");

        String filename = documentEntity.getFile().getOriginalFilename();

        System.out.println("上传文件名称:" + filename);

        documentEntity.getFile().transferTo(new File(path + File.separator + filename));
        documentEntity.setFilename(filename);
        // 保存到数据库
        DocumentEntity document = new DocumentEntity();
        document.setTitle(documentEntity.getTitle());
        document.setFilename(documentEntity.getFilename());
        document.setRemark(documentEntity.getRemark());
        document.setUserByUserId(documentEntity.getUserByUserId());
        document.setCreateDate(documentEntity.getCreateDate());
        document.setType(documentEntity.getType());

        // 保存到数据库
        documentRepository.saveAndFlush(document);

        return "redirect:/admin/documents";
    }

    @RequestMapping(value = "/show/{id}",method = RequestMethod.GET)
    public String showDetail(@PathVariable("id") int id,ModelMap modelMap){

        DocumentEntity document = documentRepository.findOne(id);

        modelMap.addAttribute("document",document);

        String documentType = documentTypeMap.get(document.getType());
        modelMap.addAttribute("documentType",documentType);
        //return  "admin/documentDetail";
        return  "admin/documentDownload";
    }

    @RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public  String updateDocument(@PathVariable("id") int id,ModelMap modelMap){

        DocumentEntity document = documentRepository.findOne(id);
        modelMap.addAttribute("document",document);
        modelMap.addAttribute("documentTypeMap",documentTypeMap);

        return  "admin/updateDocument";

    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    String updateDocumentP(@ModelAttribute("documentP") DocumentEntity documentEntity){

        DocumentEntity document = documentRepository.findOne(documentEntity.getId());
        document.setTitle(documentEntity.getTitle());
        document.setRemark(documentEntity.getRemark());
        document.setType(documentEntity.getType());

        // 保存到数据库
        documentRepository.updateDocument(document.getTitle(),document.getRemark(),
                document.getUserByUserId().getId(),document.getFilename(),document.getCreateDate(),
                document.getType(),document.getId());

        documentRepository.flush();

        return "redirect:/admin/documents";
    }

    // 删除文件
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String deleteDocument(@PathVariable("id") int id){
        documentRepository.delete(id);
        documentRepository.flush();
        System.out.println("删除一个文件：" + id);
        return  "redirect:/admin/documents";
    }

    // 文件下载中转站 （ 未安装 ）
    @RequestMapping(value = "/downloadUninstall/{id}",method = RequestMethod.GET)
    public String downloadUninstall(@PathVariable("id") int id,
                            HttpSession session){

        UserEntity user = (UserEntity)session.getAttribute("user_session");

        System.out.println(user.getNickname()+": 下载了软件没有安装:" + id);

        InstallEntity installEntity  = new InstallEntity();
        UserEntity userEntity = userRepository.findOne(3);
        installEntity.setType("未安装");
        installEntity.setInstallDate(new Date());
        installEntity.setDocumentByDocumentId(documentRepository.findOne(id));
        installEntity.setUserByUserId(user);

        // 记录一次安装记录（软件未安装)
        installRepository.saveAndFlush(installEntity);

        return "redirect:/admin/documents";
    }

    // 文件下载中转站
    @RequestMapping(value = "/downloadT/{id}",method = RequestMethod.GET)
    public String downloadT(@PathVariable("id") int id,
                            HttpSession session){

        System.out.println("你点击了文件中转站");
        return  "admin/test";
    }

    // 文件下载
    @RequestMapping(value = "/download/{id}",method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(@PathVariable("id") int id,
        HttpSession session,
        HttpServletResponse response) throws Exception{

        DocumentEntity target = documentRepository.findOne(id);

        UserEntity user = (UserEntity)session.getAttribute("user_session");
        System.out.println(user.getNickname()+": 下载了软件并且安装:" + id);

        // 保存一次安装记录(安装成功)
        System.out.println("你下载了软件并且安装:" + id);

        InstallEntity installEntity  = new InstallEntity();
        UserEntity userEntity = userRepository.findOne(3);
        installEntity.setType("安装成功");
        installEntity.setInstallDate(new Date());
        installEntity.setDocumentByDocumentId(target); //安装软件
        installEntity.setUserByUserId(user);

        // 记录一次安装记录（软件未安装)
        installRepository.saveAndFlush(installEntity); //存入数据库

        String fileName = target.getFilename();
        // 上传文件路径
        String path = session.getServletContext().getRealPath("/upload/");
        // 获取要下载文件的File对象
        File file = new File(path + File.separator +fileName);
        //创建 Springframework 的 HttpHeaders对象
        HttpHeaders headers = new HttpHeaders();
        // 下载显示的文件名，解决中文名称乱码问题
        String downloadFileName = new String(fileName.getBytes(
                "UTF-8"),"iso-8859-1");

        // 通知浏览器以 attachment(下载方式) 打开文件
        headers.setContentDispositionFormData("attachment",downloadFileName);
        // application/octet-stream : 二进制流数据（最为常见的文件下载)
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);


        // 201 HttpStatus.CREATED
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.OK);


    }

    // 下载测试
    @RequestMapping(value = "/download/test",method = RequestMethod.GET)
    public ResponseEntity<String> downFile(
            HttpSession session,
            HttpServletResponse response,
            HttpServletRequest request){
        InputStream inputStream = null;
        ServletOutputStream out = null;
        try {
            String path = session.getServletContext().getRealPath("/upload/");
            String fileName = "setup-x86_64.exe";//"opencv-3.1.0.exe";//"
            String filePath = path + File.separator +fileName;
            File file = new File(filePath + File.separator +fileName);
            int fSize = Integer.parseInt(String.valueOf(file.length()));
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/x-download");
            response.setHeader("Accept-Ranges", "bytes");
            response.setHeader("Content-Length", String.valueOf(fSize));
            response.setHeader("Content-Disposition", "attachment;fileName=" +fileName );
            inputStream = new FileInputStream(filePath);
            long pos = 0;
            if (null != request.getHeader("Range")) {
                // 断点续传
                response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                try {
                    pos = Long.parseLong(request.getHeader("Range").replaceAll("bytes=", "").replaceAll("-", ""));
                } catch (NumberFormatException e) {
                    pos = 0;
                }
            }
            out = response.getOutputStream();
            String contentRange = new StringBuffer("bytes ").append(pos+"").append("-").append((fSize - 1)+"").append("/").append(fSize+"").toString();
            response.setHeader("Content-Range", contentRange);
            inputStream.skip(pos);
            byte[] buffer = new byte[1024*10];
            int length = 0;
            while ((length = inputStream.read(buffer, 0, buffer.length)) != -1) {
                out.write(buffer, 0, length);
           /*<span style="font-family: Consolas;">*/Thread.sleep(100/*</span><code class="java value">100</code><code class="java plain">*/);/*</code>*/
            }
        } catch (Exception e) {
            //logger.error("ODEX软件下载异常："+e);
        }finally{
            try {
                if(null != out) out.flush();
                if(null != out) out.close();
                if(null != inputStream) inputStream.close();
            } catch (IOException e) {
            }
        }
        System.out.println("调用controller里面的文件下载方法！！！");

        return new ResponseEntity(null,HttpStatus.OK);
    }

    @RequestMapping(value = "/system/test" ,method = RequestMethod.GET)
    public String system(){
                return "admin/system";
    }

    // 下载测试
    @RequestMapping(value = "/download/test1",method = RequestMethod.GET)
    public ResponseEntity<String> downFileOne(
            HttpSession session,
            HttpServletResponse response,
            HttpServletRequest request){
        InputStream inputStream = null;
        ServletOutputStream out = null;
        try {
            String path = session.getServletContext().getRealPath("/upload/");
            String fileName = "setup-x86_64.exe";//"opencv-3.1.0.exe";//"
            String filePath = path + File.separator +fileName;
            File file = new File(filePath + File.separator +fileName);
            int fSize = Integer.parseInt(String.valueOf(file.length()));
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/x-download");
            response.setHeader("Accept-Ranges", "bytes");
            response.setHeader("Content-Length", String.valueOf(fSize));
            response.setHeader("Content-Disposition", "attachment;fileName=" +fileName );
            inputStream = new FileInputStream(filePath);
            long pos = 0;
            if (null != request.getHeader("Range")) {
                // 断点续传
                response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                try {
                    pos = Long.parseLong(request.getHeader("Range").replaceAll("bytes=", "").replaceAll("-", ""));
                } catch (NumberFormatException e) {
                    pos = 0;
                }
            }
            out = response.getOutputStream();
            String contentRange = new StringBuffer("bytes ").append(pos+"").append("-").append((fSize - 1)+"").append("/").append(fSize+"").toString();
            response.setHeader("Content-Range", contentRange);
            inputStream.skip(pos);
            byte[] buffer = new byte[1024*10];
            int length = 0;
            while ((length = inputStream.read(buffer, 0, buffer.length)) != -1) {
                out.write(buffer, 0, length);
           Thread.sleep(100/*</span><code class="java value">100</code><code class="java plain">*/);/*</code>*/
            }
        } catch (Exception e) {
            //logger.error("ODEX软件下载异常："+e);
        }finally{
            try {
                if(null != out) out.flush();
                if(null != out) out.close();
                if(null != inputStream) inputStream.close();
            } catch (IOException e) {
            }
        }
        System.out.println("调用controller里面的文件下载方法！！！");

        return new ResponseEntity(null,HttpStatus.OK);
    }
}
