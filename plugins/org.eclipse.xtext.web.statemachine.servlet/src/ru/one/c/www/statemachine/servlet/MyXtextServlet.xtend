package ru.one.c.www.statemachine.servlet

import com.google.inject.Provider
import java.util.List
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import javax.servlet.annotation.WebServlet
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl
import org.eclipse.xtext.web.servlet.XtextServlet

//@WebServlet(name = "Xtext Services", urlPatterns = "/xtext-service/*")
class MyXtextServlet extends XtextServlet {
	
	val List<ExecutorService> executorServices = newArrayList
	val resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
	
	new() {
		println("Yo-ho-ho!")
	}

	override init() {
		super.init()
		val Provider<ExecutorService> executorServiceProvider = [Executors.newCachedThreadPool => [executorServices += it]]
		//val resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
		new StatemachineWebSetup(executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
		//new EntitiesWebSetup(executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
	}
	
	override destroy() {
		executorServices.forEach[shutdown()]
		executorServices.clear()
		super.destroy()
	}

}
