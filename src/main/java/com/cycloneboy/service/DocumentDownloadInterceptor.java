package com.cycloneboy.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * Created by CycloneBoy on 2017/5/29.
 */
@Aspect
@Component
public class DocumentDownloadInterceptor {

    /*// 定义命名的切点
    @Pointcut("execution(* com.cycloneboy.controller.DocumentController.*(..))")
    public void performance(){}

    // 环绕通知方法
    @Around("performance()")
    public void watchPerformance(ProceedingJoinPoint jp){
        try {
            System.out.println("调用方法之前。。。。");
            System.out.println("准备开始下载...");
            jp.proceed();
            System.out.println("调用方法之后...");
            System.out.println("下载完成....");

        } catch (Throwable e){
            System.out.println("下载出现了异常。。。");
            System.out.println("调用方法出现了异常");
        }
    }
*/

}
