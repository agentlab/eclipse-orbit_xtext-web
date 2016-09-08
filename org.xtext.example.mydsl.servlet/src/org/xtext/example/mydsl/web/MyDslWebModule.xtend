/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.xtext.example.mydsl.web

import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtext.web.server.persistence.IResourceBaseProvider
import org.eclipse.xtext.web.example.jetty.resource.MyDslContentTypeProvider
import org.eclipse.xtext.web.example.jetty.resource.MyDslResourceSetProvider
import org.eclipse.xtext.web.server.model.IWebResourceSetProvider
import com.google.inject.Binder
import org.eclipse.xtext.web.server.persistence.FileResourceHandler
import org.eclipse.xtext.web.server.persistence.IServerResourceHandler
import org.eclipse.xtext.ide.editor.syntaxcoloring.ISemanticHighlightingCalculator
import org.eclipse.xtext.ide.labels.IImageDescriptionProvider
import org.eclipse.xtext.ide.editor.contentassist.IdeContentProposalProvider

/**
 * Use this class to register additional components to be used within the web application.
 */
@FinalFieldsConstructor
class MyDslWebModule extends AbstractMyDslWebModule {
	
	val IResourceBaseProvider resourceBaseProvider

	override bindIContentTypeProvider() {
		return MyDslContentTypeProvider
	}
	
	def Class<? extends IWebResourceSetProvider> bindIWebResourceSetProvider() {
		return MyDslResourceSetProvider
	}

	def void configureResourceBaseProvider(Binder binder) {
		if (resourceBaseProvider !== null) binder.bind(IResourceBaseProvider).toInstance(resourceBaseProvider)
	}

	def Class<? extends IServerResourceHandler> bindIServerResourceHandler() {
		return FileResourceHandler
	}
	
//	def Class<? extends IdeContentProposalProvider> bindIdeContentProposalProvider() {
//		return MyDslWebContentProposalProvider
//	}
//
//	def Class<? extends IImageDescriptionProvider> bindIImageDescriptionProvider() {
//		return MyDslImageDescriptionProvider
//	}
//
//	def Class<? extends ISemanticHighlightingCalculator> bindISemanticHighlightingCalculator() {
//		return MyDslSemanticHighlightingCalculator
//	}
	
}
