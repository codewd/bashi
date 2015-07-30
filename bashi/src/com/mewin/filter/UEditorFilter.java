package com.mewin.filter; 
import java.io.IOException;
 
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
 
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;
 
public class UEditorFilter extends StrutsPrepareAndExecuteFilter{
    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String url = request.getRequestURI();         
        if (url.contains("/config/ueditor/")) {             
//            System.out.println("use my brower");             
            chain.doFilter(req, res);         
        }else{             
//            System.out.println("user default brower");             
            super.doFilter(req, res, chain);         
        } 
    }
}
