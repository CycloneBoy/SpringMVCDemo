package com.cycloneboy.repository;

import com.cycloneboy.model.DocumentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by CycloneBoy on 2017/5/28.
 */
@Repository
public interface DocumentRepository extends JpaRepository<DocumentEntity,Integer>{

    // 修改博文操作
    @Modifying
    @Transactional
    @Query("update DocumentEntity document set " +
            "document.title=:qTitle," +
            "document.remark=:qRemark," +
            "document.userByUserId.id=:qUserId," +
            "document.filename=:qFilename," +
            "document.createDate=:qCreateDate ," +
            "document.type=:qType" +
            " where document.id=:qId")
    void updateDocument(@Param("qTitle") String title,
                        @Param("qRemark") String remark ,
                        @Param("qUserId") int userId,
                        @Param("qFilename") String filename,
                        @Param("qCreateDate") Date createDate,
                        @Param("qType") int type,
                        @Param("qId") int id);


    List<DocumentEntity> findAllByType(Integer type);
}
