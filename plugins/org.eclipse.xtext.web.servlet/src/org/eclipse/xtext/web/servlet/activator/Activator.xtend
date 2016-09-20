package org.eclipse.xtext.web.servlet.activator

import java.util.Hashtable
import org.eclipse.jetty.server.handler.ContextHandler
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext
import org.eclipse.jetty.servlet.ServletHandler

import org.eclipse.jetty.servlet.ServletContextHandler
import org.eclipse.xtext.web.servlet.dsl.MyXtextServlet

class Activator implements BundleActivator {

	override start(BundleContext context) {

        val servlet = new MyXtextServlet

        var handler = new ServletHandler
        handler.addServletWithMapping(MyXtextServlet, "/xtext-service/*")
        var ch = new ServletContextHandler
        ch.contextPath = "/dsl"
        ch.servletHandler = handler
        ch.sessionHandler = new org.eclipse.jetty.server.session.SessionHandler
        var props = new Hashtable
        context.registerService(ContextHandler.name, ch, props);
	}

	override stop(BundleContext context) throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
