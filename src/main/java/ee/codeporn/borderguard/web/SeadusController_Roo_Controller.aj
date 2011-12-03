// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.codeporn.borderguard.web;

import ee.codeporn.borderguard.entities.Seadus;
import ee.codeporn.borderguard.entities.SeadusePunkt;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SeadusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String SeadusController.create(@Valid Seadus seadus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("seadus", seadus);
            addDateTimeFormatPatterns(uiModel);
            return "seadused/create";
        }
        uiModel.asMap().clear();
        seadus.persist();
        return "redirect:/seadused/" + encodeUrlPathSegment(seadus.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String SeadusController.createForm(Model uiModel) {
        uiModel.addAttribute("seadus", new Seadus());
        addDateTimeFormatPatterns(uiModel);
        return "seadused/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String SeadusController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("seadus", Seadus.findSeadus(id));
        uiModel.addAttribute("itemId", id);
        return "seadused/show";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String SeadusController.update(@Valid Seadus seadus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("seadus", seadus);
            addDateTimeFormatPatterns(uiModel);
            return "seadused/update";
        }
        uiModel.asMap().clear();
        seadus.merge();
        return "redirect:/seadused/" + encodeUrlPathSegment(seadus.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String SeadusController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("seadus", Seadus.findSeadus(id));
        addDateTimeFormatPatterns(uiModel);
        return "seadused/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String SeadusController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Seadus.findSeadus(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/seadused";
    }
    
    @ModelAttribute("seadused")
    public Collection<Seadus> SeadusController.populateSeadused() {
        return Seadus.findAllSeadused();
    }
    
    @ModelAttribute("seadusepunktid")
    public Collection<SeadusePunkt> SeadusController.populateSeadusePunktid() {
        return SeadusePunkt.findAllSeadusePunktid();
    }
    
    void SeadusController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("seadus_kehtivalates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("seadus_kehtivkuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String SeadusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
