package org.eclipse.www.web.mydsl.setup

import org.eclipse.xtext.web.dsl.launguage.IExecutorServiceProvider
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl
import org.xtext.example.mydsl.web.MyDslWebSetup

//import ru.one.c.www.statemachine.servlet.StatemachineWebSetup

class WebSetup {
	
	private var IExecutorServiceProvider service
	var resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
	
	public def synchronized void setDsl(IExecutorServiceProvider service) {
		this.service = service
		new MyDslWebSetup(this.service.executorServiceProvider , resourceBaseProvider).createInjectorAndDoEMFRegistration
		System.err.println("BIND")
	}
	
	public def synchronized void unsetDsl(IExecutorServiceProvider service) {
		
	}
	
//	val List<ExecutorService> executorServices = newArrayList
//	val resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
//	
//	new() {
//		println("Yo-ho-ho!")
//	}
//
//	override init() {
//		super.init()
//		val Provider<ExecutorService> executorServiceProvider = [Executors.newCachedThreadPool => [executorServices += it]]
//		//val resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')
//		new StatemachineWebSetup(executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
//		//new EntitiesWebSetup(executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
//	}
}