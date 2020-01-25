Shader "Custom/sample" {
	Properties{
		_MainTex("Texture 1", 2D)="white"{}
		_SubTex("Texture 2", 2D)="white"{}
	}
	SubShader {
		Tags { "RenderingType" = "Opaque"}
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
			float3 viewDir;
			float3 worldNormal;
		};

		sampler2D _MainTex;
		sampler2D _SubTex;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c1 = tex2D(_MainTex, IN.uv_MainTex);
			fixed4 c2 = tex2D(_SubTex, IN.uv_MainTex);
			float factor = abs(acos(dot(IN.viewDir, IN.worldNormal)));
			o.Albedo = lerp(c1, c2, factor);
		}
		ENDCG
	}
	FallBack "Diffuse"
}