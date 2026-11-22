package application;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DatabaseQueries {

    // All markets with operating days
    public List<Market> getAllMarkets() throws SQLException, ClassNotFoundException {
        String sql = """
            SELECT m.market_id,
                   m.name,
                   m.location,
                   m.start_date,
                   m.end_date,
                   m.start_time,
                   m.end_time,
                   GROUP_CONCAT(
                       md.day_of_week
                       ORDER BY FIELD(
                           md.day_of_week,
                           'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
                       )
                   ) AS operating_days
            FROM market m
            LEFT JOIN market_day md ON m.market_id = md.market_id
            GROUP BY m.market_id, m.name, m.location, m.start_date, m.end_date, m.start_time, m.end_time
            ORDER BY m.name ASC
            """;

        List<Market> markets = new ArrayList<>();
        Connection con = DatabaseConnection.getConnection();
        try (PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String days = rs.getString("operating_days");
                markets.add(new Market(
                        rs.getInt("market_id"),
                        rs.getString("name"),
                        rs.getString("location"),
                        String.valueOf(rs.getDate("start_date")),
                        String.valueOf(rs.getDate("end_date")),
                        String.valueOf(rs.getTime("start_time")),
                        String.valueOf(rs.getTime("end_time")),
                        days != null ? days : ""
                ));
            }
        }
        return markets;
    }

    // Active markets for current date
    public List<Market> getActiveMarkets() throws SQLException, ClassNotFoundException {
        String sql = """
            SELECT m.market_id,
                   m.name,
                   m.location,
                   m.start_date,
                   m.end_date,
                   m.start_time,
                   m.end_time,
                   GROUP_CONCAT(
                       md.day_of_week
                       ORDER BY FIELD(
                           md.day_of_week,
                           'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
                       )
                   ) AS operating_days
            FROM market m
            LEFT JOIN market_day md ON m.market_id = md.market_id
            WHERE CURDATE() BETWEEN m.start_date AND m.end_date
            GROUP BY m.market_id, m.name, m.location, m.start_date, m.end_date, m.start_time, m.end_time
            ORDER BY m.name ASC
            """;

        List<Market> markets = new ArrayList<>();
        Connection con = DatabaseConnection.getConnection();
        try (PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String days = rs.getString("operating_days");
                markets.add(new Market(
                        rs.getInt("market_id"),
                        rs.getString("name"),
                        rs.getString("location"),
                        String.valueOf(rs.getDate("start_date")),
                        String.valueOf(rs.getDate("end_date")),
                        String.valueOf(rs.getTime("start_time")),
                        String.valueOf(rs.getTime("end_time")),
                        days != null ? days : ""
                ));
            }
        }
        return markets;
    }

    // Market combo box items
    public List<ComboItem> getMarketComboItems() throws SQLException, ClassNotFoundException {
        String sql = "SELECT market_id, name FROM market ORDER BY name ASC";
        List<ComboItem> items = new ArrayList<>();

        Connection con = DatabaseConnection.getConnection();
        try (PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                items.add(new ComboItem(rs.getInt("market_id"), rs.getString("name")));
            }
        }
        return items;
    }

    // Market details and vendors by market ID
    public List<MarketVendorRow> getMarketVendors(int marketId) throws SQLException, ClassNotFoundException {
        String sql = """
            SELECT mv.market_id,
                   m.name AS market_name,
                   m.location,
                   mv.vendor_id,
                   v.name AS vendor_name
            FROM market_vendor mv
            LEFT JOIN market m ON mv.market_id = m.market_id
            LEFT JOIN vendor v ON mv.vendor_id = v.vendor_id
            WHERE m.market_id = ?
            ORDER BY m.name ASC
            """;

        List<MarketVendorRow> rows = new ArrayList<>();
        Connection con = DatabaseConnection.getConnection();
        try (PreparedStatement st = con.prepareStatement(sql)) {

            st.setInt(1, marketId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int vendorId = rs.getObject("vendor_id") != null ? rs.getInt("vendor_id") : 0;
                    String vendorName = rs.getString("vendor_name") != null ? rs.getString("vendor_name") : "No vendors";
                    rows.add(new MarketVendorRow(
                            rs.getInt("market_id"),
                            rs.getString("market_name"),
                            rs.getString("location"),
                            vendorId,
                            vendorName
                    ));
                }
            }
        }
        return rows;
    }

    // Product search by keyword
    public List<ProductListingRow> searchProducts(String keyword) throws SQLException, ClassNotFoundException {
        String sql = """
            SELECT p.product_id,
                   p.name AS product_name,
                   p.description,
                   vp.price,
                   vp.stock_quantity,
                   v.vendor_id,
                   v.name AS vendor_name,
                   m.market_id,
                   m.name AS market_name
            FROM product p
            JOIN vendor_product vp ON p.product_id = vp.product_id
            JOIN vendor v ON vp.vendor_id = v.vendor_id
            JOIN market m ON v.market_id = m.market_id
            WHERE p.name LIKE ? OR p.description LIKE ?
            ORDER BY p.name ASC
            """;

        String pattern = "%" + (keyword == null ? "" : keyword.trim()) + "%";
        return queryProductListings(sql, pattern, pattern);
    }

    // Product listings by vendor name
    public List<ProductListingRow> getProductsByVendor(String vendorName) throws SQLException, ClassNotFoundException {
        String sql = """
            SELECT p.product_id,
                   p.name AS product_name,
                   p.description,
                   vp.price,
                   vp.stock_quantity,
                   v.vendor_id,
                   v.name AS vendor_name,
                   m.market_id,
                   m.name AS market_name
            FROM product p
            JOIN vendor_product vp ON p.product_id = vp.product_id
            JOIN vendor v ON vp.vendor_id = v.vendor_id
            JOIN market m ON v.market_id = m.market_id
            WHERE v.name LIKE ?
            ORDER BY p.name ASC
            """;

        String pattern = "%" + (vendorName == null ? "" : vendorName.trim()) + "%";
        return queryProductListings(sql, pattern);
    }

    // Shared product listing query runner
    private List<ProductListingRow> queryProductListings(String sql, String... params)
            throws SQLException, ClassNotFoundException {
        List<ProductListingRow> rows = new ArrayList<>();
        Connection con = DatabaseConnection.getConnection();
        try (PreparedStatement st = con.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                st.setString(i + 1, params[i]);
            }
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    rows.add(new ProductListingRow(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("description"),
                            rs.getBigDecimal("price"),
                            rs.getInt("stock_quantity"),
                            rs.getInt("vendor_id"),
                            rs.getString("vendor_name"),
                            rs.getInt("market_id"),
                            rs.getString("market_name")
                    ));
                }
            }
        }
        return rows;
    }

    // Order history by customer ID
    public List<OrderHistoryRow> getOrderHistory(int customerId) throws SQLException, ClassNotFoundException {
        String sql = """
            SELECT o.order_id,
                   o.order_date,
                   o.status,
                   o.total_amount,
                   p.name AS product_name,
                   v.name AS vendor_name,
                   oi.quantity,
                   oi.unit_price,
                   (oi.quantity * oi.unit_price) AS line_total
            FROM orders o
            JOIN customer c ON o.customer_id = c.customer_id
            JOIN order_item oi ON o.order_id = oi.order_id
            JOIN product p ON oi.product_id = p.product_id
            JOIN vendor v ON oi.vendor_id = v.vendor_id
            WHERE c.customer_id = ?
            ORDER BY o.order_date DESC, o.order_id ASC
            """;

        List<OrderHistoryRow> rows = new ArrayList<>();
        Connection con = DatabaseConnection.getConnection();
        try (PreparedStatement st = con.prepareStatement(sql)) {

            st.setInt(1, customerId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    rows.add(new OrderHistoryRow(
                            rs.getInt("order_id"),
                            String.valueOf(rs.getTimestamp("order_date")),
                            rs.getString("status"),
                            rs.getBigDecimal("total_amount"),
                            rs.getString("product_name"),
                            rs.getString("vendor_name"),
                            rs.getInt("quantity"),
                            rs.getBigDecimal("unit_price"),
                            rs.getBigDecimal("line_total")
                    ));
                }
            }
        }
        return rows;
    }

    // Pre-order transaction
    public int placePreOrder(int customerId, int vendorId, int productId, int quantity)
            throws SQLException, ClassNotFoundException {
        if (quantity <= 0) {
            throw new IllegalArgumentException("Quantity must be greater than zero.");
        }

        // Decrement stock query
        String decrementStockSql = """
            UPDATE vendor_product
            SET stock_quantity = stock_quantity - ?
            WHERE vendor_id = ?
              AND product_id = ?
              AND stock_quantity >= ?
            """;

        // Unit price query
        String selectPriceSql = """
            SELECT price
            FROM vendor_product
            WHERE vendor_id = ?
              AND product_id = ?
            """;

        // Insert order query
        String insertOrderSql = """
            INSERT INTO orders (customer_id, order_date, total_amount, status)
            VALUES (?, NOW(), ?, 'Pending')
            """;

        // Insert order item query
        String insertOrderItemSql = """
            INSERT INTO order_item (order_id, product_id, vendor_id, quantity, unit_price)
            VALUES (?, ?, ?, ?, ?)
            """;

        Connection con = DatabaseConnection.getConnection();
        
        // Begin transaction
        con.setAutoCommit(false);
        try {
            int updatedRows;
            try (PreparedStatement st = con.prepareStatement(decrementStockSql)) {
                st.setInt(1, quantity);
                st.setInt(2, vendorId);
                st.setInt(3, productId);
                st.setInt(4, quantity);
                updatedRows = st.executeUpdate();
            }

            if (updatedRows == 0) {
                throw new SQLException("Insufficient stock available for this product.");
            }

            BigDecimal unitPrice;
            try (PreparedStatement st = con.prepareStatement(selectPriceSql)) {
                st.setInt(1, vendorId);
                st.setInt(2, productId);
                try (ResultSet rs = st.executeQuery()) {
                    if (!rs.next()) {
                        throw new SQLException("Product price not found for this vendor.");
                    }
                    unitPrice = rs.getBigDecimal("price");
                }
            }

            BigDecimal totalAmount = unitPrice.multiply(BigDecimal.valueOf(quantity));
            int orderId;

            try (PreparedStatement st = con.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS)) {
                st.setInt(1, customerId);
                st.setBigDecimal(2, totalAmount);
                st.executeUpdate();

                try (ResultSet keys = st.getGeneratedKeys()) {
                    if (!keys.next()) {
                        throw new SQLException("Failed to retrieve generated order_id.");
                    }
                    orderId = keys.getInt(1);
                }
            }

            try (PreparedStatement st = con.prepareStatement(insertOrderItemSql)) {
                st.setInt(1, orderId);
                st.setInt(2, productId);
                st.setInt(3, vendorId);
                st.setInt(4, quantity);
                st.setBigDecimal(5, unitPrice);
                st.executeUpdate();
            }

            // Commit transaction
            con.commit();
            return orderId;
        } catch (Exception e) {
            // Rollback transaction
            con.rollback();
            if (e instanceof SQLException sqlEx) {
                throw sqlEx;
            }
            throw new SQLException("Pre-order failed and rolled back: " + e.getMessage(), e);
        } finally {
            // Restore auto-commit
            con.setAutoCommit(true);
        }
    }
}