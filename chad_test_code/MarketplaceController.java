package application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;


public class MarketplaceController {
	
	@FXML
	private TableView<Market> marketsTable;
	
	@FXML
	private TableColumn<Market, String> marketTableName;
	
	@FXML
	private TableColumn<Market, String> marketTableLocation;

	
	ObservableList<Market> data = FXCollections.observableArrayList();
	
	@FXML
	public void initialize() {
		marketTableName.setCellValueFactory(new PropertyValueFactory<Market, String>("name"));
		marketTableLocation.setCellValueFactory(new PropertyValueFactory<Market, String>("location"));
		marketsTable.setItems(data);
	}
	
	public void loadMarkets(Connection con) throws SQLException {
		String selectAllMarkets = "SELECT * FROM market;";
		
		PreparedStatement st = con.prepareStatement(selectAllMarkets);
		
		ResultSet rs = st.executeQuery();
		
		while (rs.next()) {
			String name = rs.getString("name");
			String location = rs.getString("location");
			
			data.add(new Market(name, location));
			
			System.out.println("Loaded rows: " + data.size());
		}
		
	}

}
