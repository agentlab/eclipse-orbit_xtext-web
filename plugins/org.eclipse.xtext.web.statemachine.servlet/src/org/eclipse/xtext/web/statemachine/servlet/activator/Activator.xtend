package org.eclipse.xtext.web.statemachine.servlet.activator;

import java.util.Hashtable
import org.eclipse.jetty.server.handler.ContextHandler
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext

class Activator implements BundleActivator {

	override start(BundleContext context) {
		var ch1= new ContextHandler
        var props1 = new Hashtable
        props1.put("Web-ContextPath","/dsl/statemachine")
        props1.put("Jetty-ContextFilePath","handlers/root.xml")
        context.registerService(ContextHandler.name, ch1, props1)
	}

	override stop(BundleContext context) throws Exception {
		context.ungetService(context.getServiceReference(ContextHandler.name))
	}

}
