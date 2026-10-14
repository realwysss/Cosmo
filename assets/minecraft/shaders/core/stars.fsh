#version 330

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

in vec3 cs;

out vec4 fragColor;

void main() {
    float sp = 1.0 + floor(cs.y * 3.0);
    float tw = 0.35 + 0.65 * (0.5 + 0.5 * sin(GameTime * 6.2831853 * 240.0 * sp + cs.x * 6.2831853));
    vec3 tn = vec3(0.92, 0.86, 1.0);
    if (cs.z > 0.4) tn = vec3(0.62, 0.38, 1.0);
    if (cs.z > 0.7) tn = vec3(0.7, 0.82, 1.0);
    if (cs.z > 0.88) tn = vec3(1.0, 0.62, 0.95);
    fragColor = vec4(tn * tw, 1.0) * ColorModulator;
}