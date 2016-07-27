package ru.one.c.www.activator;

import java.util.Hashtable
import org.eclipse.jetty.server.handler.ContextHandler
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext
import org.eclipse.jetty.servlet.ServletHandler
//import org.eclipse.jetty.server.*

import org.eclipse.jetty.servlet.ServletContextHandler
import ru.one.c.www.statemachine.servlet.MyXtextServlet

class Activator implements BundleActivator {
	
	override start(BundleContext context) {
		var ch1= new ContextHandler()
        var props1 = new Hashtable()
        props1.put("Web-ContextPath","/dsl")
        props1.put("Jetty-ContextFilePath","handlers/root.xml")
        context.registerService(typeof(ContextHandler).getName() ,ch1, props1)
        
        var handler = new ServletHandler()
        handler.addServletWithMapping(typeof(MyXtextServlet), "/xtext-service/*")
        var ch= new ServletContextHandler()
        ch.setContextPath("/dsl")
        ch.setServletHandler(handler)
        var props = new Hashtable();
        context.registerService(typeof(ContextHandler).getName(), ch, props);


//		var contextHandler = new ServletContextHandler(ServletContextHandler.SESSIONS);
//        contextHandler.setContextPath("/dsl");
////        s.setHandler(context);
//        contextHandler.addServlet(new ServletHolder(new MyXtextServlet()), "/xtext-service/*");
////        context.addServlet(new ServletHolder(new DefaultServlet()), "/pictures/*");
//		var props2 = new Hashtable();
//
//        context.registerService(typeof(ServletContextHandler).getName(), contextHandler, props2);

//		var httpServiceTracker = new HttpServiceTracker(context);
//        httpServiceTracker.open();

        System.err.println("ROOT")
	}
	
	override stop(BundleContext context) throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
