shader_type canvas_item;

uniform vec4 origin:source_color;
uniform vec4 new:source_color;
uniform vec4 origin2:source_color;
uniform vec4 new2:source_color;

void fragment() {
	vec4 current_pixel = texture(TEXTURE, UV);
	
	if (current_pixel == origin)
		COLOR = new;
	else
		COLOR = current_pixel;
	if (current_pixel == origin2)
		COLOR = new2;
	else
		COLOR = current_pixel;
}