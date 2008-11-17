package com.gregjastrab.air.io {

	import flash.errors.EOFError;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;

	/**
	 * Base class to provide convenience work of reading/writing
	 * the version for a serializable class that is migraitable
	 * or migrAIRable, if you will.
	 *
	 * @author Greg Jastrab &lt;gjastrab.dev&#64;gmail.com&gt;
	 * @date 09/10/08
	 */
	public class MigrAIRable implements IExternalizable {

		/* --- Variables --- */

		/**
		 * Version marker to be read.
		 */
		protected var parsedVersion:String;
		
		/**
		 * This will be set in the @see readExternal function.
		 */
		protected var parseNS:Namespace;

		/**
		 * Version marker to put in serialization.
		 */
		protected var version:String;
		
		/**
		 * Regular expression used to parse version marker.
		 */
		protected var regExp:RegExp;

		/* === Variables === */

		/* --- Constructor --- */

		/**
		 * Constructor.
		 *
		 * <p>The @see version and @see regExp values should
		 * be set in the sub-class's constructor.</p>
		 */
		public function MigrAIRable() {
			parsedVersion = version = "";
		}

		/* === Constructor === */

		/* --- Functions --- */

		/**
		 * Reads the version marker into @see parsedVersion and then
		 * uses @see versionRegExp to set the namespace to be used
		 * when calling parse.
		 *
		 * @param input data input stream
		 */
		public function readExternal(input:IDataInput):void {
			// ensure the parsedVersion is appropriately read out
			try {
				parsedVersion = input.readUTF();
			} catch(err:EOFError) {
				trace("[MigrAIRable::readExternal] there was no UTF string as the first piece " +
					  "of data in the serialization, so the parsedVersion could not be read!");
			}
			
			var res:Object = versionRegExp.exec(parsedVersion);
			// throw an error if there was no match on the parsedVersion string
			if(res === null) {
				throw new Error("[MigrAIRable::readExternal] invalid versionRegExp to parse version marker!");
			}
			else {
				trace("\n[MigrAIRable::readExternal] Removing entire match from res array: '" + res.shift() + "'");
				var nsVersionStr:String = res.join(".");
				trace("Namespace string is '" + nsVersionStr + "'\n");
				parseNS = new Namespace(nsVersionStr);
			}
		}

		/**
		 * Writes out the version marker as the first piece of data in the serialization.
		 *
		 * <p>This method should be overriden where <code>super.writeExternal(output)</code>
		 * is called first followed by your custom serialization.</p>
		 */
		public function writeExternal(output:IDataOutput):void {
			output.writeUTF(version);
		}

		/* === Functions === */
		
		/* --- Public Accessors --- */
		
		/**
		 * Regular expression used to parse version marker.
		 */
		public function get versionRegExp():RegExp { return regExp; }
		
		/* === Public Accessors === */

	}

}
