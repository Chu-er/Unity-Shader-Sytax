###加粗的函数为经常使用函数，标红函数为含有比较的函数
数学类


abs(x)——返回输入参数的绝对值
acos(x)——反余切函数，输入参数范围为[-1,1]，返回[0,π ]区间的角度值
all(x)——如果输入参数均不为0，则返回ture；否则返回flase。&&运算
any(x)——输入参数只要有其中一个不为0，则返回true。||运算
asin(x)——反正弦函数,输入参数取值区间为[−1,1]，返回角度值范围为[-π/2, π/2]
atan(x)——反正切函数，返回角度值范围为[-π/2, π/2]
atan2(y,x)——计算y/x 的反正切值。实际上和atan(x)函数功能完全一样，至少输入参数不同。atan(x) =atan2(x, float(1))。
ceil(x)——对输入参数向上取整。例如：ceil(float(1.3))，其返回值为2.0
clamp(x, min, max)——将x收缩至min与max之间，即min(max(x, min), max);
cos(x)——返回弧度 x的余弦值。返回值范围为[−1,1]
cosh(x)——双曲余弦（hyperbolic cosine）函数，计算x的双曲余弦值。cosh(x) = （exp(x) + exp(-x))/2
cross(x, y)——差积，x叉乘y = (x[1]*y[2]-y[1]*x[2], x[2]*y[0] - y[2]*x[0], x[0]*y[1] - y[0]*x[1])，注意，输入参数必须是三元向量！;
degrees(x)——输入参数为弧度值(radians)，函数将其转换为角度值(degrees)
determinant(m)——计算矩阵的行列式。
distance(p0, p1)——两点距离， length(p0-p1);
dot(x, y)——点积，各分量分别相乘后相加;
exp(x)——计算pow(e, x)的值，e= 2.71828182845904523536
exp2(x)——计算pow(2, x)的值
floor(x)——对输入参数向下取整。例如floor(float(1.3))返回的值为1.0；但是floor(float(-1.3))返回的值为-2.0。该函数与ceil(x)函数相对应。
fmod(x,y)——返回x/y 的余数。如果y 为0，结果不可预料。
fract(x)——取小数部分，即x - floor(x);
frexp(x, out exp)——将浮点数x 分解为尾数和指数，即x = m* 2^exp，返回m，并将指数存入exp 中；如果x 为0，则尾数和指数都返回0
ldexp(x, n)——计算x ∗2^n的值
length(x)——向量长度;
lerp(a, b, f)——计算(1− f )∗ a + b∗ f 或者a + f ∗(b − a)的值。即在下限a 和上限b 之间进行插值，f 表示权值。注意，如果a 和b 是向量，则权值f必须是标量或者等长的向量。
lit(NdotL,NdotH, m)——N 表示法向量；L 表示入射光向量；H 表示半角向量；m 表示高光系数。函数计算环境光、散射光、镜面光的贡献，返回的4 元向量：
X 位表示环境光的贡献，总是1.0；
Y位代表散射光的贡献，如果N • L < 0，则为 0；否则为N • L
Z位代表镜面光的贡献，如果 N • L < 0或者N • H < 0，则位 0；否则为(N • H)m；
W 位始终位1.0
log(x)——计算ln(x)的值，x必须大于 0
log2(x)——计算 log 2x 的值，x 必须大于0
log10(x)——计算 log 10x 的值，x 必须大于0
max(x, y)——取最大值;
min(x, y)——取最小值，x、y为标量;
mod(x, y)—— 取模， x - y*floor(x/y)
mul(M, N)——计算两个矩阵相乘，如果M 为AxB 阶矩阵，N 为BxC 阶矩阵，则返回AxC 阶矩阵。下面两个函数为其重载函数。
mul(M, v)——计算矩阵和向量相乘
mul(v, M)——计算向量和矩阵相乘
noise(x)——噪声函数，返回值始终在0，1 之间；对于同样的输入，始终返回相同的值（也就是说，并不是真正意义上的随机噪声）。
normalize(x)——归一化， length(x)=1;
pow(x, y)—— xy
radians(x)——函数将角度值转换为弧度值
reflect(I, N)——根据入射光方向向量I，和顶点法向量N，计算反射光方向向量。其中I 和N必须被归一化，需要非常注意的是，这个I 是指向模型顶点的；函数只对三元向量有效。
refract(I,N,eta)——计算折射向量，I 为入射光线，N 为法向量，eta 为折射系数；其中I 和N 必须被归一化，如果I 和N 之间的夹角太大，则返回（0，0，0），也就是没有折射光线；I 是指向模型顶点的；函数只对三元向量有效。
round(x)——Round-to-nearest，或closest integer to x 即四舍五入。
saturate(x)——如果x 小于0，返回0；如果x 大于1，返回1；否则，返回x
sign(x)——如果x 大于0，返回1；如果x 小于0，返回01；否则返回0。
sin(x)——输入参数为弧度，计算正弦值，返回值范围为[−1,1]
sincos(float x,out s, out c)——该函数是同时计算x 的sin 值和cos 值，其中s=sin(x)，c=cos(x)。该函数用于“同时需要计算sin 值和cos 值的情况”，比分别运算要快很多!
sinh(x)——计算双曲正弦（hyperbolic sine）值。cosh(x) = （exp(x) - exp(-x))/2
smoothstep(min, max, x)——x大于min，小于max时平滑差值，x<=min时为0.0， x>=max时为1.0;按照下列公式平滑插值：
-2( (x-min) / (max-min) )^3 + 3( (x-min) / (max-min) )^2
sqrt(x)——求x 的平方根， x ，x 必须大于0。
step(edge, x)——如 x小于edge，则返回0.0，否则返回1.0;
tan(x)——输入参数为弧度，计算正切值
tanh(x)——计算双曲正切值
transpose(M)——M为矩阵，计算其转置矩阵
纹理映射函数
tex1D(sampler1D tex, float s)——一维纹理查询
tex1D(sampler1D tex, float s)——一维纹理查询
tex1D(sampler1D tex, float s, float dsdx, float dsdy)——使用导数值（derivatives）查询一维纹理
** Tex2D(sampler2D tex, float2 s) ** 二维纹理查询
Tex2D(sampler2D tex, float2 s, float2 dsdx, float2 dsdy)——使用导数值（derivatives）查询二维纹理
**texCUBE(samplerCUBE tex, float3 s)**查询立方体纹理
偏导函数
ddx(a) 参数a 对应一个像素位置，返回该像素值在X 轴上的偏导数
ddy(a) 参数a 对应一个像素位置，返回该像素值在X 轴上的偏导数
Attention：
函数 ddx 和ddy 用于求取相邻像素间某属性的差值；
函数 ddx 和ddy 的输入参数通常是纹理坐标；
函数 ddx 和ddy 返回相邻像素键的属性差值；
假设传递给ddx\ddy 函数的参数myVar 是纹理坐标，则，ddx(myVar)的值为，纹理上像素点 p (i +1, j)的纹理颜色值减去 myVar 对应的纹理颜色值。
Other
clip(a)--根据变量a来舍弃当前片段，若a<=0则舍弃
discard     --用于抛弃当前像素

具有mipmap级别  在 float4 中的 w 分量表示
tex2Dlod(tex, float4(uv, 0, 0));
而且我们还需要添加#pragma target 3.0，因为tex2Dlod是Shader Model 3.0中的特性。

