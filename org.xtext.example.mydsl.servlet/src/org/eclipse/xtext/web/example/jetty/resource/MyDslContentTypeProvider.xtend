package org.eclipse.xtext.web.example.jetty.resource

import org.eclipse.xtext.web.server.generator.DefaultContentTypeProvider
import org.eclipse.xtext.web.server.generator.GeneratorService

class MyDslContentTypeProvider extends DefaultContentTypeProvider {
	
	override getContentType(String fileName) {
		if (fileName == GeneratorService.DEFAULT_ARTIFACT)
			return 'text/html'
		super.getContentType(fileName)
	}
	
}