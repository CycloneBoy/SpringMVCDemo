package com.cycloneboy.controller;

import com.cycloneboy.model.DocumentEntity;
import com.cycloneboy.model.InstallEntity;
import com.cycloneboy.model.UserEntity;
import com.cycloneboy.repository.DocumentRepository;
import com.cycloneboy.repository.InstallRepository;
import com.cycloneboy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.Id;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CycloneBoy on 2017/5/29.
 */
@Controller
@RequestMapping("/admin/installs")
public class InstallController {

    @Autowired
    InstallRepository installRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    DocumentRepository documentRepository;

    // 查看所有安装记录
    @RequestMapping(method = RequestMethod.GET)
    public String showInstalls(ModelMap modelMap,
                               HttpSession session){

        // 获取登录用户
        UserEntity user = (UserEntity)session.getAttribute("user_session");
        List<UserEntity> userList = new ArrayList<>();
        List<DocumentEntity> documentList = new ArrayList<>();
        documentList = documentRepository.findAll();

        List<InstallEntity> installList = new ArrayList<>();
        // 如果是管理员
        if(user.getNickname().equals("admin")){
            // 查询user表中所有记录
            installList  = installRepository.findAll();
            userList = userRepository.findAll();
        }else {
            installList = installRepository.findAllByUserByUserId(user); // 只显示当前用户
            userList.add(user);
        }
        modelMap.addAttribute("installList",installList);
        // 向jsp注入用户列表
        modelMap.addAttribute("userList",userList);

        // 向jsp注入软件列表
        modelMap.addAttribute("documentList",documentList);
        return "admin/installs";
    }

    // 查看指定用户的安装记录
    @RequestMapping(value = "/get",method = RequestMethod.POST)
    public String showInstallsByUser(@ModelAttribute("userFind") UserEntity userFind,
                                     ModelMap modelMap,
                                     HttpSession session){
        System.out.println("查询的用户id :" + userFind.getId());
        // 获取登录用户
        UserEntity user = (UserEntity)session.getAttribute("user_session");
        List<UserEntity> userList = new ArrayList<>();

        List<InstallEntity> installList = new ArrayList<>();
        // 如果是管理员
        if(user.getNickname().equals("admin")){
            // 查询user表中所有记录
            UserEntity findUser = userRepository.findOne(userFind.getId());
            installList  = installRepository.findAllByUserByUserId(findUser);
            System.out.println("要查询的用户名称:" + findUser.getId() + "_"+
                findUser.getNickname());
            userList = userRepository.findAll();
        }else {
            installList = installRepository.findAllByUserByUserId(user); // 只显示当前用户
            userList.add(user);
        }
        modelMap.addAttribute("installList",installList);
        // 向jsp注入用户列表
        modelMap.addAttribute("userList",userList);
        return "admin/installs";
    }

    // 查看指定用户的安装记录
    @RequestMapping(value = "/getByDocument",method = RequestMethod.POST)
    public String showInstallsByDocument(@ModelAttribute("documentFind") DocumentEntity documentFind,
                                     ModelMap modelMap,
                                     HttpSession session){
        System.out.println("查询的软件id :" + documentFind.getId());
        // 获取登录用户
        UserEntity user = (UserEntity)session.getAttribute("user_session");
        List<DocumentEntity> documentList = new ArrayList<>();
        List<UserEntity> userList = new ArrayList<>();
        List<InstallEntity> installList = new ArrayList<>();
        DocumentEntity findDocument = documentRepository.findOne(documentFind.getId());
        // 如果是管理员
        if(user.getNickname().equals("admin")){
            // 查询document表中所有记录


            installList  = installRepository.findAllByDocumentByDocumentId(findDocument);
            System.out.println("要查询的软件名称:" + findDocument.getId() + "_"+
                    findDocument.getTitle() + "_" + findDocument.getFilename());

            documentList = documentRepository.findAll();
            userList = userRepository.findAll();
        }else {
           // installList = installRepository.findAllByUserByUserId(user); // 只显示当前用户
            installList = installRepository.findAllByDocumentByDocumentIdAndUserByUserId(findDocument,user);
            documentList = documentRepository.findAll();
            userList.add(user);
        }
        modelMap.addAttribute("installList",installList);
        // 向jsp注入用户列表
        modelMap.addAttribute("userList",userList);
        // 向jsp注入软件列表
        modelMap.addAttribute("documentList",documentList);
        return "admin/installs";
    }

    // 删除指定的记录
    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") int id){

        installRepository.delete(id);
        installRepository.flush();

        return "redirect:/admin/installs";
    }
}
