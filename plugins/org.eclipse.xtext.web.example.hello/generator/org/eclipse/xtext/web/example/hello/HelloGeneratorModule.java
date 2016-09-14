package org.eclipse.xtext.web.example.hello;


import org.eclipse.xtext.Grammar;
import org.eclipse.xtext.xtext.generator.DefaultGeneratorModule;
import org.eclipse.xtext.xtext.generator.XtextGeneratorNaming;

public class HelloGeneratorModule extends DefaultGeneratorModule {

	public Class<? extends XtextGeneratorNaming> bindNaming() {
		return HelloGeneratorNaming.class;
	}

	public static class HelloGeneratorNaming extends XtextGeneratorNaming {
		@Override
		public String getWebBasePackage(Grammar grammar) {
			if (grammar.getName().equals("org.eclipse.xtext.web.example.hello.Hello")) {
				return "org.eclipse.xtext.web.example.jetty";
			} else {
				return super.getWebBasePackage(grammar);
			}
		}
	}
}
