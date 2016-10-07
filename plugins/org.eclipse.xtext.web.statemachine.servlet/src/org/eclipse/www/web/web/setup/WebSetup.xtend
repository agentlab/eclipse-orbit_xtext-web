package org.eclipse.www.web.web.setup

import org.eclipse.xtext.web.dsl.launguage.IExecutorServiceProvider
import org.eclipse.xtext.web.server.persistence.ResourceBaseProviderImpl
import ru.one.c.www.statemachine.servlet.StatemachineWebSetup

class WebSetup {

	private var IExecutorServiceProvider service
	var resourceBaseProvider = new ResourceBaseProviderImpl('./test-files')

	public def synchronized void setDsl(IExecutorServiceProvider service) {
		this.service = service
		new StatemachineWebSetup(this.service.executorServiceProvider, resourceBaseProvider).createInjectorAndDoEMFRegistration
	}

	public def synchronized void unsetDsl(IExecutorServiceProvider service) {
		this.service = null
	}
}