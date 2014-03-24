//
// K_BlurMask v1.1
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//
// Pass #6: Put everything back together
//

uniform sampler2D adsk_results_pass1, adsk_results_pass2, adsk_results_pass5;
uniform float adsk_result_w, adsk_result_h;

void main() {
	vec2 iResolution = vec2(adsk_result_w, adsk_result_h);
	vec2 uv = (gl_FragCoord.xy/iResolution.xy);
	
	vec4 blurred = texture2D(adsk_results_pass5, uv).rgba;
	vec3 back = texture2D(adsk_results_pass1, uv).rgb;
	vec3 src_matte = texture2D(adsk_results_pass2, uv).rgb;
	
	gl_FragColor = vec4 (mix(back, (blurred.rgb/(blurred.a + 0.0001)), src_matte.r), src_matte.r);
}