package edu.ucsd.dblab.models;

import java.util.ArrayList;

public class DeliveryTruck {
	
	private int id;
	private ArrayList<DeliveryItem> deliveries = new ArrayList<DeliveryItem>();
	private Coordinates coordinates;
	private int pending_deliveries;
	private boolean visible;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ArrayList<DeliveryItem> getDeliveries() {
		return deliveries;
	}
	public void setDeliveries(ArrayList<DeliveryItem> deliveries) {
		this.deliveries = deliveries;
	}
	public Coordinates getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(double lat, double lon) {
		Coordinates coords = new Coordinates(lat, lon);
		this.coordinates = coords;
	}
	public int getPending_deliveries() {
		return pending_deliveries;
	}
	public void setPending_deliveries(int pending_deliveries) {
		this.pending_deliveries = pending_deliveries;
	}
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	
	
	

}
