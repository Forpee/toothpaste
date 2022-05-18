uniform float uTime;

varying vec2 vUv;
varying vec3 vNormal;
mat4 rotationMatrix(vec3 axis,float angle){
    axis=normalize(axis);
    float s=sin(angle);
    float c=cos(angle);
    float oc=1.-c;
    
    return mat4(oc*axis.x*axis.x+c,oc*axis.x*axis.y-axis.z*s,oc*axis.z*axis.x+axis.y*s,0.,
        oc*axis.x*axis.y+axis.z*s,oc*axis.y*axis.y+c,oc*axis.y*axis.z-axis.x*s,0.,
        oc*axis.z*axis.x-axis.y*s,oc*axis.y*axis.z+axis.x*s,oc*axis.z*axis.z+c,0.,
    0.,0.,0.,1.);
}

vec3 rotate(vec3 v,vec3 axis,float angle){
    mat4 m=rotationMatrix(axis,angle);
    return(m*vec4(v,1.)).xyz;
}

float PI=3.14159265;

void main()
{
    vec3 n=rotate(vNormal,vec3(0.,1.,0.),-uTime*PI);
    float diff=dot(vec3(1.),n);
    gl_FragColor=vec4(vUv,1.,1.);
    gl_FragColor=vec4(diff,diff,diff,1.);
}