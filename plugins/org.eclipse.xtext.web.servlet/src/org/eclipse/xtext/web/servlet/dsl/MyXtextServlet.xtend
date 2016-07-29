package org.eclipse.xtext.web.servlet.dsl

import com.google.inject.Provider
import java.util.List
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl
import org.eclipse.xtext.web.servlet.XtextServlet
import org.eclipse.xtext.web.dsl.launguage.IExecutorServiceProvider

//@WebServlet(name = "Xtext Services", urlPatterns = "/xtext-service/*")
class MyXtextServlet extends XtextServlet implements IExecutorServiceProvider {
	
	val List<ExecutorService> executorServices = newArrayList
	val resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
	var Provider<ExecutorService> executorServiceProvider;
	
	
	
	new() {
		println("Yo-ho-ho!")
		init()
	}

	override init() {
		super.init()
	    executorServiceProvider = [Executors.newCachedThreadPool => [executorServices += it]]
		//val resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
//		new StatemachineWebSetup(executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
		//new EntitiesWebSetup(executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
	}
	
	
	
	override destroy() {
		executorServices.forEach[shutdown()]
		executorServices.clear()
		super.destroy()
	}
	
	override getExecutorServiceProvider() {
		return executorServiceProvider;
	}

}
