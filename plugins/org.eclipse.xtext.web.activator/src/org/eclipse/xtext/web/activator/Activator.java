package org.eclipse.xtext.web.activator;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Hashtable;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.jetty.server.handler.ContextHandler;
import org.osgi.framework.Bundle;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

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
//		
//		
////		URL entry = context.getBundle().getEntry(".");
////		if (entry != null)
////		{
////		URLConnection connection = entry.openConnection();
////		if (connection instanceof BundleURLConnection)
////		{
////		URL fileURL = ((BundleURLConnection) connection).getFileURL();
////		URI uri = new URI(fileURL.toString());
////		String path = new File(uri).getAbsolutePath();
////		System.out.printf("This is the path: %s\n", path); 
////		}
////		}
//		
//		// упрощенный пример 
//        File f = new File("/Users/admin/Work/1C/workspace/xtext-web/plugins/org.eclipse.xtext.web.activator/handlers/cssHandler.xml");
//        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//        DocumentBuilder builder = factory.newDocumentBuilder();
//        Document document = builder.parse(f);
//        Element root = document.getDocumentElement();
//        // для простоты сразу берем message
//        Element message = (Element) root.getElementsByTagName("Arg").item(0);
//        message.setTextContent("lol"); 
//        String textContent = message.getTextContent(); // тоже для упрощения
//        System.err.println(textContent);
//        
//		
//		Bundle bundle = Platform.getBundle("org.eclipse.xtext.web.activator");
//		Path path = new Path("css/xtext/");
////		URL fileURL = Platform.find(bundle, path);
//		
//		URL fileURL = FileLocator.find(bundle, path, null);
//		System.err.println(Platform.resolve(fileURL) + " " 
//				+ context.getBundle().getSymbolicName());
////		InputStream in = fileURL.openStream();
//		 
//		
//
//		
//		
//		
//	    context.getBundle().getSymbolicName();
		
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
