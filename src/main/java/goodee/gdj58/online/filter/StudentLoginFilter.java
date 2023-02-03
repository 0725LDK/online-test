package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log(); 로그 쓸때
@WebFilter("/student/*")
public class StudentLoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
	{
		log.debug("\u001B[31m"+"StudentLoginFilter");//로그 빨간색으로 표시 앞에 문자열을 바꾸면 색이 바뀐다
		if(request instanceof HttpServletRequest)
		{
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("loginStudent") == null)
			{
				((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/loginEmp");
				return;
			}
		}
		else
		{
			log.debug("웹브라우저 요청만 허용됩니다.");
			return;
		}
		
		//controller 전
		chain.doFilter(request, response);
		//controller 후
	}
}
