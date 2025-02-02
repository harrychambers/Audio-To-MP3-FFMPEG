// Generated from libavfilter/opencl/remap.cl
const char *ff_opencl_source_remap =
"#line 1 \"libavfilter/opencl/remap.cl\"\n"
"/*\n"
" * This file is part of FFmpeg.\n"
" *\n"
" * FFmpeg is free software; you can redistribute it and/or\n"
" * modify it under the terms of the GNU Lesser General Public\n"
" * License as published by the Free Software Foundation; either\n"
" * version 2.1 of the License, or (at your option) any later version.\n"
" *\n"
" * FFmpeg is distributed in the hope that it will be useful,\n"
" * but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
" * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\n"
" * Lesser General Public License for more details.\n"
" *\n"
" * You should have received a copy of the GNU Lesser General Public\n"
" * License along with FFmpeg; if not, write to the Free Software\n"
" * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA\n"
" */\n"
"\n"
"const sampler_t linear_sampler = (CLK_NORMALIZED_COORDS_FALSE |\n"
"                                  CLK_FILTER_LINEAR);\n"
"\n"
"const sampler_t nearest_sampler = (CLK_NORMALIZED_COORDS_FALSE |\n"
"                                   CLK_FILTER_NEAREST);\n"
"\n"
"__kernel void remap_near(__write_only image2d_t dst,\n"
"                         __read_only  image2d_t src,\n"
"                         __read_only  image2d_t xmapi,\n"
"                         __read_only  image2d_t ymapi,\n"
"                         float4 fill_color)\n"
"{\n"
"    int2 p = (int2)(get_global_id(0), get_global_id(1));\n"
"    int2 dimi = get_image_dim(src);\n"
"    float2 dimf = (float2)(dimi.x, dimi.y);\n"
"    float4 val;\n"
"    int2 mi;\n"
"    float m;\n"
"\n"
"    float4 xmap = read_imagef(xmapi, nearest_sampler, p);\n"
"    float4 ymap = read_imagef(ymapi, nearest_sampler, p);\n"
"    float2 pos  = (float2)(xmap.x, ymap.x);\n"
"    pos.xy = pos.xy * 65535.f;\n"
"\n"
"    mi = ((pos >= (float2)(0.f, 0.f)) * (pos < dimf) * (p <= dimi));\n"
"    m = mi.x && mi.y;\n"
"    val = mix(fill_color, read_imagef(src, nearest_sampler, pos), m);\n"
"\n"
"    write_imagef(dst, p, val);\n"
"}\n"
"\n"
"__kernel void remap_linear(__write_only image2d_t dst,\n"
"                           __read_only  image2d_t src,\n"
"                           __read_only  image2d_t xmapi,\n"
"                           __read_only  image2d_t ymapi,\n"
"                           float4 fill_color)\n"
"{\n"
"    int2 p = (int2)(get_global_id(0), get_global_id(1));\n"
"    int2 dimi = get_image_dim(src);\n"
"    float2 dimf = (float2)(dimi.x, dimi.y);\n"
"    float4 val;\n"
"    int2 mi;\n"
"    float m;\n"
"\n"
"    float4 xmap = read_imagef(xmapi, nearest_sampler, p);\n"
"    float4 ymap = read_imagef(ymapi, nearest_sampler, p);\n"
"    float2 pos  = (float2)(xmap.x, ymap.x);\n"
"    pos.xy = pos.xy * 65535.f;\n"
"\n"
"    mi = ((pos >= (float2)(0.f, 0.f)) * (pos < dimf) * (p <= dimi));\n"
"    m = mi.x && mi.y;\n"
"    val = mix(fill_color, read_imagef(src, linear_sampler, pos), m);\n"
"\n"
"    write_imagef(dst, p, val);\n"
"}\n"
;
