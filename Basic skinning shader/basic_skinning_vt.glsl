#version 400

#define number_of_bones 100  // this have to be changed to actual number of bones of worm

layout(location = 1) in vec4 vertex_position;
layout(location = 2) in int index_of_bone[4];
layout(location = 3) in float weight[4];

uniform mat4 projection, view, model;
uniform mat4 bones[number_of_bones];

void main() {
  vec4 transformed_vertex = vec4(0.0, 0.0, 0.0, 0.0); 
  for (int i = 0; i < 4; i++){
    transformed_vertex += weight[i] * (vertex_position * bones[index_of_bone[i]]);
  }
  gl_Position = projection * view * model * vec4(transformed_vertex.x, transformed_vertex.y, transformed_vertex.z, 1.0);
}