#version 330

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>

in vec3 Position;

out vec3 cs;

float hs(vec3 q, float s) {
    return fract(sin(dot(q, vec3(12.9898, 78.233, 37.719)) + s) * 43758.5453);
}

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vec3 q = floor(Position / 3.0);
    cs = vec3(hs(q, 0.0), hs(q, 4.0), hs(q, 9.0));
}