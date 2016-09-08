/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.xtext.example.mydsl.web

import com.google.inject.Guice
import com.google.inject.Injector
import com.google.inject.Provider
import com.google.inject.util.Modules
import java.util.concurrent.ExecutorService
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.xtext.example.mydsl.MyDslRuntimeModule
import org.xtext.example.mydsl.MyDslStandaloneSetup
import org.eclipse.xtext.web.server.persistence.IResourceBaseProvider

/**
 * Initialization support for running Xtext languages in web applications.
 */
@FinalFieldsConstructor
class MyDslWebSetup extends MyDslStandaloneSetup {
	
	val Provider<ExecutorService> executorServiceProvider;
	val IResourceBaseProvider resourceBaseProvider
	
	override Injector createInjector() {
		val runtimeModule = new MyDslRuntimeModule()
		val webModule = new MyDslWebModule(executorServiceProvider, resourceBaseProvider)
		return Guice.createInjector(Modules.override(runtimeModule).with(webModule))
	}
	
}
