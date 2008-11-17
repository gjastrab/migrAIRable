package com.gregjastrab.migrairable {
	
	import com.gregjastrab.air.io.MigrAIRable;
	
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	
	public class Foo extends MigrAIRable {
		
		namespace v0_1 = "0.1";
		
		public var foo:String;
		
		public function Foo(foo:String="") {
			version = "F0.1";
			regExp = /^F(\d+)\.(\d+)$/;
			this.foo = foo;
		}
		
		override public function readExternal(input:IDataInput):void {
			super.readExternal(input);
			parseNS::parse(input);
		}
		
		override public function writeExternal(output:IDataOutput):void {
			super.writeExternal(output);
			output.writeUTF(foo);
		}
		
		v0_1 function parse(input:IDataInput):void {
			trace("0.1::parse");
			foo = input.readUTF();
		}

	}
	
}