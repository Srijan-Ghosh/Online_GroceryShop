package com.jsp.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GroceryItems {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productid;
	private String name;
	private String category;
	private double price;
	private int stockquantity;
	private String image;
//	 private String searchTerm;
	
	
	public int getProductid() {
		return productid;
	}
	
//	public String getSearchTerm() {
//		return searchTerm;
//	}
//
//	public void setSearchTerm(String searchTerm) {
//		this.searchTerm = searchTerm;
//	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setProductid(int productid) {
        this.productid = productid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStockquantity() {
		return stockquantity;
	}
	public void setStockquantity(int stockquantity) {
		this.stockquantity = stockquantity;
	}
	public GroceryItems() {
		super();
	}
	
	
	

}
