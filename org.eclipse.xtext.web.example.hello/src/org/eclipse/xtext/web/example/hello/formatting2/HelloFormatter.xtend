/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.web.example.hello.formatting2

import com.google.inject.Inject
import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument
import org.eclipse.xtext.web.example.hello.hello.Greeting
import org.eclipse.xtext.web.example.hello.hello.Model
import org.eclipse.xtext.web.example.hello.services.HelloGrammarAccess

class HelloFormatter extends AbstractFormatter2 {
	
	@Inject extension HelloGrammarAccess

	def dispatch void format(Model model, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		for (Greeting greeting : model.getGreetings()) {
			greeting.format;
		}
	}
	
	// TODO: implement for 
}
