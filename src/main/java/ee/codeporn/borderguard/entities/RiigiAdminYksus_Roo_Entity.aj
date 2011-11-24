// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.codeporn.borderguard.entities;

import ee.codeporn.borderguard.entities.RiigiAdminYksus;
import java.lang.Long;
import java.util.List;
import javax.persistence.Entity;

privileged aspect RiigiAdminYksus_Roo_Entity {
    
    declare @type: RiigiAdminYksus: @Entity;
    
    public static long RiigiAdminYksus.countRiigiAdminYksuses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM RiigiAdminYksus o", Long.class).getSingleResult();
    }
    
    public static List<RiigiAdminYksus> RiigiAdminYksus.findAllRiigiAdminYksuses() {
        return entityManager().createQuery("SELECT o FROM RiigiAdminYksus o", RiigiAdminYksus.class).getResultList();
    }
    
    public static RiigiAdminYksus RiigiAdminYksus.findRiigiAdminYksus(Long id) {
        if (id == null) return null;
        return entityManager().find(RiigiAdminYksus.class, id);
    }
    
    public static List<RiigiAdminYksus> RiigiAdminYksus.findRiigiAdminYksusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM RiigiAdminYksus o", RiigiAdminYksus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
