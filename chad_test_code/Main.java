package application;
	
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.fxml.FXMLLoader;
import java.sql.*;

public class Main extends Application {
	
	private Connection conn;
	
	@Override
	public void start(Stage primaryStage) {
		try {
			String url = "jdbc:mysql://localhost:3306/group_project";
			String user = "root";
			String password = "password";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			
			FXMLLoader loader = new FXMLLoader(getClass().getResource("Marketplace.fxml"));
			BorderPane root = loader.load();
			
			MarketplaceController controller = loader.getController();
			controller.loadMarkets(con);

			Scene scene = new Scene(root,400,400);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void stop() throws Exception {
		if (conn != null && !conn.isClosed()) {
			conn.close();
		}
		super.stop();
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		launch(args);
	}
}
