FROM runpod/worker-comfyui:5.7.1-base

COPY handler.py /handler.py

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/resolve/main/split_files/text_encoders/clip_l_hidream.safetensors --relative-path models/text_encoders --filename clip_l_hidream.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/resolve/main/split_files/text_encoders/clip_g_hidream.safetensors --relative-path models/text_encoders --filename clip_g_hidream.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/resolve/main/split_files/text_encoders/llama_3.1_8b_instruct_fp8_scaled.safetensors --relative-path models/text_encoders --filename llama_3.1_8b_instruct_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/resolve/main/split_files/diffusion_models/hidream_i1_full_fp16.safetensors --relative-path models/diffusion_models --filename hidream_i1_full_fp16.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/

