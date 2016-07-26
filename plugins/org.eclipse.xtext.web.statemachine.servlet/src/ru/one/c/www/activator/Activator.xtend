package ru.one.c.www.activator;

import java.util.Dictionary
import java.util.Hashtable

import org.eclipse.jetty.server.handler.ContextHandler
import org.eclipse.jetty.webapp.WebAppContext
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext
import org.eclipse.jetty.webapp.WebXmlConfiguration
import org.eclipse.jetty.webapp.WebInfConfiguration
import org.eclipse.jetty.webapp.MetaInfConfiguration

class Activator implements BundleActivator {
	
	override start(BundleContext context) {
		
		
//		val server = new Server(new InetSocketAddress('localhost', 8080))
//		server.handler = new HandlerList => [
//			handlers = #[
//				new ResourceHandler => [
//					resourceBase = 'src/main/webapp'
//					welcomeFiles = #['index.html']
//				],
//				new ResourceHandler => [
//					resourceBase = '../org.eclipse.xtext.web/src/main/css'
//				],
//				new WebAppContext => [
//					resourceBase = '../org.eclipse.xtext.web/src/main/js'
//					contextPath = '/'
//					configurations = #[
//						new WebXmlConfiguration,
//						new WebInfConfiguration,
//						new MetaInfConfiguration
//					]
//					setAttribute(WebInfConfiguration.CONTAINER_JAR_PATTERN,
//						".*/org\\.eclipse\\.xtext\\.web.*,.*/org.webjars.*")
//				]
//			]
//		]



//Create a webapp context as a Service and target it at the "fooServer" Server instance
        var webapp = new WebAppContext()
        var props = new Hashtable()
        props.put("war",".")
        props.put("contextPath","/dsl")
//        props.put("managedServerName", "fooServer");
        context.registerService(typeof(ContextHandler).getName() ,webapp,props);


		
		
	}
	
	override stop(BundleContext context) throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

//	val BundleContext context



	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#start(org.osgi.framework.BundleContext)
	 */
//	public void start(BundleContext bundleContext) throws Exception {
//		Activator.context = bundleContext;
//		
//		//Create a webapp context as a Service and target it at the "fooServer" Server instance
//        WebAppContext webapp = new WebAppContext();
//        Dictionary props = new Hashtable();
//        props.put("war",".");
//        props.put("contextPath","/acme");
//        context.registerService(ContextHandler.class.getName(),webapp,props);
//		
//	}
//
//	/*
//	 * (non-Javadoc)
//	 * @see org.osgi.framework.BundleActivator#stop(org.osgi.framework.BundleContext)
//	 */
//	public void stop(BundleContext bundleContext) throws Exception {
//		Activator.context = null;
//	}

}
