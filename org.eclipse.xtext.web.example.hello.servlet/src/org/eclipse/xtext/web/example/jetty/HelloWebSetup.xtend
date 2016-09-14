/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.web.example.jetty

import com.google.inject.Guice
import com.google.inject.Injector
import com.google.inject.Provider
import com.google.inject.util.Modules
import java.util.concurrent.ExecutorService
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtext.web.example.hello.HelloRuntimeModule
import org.eclipse.xtext.web.example.hello.HelloStandaloneSetup
import org.eclipse.xtext.web.server.persistence.IResourceBaseProvider

/**
 * Initialization support for running Xtext languages in web applications.
 */
@FinalFieldsConstructor
class HelloWebSetup extends HelloStandaloneSetup {
	
	val Provider<ExecutorService> executorServiceProvider;
	val IResourceBaseProvider resourceBaseProvider;
	
	override Injector createInjector() {
		val runtimeModule = new HelloRuntimeModule()
		val webModule = new HelloWebModule(executorServiceProvider, resourceBaseProvider)
		return Guice.createInjector(Modules.override(runtimeModule).with(webModule))
	}
	
}
