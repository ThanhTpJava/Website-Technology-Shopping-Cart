package poly.edu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import poly.edu.dao.DanhmucDao;
import poly.edu.dao.SanPhamDao;
import poly.edu.model.Danhmuc;
import poly.edu.model.Sanpham;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet({ "/list", "/detail" })
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
   
	
	SanPhamDao daoSP = new SanPhamDao();
	DanhmucDao daoDM = new DanhmucDao();

	protected void SPFillDanhMuc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// chọn thư mục
		try {
			String madm = request.getParameter("madm");
			if (madm == null) {
				return;
			} else {
				List<Sanpham> listspdm = daoSP.findAllByMadm(madm);
				request.setAttribute("items", listspdm);
				System.out.println("Truy vấn thành công");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Truy vấn sản phẩm trong 1 danh mục thất bại");
		}
	}

	protected void DanhMucFillSP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Danh mục

		try {
			List<Danhmuc> dm = daoDM.findAll();
			request.setAttribute("dm", dm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Truy vấn danh mục thất bại");
		}

	}

	protected void FindAllSP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Tìm 1 sản phẩm
		try {
			List<Sanpham> listsp = daoSP.findAll();
			System.out.println("Truy vấn thành công");
			request.setAttribute("items", listsp);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Truy vấn toàn bộ sản phẩm thất bại");
		}

	}

	protected void FindByMaSP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Tìm hết
		String id = request.getParameter("id");
		try {
			Sanpham sp = daoSP.findById(id);
			System.out.println("Truy vấn thành công");
			request.setAttribute("item", sp);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Truy vấn 1 sản phẩm thất bại");
		}

	}

	protected void FindByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
		int pageSize = 9;
		long totalProducts = daoSP.countProduct();
		int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPages", totalPages);

		List<Sanpham> listsp = daoSP.findPage(currentPage, pageSize);
		request.setAttribute("items", listsp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		 HttpSession session = request.getSession();
//	        String lang = (String) session.getAttribute("lang");
//	        if (lang == null) {
//	            lang = "en"; // Mặc định là tiếng Anh nếu chưa được lưu trong session
//	        }
//	        response.getWriter().write(lang); // Trả về ngôn ngữ hiện tại
		
		
		
		String uri = request.getRequestURI();
		if (uri.contains("detail")) {
			FindByMaSP(request, response);
			DanhMucFillSP(request, response);
			SPFillDanhMuc(request, response);
			request.getRequestDispatcher("/views/list/detail.jsp").forward(request, response);
		} else if (uri.contains("list")) {
//			FindAllSP(request, response);
			FindByPage(request, response);
			DanhMucFillSP(request, response);
			SPFillDanhMuc(request, response);
			request.getRequestDispatcher("/views/list/list.jsp").forward(request, response);

		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String madm = request.getParameter("madm");
//		response.sendRedirect(request.getContextPath() + "/list?madm=" + madm);
		
//		HttpSession session = request.getSession();
//		
//        String lang = request.getParameter("lang");
//        session.setAttribute("lang", lang); // Lưu ngôn ngữ mới vào session
//        response.sendRedirect(request.getHeader("referer")); // Chuyển hướng trang trở lại trang hiện tại
		
		
	}
}
