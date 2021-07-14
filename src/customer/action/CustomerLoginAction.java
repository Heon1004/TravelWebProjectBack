package customer.action;

import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import customer.model.CustomerBean;
import customer.model.CustomerDAO;
import util.SHA256;

public class CustomerLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		CustomerBean customer;
		CustomerDAO dao = new CustomerDAO();
		String loginMsg = null;
		String email = request.getParameter("customerEmail");
		String pw = request.getParameter("customerPw");
		String emailpattern = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";

			if (!email.equals("") && email != null && !pw.equals("") && pw != null) {
				if (Pattern.matches(emailpattern, email)) {
				email = SHA256.getEncrypt(email);
				if (dao.login(email, pw)) {
					customer = dao.getCustomer(email);
					session.setAttribute("customer", customer);
				}else {
					loginMsg = "メールまたは、パスワード一度確認してください。";
					request.setAttribute("customerEmail", email);
				}
			}else {
				loginMsg = "正しいEamilではありません。";
			}
		} 
		if(loginMsg != null) {
			request.setAttribute("loginMsg", loginMsg);
		}
		forward.setRedirect(true);
		forward.setPath("index.jsp");
		return forward;
	}
}
