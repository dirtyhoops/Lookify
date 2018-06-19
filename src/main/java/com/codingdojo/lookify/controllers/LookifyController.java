package com.codingdojo.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.models.Lookify;
import com.codingdojo.lookify.services.LookifyService;

@Controller
public class LookifyController {
	private final LookifyService lookifyService;
	
	public LookifyController(LookifyService lookifyService) {
		this.lookifyService = lookifyService;
	}
	
	@RequestMapping("/") 
	public String index() {
		return "/views/index.jsp";
	}
	
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Lookify> lookifies = lookifyService.allLookify();
		model.addAttribute("lookifies", lookifies);
		return "/views/dashboard.jsp";
	}
	
	
	@RequestMapping("lookify/new")
	public String newLookify(@ModelAttribute("lookify") Lookify lookify) {
		return "/views/new.jsp";
	}
	
	
	@RequestMapping(value="/lookify", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result) {
        if (result.hasErrors()) {
            return "/views/new.jsp";
        } else {
            lookifyService.createLookify(lookify);
            return "redirect:/dashboard";
        }
    }
	
	 //for show page
    @RequestMapping("/lookify/{id}")
    public String show(@PathVariable("id") Long id, Model model) {
    	Lookify lookify = lookifyService.findLookify(id);
        model.addAttribute("lookify", lookify);
        return "/views/show.jsp";
    }
    
    //for edit and to render the edit jsp
    @RequestMapping("/lookify/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Lookify lookify = lookifyService.findLookify(id);
        model.addAttribute("lookify", lookify);
        return "/views/edit.jsp";
    }
    
    //for update
    @RequestMapping(value="/lookify/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result) {
        if (result.hasErrors()) {
            return "/views/edit.jsp";
        } else {
            lookifyService.updateLookify(lookify);
            return "redirect:/dashboard";
        }
    }
    
    //for delete
    @RequestMapping(value="/lookify/{id}/delete")
    public String destroy(@PathVariable("id") Long id) {
        lookifyService.deleteLookify(id);
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value="/search/topTen")
    public String topsongs(Model model) {
    	List<Lookify> songs = lookifyService.getTopSongs();
    	model.addAttribute("songs", songs);
    	return "/views/topsongs.jsp";	
    }
    
	@PostMapping("/search")
	public String search(@RequestParam("artist") String artist) {
		return "redirect:/search/"+artist;
	}
	
	@RequestMapping("/search/{artist}")
	public String showSearch(Model model, @PathVariable("artist") String artist) {
		List<Lookify> songs = lookifyService.getSearchSongs(artist);
		model.addAttribute("artist", artist);
		model.addAttribute("songs", songs);
		return "/views/artistsongs.jsp";
	}
   
    

    
    
    
	
}
