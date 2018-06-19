package com.codingdojo.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.Lookify;
import com.codingdojo.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	private final LookifyRepository lookifyRepository;
	
	public LookifyService(LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}
	
	public List<Lookify> allLookify() {
		return lookifyRepository.findAll();
	}
	
	public Lookify createLookify(Lookify l) {
		return lookifyRepository.save(l);
	}
	
	public Lookify findLookify(Long id) {
		Optional<Lookify> optionalLookify = lookifyRepository.findById(id);
		if(optionalLookify.isPresent()) {
			return optionalLookify.get();
		} else {
			return null;
		}
	}
	
	public void deleteLookify(Long id) {
		lookifyRepository.deleteById(id);
	}
	
	public void updateLookify(Lookify l) {
		lookifyRepository.save(l);
	}
	
	public List<Lookify> getSearchSongs(String artist){
		return lookifyRepository.findByArtist(artist);
	}
	public List<Lookify> getTopSongs(){
		return lookifyRepository.findTop10ByOrderByRatingDesc();
	}
	
}
