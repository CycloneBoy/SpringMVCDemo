package com.cycloneboy.controller;

import com.cycloneboy.model.UserEntity;
import com.cycloneboy.model.UserForm;
import com.cycloneboy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CycloneBoy on 2017/5/27.
 */
@Controller
public class MainController {

    // 自动装配数据库接口，不需要再写原始的Connection来操作数据库
   @Autowired(required=true)
    UserRepository userRepository;


   // 返回用户首页
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public  String index(){
        return  "loginForm";
    }

    // 注销用户
    @RequestMapping(value = "/admin/users/logout",method = RequestMethod.GET)
    public  String logout(HttpSession session){

        session.removeAttribute("user_session");

        return  "loginForm";
    }
    // 查看所有用户
    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap,
            HttpSession session){

        // 获取登录用户
        UserEntity user = (UserEntity)session.getAttribute("user_session");
        user = userRepository.findOne(user.getId());
        session.setAttribute("user_session",user);
        List<UserEntity> userList = new ArrayList<>();
        // 如果是管理员
        if(user.getNickname().equals("admin")){
            // 查询user表中所有记录
            userList = userRepository.findAll();
        }else {
            userList.add(user); // 只显示当前用户
        }

        // 将所有记录传递给要返回的jsp页面，放在userList当中
        modelMap.addAttribute("userList",userList);
        modelMap.addAttribute("user",user);
        // 返回pages目录下的admin/users.jsp页面
        return  "admin/users";
    }

    // get请求，访问添加用户 页面
    @RequestMapping(value = "/admin/users/add",method = RequestMethod.GET)
    public String addUser(){
        // 转到 admin/addUser.jsp页面
        return  "admin/addUser";
    }

    // post请求，处理添加用户请求，并重定向到用户管理页面
    @RequestMapping(value = "/admin/users/addP",method = RequestMethod.POST)
    public String addUserP(@ModelAttribute("user") UserEntity userEntity,
                           HttpSession session){
        // 注意此处，post请求传递过来的是一个UserEntity对象，里面包含了该用户的信息
        // 通过@ModelAttribute()注解可以获取传递过来的'user'，并创建这个对象

        // 数据库中添加一个用户，该步暂时不会刷新缓存
        //userRepository.save(userEntity);

        // 数据库中添加一个用户，并立即刷新缓存
        userRepository.saveAndFlush(userEntity);

        session.setAttribute("user_session",userEntity);
        // 重定向到用户管理页面，方法为 redirect:url
        return  "redirect:/";
    }

    // 查看用户详情
    // @PathVariable可以收集url中的变量，需匹配的变量用{}括起来
    // 例如：访问 localhost:8080/admin/users/show/1 ，将匹配 id = 1
    @RequestMapping(value = "/admin/users/show/{id}",method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer userId,ModelMap modelMap){

        // 找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        // 传递给请求页面
        modelMap.addAttribute("user",userEntity);

        return "admin/userDetail";
    }

    // 更新用户信息 页面
    @RequestMapping(value = "/admin/users/update/{id}",method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId,ModelMap modelMap){

        // 找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        // 传递给请求页面
        modelMap.addAttribute("user",userEntity);

        return  "admin/updateUser";
    }

    // 更新用户信息 操作
    @RequestMapping(value = "/admin/users/updateP" ,method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("userP") UserEntity user
                                 ){

        // 更新用户信息
        userRepository.updateUser(user.getNickname(), user.getFirstName(),
                user.getLastName(),user.getPassword(),user.getId());
        // 刷新缓冲区
        userRepository.flush();

        return "redirect:/admin/users";
    }

    // 删除用户
    @RequestMapping(value = "/admin/users/delete/{id}",method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer userId){

        // 删除id为userId的用户
        userRepository.delete(userId);
        // 立即刷新
        userRepository.flush();

        return "redirect:/admin/users";
    }

    @RequestMapping(value = "/admin/users/login",method = RequestMethod.GET)
    public String login(){

        return "loginForm";
    }

    // 用户登录
    @RequestMapping(value = "/admin/users/login",method = RequestMethod.POST)
    public  String loginP(@ModelAttribute("user") UserForm userForm,
            HttpSession session, ModelMap modelMap){

        System.out.println("输入的用户：" + userForm.getNickname() + "_" +
            userForm.getPassword() + "_" + userForm.getType() );

        UserEntity userEntity = userRepository.findUserEntityByNicknameAndPassword(
                userForm.getNickname(),userForm.getPassword());


        if (userEntity == null){
            modelMap.addAttribute("message",
                    "用户名或密码不对，请重新输入！");
            return "loginForm";
        }
        System.out.println("登录的用户:" + userEntity.getId() +"_" +
            userEntity.getNickname());
        session.setAttribute("user_session",userEntity);

        return "redirect:/admin/documents";
    }
}
