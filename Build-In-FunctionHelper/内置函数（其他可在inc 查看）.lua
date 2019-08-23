UnityCG.cginc�еĶ���任����
���ܣ�	������
float4 UnityObjectToClipPos(float3 pos)	����Ӷ���ռ�ת��Ϊ������������ϵ�еļ����ռ䡣���൱��mul��UNITY_MATRIX_MVP��float4��pos��1.0������Ӧ��������λ��ʹ�á�
float3 UnityObjectToViewPos(float3 pos)	����Ӷ���ռ�ת��Ϊ��ͼ�ռ䡣���൱��mul��UNITY_MATRIX_MV��float4��pos��1.0������xyz��Ӧ��������λ��ʹ�á�


UnityCG.cginc�е�ͨ�����ֺ���
���ܣ�	������
float3 WorldSpaceViewDir (float4 v)	�Ӹ����Ķ���ռ䶥��λ�����������������ռ䷽��δ��׼������
float3 ObjSpaceViewDir (float4 v)	�Ӹ����Ķ���ռ䶥��λ������������ض���ռ䷽��δ��׼������
float2 ParallaxOffset (half h, half height, half3 viewDir)	�����Ӳ����ͼ��UVƫ�ơ�
fixed Luminance (fixed3 c)	����ɫת��Ϊ���ȣ��Ҷȣ���
fixed3 DecodeLightmap (fixed4 color)	��Unity ������ͼ�н�����ɫ��RGBM��dLDR������ȡ����ƽ̨����
float4 EncodeFloatRGBA (float v)	����[0..1]��Χ����ΪRGBA��ɫ�����ڴ洢�ڵ;�����ȾĿ���С�
float DecodeFloatRGBA (float4 enc)	��RGBA��ɫ����Ϊ��������
float2 EncodeFloatRG (float v)	����[0..1]��Χ������float2��
float DecodeFloatRG (float2 enc)	������ǰ�����RG��������
float2 EncodeViewNormalStereo (float3 n)	����ͼ�ռ���������Ϊ0..1��Χ�ڵ��������֡�
float3 DecodeViewNormalStereo (float4 enc4)	��enc4.xy������ͼ�ռ䷨�ߡ�



��UnityCG.cginc��ת����Ⱦ��������
��Щ��������ʹ��������Ⱦ
ʱ���ã�ForwardBase��ForwardAdd�������ͣ���

���ܣ�	������
float3 WorldSpaceLightDir (float4 v)	��������ռ䶥��λ�ã���������ռ䷽��δ��׼�������⡣
float3 ObjSpaceLightDir (float4 v)	��������ռ䶥��λ�ã��������ռ䷽��δ��׼�������⡣
float3 Shade4PointLights (...)	���������ĸ����Դ���������������ݽ��ܵش����ʸ���С�������Ⱦ
ʹ����������ÿ������ա�


UnityCG.cginc�е���Ļ�ռ丨������
���º����ǰ����������ڲ�����Ļ�ռ����������ĸ������������Ƿ���float4����������������������ͨ��͸�ӷָ����xy/w�����㡣
�ù���Ҳ�չ˵�ƽ̨��������Ⱦ��������ꡣ

���ܣ�	������
float4 ComputeScreenPos (float4 clipPos)	��������ִ����Ļ�ռ�ӳ�������������������ꡣ�����Ǽ����ռ�λ�á�
float4 ComputeGrabScreenPos (float4 clipPos)	�������ڲ���GrabPass������������ꡣ�����Ǽ����ռ�λ�á�


UnityCG.cginc�еĶ��㸨������
��Щ��������ʹ��ÿ����������ɫ���������㡱�������ͣ�ʱ�����á�

���ܣ�	������
float3 ShadeVertexLights (float4 vertex, float3 normal)	�ڸ�������ռ�λ�úͷ��ߵ�����£����������ĸ�ÿ�����ͻ�������նȡ�