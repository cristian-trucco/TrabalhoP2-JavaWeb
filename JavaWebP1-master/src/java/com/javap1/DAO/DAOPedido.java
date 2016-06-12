
package com.javap1.DAO;

import com.javap1.modelo.Pedido;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DAOPedido {

    private Connection con;
    private PreparedStatement pstmtInsert;
    private PreparedStatement pstmtDelete;
    private PreparedStatement pstmtFind;
    private PreparedStatement pstmtRecords;
    private ResultSet rsRecords;
    private PreparedStatement pstmtUpdate;

    public DAOPedido() {

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            String url = "jdbc:derby://localhost:1527/BrJavaP1";
            String user = "root";
            String pass = "root";

            con = DriverManager.getConnection(url, user, pass);

            pstmtInsert = con.prepareStatement("INSERT INTO pedidos VALUES ( ?, ?, ?, ?, ?, ? )");
            pstmtUpdate = con.prepareStatement("UPDATE pedidos SET CLIENTE = ?, "
                    + "ENDERECO = ?, ESTADO = ?, INTENS = ?, TOTAL = ?  WHERE CODIGO = ?");
            pstmtDelete = con.prepareStatement("DELETE FROM pedidos WHERE CODIGO = ?");
            pstmtFind = con.prepareStatement("SELECT * FROM pedidos WHERE CODIGO = ?");
            pstmtRecords = con.prepareStatement("SELECT * FROM pedidos");

            rsRecords = pstmtRecords.executeQuery();

        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

    }

    public Pedido first() {
        try {
            rsRecords.first();

            Pedido pedido = new Pedido();

            pedido.setCodigo(rsRecords.getInt("CODIGO"));
            pedido.setCliente(rsRecords.getString("CLIENTE"));
            pedido.setEndereco(rsRecords.getString("ENDERECO"));
            pedido.setEstado(rsRecords.getString("ESTADO"));
            pedido.setItens(rsRecords.getString("ITENS"));
            pedido.setTotal(rsRecords.getDouble("TOTAL"));

            return pedido;

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    public Pedido previous() {

        try {
            if (!rsRecords.isFirst()) {
                rsRecords.previous();
            }

            Pedido pedido = new Pedido();

            pedido.setCodigo(rsRecords.getInt("CODIGO"));
            pedido.setCliente(rsRecords.getString("CLIENTE"));
            pedido.setEndereco(rsRecords.getString("ENDERECO"));
            pedido.setEstado(rsRecords.getString("ESTADO"));
            pedido.setItens(rsRecords.getString("ITENS"));
            pedido.setTotal(rsRecords.getDouble("TOTAL"));

            return pedido;

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    public Pedido next() {

        try {
            if (!rsRecords.isLast()) {
                rsRecords.next();
            }

            Pedido pedido = new Pedido();

            pedido.setCodigo(rsRecords.getInt("CODIGO"));
            pedido.setCliente(rsRecords.getString("CLIENTE"));
            pedido.setEndereco(rsRecords.getString("ENDERECO"));
            pedido.setEstado(rsRecords.getString("ESTADO"));
            pedido.setItens(rsRecords.getString("ITENS"));
            pedido.setTotal(rsRecords.getDouble("TOTAL"));

            return pedido;

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    public Pedido last() {
        try {
            rsRecords.last();

            Pedido pedido = new Pedido();

            pedido.setCodigo(rsRecords.getInt("CODIGO"));
            pedido.setCliente(rsRecords.getString("CLIENTE"));
            pedido.setEndereco(rsRecords.getString("ENDERECO"));
            pedido.setEstado(rsRecords.getString("ESTADO"));
            pedido.setItens(rsRecords.getString("ITENS"));
            pedido.setTotal(rsRecords.getDouble("TOTAL"));

            return pedido;

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    public boolean insert(Pedido pedido) {
        try {
            pstmtInsert.setInt(1, pedido.getCodigo());
            pstmtInsert.setString(2, pedido.getCliente());
            pstmtInsert.setString(3, pedido.getEndereco());
            pstmtInsert.setString(4, pedido.getEstado());
            pstmtInsert.setString(5, pedido.getItens());
            pstmtInsert.setDouble(6, pedido.getTotal());

            pstmtInsert.executeUpdate();
            
            rsRecords = pstmtInsert.executeQuery();
            return true;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }

    }

    public boolean update(Pedido pedido) {
        try {

            pstmtUpdate.setString(1, pedido.getCliente());
            pstmtUpdate.setString(2, pedido.getEndereco());
            pstmtUpdate.setString(3, pedido.getEstado());
            pstmtUpdate.setString(4, pedido.getItens());
            pstmtUpdate.setDouble(5, pedido.getTotal());
            pstmtUpdate.setInt(6, pedido.getCodigo());

            pstmtUpdate.executeUpdate();

            rsRecords = pstmtUpdate.executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }

    }

    public boolean delete(int cod) {
        try {

            pstmtDelete.setInt(1, cod);

            pstmtDelete.executeUpdate();

            rsRecords = pstmtDelete.executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }

    }

    public Pedido find(int cod) {
        try {

            pstmtFind.setInt(1, cod);
            pstmtFind.executeUpdate();

            ResultSet rs = pstmtFind.executeQuery();

            if (rs.next()) {
                Pedido pedido = new Pedido();

                pedido.setCodigo(rs.getInt("CODIGO"));
                pedido.setCliente(rs.getString("CLIENTE"));
                pedido.setEndereco(rs.getString("ENDERECO"));
                pedido.setEstado(rs.getString("ESTADO"));
                pedido.setItens(rs.getString("ITENS"));
                pedido.setTotal(rs.getDouble("TOTAL"));

                return pedido;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }

    }

    public ArrayList list() {
        try {
            ArrayList listReturn = new ArrayList();
            while (rsRecords.next()) {
                Pedido pedido = new Pedido();
                pedido.setCodigo(rsRecords.getInt("CODIGO"));
                pedido.setCliente(rsRecords.getString("CLIENTE"));
                pedido.setEndereco(rsRecords.getString("ENDERECO"));
                pedido.setEstado(rsRecords.getString("ESTADO"));
                pedido.setItens(rsRecords.getString("ITENS"));
                pedido.setTotal(rsRecords.getDouble("TOTAL"));
                listReturn.add(pedido);
            }
            return listReturn;
        } catch (SQLException ex) {
            
            return null;
        }

    }

}
