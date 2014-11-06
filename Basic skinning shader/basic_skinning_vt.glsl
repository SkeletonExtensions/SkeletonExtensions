#version 400

layout(location = 0) in vec4 vertex_position;
layout(location = 1) in ivec4 index_of_bone;
layout(location = 2) in vec4 weight;

uniform mat4 projection, view, model;
uniform mat4 bones[#NUMBER_OF_BONES#];

void main() {
  vec4 transformed_vertex = vec4(0.0, 0.0, 0.0, 0.0); 
  transformed_vertex += weight.x * (bones[index_of_bone.x] * vertex_position);
  transformed_vertex += weight.y * (bones[index_of_bone.y] * vertex_position);
  transformed_vertex += weight.z * (bones[index_of_bone.z] * vertex_position);
  transformed_vertex += weight.w * (bones[index_of_bone.w] * vertex_position);
  gl_Position = projection * view * model * vec4(transformed_vertex.x, transformed_vertex.y, transformed_vertex.z, 1.0);
}