package com.gregjastrab.migrairable {
	
	import com.gregjastrab.air.io.MigrAIRable;
	
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	
	public class Foo2 extends MigrAIRable {
		
		namespace v0_1 = "0.1";
		namespace v0_2 = "0.2";
		
		public var foo:String;
		
		public var bar:String;
		
		public function Foo2(foo:String="", bar:String="") {
			version = "F0.2";
			regExp = /^F(\d+)\.(\d+)$/;
			this.foo = foo;
			this.bar = bar;
		}
		
		override public function readExternal(input:IDataInput):void {
			super.readExternal(input);
			parseNS::parse(input);
		}
		
		override public function writeExternal(output:IDataOutput):void {
			super.writeExternal(output);
			output.writeUTF(foo);
			output.writeUTF(bar);
		}
		
		v0_1 function parse(input:IDataInput):void {
			trace("0.1::parse");
			foo = input.readUTF();
		}
		
		v0_2 function parse(input:IDataInput):void {
			trace("0.2::parse");
			foo = input.readUTF();
			bar = input.readUTF();
		}

	}
	
}