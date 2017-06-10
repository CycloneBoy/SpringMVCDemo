package com.cycloneboy.repository;

import com.cycloneboy.model.DocumentEntity;
import com.cycloneboy.model.InstallEntity;

import com.cycloneboy.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by CycloneBoy on 2017/5/29.
 */
@Repository
public interface InstallRepository extends JpaRepository<InstallEntity,Integer> {

   // 根据某一用户查询安装软件记录
   public List<InstallEntity> findAllByUserByUserId(UserEntity userEntity);

   // 根据某一软件类型查询安装软件记录
   public  List<InstallEntity> findAllByDocumentByDocumentId(DocumentEntity documentEntity);

   public List<InstallEntity> findAllByDocumentByDocumentIdAndUserByUserId(
           DocumentEntity documentEntity,UserEntity userEntity);
}
