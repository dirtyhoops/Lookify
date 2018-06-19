package com.codingdojo.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.lookify.models.Lookify;

public interface LookifyRepository extends CrudRepository<Lookify, Long>{
    // this method retrieves all the books from the database
    List<Lookify> findAll();
	List<Lookify> findByArtist(String artist);
	List<Lookify> findTop10ByOrderByRatingDesc();
}

