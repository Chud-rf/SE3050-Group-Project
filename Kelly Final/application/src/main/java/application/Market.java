package application;

public class Market {

    private int marketId;
    private String name;
    private String location;
    private String startDate;
    private String endDate;
    private String startTime;
    private String endTime;
    private String operatingDays;

    // Kept for compatibility with the existing UI code.
    public Market(String name, String location) {
        this.name = name;
        this.location = location;
    }

    // Full constructor for database market information.
    public Market(int marketId, String name, String location,
                  String startDate, String endDate,
                  String startTime, String endTime,
                  String operatingDays) {
        this.marketId = marketId;
        this.name = name;
        this.location = location;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.operatingDays = operatingDays;
    }

    public int getMarketId() {
        return marketId;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public String getOperatingDays() {
        return operatingDays;
    }
}