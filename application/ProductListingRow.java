package application;

import java.math.BigDecimal;

// One result row from a product search or products-by-vendor query.
public class ProductListingRow {

    private int productId;
    private String productName;
    private String description;
    private BigDecimal price;
    private int stockQuantity;
    private int vendorId;
    private String vendorName;
    private int marketId;
    private String marketName;

    public ProductListingRow(int productId, String productName,
                             String description, BigDecimal price,
                             int stockQuantity, int vendorId,
                             String vendorName, int marketId,
                             String marketName) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.vendorId = vendorId;
        this.vendorName = vendorName;
        this.marketId = marketId;
        this.marketName = marketName;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getDescription() {
        return description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public int getVendorId() {
        return vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public int getMarketId() {
        return marketId;
    }

    public String getMarketName() {
        return marketName;
    }
}
