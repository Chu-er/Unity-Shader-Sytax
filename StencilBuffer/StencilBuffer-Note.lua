

STencilBuffer 长度8位 属于ZTest的一部分  

Stencil
{
	Ref 2  //
	Comp equal
	Pass keep
	Fail decrWrap
	Zfail keep

}

Ref :这个是设定参考值  模板缓冲里的值会和他进行比较
ReadMask readMask:这个是在比较C 参考值和buffer值的时候用的 读取buffer里的值
WriteMask writeMask: 写入buffer值
Comp    :比较重要  Greater GEqual Equal ...八种 和Ztestyiyang
Fail stencilOperation : 模板测试通过执行的方法 只要模板通过
ZFai      :模板通过  深度没有通过 执行的方法
Pass :两者都通过执行的方法

 一般Comp Pass Fail ZFail 只用于正面渲染  除非有Cull Front 出现 如果两面都要渲染 用C
 CompFront CompBack   同理 Pass Fail
 
 stencilOperation操作
 
 类型          含义2
 Keep     		保持
 Zero  			归0
 Replace         拿比较值替换buffer值
 IncrSat         值+1   不溢出  如果255 就不再加
 DecrSat          值-1   不溢出  到0 不再减
 Invert         翻转   0变成255  1-254
 IncrWrap        值+1  会溢出 255变成0
 DecrWrap         值-1 会溢出 0变成255
 
 
 
 
 
