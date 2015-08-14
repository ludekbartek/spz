/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.dcb.support.db.managers;

import cz.dcb.support.db.jpa.controllers.RolesJpaController;
import cz.dcb.support.db.jpa.controllers.RolesManager;
import cz.dcb.support.db.jpa.entities.Roles;
import cz.dcb.support.db.managers.exceptions.NonexistentEntityException;
import cz.dcb.support.db.managers.exceptions.PreexistingEntityException;
import cz.dcb.support.db.managers.utils.DBUtils;
import java.math.BigInteger;
import java.security.InvalidParameterException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author bar
 */
public class RoleManagerTest {
    
    private final RolesManager manager = new RolesJpaController(DBUtils.getEntityManagerFactory());
    private final Logger logger = Logger.getLogger(RoleManagerTest.class.getName());
    
    public RoleManagerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of create method, of class RoleManager.
     */
    @Test
    public void testCreate() throws Exception {
        System.out.println("create");
        Roles role = null;
        try{
            manager.create(role);
            fail("Exception should be thrown.");
        }catch(IllegalArgumentException iae){
            logger.log(Level.INFO,"Exception ",iae);
            assertNull(role);
        }catch(Exception ex){
            fail("Invalid exception thrown "+ex);
        }
        role = DBUtils.createRole();
        try{
            manager.create(role);
            assertNotNull(role.getId());
            Roles result = manager.findRoles(role.getId());
            assertEquals("Created item not found.",role,result);
        }catch(Exception ex){
            fail("Unexpected exception thrown."+ex);
        }
    }

    @Test 
    public void testCreateNullId() throws Exception{
        System.out.println("create user with null id");
        Roles role = DBUtils.createRole();
        role.setUserid(null);
        try{
            manager.create(role);
            fail("Exception should be thrown");
        }catch(IllegalArgumentException iae){
            
        }catch(Exception ex){
            fail("Invalid exception thrown "+ex);
        }
        
    }
    /**
     * Test of destroy method, of class RoleManager.
     */
    
    /**
     * Test of edit method, of class RoleManager.
     */
    @Test
    public void testEdit() throws Exception {
        System.out.println("edit");
        Roles role = null;
      //  RoleManager instance = new RoleManagerImpl();
        manager.edit(role);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findRoles method, of class RoleManager.
     */
    @Test
    public void testFindRoles() {
        System.out.println("findRoles");
        String id = "";
      //  RoleManager instance = new RoleManagerImpl();
        Roles expResult = null;
        Roles result = manager.findRoles(-1);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findRolesEntities method, of class RoleManager.
     */
    @Test
    public void testFindRolesEntities_0args() {
        System.out.println("findRolesEntities");
      //  RoleManager instance = new RoleManagerImpl();
        List<Roles> expResult = null;
        List<Roles> result = manager.findRolesEntities();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of findRolesEntities method, of class RoleManager.
     */
    @Test
    public void testFindRolesEntities_int_int() {
        System.out.println("findRolesEntities");
        int maxResults = 0;
        int firstResult = 0;
        //RoleManager instance = new RoleManagerImpl();
        List<Roles> expResult = null;
        List<Roles> result = manager.findRolesEntities(maxResults, firstResult);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getRolesCount method, of class RoleManager.
     */
    @Test
    public void testGetRolesCount() {
        System.out.println("getRolesCount");
        //RoleManager instance = new RoleManagerImpl();
        int expResult = 0;
        int result = manager.getRolesCount();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
/*
    public class RoleManagerImpl implements RoleManager {

        public void create(Roles role) throws PreexistingEntityException, Exception {
        }

        public void destroy(String id) throws NonexistentEntityException {
        }

        public void edit(Roles role) throws NonexistentEntityException, Exception {
        }

        public Roles findRoles(String id) {
            return null;
        }

        public List<Roles> findRolesEntities() {
            return null;
        }

        public List<Roles> findRolesEntities(int maxResults, int firstResult) {
            return null;
        }

        public int getRolesCount() {
            return 0;
        }
    }
  */  
}
