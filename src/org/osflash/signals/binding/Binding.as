package org.osflash.signals.binding 
{
	public class Binding implements IChangeSlot
	{
		public var source:IBindable;
		public var sourceProperty:String = '';
		public var target:Object;		public var targetProperty:String = '';
		public var double:Boolean = false;

		public function Binding(source:IBindable, sourceProperty:String, target:Object, targetProperty:String, double:Boolean = false) 
		{
			this.source = source;
			this.sourceProperty = sourceProperty;
			this.target = target;
			this.targetProperty = targetProperty;
			this.double = double;
		}

		public function onChange(fromObject:Object, property:String, newValue:Object):void
		{
			//TODO: check against old value
			//TODO: perhaps move filtering out of here
			
			if (fromObject == source && property == sourceProperty)
			{
				if (target[targetProperty] != newValue)
					target[targetProperty]  = newValue;
			}
			
			if (!double) return;
			
			if (fromObject == target && property == targetProperty)
			{
				if (source[sourceProperty] != newValue)
					source[sourceProperty]  = newValue;
			}
		}
	}
}
