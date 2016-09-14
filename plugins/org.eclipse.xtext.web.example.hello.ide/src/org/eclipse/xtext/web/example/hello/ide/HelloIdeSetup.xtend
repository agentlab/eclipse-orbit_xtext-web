/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.web.example.hello.ide

import com.google.inject.Guice
import org.eclipse.xtext.web.example.hello.HelloRuntimeModule
import org.eclipse.xtext.web.example.hello.HelloStandaloneSetup

/**
 * Initialization support for running Xtext languages without Equinox extension registry.
 */
class HelloIdeSetup extends HelloStandaloneSetup {

	override createInjector() {
		Guice.createInjector(new HelloRuntimeModule, new HelloIdeModule)
	}
}
