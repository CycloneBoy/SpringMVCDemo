package com.cycloneboy.commont;

import com.cycloneboy.model.UserEntity;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by CycloneBoy on 2017/5/29.
 */
public class AuthorizedIntercepor implements HandlerInterceptor{

    /** 定义不需要拦截的请求 */
    private static final String[] IGNORE_URI = {"/loginForm",
            "/login","/404.html","/admin/documents"};

    private static final String[] NEED_URI = {"/admin/documents/add",
            "/admin/documents/download","/admin/documents/update",
            "/admin/documents/delete","/admin/documents/downloadUninstall",
            "/admin/installs"
    };

    /**
     * preHandle方法是进行处理器拦截用的，该方法将在Controller处理之前进行调用，
     * 当preHandle的返回值为false的时候整个请求就结束了。
     * 如果preHandle的返回值为true，则会继续执行postHandle和afterCompletion。
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        boolean flag = true;
        //获取请求的 ServletPath
        String servletPath = httpServletRequest.getServletPath();
        System.out.println("请求的路径:" + servletPath);
        //判断请求是否需要拦截
        /*for (String s : IGNORE_URI){
            if (servletPath.contains(s)){
                flag = true ;
                break;
            }
        }*/

        // 需要被拦截
        for (String s : NEED_URI){
            if (servletPath.contains(s)){
                flag = false ;
                break;
            }
        }

    // 拦截请求
        if(!flag){
            /**  1.获取 session 中的用户 */
            UserEntity user = (UserEntity)httpServletRequest.getSession().
                    getAttribute("user_session");

            /** 2.判断用户是否已经登录 */
            if (user == null){
                httpServletRequest.setAttribute("message",
                        "请先登录网站，再进行下载软件!");
                httpServletRequest.getRequestDispatcher("loginForm").
                        forward(httpServletRequest,httpServletResponse);
                System.out.println("下载拦截:请先登录网站，再进行下载软件!");
                return  false;
            }else {   //用户已经登录
                flag = true;
            }
        }
        return flag;
    }

    /**
     * 这个方法在preHandle方法返回值为true的时候才会执行。
     * 执行时间是在处理器进行处理之 后，也就是在Controller的方法调用之后执行。
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 该方法需要preHandle方法的返回值为true时才会执行。
     * 该方法将在整个请求完成之后执行，主要作用是用于清理资源。
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
