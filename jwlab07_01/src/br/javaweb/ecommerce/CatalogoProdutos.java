
package br.javaweb.ecommerce;

import br.javaweb.aj.dao.ProdutoDAO;
import br.javaweb.aj.dao.ProdutoDAOImpl;
import br.javaweb.util.JavaWebException;
import java.util.List;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CatalogoProdutos extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProdutoDAO produtosDB = new ProdutoDAOImpl();
        List listaProdutos = null;
        try {
            listaProdutos = produtosDB.getCatalogoProdutos();

            request.setAttribute("catalogo", listaProdutos);
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/CatalogoProdutosView.jsp");
            rd.forward(request, response);

        } catch (JavaWebException e) {
            throw new ServletException(e);
        }
    }
}
