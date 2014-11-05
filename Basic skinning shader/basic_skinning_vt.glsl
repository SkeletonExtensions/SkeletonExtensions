#version 400

#define NUMBER_OF_BONES 100  // this have to be changed to actual number of bones of worm

layout(location = 0) in vec4 vertex_position;
layout(location = 1) in vec4 index_of_bone;
layout(location = 2) in vec4 weight;

uniform mat4 projection, view, model;
uniform mat4 bones[number_of_bones];

void main() {
  vec4 transformed_vertex = vec4(0.0, 0.0, 0.0, 0.0); 
  transformed_vertex += weight.x * (vertex_position * bones[index_of_bone.x]);
  transformed_vertex += weight.y * (vertex_position * bones[index_of_bone.y]);
  transformed_vertex += weight.z * (vertex_position * bones[index_of_bone.z]);
  transformed_vertex += weight.w * (vertex_position * bones[index_of_bone.w]);
  gl_Position = projection * view * model * vec4(transformed_vertex.x, transformed_vertex.y, transformed_vertex.z, 1.0);
}