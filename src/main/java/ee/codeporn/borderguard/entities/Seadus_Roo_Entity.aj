// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.codeporn.borderguard.entities;

import ee.codeporn.borderguard.entities.Seadus;
import java.lang.Long;
import java.util.List;
import javax.persistence.Entity;

privileged aspect Seadus_Roo_Entity {
    
    declare @type: Seadus: @Entity;
    
    public static long Seadus.countSeadused() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Seadus o", Long.class).getSingleResult();
    }
    
    public static List<Seadus> Seadus.findAllSeadused() {
        return entityManager().createQuery("SELECT o FROM Seadus o", Seadus.class).getResultList();
    }
    
    public static Seadus Seadus.findSeadus(Long id) {
        if (id == null) return null;
        return entityManager().find(Seadus.class, id);
    }
    
    public static List<Seadus> Seadus.findSeadusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Seadus o", Seadus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
