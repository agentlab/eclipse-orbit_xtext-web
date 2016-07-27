package org.eclipse.xtext.web.activator;

import java.util.Hashtable;
import org.eclipse.jetty.server.handler.ContextHandler;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

@SuppressWarnings("all")
public class Activator implements BundleActivator {
  @Override
  public void start(final BundleContext context) {
    ContextHandler ch1 = new ContextHandler();
    Hashtable<String, String> props1 = new Hashtable<String, String>();
    props1.put("Web-ContextPath", "/dsl");
    props1.put("Jetty-ContextFilePath", "handlers/cssHandler.xml");
    String _name = ContextHandler.class.getName();
    context.registerService(_name, ch1, props1);
    System.err.println("css");
    ContextHandler ch2 = new ContextHandler();
    Hashtable<String, String> props2 = new Hashtable<String, String>();
    props2.put("Web-ContextPath", "/dsl");
    props2.put("Jetty-ContextFilePath", "handlers/jsHandler.xml");
    String _name_1 = ContextHandler.class.getName();
    context.registerService(_name_1, ch2, props2);
    System.err.println("js");
    ContextHandler ch3 = new ContextHandler();
    Hashtable<String, String> props3 = new Hashtable<String, String>();
    props3.put("Web-ContextPath", "/dsl");
    props3.put("Jetty-ContextFilePath", "handlers/jarHandler.xml");
    String _name_2 = ContextHandler.class.getName();
    context.registerService(_name_2, ch3, props3);
    System.err.println("jar");
  }
  
  @Override
  public void stop(final BundleContext context) throws Exception {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
