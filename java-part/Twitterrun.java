


import twitter4j.FilterQuery;
import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.User;
import twitter4j.auth.AccessToken;
import twitter4j.conf.ConfigurationBuilder;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;   // Use classes in java.sql package
import java.sql.SQLException;
import java.sql.Statement;

public class Twitterrun {
	
	public static void main(String[] args) throws TwitterException,IOException {
		

		
		StatusListener listener = new StatusListener(){
		   // FileWriter writer = new FileWriter("/Users/caowei91/Desktop/problem.txt");
			//int count=0;
			
			int count = 21;
			
			



	        public void onStatus(Status status) {
  	    	  String strUpdate = "INSERT INTO twitter "+"VALUES (?, ?, ?, ?, ?)";

	        	
	        	try (
	        	         // Step 1: Allocate a database "Connection" object
	        	         Connection conn = DriverManager.getConnection(
	        	               "jdbc:mysql://######:####/twitt", "#####", "#####"); // MySQL
	        	 
	        	         // Step 2: Allocate a "Statement" object in the Connection
	        	         PreparedStatement stmt = conn.prepareStatement(strUpdate);
				         Statement deletestmt = conn.createStatement();

	        			
	        	      ) {
	        		       if(status.getGeoLocation()!=null){
	    	               count++;
	    	              System.out.println(count + " "+ status.getUser().getName() + " : " + status.getUser().getLang()+"; "+ status.getGeoLocation());
	    	            
	        	    	  
	        	    	  //String strUpdate = "INSERT INTO twit "+"VALUES (?, ?, ?, ?, ?)";
	        	          //System.out.println("The SQL query is: " + strUpdate);  // Echo for debugging
	        	    	 // stmt = conn.prepareStatement(strUpdate);
	    	               stmt.setInt(1,count);
	    	               stmt.setString(2, status.getUser().getName());
	    	               stmt.setString(3, "girl");
	    	               stmt.setDouble(4, status.getGeoLocation().getLatitude());
	    	               stmt.setDouble(5, status.getGeoLocation().getLongitude());


	    	               
	    	               
	        	    	  
	        	          int countUpdated = stmt.executeUpdate();
	        	          if(count>=3000){
	        	        	  String deleteQuery = "delete from twitter";
	     			         deletestmt.executeUpdate(deleteQuery);
	     			         count=0;

	        	        	  
	        	        	  
	        	          }
	        	          //System.out.println(countUpdated + " records affected.");
	        		       }
	        	      
	        	      } catch(SQLException ex) {
	        	         ex.printStackTrace();
	        	      }
	        	
	        	
	            
	         
	        	
	        }
	        public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
	        public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
	        public void onException(Exception ex) {
	            ex.printStackTrace();
	        }
			@Override
			public void onScrubGeo(long arg0, long arg1) {
				// TODO Auto-generated method stub
				
			}
			@Override
			public void onStallWarning(StallWarning arg0) {
				// TODO Auto-generated method stub
				
			}
	    };
	    
	    
	    
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthConsumerKey("##########")
		  .setOAuthConsumerSecret("############################")
		  .setOAuthAccessToken("########-#################")
		  .setOAuthAccessTokenSecret("###################");
		   try (
			         // Step 1: Allocate a database "Connection" object
			         Connection conn = DriverManager.getConnection(
			               "jdbc:mysql://#######:########/", "####", "#######"); // MySQL
			 
			         // Step 2: Allocate a "Statement" object in the Connection
			         Statement stmt = conn.createStatement();
			      ) {
			    	  
			    	 String dbname = "twitt";
			    	 String tablename = "twitter";
			    	 String createdbQuery = "create database if not exists " + dbname;
			    	 String createtbQuery = "create table if not exists " + tablename
			    			 + "  (Count           INTEGER,"
			    	            + "   Name            VARCHAR(100),"
			    	            + "   Tag          VARCHAR(20),"
			    	            + "   Latitude           DOUBLE,"
			    	            + "   Longitude           DOUBLE)";
			    	      
;			    	 
			         String deleteQuery = "delete from twitter";
			         System.out.println("The SQL query is: " + deleteQuery); // Echo For debugging
			         
			         stmt.executeUpdate(createdbQuery);
			         Connection connn = DriverManager.getConnection(
				               "jdbc:mysql://localhost:8888/twitt", "root", "@CaoWei@"); // MySQL
			         Statement stmtt = connn.createStatement();
			         stmtt.executeUpdate(createtbQuery); 
			 
			         
			 
			      } catch(SQLException ex) {
			         ex.printStackTrace();
			      }
		//TwitterFactory tf = new TwitterFactory(cb.build());
        TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
        FilterQuery fq = new FilterQuery();
        String keywords[] = { "girl" };

        fq.track(keywords);


        twitterStream.addListener(listener);
        twitterStream.filter(fq);

        // sample() method internally creates a thread which manipulates TwitterStream and calls these adequate listener methods continuously.
       
       /* 
        try {
            Thread.sleep(1200000);                 //1000 milliseconds is one second.
        } catch(InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
        System.out.println("Stop!");
        twitterStream.shutdown();
		
        */
        
      
	}
	
	
	
	
}