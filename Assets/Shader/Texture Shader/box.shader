Shader "Custom/box"
{
    Properties{
		_MainTex("Texture", 2D) = "white"{}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
			
		};

		sampler2D _MainTex;

		void surf (Input IN, inout SurfaceOutputStandard o) {
            float2 scroll = float2(1, 1) * _Time.y;
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex + scroll);
        }
		ENDCG
	}
	FallBack "Diffuse"
}
