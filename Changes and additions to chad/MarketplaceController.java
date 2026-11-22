package application;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//ADDED
import java.util.ArrayList; 
import java.util.List; 
import java.math.BigDecimal;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
//ADDED
import javafx.scene.control.Alert; 
import javafx.scene.control.Label; 
import javafx.scene.control.ListView; 
import javafx.scene.control.TextField; 

public class MarketplaceController {

	@FXML
	private TableView<Market> marketsTable;

	@FXML
	private TableColumn<Market, String> marketTableName;

	@FXML
	private TableColumn<Market, String> marketTableLocation;

	ObservableList<Market> data = FXCollections.observableArrayList();

	// ADDED: DatabaseQueries helper instance
	private final DatabaseQueries dbQueries = new DatabaseQueries();

	// ADDED: "Market Details" tab fields
	@FXML
	private Label detailsMarketName;

	@FXML
	private Label detailsAddress;

	@FXML
	private Label detailsDates;

	@FXML
	private ListView<String> vendorsList;

	// ADDED: "Products" tab fields
	@FXML
	private TextField productSearchField;

	@FXML
	private TableView<ProductListingRow> productsTable;

	@FXML
	private TableColumn<ProductListingRow, String> productColName;

	@FXML
	private TableColumn<ProductListingRow, String> productColVendor;

	@FXML
	private TableColumn<ProductListingRow, String> productColMarket;

	@FXML
	private TableColumn<ProductListingRow, BigDecimal> productColPrice;

	@FXML
	private TableColumn<ProductListingRow, Integer> productColStock;

	// ADDED: "Pre-order" tab fields
	@FXML
	private TextField preOrderCustomerIdField;

	@FXML
	private TextField preOrderVendorIdField;

	@FXML
	private TextField preOrderProductIdField;

	@FXML
	private TextField preOrderQuantityField;

	@FXML
	private Label preOrderStatusLabel;

	@FXML
	public void initialize() {
		marketTableName.setCellValueFactory(new PropertyValueFactory<Market, String>("name"));
		marketTableLocation.setCellValueFactory(new PropertyValueFactory<Market, String>("location"));
		marketsTable.setItems(data);

		// ADDED: Populate Market Details & vendors when a market is selected
		marketsTable.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, selectedMarket) -> {
			if (selectedMarket != null) {
				populateMarketDetails(selectedMarket);
			}
		});

		// ADDED: Bind Products table columns to ProductListingRow getters
		if (productsTable != null) {
			productColName.setCellValueFactory(new PropertyValueFactory<>("productName"));
			productColVendor.setCellValueFactory(new PropertyValueFactory<>("vendorName"));
			productColMarket.setCellValueFactory(new PropertyValueFactory<>("marketName"));
			productColPrice.setCellValueFactory(new PropertyValueFactory<>("price"));
			productColStock.setCellValueFactory(new PropertyValueFactory<>("stockQuantity"));
		}
	}

		// UPDATED: Load full Market objects via dbQueries.getAllMarkets() so marketId, dates, days, and hours are populated
	public void loadMarkets(Connection con) throws SQLException {
		try {
			List<Market> markets = dbQueries.getAllMarkets();

			// ADDED: Clear previous rows before reloading
			data.clear();
			data.addAll(markets);

			System.out.println("Loaded rows: " + data.size());

			// ADDED: Auto-select first market so Market Details starts populated
			if (!data.isEmpty()) {
				marketsTable.getSelectionModel().selectFirst();
			}
		} catch (SQLException e) {
			throw e;
		} catch (Exception e) {
			throw new SQLException("Failed to load markets", e);
		}
	}

	// ADDED: Populate Market Details labels and vendor list
	private void populateMarketDetails(Market market) {
		if (detailsMarketName != null) {
			detailsMarketName.setText(market.getName());
		}
		if (detailsAddress != null) {
			detailsAddress.setText(market.getLocation());
		}
		if (detailsDates != null) {
			String dates = (market.getStartDate() != null || market.getEndDate() != null)
					? market.getStartDate() + " - " + market.getEndDate()
					: "";
			String hours = (market.getStartTime() != null && market.getEndTime() != null)
					? " | " + market.getStartTime() + " - " + market.getEndTime()
					: "";
			String days = (market.getOperatingDays() != null && !market.getOperatingDays().isBlank())
					? " (" + market.getOperatingDays() + ")"
					: "";
			detailsDates.setText(dates + days + hours);
		}

		if (vendorsList != null && market.getMarketId() > 0) {
			try {
				List<MarketVendorRow> vendors = dbQueries.getMarketVendors(market.getMarketId());
				List<String> items = new ArrayList<>();
				for (MarketVendorRow row : vendors) {
					if (row.getVendorId() > 0) {
						items.add(row.getVendorName() + " (Vendor ID: " + row.getVendorId() + ")");
					}
				}
				if (items.isEmpty()) {
					items.add("No vendors listed");
				}
				vendorsList.setItems(FXCollections.observableArrayList(items));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// ADDED: FXML handler for Products search button
	@FXML
	private void handleSearchProducts() {
		if (productsTable == null) {
			return;
		}
		try {
			String keyword = productSearchField != null ? productSearchField.getText() : "";
			List<ProductListingRow> results = dbQueries.searchProducts(keyword);
			productsTable.setItems(FXCollections.observableArrayList(results));
		} catch (Exception e) {
			e.printStackTrace();
			showAlert(Alert.AlertType.ERROR, "Search Error", "Could not search products: " + e.getMessage());
		}
	}

	// ADDED: FXML handler for Pre-order submit button
	@FXML
	private void handlePlacePreOrder() {
		try {
			int customerId = Integer.parseInt(preOrderCustomerIdField.getText().trim());
			int vendorId = Integer.parseInt(preOrderVendorIdField.getText().trim());
			int productId = Integer.parseInt(preOrderProductIdField.getText().trim());
			int quantity = Integer.parseInt(preOrderQuantityField.getText().trim());

			int orderId = dbQueries.placePreOrder(customerId, vendorId, productId, quantity);
			String msg = "Pre-order placed! Order ID: " + orderId;

			if (preOrderStatusLabel != null) {
				preOrderStatusLabel.setText(msg);
			}
			showAlert(Alert.AlertType.INFORMATION, "Order Confirmed", msg);
		} catch (NumberFormatException e) {
			String msg = "Enter valid numbers for Customer ID, Vendor ID, Product ID, and Quantity.";
			if (preOrderStatusLabel != null) {
				preOrderStatusLabel.setText(msg);
			}
			showAlert(Alert.AlertType.WARNING, "Invalid Input", msg);
		} catch (Exception e) {
			String msg = e.getMessage() != null ? e.getMessage() : "Unable to place pre-order.";
			if (preOrderStatusLabel != null) {
				preOrderStatusLabel.setText(msg);
			}
			showAlert(Alert.AlertType.ERROR, "Pre-Order Error", msg);
		}
	}

	// ADDED: Reusable alert helper
	private void showAlert(Alert.AlertType type, String title, String message) {
		Alert alert = new Alert(type);
		alert.setTitle(title);
		alert.setHeaderText(null);
		alert.setContentText(message);
		alert.showAndWait();
	}
}