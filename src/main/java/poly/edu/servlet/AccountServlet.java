package poly.edu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;


import poly.edu.dao.UserDao;
import poly.edu.model.User;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet(urlPatterns = { "/account/sign-in", "/account/sign-up", "/account/sign-out", "/account/forgot-password",
		"/account/change-password", "/account/edit-profile" })
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AccountServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("sign-in")) {
//			doSignIn(request, response);
			doLogin(request, response);
		} else if (uri.contains("sign-up")) {
			doSignUp(request, response);
			
		} else if (uri.contains("sign-out")) {
			doSignOut(request, response);
		} else if (uri.contains("edit-profile")) {
			doEditProfile(request, response);
		} else if (uri.contains("forgot-password")) {
			doForGotPassword(request, response);
		} else if (uri.contains("change-password")) {
			doChangePassword(request, response);
		}
	}

	private void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (method.equalsIgnoreCase("POST")) {
			try {
				UserDao dao = new UserDao();
				User user = dao.findOneUser(username);
				System.out.print(user.getFullname());
				System.out.print(user.getPassword());
				if (user == null) {
					request.setAttribute("message", "Username không hợp lệ!!");
				} else {
					if (!user.getPassword().equals(password)) {
						request.setAttribute("message", "Mật khẩu không đúng!!");
					} else {
						request.setAttribute("message", "Đăng nhập thành công!!");
						response.setHeader("Refresh", "1;url=/PS22219_Thanhtp_ASM2/list");
						request.getSession().setAttribute("user", user);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("/views/account/sign-in.jsp").forward(request, response);

	}
	
	private void doSignUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				User entity = new User();
				BeanUtils.populate(entity, request.getParameterMap());
				UserDao dao = new UserDao();
				dao.create(entity);
				request.setAttribute("message", "Đăng ký thành công!");
				response.setHeader("Refresh", "1;url=/PS22219_Thanhtp_ASM2/account/sign-in");
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi đăng ký!");
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("/views/account/sign-up.jsp").forward(request, response);
	}

	private void doSignIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String username = request.getParameter("username");
			String pw = request.getParameter("password");
			try {
				UserDao dao = new UserDao();
				User user = dao.findByOneByUsername(username);
				if (!user.getPassword().equals(pw)) {
					request.setAttribute("message", "Sai mật khẩu!");
				} else {
					request.setAttribute("message", "Đăng nhập thành công!");
					request.getSession().setAttribute("user", user);
					request.setAttribute("hiusername", method);
					response.setHeader("Refresh", "1;url=/PS22219_Thanhtp_ASM2/list");
				}
			} catch (Exception e) {
				request.setAttribute("message", "Sai tên đăng nhập!");
			}
		}
		request.getRequestDispatcher("/views/account/sign-in.jsp").forward(request, response);
	}

	private void doEditProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				UserDao dao = new UserDao();
				dao.update(user);
				request.setAttribute("message", "Cập nhật tài khoản thành công!");
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi cập nhật tài khoản!");
			}
		}
		request.getRequestDispatcher("/views/account/edit-profile.jsp").forward(request, response);
	}

	private void doSignOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.removeAttribute("id");
		session.invalidate();
		request.setAttribute("message", "Đăng xuất thành công!");
		request.getRequestDispatcher("/views/account/sign-in.jsp").forward(request, response);
	}

	private void doForGotPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String email = request.getParameter("email");
			UserDao dao = new UserDao();
			
			try {
				User user = dao.findByOneByEmail(email);
				request.getSession().setAttribute("user", user);
				response.setHeader("Refresh", "1;url=/PS22219_Thanhtp_ASM2/account/change-password");
				request.setAttribute("message", "Đã tìm thấy Email của bạn");
			} catch (Exception e) {
				request.setAttribute("message", "Không tìm thấy Email của bạn");
			}

		}
		request.getRequestDispatcher("/views/account/forgot-password.jsp").forward(request, response);

	}

	private void doChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		User user = (User) request.getSession().getAttribute("user");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				UserDao dao = new UserDao();
				dao.updatePassword(id, password);
				request.getRequestDispatcher("/views/account/sign-in.jsp").forward(request, response);
				request.setAttribute("message", "Cập nhật mật khẩu thành công!");
			} catch (Exception e) {
				request.setAttribute("message", "Cập nhật mật khẩu thành công!");
			}
		}
		request.getRequestDispatcher("/views/account/change-password.jsp").forward(request, response);
	}
}
