//
// K_BlurMask v1.0
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//
// Pass #4: Put everything back together
//

uniform sampler2D adsk_results_pass3, front, matte;
uniform float adsk_result_w, adsk_result_h;

void main() {
	vec2 iResolution = vec2(adsk_result_w, adsk_result_h);
	vec2 uv = (gl_FragCoord.xy/iResolution.xy);
	
	vec4 blurred = texture2D(adsk_results_pass3, uv).rgba;
	vec3 back = texture2D(front, uv).rgb;
	vec3 src_matte = texture2D(matte, uv).rgb;
	
	gl_FragColor = vec4 (mix(back, (blurred.rgb/(blurred.a + 0.0001)), src_matte.r), src_matte.r);
}