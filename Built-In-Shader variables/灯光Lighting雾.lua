光参数以不同的方式传递给着色器，具体取决于渲染路径
中使用，以及着色器中使用的LightMode Pass Tag。

***************正向渲染
（ForwardBase和ForwardAdd传递类型）：



名称	类型	值
_LightColor0 （在Lighting.cginc中声明）	fixed4	lightColor
_WorldSpaceLightPos0					float4	平行灯:(世界空间方向，0）。其他灯:(世界空间位置，1）。
_LightMatrix0 （在AutoLight.cginc中声明）float4x4	世界到光的矩阵。用于对cookie和衰减纹理进行采样。
unity_4LightPosX0，unity_4LightPosY0，unity_4LightPosZ0	float4	（ForwardBase仅通过）前四个非重要点光源的世界空间位置。
unity_4LightAtten0	个float4	（ForwardBase仅通过）前四个非重要点光源的衰减系数。
unity_LightColor	half4 [4]	（仅限ForwardBase传递）前四个非重要点光源的颜色。
unity_WorldToShadow	float4x4 [4]	世界阴影矩阵。一个用于聚光灯的矩阵，最多四个用于定向光级联。


************************
*********************延迟着色和延迟光照，在光照通道着色器中使用（全部在UnityDeferredLibrary.cginc中声明）：

名称	类型	值
_LightColor		float4	LightColor	。
_LightMatrix0	float4x4	世界到光的矩阵。用于对cookie和衰减纹理进行采样。
unity_WorldToShadow	float4x4 [4]	世界阴影矩阵。一个用于聚光灯的矩阵，最多四个用于定向光级联。

// normal should be normalized, w=1.0
// output in active color space

half3 ShadeSH9 (half4 normal)
{
    // Linear + constant polynomial terms
    half3 res = SHEvalLinearL0L1 (normal);

    // Quadratic polynomials
    res += SHEvalLinearL2 (normal);

#   ifdef UNITY_COLORSPACE_GAMMA
        res = LinearToGammaSpace (res);
#   endif

    return res;
}
球面谐波系数（由环境和光探针使用）都设置了ForwardBase，PrePassFinal并Deferred 通过类型。它们包含3阶SH由世界空间正常进行评估（见ShadeSH9从UnityCG.cginc）。变量都是half4类型，unity_SHAr名称相似。

****************
****************8顶点渲染（Vertex传递类型）：
最多可设置8个灯，用于Vertex通过类型; 始终从最亮的一个开始排序。因此，
如果要同时渲染受两个灯影响的对象，则可以在数组中前两个条目。如果影响对象的光线少于8，
则其余部分的颜色将设置为黑色。


名称	类型	值
unity_LightColor		half4 [8]	LightColor
unity_LightPosition		float4 [8]	观景空间的灯光位置。（-direction，0）用于定向灯; （position，1）用于点/聚光灯。
unity_LightAtten		half4 [8]	光衰减因子。对于非聚光灯，x是cos（spotAngle / 2）或-1; 对于非聚光灯，y为1 / cos（spotAngle / 4）或1; z是二次衰减; w是平方光范围。
unity_SpotDirection		float4 [8]	观察空间聚光灯位置; （0,0,1,0）用于非聚光灯。

*************
*******************雾和环境
名称	类型	值
unity_AmbientSky			fixed4	渐变环境照明案例中的天空环境照明颜色。
unity_AmbientEquator		fixed4	渐变环境照明案例中的赤道环境照明颜色。
unity_AmbientGround			fixed4	渐变环境照明外壳中的地面环境照明颜色。
UNITY_LIGHTMODEL_AMBIENT	fixed4	环境照明颜色（渐变环境中的天空颜色）。遗留变量。Legacy
unity_FogColor				fixed4	雾颜色。
unity_FogParams				float4	雾计算的参数:(密度/ sqrt（ln（2）），密度/ ln（2）， - 1 /（结束 - 开始），结束/（结束 - 开始））。X为EXP2雾模式，有用ÿ对于精通模式，ž和瓦特为线性模式。


**************
************Various各个
名称	类型	值
unity_LODFade	个float4	使用LODGroup时细节级别淡入淡出。x是淡入淡出（0..1），y淡入淡出量化为16级，z和w未使用。
_TextureSampleAdd	个float4	由Unity for UI
自动设置仅根据所使用的纹理是否为Alpha8格式（值设置为（1,1,1,0））或不是（该值设置为（0,0,0,0） ）。



