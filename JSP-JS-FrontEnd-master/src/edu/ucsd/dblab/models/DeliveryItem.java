package edu.ucsd.dblab.models;

public class DeliveryItem {
	
	private int delivery_ID;
	private String recipient;
	private String scheduled_time;
	private String delivered_time;
	private String item_title;
	private String item_description;
	
	
	public int getDelivery_ID() {
		return delivery_ID;
	}
	public void setDelivery_ID(int delivery_ID) {
		this.delivery_ID = delivery_ID;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getScheduled_time() {
		return scheduled_time;
	}
	public void setScheduled_time(String scheduled_time) {
		this.scheduled_time = scheduled_time;
	}
	public String getDelivered_time() {
		return delivered_time;
	}
	public void setDelivered_time(String delivered_time) {
		this.delivered_time = delivered_time;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public String getItem_description() {
		return item_description;
	}
	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}
	
	

}
