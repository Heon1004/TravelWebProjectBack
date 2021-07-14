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

public class CustomerJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		CustomerBean customer = new CustomerBean();
		CustomerDAO dao = new CustomerDAO();
		String joinMsg = null;
		String email = request.getParameter("customerEmail");
		String pw = request.getParameter("customerPw");
		String reEnter = request.getParameter("reEnter");
		String emailpattern = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		//空白検索
		if (!email.equals("") && email != null && !pw.equals("") && pw != null) {
			//メール検索
			if (Pattern.matches(emailpattern, email)) {
				//メール検索
				if(dao.checkCustomerEmail(email)) {
					joinMsg = "既に存在しているEmailです。";
				}
				if (reEnter.equals(pw)) {
					//ログイン成功
					email = SHA256.getEncrypt(email);
					customer.setCustomerEmail(email);
					customer.setCustomerPw(pw);
					dao.join(customer);
	
					session.setAttribute("customer", customer);
					joinMsg = "会員登録完了";
				}else {
					//パスワードが間違った場合
					joinMsg = "パスワードをもう一度確認してください。";
					request.setAttribute("customerEmail", email);
					request.setAttribute("customerPw", pw);
				}
			}else {
				//メールの形式のエラー
				request.setAttribute("customerEmail", email);
				joinMsg = "既に存在しているEmailです。";
			} 
		}else {
			request.setAttribute("customerEmail",email);
			joinMsg = "入力されてないところがあります。";
		}
		if(joinMsg != null) {
			request.setAttribute("joinMsg", joinMsg);
		}
		forward.setRedirect(true);
		forward.setPath("index.jsp");
		return forward;
	}
}
