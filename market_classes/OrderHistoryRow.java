package application;

import java.math.BigDecimal;

// One row from the order-history query (one row per order item).
public class OrderHistoryRow {

    private int orderId;
    private String orderDate;
    private String status;
    private BigDecimal totalAmount;
    private String productName;
    private String vendorName;
    private int quantity;
    private BigDecimal unitPrice;
    private BigDecimal lineTotal;

    public OrderHistoryRow(int orderId, String orderDate,
                           String status, BigDecimal totalAmount,
                           String productName, String vendorName,
                           int quantity, BigDecimal unitPrice,
                           BigDecimal lineTotal) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.productName = productName;
        this.vendorName = vendorName;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.lineTotal = lineTotal;
    }

    public int getOrderId() {
        return orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getStatus() {
        return status;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public String getProductName() {
        return productName;
    }

    public String getVendorName() {
        return vendorName;
    }

    public int getQuantity() {
        return quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public BigDecimal getLineTotal() {
        return lineTotal;
    }
}
