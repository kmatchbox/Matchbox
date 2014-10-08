//
// K_RgbcmyMatte v1.2
// Shader written by:   Kyle Obley (kyle.obley@gmail.com)
//

uniform sampler2D image;
uniform float adsk_result_w, adsk_result_h;
uniform int selection;

void main()
{	
	vec2 st = gl_FragCoord.xy / vec2 (adsk_result_w, adsk_result_h);
	vec3 image = texture2D(image, st).rgb;
	
	// Red
	if ( selection == 1 )
	{
		gl_FragColor = vec4( image.r * (1.0 - image.g) * (1.0 - image.b) );
	}
	
	// Green
	else if ( selection == 2 )
	{
		gl_FragColor = vec4( (1.0 - image.r) * image.g * (1.0 - image.b) );
	}
	
	// Blue
	else if ( selection == 3 )
	{
		gl_FragColor = vec4( (1.0 - image.r) * (1.0 - image.g) * image.b );
	}
	
	// Cyan
	else if ( selection == 4 )
	{
		gl_FragColor = vec4( (1.0 - image.r) * image.g * image.b );
	}
	
	// Yellow
	else if ( selection == 5 )
	{
		gl_FragColor = vec4(  image.r * image.g  * (1.0 - image.b) );
	}
	
	// Magenta
	else if ( selection == 6 )
	{
		gl_FragColor = vec4( image.b * (1.0 - image.r ) * image.g );
	}
	
	// White
	else if ( selection == 7 )
	{
		gl_FragColor = vec4( image.r * image.g * image.b );
	}
}