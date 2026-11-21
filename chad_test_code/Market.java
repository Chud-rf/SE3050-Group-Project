package application;

public class Market {
	private String name;
	
	private String location;
	
	private String startDate;
	
	private String endDate;
	
	private String startTime;
	
	private String endTime;
	
	public Market(String name, String location) {
		// , String startDate, String endDate, String startTime, String endTime
		this.name = name;
		this.location = location;
	}
	
	public String getName() {
		return name;
	}
	
	public String getLocation() {
		return location;
	}

}
