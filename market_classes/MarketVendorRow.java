package application;

// One row showing a vendor associated with a market.
public class MarketVendorRow {

    private int marketId;
    private String marketName;
    private String location;
    private int vendorId;
    private String vendorName;

    public MarketVendorRow(int marketId, String marketName,
                           String location, int vendorId,
                           String vendorName) {
        this.marketId = marketId;
        this.marketName = marketName;
        this.location = location;
        this.vendorId = vendorId;
        this.vendorName = vendorName;
    }

    public int getMarketId() {
        return marketId;
    }

    public String getMarketName() {
        return marketName;
    }

    public String getLocation() {
        return location;
    }

    public int getVendorId() {
        return vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }
}
