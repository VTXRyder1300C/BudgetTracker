package budget;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;//format double
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import java.io.Serializable;

@Named
@RequestScoped
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    private boolean loginAttempted = false;
    private boolean passwordMismatch = false;
    private String username;
    private String password;
    private String name;
    private String userID = "0";//default for testing only
    private static String table = "";
    private static String dbURL = "jdbc:derby://localhost:1527/contact;create=true;user=nbuser;password=nbuser";
    private static String usersTable = "APP.Users";
    private static String incomeTable = "APP.Income";
    private static String expenseTable = "APP.Expenses"; 
    private String test = "lets try something";
    // jdbc Connection
    private static Connection conn = null;
    private static Statement stmt = null;

    //information sent from the page to update the java page
    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    //transactions
    
    //Requests for the information from the HMTL page
    public String getTest() {
        return test;
    }

    public String getUserID() {
        return userID;
    }

    public String getName() {
        return name;
    }

    //transactions
    
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }


    public Boolean getPasswordMismatch() {
        return passwordMismatch;
    }

    public boolean getloginAttempted() {
        return loginAttempted;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String t) {//t holds the value that is passed in
        if ("login".equalsIgnoreCase(t)) {
            System.out.println("Logging in...");//test only see glassfish server output
            this.loginAttempted = true;
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                //Get a connection
                conn = DriverManager.getConnection(dbURL);
            } catch (Exception except) {
                except.printStackTrace();
            }
            try {//connect to the database
                System.out.println("Connecting to database for: " + t);//test only see glassfish server output
                stmt = conn.createStatement();
                ResultSet results = stmt.executeQuery("select * from " + usersTable);
                while (results.next()) {
                    String userID = results.getString(1);
                    String username = results.getString(2);
                    String password = results.getString(3);
                    String name = results.getString(4);
                    if (this.username.equalsIgnoreCase(username) && this.password.equals(password)) {
                        this.userID = userID;
                        this.username = username;
                        this.name = name;
                        System.out.println("User exists and passwords match!");//test only see glassfish server output
                        break;//kill the loop after a valid user is found
                    } else if (this.username.equalsIgnoreCase(username)) {
                        System.out.println("User exists, but password is wrong...");//test only see glassfish server output
                    }
                }
                results.close();
                stmt.close();
            } catch (SQLException sqlExcept) {
                sqlExcept.printStackTrace();
            }
        }  else {
            System.out.println("Error... nothing caught in setTable... Please ensure proper case of operation.  Such as(insertExpense..etc");//test only see glassfish server output
        }
    }
}
