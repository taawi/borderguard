// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.codeporn.borderguard.entities;

import ee.codeporn.borderguard.entities.IntsidendiLiik;
import java.lang.Long;
import java.util.List;
import javax.persistence.Entity;

privileged aspect IntsidendiLiik_Roo_Entity {
    
    declare @type: IntsidendiLiik: @Entity;
    
    public static long IntsidendiLiik.countIntsidendiLiiks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM IntsidendiLiik o", Long.class).getSingleResult();
    }
    
    public static List<IntsidendiLiik> IntsidendiLiik.findAllIntsidendiLiiks() {
        return entityManager().createQuery("SELECT o FROM IntsidendiLiik o", IntsidendiLiik.class).getResultList();
    }
    
    public static IntsidendiLiik IntsidendiLiik.findIntsidendiLiik(Long id) {
        if (id == null) return null;
        return entityManager().find(IntsidendiLiik.class, id);
    }
    
    public static List<IntsidendiLiik> IntsidendiLiik.findIntsidendiLiikEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM IntsidendiLiik o", IntsidendiLiik.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
