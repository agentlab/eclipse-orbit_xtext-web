package org.eclipse.xtext.web.activator;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Hashtable;

import org.eclipse.jetty.server.handler.ContextHandler;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

public class Activator implements BundleActivator {

	private static BundleContext context;

	static BundleContext getContext() {
		return context;
	}

	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#start(org.osgi.framework.BundleContext)
	 */
	public void start(BundleContext bundleContext) throws Exception {
		Activator.context = bundleContext;
////		URL cssFile = this.getClass().getResource("/src/main/css/xtext/xtext-ace.css");
//		URL url = new URL("platform:/plugin/org.eclipse.xtext.web/handlers/cssHandler.xml");
//		System.err.println(url.toString());
//		try {
//		 InputStream inputStream = url.openConnection().getInputStream();
//		    BufferedReader in = new BufferedReader(new InputStreamReader(inputStream));
//		    String inputLine;
//
//		    while ((inputLine = in.readLine()) != null) {
//		        System.out.println(inputLine);
//		    }
//
//		    in.close();
// 
//		} catch (IOException e) {
//		    e.printStackTrace();
//		}
	    context.getBundle().getSymbolicName();
		
		ContextHandler ch1= new ContextHandler();
		Hashtable<String, String> props1 = new Hashtable<>();
		props1.put("Web-ContextPath","/resources");
		props1.put("Jetty-ContextFilePath",  "handlers/cssHandler.xml");
		context.registerService(ContextHandler.class.getName(), ch1, props1);
		System.err.println("css");
		        
		ContextHandler ch2= new ContextHandler();
		Hashtable<String, String> props2 = new Hashtable<>();
		props2.put("Web-ContextPath","/resources");
		props2.put("Jetty-ContextFilePath",  "handlers/jsHandler.xml");
		context.registerService(ContextHandler.class.getName() ,ch2, props2);
		System.err.println("js");
		        
		ContextHandler ch3= new ContextHandler();
		Hashtable<String, String> props3 = new Hashtable<>();
		props3.put("Web-ContextPath","/resources");
		props3.put("Jetty-ContextFilePath",  "handlers/jarHandler.xml");
		context.registerService(ContextHandler.class.getName() ,ch3, props3);
		System.err.println("jar");  
		
	}

	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#stop(org.osgi.framework.BundleContext)
	 */
	public void stop(BundleContext bundleContext) throws Exception {
		Activator.context = null;
	}

}
