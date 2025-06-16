package com.jsp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsp.dto.GroceryItems;

@Repository
public class OnlineDao {
	
	@Autowired
	EntityManager manager;
	
	@Autowired
	EntityTransaction transaction;
	
	public void saveItem(GroceryItems items) {
		transaction.begin();
		manager.persist(items);
		transaction.commit();
	}
		
	public String deleteItem(int id) {
		Query q=manager.createQuery("SELECT g FROM GroceryItems g WHERE g.id = :id", GroceryItems.class).setParameter("id", id);	
		GroceryItems e=(GroceryItems)q.getSingleResult();
		if(e != null) {
				transaction.begin();
				manager.remove(e);
				transaction.commit();
				return "Item with name : "+id+" is remove successfully....";
			}
			else {
				return "Item with name : "+id+" doesnt exist...";
			}
		}
	public List<GroceryItems> getItemsByName(String name) {
		Query q=manager.createQuery("SELECT g FROM GroceryItems g WHERE g.name = :name", GroceryItems.class).setParameter("name", name);
                return q.getResultList();
		}

	public List<GroceryItems> getItemsByCategory(String category) {
		Query q=manager.createQuery("SELECT g FROM GroceryItems g WHERE g.category = :category", GroceryItems.class).setParameter("category", category);
	    return q.getResultList();
	                                  
	}

		public String updateItems(int id, String newName, String newCategory, double newPrice, int newQuantity,String image) {
			GroceryItems e = manager.find(GroceryItems.class, id);
			
			if(e != null) {
				String input = e.getName();
				e.setName(input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase());
				
				e.setName(newName);
				e.setCategory(newCategory);
				e.setPrice(newPrice);
				e.setStockquantity(newQuantity);
				e.setImage(image);
				transaction.begin();
				manager.merge(e);
				transaction.commit();
				return "Item details are updated successfully....";
			}
			return "Item with ID : "+id+" doesnt exist...";
		}
		
		public GroceryItems getItemById(int id){
			
			GroceryItems g=manager.find(GroceryItems.class,id);
			return g;
		}
	
		public List<GroceryItems> getAllItems(){
			
			Query q=manager.createQuery("select e from GroceryItems e");
			return q.getResultList();
		}
		
		public List<String> getAllItemNames() {
		    Query q = manager.createQuery("SELECT DISTINCT e.name FROM GroceryItems e");
		    return q.getResultList();
		}

		public List<String> getAllItemCategories() {
		    Query q = manager.createQuery("SELECT DISTINCT e.category FROM GroceryItems e");
		    return q.getResultList();
		}

		
		public double purchaseItems(String name, int purQuantity) {
			Query q=manager.createQuery("SELECT g FROM GroceryItems g WHERE g.name = :name", GroceryItems.class).setParameter("name", name);
			GroceryItems e=(GroceryItems)q.getSingleResult();
			int oldQuantity =e.getStockquantity();
			if(e != null && e.getStockquantity()>=purQuantity) {
				
				double price =e.getPrice();
				double total = price*purQuantity;
				int newQuantity=oldQuantity-purQuantity;
				e.setStockquantity(newQuantity);
				transaction.begin();
				manager.merge(e);
				transaction.commit();
				return  total;
			}
			return oldQuantity;
		}


	}