package com.jsp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.dao.OnlineDao;
import com.jsp.dto.GroceryItems;

@Controller
public class GroceryController {
    
    @Autowired
    OnlineDao dao;
   
    @RequestMapping("/itm")
    public ModelAndView getGroceryForm() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("items", new GroceryItems());
        mv.setViewName("create.jsp"); 
        return mv;
    }
    
    @RequestMapping("/save")
	@ResponseBody
	public String SaveItems(@ModelAttribute GroceryItems items) {
	    String input = items.getName();
	    List<String> namelist = dao.getAllItemNames();

	    for (String s : namelist) {
	        if (s.equalsIgnoreCase(input)) {
	            return "Grocery item with the name " + input + " exists in database....";
	        }
	    }

	    input = input.trim();
	    items.setName(input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase());
	    dao.saveItem(items);
	    return "Grocery item details added successfully.";
	}
    @RequestMapping("/search")
    public ModelAndView getSearchForm() {
        List<String> namelist = dao.getAllItemNames();
        List<String> categorylist = dao.getAllItemCategories();
        ModelAndView mv = new ModelAndView();
        mv.addObject("namelist", namelist);  
        mv.addObject("categorylist", categorylist);  
        mv.setViewName("search.jsp"); 
        return mv;
    }
      
    @RequestMapping("/view")
    public ModelAndView displayItem(@ModelAttribute GroceryItems items) {
        String name = items.getName();
        String category = items.getCategory();
        List<GroceryItems> list = new ArrayList<>();
        
        if (name != null && !name.isEmpty()) {
            list.addAll(dao.getItemsByName(name));  
        }
        if (category != null && !category.isEmpty()) {
            list.addAll(dao.getItemsByCategory(category));  
        }
        
        ModelAndView mv = new ModelAndView();
        if (!list.isEmpty()) {
            mv.addObject("itemslist", list); 
        } else {
            mv.addObject("error", "No items found for the search criteria.");
        }
        mv.setViewName("search.jsp"); 
        return mv;
    }
    
    @RequestMapping("/remove")
	@ResponseBody
	public String DeleteItem(@RequestParam("id") int id) {
		String result=dao.deleteItem(id);
		return result;
	}
	
    
    @RequestMapping("/edit")
    public ModelAndView getUpdateForm() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("items", new GroceryItems());
        mv.setViewName("edit.jsp"); 
        return mv;
    }
    
    @RequestMapping("/directedit")
	public ModelAndView getdirectUpdateForm(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		GroceryItems item = dao.getItemById(id); 
		mv.addObject("items",item);
		mv.setViewName("edit.jsp");
		return mv;
	}
    
    @RequestMapping("/update")
	@ResponseBody
	public String UpdateItem(@ModelAttribute GroceryItems items) {
	    String input = items.getName();

		
	    input = input.trim();
	    items.setName(input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase());
		return dao.updateItems(items.getProductid(), items.getName(), items.getCategory(), items.getPrice(), items.getStockquantity(), items.getImage());
	}

    
    @RequestMapping("/purchase")
	public ModelAndView GetPurchaseForm() {
		List<GroceryItems> list = dao.getAllItems();

		ModelAndView mv = new ModelAndView();
		mv.addObject("puritems",new GroceryItems());
		mv.addObject("itemslist",list);
		mv.setViewName("purchase.jsp");
		return mv;
	}

    @RequestMapping("/process")
    @ResponseBody
    public ModelAndView purchaseItem(@RequestParam("name") String name,@RequestParam("stockquantity") int stockquantity) {
        double bill = dao.purchaseItems(name, stockquantity); 
        ModelAndView mv = new ModelAndView();
        mv.addObject("bill", bill);  
        mv.setViewName("bill.jsp");  
        return mv;
    }
    
    @RequestMapping("/getitm")
    public ModelAndView getAllItems() {
        List<GroceryItems> list = dao.getAllItems();
        ModelAndView mv = new ModelAndView();
        mv.addObject("itemslist", list);  
        mv.setViewName("display.jsp"); 
        return mv;
    }
}
