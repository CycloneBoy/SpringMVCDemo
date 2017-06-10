package com.cycloneboy.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by CycloneBoy on 2017/5/29.
 */
@Entity
@Table(name = "install", schema = "springdemo", catalog = "")
public class InstallEntity {
    private int id;
    private String type;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date installDate;
    private UserEntity userByUserId;
    private DocumentEntity documentByDocumentId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "type", nullable = false, length = 200)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "install_date", nullable = false)
    public Date getInstallDate() {
        return installDate;
    }

    public void setInstallDate(Date installDate) {
        this.installDate = installDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InstallEntity that = (InstallEntity) o;

        if (id != that.id) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (installDate != null ? !installDate.equals(that.installDate) : that.installDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (installDate != null ? installDate.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "document_id", referencedColumnName = "id", nullable = false)
    public DocumentEntity getDocumentByDocumentId() {
        return documentByDocumentId;
    }

    public void setDocumentByDocumentId(DocumentEntity documentByDocumentId) {
        this.documentByDocumentId = documentByDocumentId;
    }
}
