package ru.one.c.www.activator;

import java.util.Hashtable
import org.eclipse.jetty.server.handler.ContextHandler
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext
import org.eclipse.jetty.servlet.ServletHandler

import org.eclipse.jetty.servlet.ServletContextHandler
import ru.one.c.www.statemachine.servlet.MyXtextServlet

class Activator implements BundleActivator {
	
	override start(BundleContext context) {
		var ch1= new ContextHandler
        var props1 = new Hashtable
        props1.put("Web-ContextPath","/dsl")
        props1.put("Jetty-ContextFilePath","handlers/root.xml")
        context.registerService(ContextHandler.name, ch1, props1)
        
        var handler = new ServletHandler
        handler.addServletWithMapping(MyXtextServlet, "/xtext-service/*")
        var ch = new ServletContextHandler
        ch.contextPath = "/dsl"
        ch.servletHandler = handler
        ch.sessionHandler = new org.eclipse.jetty.server.session.SessionHandler
        var props = new Hashtable
        context.registerService(ContextHandler.name, ch, props);

        System.err.println("ROOT")
	}
	
	override stop(BundleContext context) throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
