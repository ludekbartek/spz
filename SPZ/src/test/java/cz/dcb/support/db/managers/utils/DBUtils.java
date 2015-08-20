/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.dcb.support.db.managers.utils;

import cz.dcb.support.db.jpa.controllers.ConfigurationJpaController;
import cz.dcb.support.db.jpa.controllers.ConfigurationManager;
import cz.dcb.support.db.jpa.controllers.ProjectConfigurationJpaController;
import cz.dcb.support.db.jpa.controllers.ProjectConfigurationManager;
import cz.dcb.support.db.jpa.controllers.ProjectJpaController;
import cz.dcb.support.db.jpa.controllers.ProjectManager;
import cz.dcb.support.db.jpa.controllers.SpzAnalystJpaController;
import cz.dcb.support.db.jpa.controllers.SpzAnalystManager;
import cz.dcb.support.db.jpa.controllers.SpzJpaController;
import cz.dcb.support.db.jpa.controllers.SpzManager;
import cz.dcb.support.db.jpa.controllers.SpzNoteJpaController;
import cz.dcb.support.db.jpa.controllers.SpzNoteManager;
import cz.dcb.support.db.jpa.controllers.SpzStateJpaController;
import cz.dcb.support.db.jpa.controllers.SpzStateManager;
import cz.dcb.support.db.jpa.controllers.UserJpaController;
import cz.dcb.support.db.jpa.controllers.UserManager;
import cz.dcb.support.db.jpa.controllers.exceptions.NonexistentEntityException;
import cz.dcb.support.db.jpa.entities.Attachment;
import cz.dcb.support.db.jpa.entities.Attachmentnote;
import cz.dcb.support.db.jpa.entities.Configuration;
import cz.dcb.support.db.jpa.entities.Noteissuer;
import cz.dcb.support.db.jpa.entities.Project;
import cz.dcb.support.db.jpa.entities.Projectconfiguration;
import cz.dcb.support.db.jpa.entities.Roles;
import cz.dcb.support.db.jpa.entities.Spz;
import cz.dcb.support.db.jpa.entities.Spzanalyst;
import cz.dcb.support.db.jpa.entities.Spzissuer;
import cz.dcb.support.db.jpa.entities.Spznote;
import cz.dcb.support.db.jpa.entities.Spzstate;
import cz.dcb.support.db.jpa.entities.Spzstatenote;
import cz.dcb.support.db.jpa.entities.Spzstates;
import cz.dcb.support.db.jpa.entities.User;
import cz.dcb.support.db.jpa.entities.Useraccess;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author bar
 */
public class DBUtils {
    public static EntityManagerFactory getEntityManagerFactory()
    {
        return Persistence.createEntityManagerFactory("support_JPA");
    }
    
    public static Attachment createAttachment(){
        Attachment atach = new Attachment();
        atach.setContent("Some content");
        atach.setDate(new GregorianCalendar().getTime());
        atach.setLocation("/some/path/");
        Spzstate state = createSpzState();
        //atach.setSpznoteId(createSpznote(state));
        atach.setType("text/plain");
        atach.setTs(BigInteger.valueOf(1000));
        return atach;
    }
    
    public static Spznote createSpznote(Spzstate state){
        Spznote note = new Spznote();
        note.setExternalnote((short)1);
        note.setNotedate(new GregorianCalendar().getTime());
        note.setNotetext("Text poznamky");
        //note.setStateId(state);
        Set<Spznote> notes = new HashSet<>();
        notes.add(note);
        //state.setSpznoteCollection(notes);
        note.setTs(BigInteger.valueOf(new Random().nextInt()%1000));
        return note;
    }
    
    public static Spzstate createSpzState(){
        Spzstate state = new Spzstate();
        state.setAssumedmandays(1.5);
        state.setCode("Started");
        state.setIssuerLogin(createUser().getLogin());
        
        
        return state;
    }
    
    public static User createUser(){
        User user = new User();
        user.setCompany("aaa");
        user.setEmail("someb@aaa.cz");
        user.setFax("123");
        user.setLogin("aaa");
        user.setName("A Aa");
        user.setPassword("bbb");
        user.setTel("123123");
        
        return user;
    }

    public static Project createProject() {
        Project project = new Project();
        project.setDescription("Some project");
        project.setName("Test project");
        project.setTs(BigInteger.ONE);
        return project;
    }

    public static Attachmentnote createAttachmentNote() {
        Attachmentnote note = new Attachmentnote();
        Spzstate state = createSpzState();
        Spznote spzNote = createSpznote(state);
        Attachment attach = createAttachment();
        
        note.setSpznoteid(spzNote.getId());
        note.setAttachmentid(attach.getId());
        return note;
    }
    
    public static Configuration createConfiguration(){
        ConfigurationManager manager = new ConfigurationJpaController(DBUtils.getEntityManagerFactory());
        Configuration config = new Configuration();
        config.setCode("Some configuration");
        config.setDescription("Some description");
        config.setSeqnumber(BigInteger.ONE);
        config.setTs(BigInteger.ONE);
        //manager.create(config);
        
        return config;
    }

    public static Noteissuer createNoteIssuer(EntityManagerFactory emf) {
        UserManager userMan = new UserJpaController(emf);
        SpzStateManager stateManager = new SpzStateJpaController(emf);
        SpzNoteManager noteManager = new SpzNoteJpaController(emf);
        User issuer = createUser();
        Spzstate state = createSpzState();
        userMan.create(issuer);
        stateManager.create(state);
        Spznote note= createSpznote(state);
        noteManager.create(note);
        Noteissuer noteIssuer =  new Noteissuer();
        noteIssuer.setNoteid(note.getId());
        noteIssuer.setUserid(issuer.getId());
        return noteIssuer;
    }

    public static Projectconfiguration createProjectConfiguration(EntityManagerFactory entityManagerFactory) {
        ProjectConfigurationManager manager = new ProjectConfigurationJpaController(entityManagerFactory);
        Project proj = createProject();
        Configuration config = createConfiguration();
        Projectconfiguration projConf = new Projectconfiguration();
        projConf.setConfigurationid(config.getId());
        projConf.setProjectid(proj.getId());
        
        return projConf;
    }

    public static Roles createRole() {
        Roles role = new Roles();
        role.setRole("administrator");
        role.setUserid(1);
        return role;
    }

    public static void deleteSpzAnalyst(Spzanalyst analyst) throws NonexistentEntityException {
        EntityManagerFactory emf = DBUtils.getEntityManagerFactory();
        SpzAnalystManager manager = new SpzAnalystJpaController(emf);
        SpzManager spzManager = new SpzJpaController(emf);
        UserManager userManager = new UserJpaController(emf);
        for(User user:userManager.findUserEntities()){
            userManager.destroy(user.getId());
        }
        for(Spz spz:spzManager.findSpzEntities()){
            spzManager.destroy(spz.getId());
        }
        for(Spzanalyst spzAnalyst:manager.findSpzanalystEntities()){
            manager.destroy(spzAnalyst.getId());
        }
    }

    public static Spzanalyst createSpzAnalyst() {
        Spzanalyst analyst = new Spzanalyst();
        Spz spz=createSpz();
        User user = createUser();
        EntityManagerFactory emf = DBUtils.getEntityManagerFactory();
        SpzManager spzManager = new SpzJpaController(emf);
        UserManager userManager = new UserJpaController(emf);
        spzManager.create(spz);
        userManager.create(user);
        analyst.setSpzid(spz.getId());
        analyst.setUserid(user.getId());
        return analyst;
    }

    public static Spz createSpz() {
        Spz spz = new Spz();
        Calendar cal = new GregorianCalendar();
        spz.setContactperson("Jan Novak");
        spz.setImplementationacceptdate(cal.getTime());
        spz.setIssuedate(cal.getTime());
        spz.setPriority(Short.MIN_VALUE);
        spz.setReqnumber("One");
        spz.setRequestdescription("Testik");
        spz.setRequesttype("nejaky");
        spz.setShortname("short");
        spz.setTs(BigInteger.ONE);
        return spz;
    }

    public static Spzissuer createSpzIssuer() {
        EntityManagerFactory emf=DBUtils.getEntityManagerFactory();
        SpzManager spzManager = new SpzJpaController(emf);
        UserManager userManager = new UserJpaController(emf);
        Spzissuer issuer = new Spzissuer();
        
        Spz spz = createSpz();
        spzManager.create(spz);
        issuer.setSpzid(spz.getId());
        
        User user = createUser();
        userManager.create(user);
        issuer.setUserid(user.getId());
        
        return issuer;
    }

    public static Spzstatenote createSpzStateNote() {
        EntityManagerFactory emf = DBUtils.getEntityManagerFactory();
        Spzstatenote value = new Spzstatenote();
        SpzStateManager spzStateManager = new SpzStateJpaController(emf);
        SpzNoteManager spzNoteManger = new SpzNoteJpaController(emf);
        
        Spzstate spzstate = createSpzState();
        spzStateManager.create(spzstate);
        Spznote note = createSpznote(spzstate);
        spzNoteManger.create(note);
        value.setNoteid(note.getId());
        value.setStateid(spzstate.getId());
        return value;
    }

    public static Useraccess createUserAccess() {
        EntityManagerFactory emf = DBUtils.getEntityManagerFactory();
        UserManager userManager = new UserJpaController(emf);
        ConfigurationManager confManager = new ConfigurationJpaController(emf);
        Useraccess access = new Useraccess();
        User user = createUser();
        userManager.create(user);
        Configuration conf = createConfiguration();
        confManager.create(conf);
        access.setRole("administrator");
        access.setUserid(user.getId());
        access.setConfigurationid(conf.getId());
        access.setTs(BigInteger.ONE);
        return access;
    }

    public static Spzstate createSpzstate() {
        Spzstate state = new Spzstate();
        Calendar cal = new GregorianCalendar();
        
        state.setAssumedmandays(2.0);
        state.setClasstype((short)1);
        state.setCode("Some code");
        state.setCurrentstate(0);
        state.setIdate(cal.getTime());
        state.setIssuerLogin("someLogin");
        state.setMandays(2.0);
        state.setReleasenotes("Some notes");
        state.setRevisedrequestdescription("some text");
        state.setSolutiondescription("Short solution");
        state.setTs(BigInteger.ONE);
        
        return state;
    }

    public static Spzstates createSpzStates() {
        EntityManagerFactory emf= DBUtils.getEntityManagerFactory();
        SpzManager spzManager = new SpzJpaController(emf);
        Spz spz = createSpz();
        spzManager.create(spz);
        
        SpzStateManager stateManager = new SpzStateJpaController(emf);
        Spzstate state = createSpzState();
        stateManager.create(state);
        
        Spzstates value = new Spzstates();
        value.setSpzid(spz.getId());
        value.setStateid(state.getId());
       
        return value;
    }
}
