#version 400

uniform mat4 projection, view, model;
uniform vec3 bones[4];
uniform float weights[4];

in vec3 vertex_position;

void main() {
  vec3 transformed_vertex = vec3(0.0, 0.0, 0.0); 
  for (int i = 0; i < 4; i++){
    transformed_vertex += weights[i]*vertex_position*bones[i];
  }
  gl_Position = projection * view * model * vec4(transformed_vertex, 1.0);
}