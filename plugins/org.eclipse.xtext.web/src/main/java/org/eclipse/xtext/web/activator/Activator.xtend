package org.eclipse.xtext.web.activator

import java.util.Hashtable

import org.eclipse.jetty.server.handler.ContextHandler
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext
import org.osgi.framework.Bundle

class Activator implements BundleActivator {
	
	override start(BundleContext context) {
		
		var ch1= new ContextHandler()
        var props1 = new Hashtable()
        props1.put("Web-ContextPath","/resources")
        props1.put("Jetty-ContextFilePath","handlers/cssHandler.xml")
        context.registerService(typeof(ContextHandler).getName() ,ch1, props1)
        System.err.println("css");
        
        var ch2= new ContextHandler()
        var props2 = new Hashtable()
        props2.put("Web-ContextPath","/resources")
        props2.put("Jetty-ContextFilePath","handlers/jsHandler.xml")
        context.registerService(typeof(ContextHandler).getName() ,ch2, props2)
        System.err.println("js");
        
        var ch3= new ContextHandler()
        var props3 = new Hashtable()
        props3.put("Web-ContextPath","/resources")
        props3.put("Jetty-ContextFilePath","handlers/jarHandler.xml")
        context.registerService(typeof(ContextHandler).getName() ,ch3, props3)
        System.err.println("jar");  
        
	}
	
	override stop(BundleContext context) throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
