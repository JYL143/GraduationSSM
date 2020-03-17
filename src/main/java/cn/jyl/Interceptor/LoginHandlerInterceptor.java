package cn.jyl.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandlerInterceptor implements HandlerInterceptor {

    //目标方法执行之前
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        Object user=request.getSession().getAttribute("loginUser");

            //做数据库查询为了方便的时候把拦截器关了
        if (user==null){//session拿不到值说明是没有登录的，不放行，返回登录页面
            request.getSession().setAttribute("msg","没有权限请先登录!");//顺便给一下错误消息
            response.sendRedirect(request.getContextPath()+"/login/login1");
            return false;
        }else{      //登录状态就放行

        return true;
      }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
