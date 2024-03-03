package edu.ucsd.dblab;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.JSONArray;

import edu.ucsd.dblab.models.DeliveryItem;
import edu.ucsd.dblab.models.DeliveryTruck;

public class Helper {
	
	/**
	 * This method retrieves a JSON from a REST Web Service, parses it, 
	 * creates an ArrayList of delivery trucks and returns it. 
	 * @return
	 */
	public ArrayList<DeliveryTruck> getDeliveryTrucks() {
	      URL url;
	      HttpURLConnection conn;
	      BufferedReader rd;
	      String line;
	      String result = "";
	      try {
	    	 // Had to go with JSONP due to CORS error... 
	         url = new URL("http://zarifis1.ucsd.edu:3000/delivery_trucksi");
	         conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");
	         rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         while ((line = rd.readLine()) != null) {
	            result += line;
	         }
	         rd.close();
	         conn.disconnect();
		    
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      // Parse the JSON and create the corresponding objects
	      try {
	    	  JSONArray arr = new JSONArray(result); 
		      ArrayList<DeliveryTruck> delivery_trucks = new ArrayList<DeliveryTruck>();
		      for (int i = 0; i < arr.length(); i++) {
		    	  DeliveryTruck t = new DeliveryTruck();
		    	  t.setId(arr.getJSONObject(i).getInt("id"));
		    	  t.setCoordinates(arr.getJSONObject(i).getJSONObject("coords").getDouble("latitude"), 
		    			  arr.getJSONObject(i).getJSONObject("coords").getDouble("longitude"));
		    	  t.setPending_deliveries(arr.getJSONObject(i).getInt("pending_deliveries"));
		    	  t.setVisible(arr.getJSONObject(i).getBoolean("visible"));
		    	  
		    	  ArrayList<DeliveryItem> deliveries = new ArrayList<DeliveryItem>();
		    	  JSONArray all_deliveries = arr.getJSONObject(i).getJSONArray("all_deliveries");
		    	  for (int j = 0; j < all_deliveries.length(); j++) {
		    		  DeliveryItem item = new DeliveryItem();
		    		  item.setDelivery_ID(all_deliveries.getJSONObject(j).getInt("delivery_id"));
		    		  item.setDelivered_time(all_deliveries.getJSONObject(j).getString("delivered_time"));
		    		  item.setScheduled_time(all_deliveries.getJSONObject(j).getString("scheduled_time"));
		    		  item.setRecipient(all_deliveries.getJSONObject(j).getString("recipient"));
		    		  item.setItem_title(all_deliveries.getJSONObject(j).getString("item_title"));
		    		  item.setItem_description(all_deliveries.getJSONObject(j).getString("item_description"));
		    		  deliveries.add(item);
		    	  }
		    	  t.setDeliveries(deliveries);
		    	  delivery_trucks.add(t);
		      }
		      
		      return delivery_trucks;
	      } 
	      catch (Exception e) {
		  	return null;
		  }
	   }


}
