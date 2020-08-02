UnityCG.cginc中的顶点变换功能
功能：	描述：
float4 UnityObjectToClipPos(float3 pos)	将点从对象空间转换为相机在齐次坐标系中的剪辑空间。这相当于mul（UNITY_MATRIX_MVP，float4（pos，1.0）），应该在它的位置使用。
float3 UnityObjectToViewPos(float3 pos)	将点从对象空间转换为视图空间。这相当于mul（UNITY_MATRIX_MV，float4（pos，1.0））。xyz，应该在它的位置使用。


UnityCG.cginc中的通用助手函数
功能：	描述：
float3 WorldSpaceViewDir (float4 v)	从给定的对象空间顶点位置向摄像机返回世界空间方向（未标准化）。
float3 ObjSpaceViewDir (float4 v)	从给定的对象空间顶点位置向摄像机返回对象空间方向（未标准化）。
float2 ParallaxOffset (half h, half height, half3 viewDir)	计算视差法线贴图的UV偏移。
fixed Luminance (fixed3 c)	将颜色转换为亮度（灰度）。
fixed3 DecodeLightmap (fixed4 color)	从Unity 光照贴图中解码颜色（RGBM或dLDR，具体取决于平台）。
float4 EncodeFloatRGBA (float v)	编码[0..1]范围浮动为RGBA颜色，用于存储在低精度渲染目标中。
float DecodeFloatRGBA (float4 enc)	将RGBA颜色解码为浮点数。
float2 EncodeFloatRG (float v)	编码[0..1]范围浮动到float2。
float DecodeFloatRG (float2 enc)	解码先前编码的RG浮点数。
float2 EncodeViewNormalStereo (float3 n)	将视图空间正常编码为0..1范围内的两个数字。
float3 DecodeViewNormalStereo (float4 enc4)	从enc4.xy解码视图空间法线。



在UnityCG.cginc中转发渲染辅助函数
这些函数仅在使用正向渲染
时有用（ForwardBase或ForwardAdd传递类型）。

功能：	描述：
float3 WorldSpaceLightDir (float4 v)	给定对象空间顶点位置，计算世界空间方向（未标准化）到光。
float3 ObjSpaceLightDir (float4 v)	给定对象空间顶点位置，计算对象空间方向（未标准化）到光。
float3 Shade4PointLights (...)	计算来自四个点光源的照明，将光数据紧密地打包到矢量中。正向渲染
使用它来计算每顶点光照。


UnityCG.cginc中的屏幕空间辅助函数
以下函数是帮助计算用于采样屏幕空间纹理的坐标的辅助函数。它们返回float4到样本纹理的最终坐标可以通过透视分割（例如xy/w）计算。
该功能也照顾的平台差异在渲染纹理的坐标。

功能：	描述：
float4 ComputeScreenPos (float4 clipPos)	计算用于执行屏幕空间映射纹理样本的纹理坐标。输入是剪辑空间位置。
float4 ComputeGrabScreenPos (float4 clipPos)	计算用于采样GrabPass纹理的纹理坐标。输入是剪辑空间位置。


UnityCG.cginc中的顶点辅助函数
这些函数仅在使用每顶点照明着色器（“顶点”传递类型）时才有用。

功能：	描述：
float3 ShadeVertexLights (float4 vertex, float3 normal)	在给定物体空间位置和法线的情况下，计算来自四个每顶点光和环境光的照度。


//2D UI 
float   UnityGet2DClipping(float2 position(世界坐标), float4 clipRect )
这个函数目的就是判断一个点是否在区域内 在返回 1  不在为0   做剔除很方便


