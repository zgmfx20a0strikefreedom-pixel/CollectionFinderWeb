package servlet;

import java.io.IOException;
import java.util.Map;

// ▼ここが jakarta になっているか確認！
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ReleaseDao;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // DAOを使ってDBから最新情報をSELECT
        ReleaseDao dao = new ReleaseDao();
        Map<String, String> latestRelease = dao.getLatestRelease();

        // リクエストスコープにデータを保存
        request.setAttribute("release", latestRelease);

        // JSPへ転送
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}