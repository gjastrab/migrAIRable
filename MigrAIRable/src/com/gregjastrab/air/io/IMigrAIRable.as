package com.gregjastrab.air.io {
	
	import flash.utils.IDataInput;

	/**
	 * Interface any migrAIRable class must implement
	 * in order to parse according to the version marker.
	 *
	 * @author Greg Jastrab &lt;gjastrab.dev&#64;gmail.com&gt;
	 * @date 09/10/08
	 */
	public interface IMigrAIRable {

		/* --- Functions --- */
		
		function parse(input:IDataInput):void;
		
		/* === Functions === */
		
		/* --- Public Accessors --- */
		
		/**
		 * Regular expression used to parse version marker.
		 */
		function get versionRegExp():RegExp;

		/* === Public Accessors === */
		
	}

}
