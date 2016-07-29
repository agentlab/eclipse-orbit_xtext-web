package org.eclipse.xtext.web.dsl.launguage

import com.google.inject.Provider
import java.util.concurrent.ExecutorService

public interface IExecutorServiceProvider {
	public def Provider<ExecutorService> getExecutorServiceProvider();
}