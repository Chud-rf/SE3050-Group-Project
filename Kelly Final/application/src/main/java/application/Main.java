package application;

import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

public class Main extends Application {

	@Override
	public void start(Stage primaryStage) {
		try {
			Connection con = DatabaseConnection.getConnection();

			FXMLLoader loader = new FXMLLoader(getClass().getResource("Marketplace.fxml"));
			BorderPane root = loader.load();

			MarketplaceController controller = loader.getController();
			controller.loadMarkets(con);

		// UPDATED: matched scene size to Marketplace.fxml
			Scene scene = new Scene(root, 943, 704);

			// UPDATED: guarded stylesheet load so a missing CSS file won't throw a NullPointerException
			URL cssUrl = getClass().getResource("application.css");
			if (cssUrl != null) {
				scene.getStylesheets().add(cssUrl.toExternalForm());
			}

			// ADDED: Title
			primaryStage.setTitle("Farmers Market");
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void stop() throws Exception {
		DatabaseConnection.closeConnection();
		super.stop();
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		launch(args);
	}
}