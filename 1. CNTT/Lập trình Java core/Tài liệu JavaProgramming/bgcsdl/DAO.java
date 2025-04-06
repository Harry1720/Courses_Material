package DAL;

import java.sql.*;
import java.util.*;
import javax.swing.table.DefaultTableModel;

public class DAO {

    static private Connection con = null;
    static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    static String host = "jdbc:sqlserver://VULONG\\LONG:1433;databaseName=NS;";
    static String uName = "sa";
    static String uPass = "thanggieng";

    static private Connection createConnection() throws SQLException, ClassNotFoundException {
        Class.forName(driver);
        return DriverManager.getConnection(host, uName, uPass);
    }

    static public void closeConnection() throws SQLException {
        if (con != null) {
            con.close();
        }
    }

    static public ResultSet getResultSet(String query, Object... params) throws SQLException, ClassNotFoundException {
        con = createConnection();
        PreparedStatement pst = con.prepareStatement(query);
        int j = 1;
        for (int i = 0; i < params.length - 1; i += 2) {
            pst.setObject(j, params[i], (int) params[i + 1]);
            j++;
        }
        return pst.executeQuery();
    }

    static public ArrayList getTableMetadata() throws Exception {
        con = createConnection();
        DatabaseMetaData meta = con.getMetaData();
        String[] table = {"TABLE"};
        ResultSet rs = null;
        ArrayList tables = new ArrayList();
//        System.out.println(meta.getDriverName() + "\n" + meta.getURL());
        rs = meta.getTables(null, null, null, table);
        while (rs.next()) {
            tables.add(rs.getString("TABLE_NAME"));
        }
        con.close();
        return tables;
    }

    static public ArrayList getColumnsMetadata() throws Exception {
        con = createConnection();
        DatabaseMetaData meta = con.getMetaData();
        String[] table = {"TABLE"};
        ResultSet rs = null;
        ArrayList tables = getTableMetadata();
        ArrayList columns = new ArrayList();
        for (Object t : tables) {
            rs = meta.getColumns(null, null, (String) t, null);
            while (rs.next()) {
                columns.add(rs.getString("COLUMN_NAME"));
//                columns.add(rs.getString("COLUMN_SIZE"));
//                columns.add(rs.getString("TYPE_NAME"));
            }
        }
        con.close();
        return columns;
    }

    static public int executeNonQuery(String query, Object... params) throws SQLException, ClassNotFoundException {
        con = createConnection();
        PreparedStatement pst = con.prepareStatement(query);
        int j = 1;
        for (int i = 0; i < params.length - 1; i += 2) {
            pst.setObject(j, params[i], (int) params[i + 1]);
            j++;
        }
        int kq = pst.executeUpdate();
        con.close();
        return kq;
    }

    public static DefaultTableModel getTableModel(ResultSet rs) {
        try {
            ResultSetMetaData md = rs.getMetaData();
            int colNum = md.getColumnCount();
            Vector colNames = new Vector();
            // Get the column names
            for (int col = 0; col < colNum; col++) {
                colNames.addElement(md.getColumnLabel(col + 1));
            }
            // Get all rows.
            Vector rows = new Vector();
            while (rs.next()) {
                Vector newRow = new Vector();
                for (int i = 1; i <= colNum; i++) {
                    newRow.addElement(rs.getObject(i));
                }
                rows.addElement(newRow);
            }
            return new DefaultTableModel(rows, colNames);
        } catch (Exception e) {

            return null;
        } finally {
            try {
                DAO.closeConnection();
            } catch (SQLException ex) {
            }
        }
    }
    
}
