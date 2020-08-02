***************目标平台
宏：	目标平台：
SHADER_API_D3D11	Direct3D 11
SHADER_API_GLCORE	桌面OpenGL“核心”（GL 3/4）
SHADER_API_GLES	OpenGL ES 2.0
SHADER_API_GLES3	OpenGL ES 3.0 / 3.1
SHADER_API_METAL	iOS/ Mac Metal
SHADER_API_VULKAN	福尔康
SHADER_API_D3D11_9X	通用Windows平台 Direct3D 11“功能级别9.x”目标
SHADER_API_PS4	PlayStation 4。SHADER_API_PSSL也定义了。

	Xbox One

SHADER_API_MOBILE 定义适用于所有通用移动平台（GLES，GLES3，METAL）。

SHADER_TARGET_GLSL在目标着色语言为GLSL时定义（对于OpenGL / GLES平台始终为true）。


***********着色器目标模型
**********
SHADER_TARGET被定义为与着色器匹配的数值目标编译模型（即匹配#pragma target指令）。
例如，SHADER_TARGET是30编译为着色器模型3.0时。您可以在Shader代码中使用它来进行条件检查。例如：

#if SHADER_TARGET < 30
    // less than Shader model 3.0:
    // very limited Shader capabilities, do some approximation
#else
    // decent capabilities, do a better thing
#endif



Unity版本
UNITY_VERSION包含Unity版本的数值。例如，UNITY_VERSION适用501于Unity 5.0.1。
如果需要编写使用不同内置着色器功能的着色器，则可以将其用于版本比较
。例如，
#if UNITY_VERSION >= 500预处理程序检查仅传递版本5.0.0或更高版本。


阴影贴图宏
根据平台的不同，声明和采样阴影贴图可能会有很大差异。Unity有几个宏来帮助解决这个问题：

宏：	使用：
UNITY_DECLARE_SHADOWMAP(tex)	声明一个名为“tex”的shadowmap纹理变量。
#if !defined(SHADOWMAPSAMPLER_DEFINED)
UNITY_DECLARE_SHADOWMAP(_ShadowMapTexture);
#endif

UNITY_SAMPLE_SHADOW(tex,uv)	样本shadowmap在给定的“uv”坐标处纹理“tex”（XY组件是纹理位置，Z组件是深度与之比较）。返回单个浮点值，阴影项在0..1范围内。
UNITY_SAMPLE_SHADOW_PROJ(tex,uv)	与上面类似，但是可以读取投影阴影贴图。“uv”是一个float4，所有其他组件除以.w进行查找。
注意：并非所有图形卡都支持阴影贴图。使用SystemInfo.SupportsRenderTextureFormat检查是否支持。
SystemInfo .SupportsRenderTextureFormat
留下反馈信息
public static bool SupportsRenderTextureFormat（RenderTextureFormat format）;

*************常量缓冲区宏
Direct3D 11将所有Shader变量分组为“常量缓冲区”。Unity的大多数内置变量已经分组，但对于您自己的着色器中的变量，根据预期的更新频率将它们放入单独的常量缓冲区可能更为理想。

使用CBUFFER_START(name)和CBUFFER_END宏：

CBUFFER_START(MyRarelyUpdatedVariables)
    float4 _SomeGlobalValue;
CBUFFER_END


************************
纹理/采样器声明宏
************************
通常，您将texture2D在Shader代码中使用声明Texture和Sampler对。但是在某些平台（例如DX11）上，
纹理和采样器是单独的游戏，最大可能的采样器数量非常有限。Unity有一些宏来声明没有采样器的纹理，
并使用另一个纹理中的采样器对纹理进行采样。如果您最终遇到Sampler限制，请使用此选项，
并且您知道几个Texture实际上可以共享一个Sampler（Samplers定义Texture过滤和包装模式）。



宏：						使用：
UNITY_DECLARE_TEX2D(name)				声明Texture和Sampler对。
UNITY_DECLARE_TEX2D_NOSAMPLER(name)		声明没有采样器的纹理。
UNITY_DECLARE_TEX2DARRAY(name)			声明Texture数组Sampler变量。
UNITY_SAMPLE_TEX2D(name,uv)				使用给定的纹理坐标从Texture和Sampler对中取样。
UNITY_SAMPLE_TEX2D_SAMPLER( name,samplername,uv)	来自Texture（name）的样本，使用另一个Texture（samplername）中的Sampler。
UNITY_SAMPLE_TEX2DARRAY(name,uv)						来自带有float3 UV的Texture数组的样本; 坐标的z分量是数组元素索引。
UNITY_SAMPLE_TEX2DARRAY_LOD(name,uv,lod)			来自具有显式mipmap级别的Texture数组的样本。

------------下面是关于具体使用
大多数情况下在着色器中
采样纹理，纹理采样状态应该来自纹理设置 - 基本上，纹理和采样器耦合在一起。使用DX9样式着色器语法时，这是默认行为：
sampler2D _MainTex;
// ...
half4 color = tex2D(_MainTex, uv);
----------使用sampler2D，sampler3D，samplerCUBE HLSL关键字声明了纹理和采样器。
---大多数情况下，这就是您想要的，并且是旧图形API（OpenGL ES）上唯一受支持的选项。

----
下面这样一种着色器可以编写为“重用”来自其他纹理的采样器，同时采样多个纹理。在下面的示例中，
对三个纹理进行了采样，但只有一个采样器用于所有纹理：

Texture2D _MainTex;
Texture2D _SecondTex;
Texture2D _ThirdTex;
SamplerState sampler_MainTex; // "sampler" + “_MainTex”
// ...
half4 color = _MainTex.Sample(sampler_MainTex, uv);
color += _SecondTex.Sample(sampler_MainTex, uv);
color += _ThirdTex.Sample(sampler_MainTex, uv);

但请注意，DX11样式的HLSL语法不适用于某些较旧的平台（例如OpenGL ES 2.0），
有关详细信息，请参阅着色语言。您可能希望指定#pragma target 3.5
（请参阅着色器编译目标以跳过较旧的平台使用着色器。Unity提供了几个着色器宏来帮助使用这种“单独的采样器”
方法声明和采样纹理，请参阅内置宏。可以使用所述宏以这种方式重写上面的示例：

UNITY_DECLARE_TEX2D(_MainTex);---声名了一个采样器 以及与其相对的纹理 _MainTex
UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondTex);----声名了无采样器 的纹理 
UNITY_DECLARE_TEX2D_NOSAMPLER(_ThirdTex);----声名了无采样器 的纹理 
// ...
half4 color = UNITY_SAMPLE_TEX2D(_MainTex, uv);
color += UNITY_SAMPLE_TEX2D_SAMPLER(_SecondTex, _MainTex, uv);
color += UNITY_SAMPLE_TEX2D_SAMPLER(_ThirdTex, _MainTex, uv);

---用来判断是否是DX平台  
 #ifUNITY_UV_STARTS_AT_TOP
  if(_Main_Tex_TexelSize.y<0) //是否小于0来检验是否开启了抗体锯齿。翻转
  	uv.y = 1-uv.y							

#endif


UNITY_HALF_TEXEL_OFFSET  :用于支持DirectX 9的像素偏移。









