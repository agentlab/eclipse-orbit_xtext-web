package org.eclipse.xtext.web.hello.setup

import org.eclipse.xtext.web.dsl.launguage.IExecutorServiceProvider
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl
import org.eclipse.xtext.web.example.jetty.HelloWebSetup

class WebSetup {

	private var IExecutorServiceProvider service
	var resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')

	public def synchronized void setDsl(IExecutorServiceProvider service) {
		this.service = service
		new HelloWebSetup(this.service.executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
	}

	public def synchronized void unsetDsl(IExecutorServiceProvider service) {
		this.service = null;
	}

}