package com.be.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.be.model.Post;
import com.be.repository.custom.PostSearchCustomRepository;

@Repository
public interface PostRepository extends JpaRepository<Post, Long>, PostSearchCustomRepository {

}
