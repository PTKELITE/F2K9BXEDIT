# Tags: 
#TAG1:Your HUGGFACE KEY
#TAG1:Your CIVITAI  KEY
# AFTER REPLACE (CTRL+F) ALL TOKENS, SAVE FILE OR TEXT TO FIRT TO LOAD ALL START YOUR KEYTOKEN ON NEXTS STARTS
#DOWNLOAD TO IMAGE AND WORKFLOW TO Comfy
#REPLACE INPUTIMAGEID TO ID IMAGEM GOOGLE OR JSON


# 1. Configuração e Correção Definitiva do ComfyUI-GGUF
cd /workspace/runpod-slim/ComfyUI/custom_nodes && \
git clone https://github.com/city96/ComfyUI-GGUF.git && \
cd ComfyUI-GGUF && \
$(which python3) -m pip install --upgrade pip && \
$(which python3) -m pip install -r requirements.txt && \
$(which python3) -m pip install gguf && \

# 2. Instalação dos Demais Custom Nodes e suas Dependências
cd /workspace/runpod-slim/ComfyUI/custom_nodes && \
git clone https://github.com/kaibioinfo/ComfyUI_AdvancedRefluxControl.git && \
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git && \
git clone https://github.com/space-nuko/ComfyUI-OpenPose-Editor.git && \
git clone https://github.com/rgthree/rgthree-comfy.git && \
cd comfyui_controlnet_aux && $(which python3) -m pip install -r requirements.txt && \

# 3. Injeção de Configurações (Modo Dev e Latent2RGB)
mkdir -p /workspace/runpod-slim/ComfyUI/user/default && \
cat <<EOF > /workspace/runpod-slim/ComfyUI/user/default/comfy.settings.json
{
  "Comfy.DevMode": true,
  "Comfy.LivePreviewMethod": "latent2rgb"
}
EOF

# 4. Criação de Pastas e Arquivos de Suporte
mkdir -p /workspace/runpod-slim/ComfyUI/models/text_encoders && \
touch /workspace/runpod-slim/ComfyUI/models/text_encoders/qwen_3_8b_fp8mixed.safetensors && \

# 5. Instalação do gdown e Download de Workflows
#mkdir -p /workspace/runpod-slim/ComfyUI/user/default/workflows && \
#cd /workspace/runpod-slim/ComfyUI/user/default/workflows && \
#python3 -m pip install --upgrade gdown && \
#export PATH="$HOME/.local/bin:$PATH" && \
#gdown INPUTIMAGEID && \

# 5.5 Download de Workflows (Imagem com JSON embutido) via GitHub Raw
mkdir -p /workspace/runpod-slim/ComfyUI/user/default/workflows && \
cd /workspace/runpod-slim/ComfyUI/user/default/workflows && \
wget -O "template_workflow.png" "https://raw.githubusercontent.com/PTKELITE/F2K916/refs/heads/main/TEMPLATES/NSFW/%2B18%20BLOWJOB%20FLUX2DV9B%20(V1-6%20-%20ALPHA).png"

# 6. Download de Imagens na Pasta Input
mkdir -p /workspace/runpod-slim/ComfyUI/input && \
cd /workspace/runpod-slim/ComfyUI/input && \
wget -O "template_input.png" "https://raw.githubusercontent.com/PTKELITE/F2K916/refs/heads/main/TEMPLATES/NSFW/%2B18%20BLOWJOB%20FLUX2DV9B%20(V1-6%20-%20ALPHA).png"


# 6. Download de Imagens na Pasta Input IMAGENS/WORFLOW
#mkdir -p /workspace/runpod-slim/ComfyUI/input && \
#cd /workspace/runpod-slim/ComfyUI/input && \
#gdown INPUTIMAGEID && \


# 7. Downloads do Hugging Face (Modelos, VAE, Text Encoder e LoRA)
mkdir -p /workspace/runpod-slim/ComfyUI/models/unet && \
mkdir -p /workspace/runpod-slim/ComfyUI/models/clip && \
mkdir -p /workspace/runpod-slim/ComfyUI/models/vae && \
mkdir -p /workspace/runpod-slim/ComfyUI/models/loras && \
wget --header="Authorization: Bearer Your HUGGFACE KEY" -O /workspace/runpod-slim/ComfyUI/models/unet/flux-2-klein-9b-Q4_K_M.gguf "https://huggingface.co/unsloth/FLUX.2-klein-9B-GGUF/resolve/main/flux-2-klein-9b-Q4_K_M.gguf" && \
wget --header="Authorization: Bearer Your HUGGFACE KEY" -O /workspace/runpod-slim/ComfyUI/models/vae/flux2-vae.safetensors "https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors" && \
wget --header="Authorization: Bearer Your HUGGFACE KEY" -O /workspace/runpod-slim/ComfyUI/models/clip/flux2-klein-9b-uncensored-q4_k_m.gguf "https://huggingface.co/ponpoke/flux2-klein-9b-uncensored-text-encoder/resolve/main/flux2-klein-9b-uncensored-q4_k_m.gguf" && \
wget --header="Authorization: Bearer Your HUGGFACE KEY" -O /workspace/runpod-slim/ComfyUI/models/loras/Flux2-Klein-9B-consistency-V2.safetensors "https://huggingface.co/dx8152/Flux2-Klein-9B-Consistency/resolve/main/Flux2-Klein-9B-consistency-V2.safetensors" && \

# 8. Downloads em Massa do CivitAI e CivitAI Red
wget -O /workspace/runpod-slim/ComfyUI/models/loras/V2_flux_klein.safetensors "https://civitai.com/api/download/models/2981570?fileId=2861093&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/KLEIN-Unchained-V2.safetensors "https://civitai.red/api/download/models/2753532?fileId=2639950&token=Your CIVITAI  KEY" && \


#wget -O /workspace/runpod-slim/ComfyUI/models/loras/klein-deepthroat-v2-5epoc-k3nk.safetensors #"https://civitai.red/api/download/models/2832958?fileId=2719117&token=Your CIVITAI  KEY" && \


#wget -O /workspace/runpod-slim/ComfyUI/models/loras/REALISTIC_SKIN_quality_epoch_10.safetensors #"https://civitai.com/api/download/models/2968520?fileId=2850313&token=Your CIVITAI  KEY" && \

#wget -O /workspace/runpod-slim/ComfyUI/models/loras/pusfix-klein.safetensors #"https://civitai.red/api/download/models/2754309?fileId=2640775&token=Your CIVITAI  KEY" && \


wget -O /workspace/runpod-slim/ComfyUI/models/loras/PornMaster_innie_pussy_flux-2-klein-9b_V1.safetensors "https://civitai.red/api/download/models/2714532?fileId=2600226&token=Your CIVITAI  KEY" && \


wget -O /workspace/runpod-slim/ComfyUI/models/loras/NaturalBeautyFLUX2Klein9BNudity_v2.safetensors "https://civitai.red/api/download/models/2972296?fileId=2851866&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/Flux_Klein_-_NSFW_v2.safetensors "https://civitai.red/api/download/models/2677698?fileId=2564503&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/pussydiffusion-f2-klein-9b_v2.safetensors "https://civitai.red/api/download/models/2960754?fileId=2840079&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/pussydiffusion-shaved_innie-f2-klein-9b_v1.safetensors "https://civitai.red/api/download/models/2960776?fileId=2840093&token=Your CIVITAI  KEY" && \

#wget -O /workspace/runpod-slim/ComfyUI/models/loras/klein_slider_anatomy.safetensors #"https://civitai.com/api/download/models/2615554?fileId=2502989&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/razzz_nude_woman_klein_v1.safetensors "https://civitai.red/api/download/models/2652080?fileId=2539871&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/klein_snofs_v1_4.safetensors "https://civitai.red/api/download/models/2960556?fileId=2839878&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/klein-deepthroat-v2-5epoc-k3nk.safetensors "https://civitai.red/api/download/models/2832958?fileId=2719117&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/SEXGOD_ImprovedNudity_Klein9b_v4.safetensors "https://civitai.red/api/download/models/2929301?fileId=2808122&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/lenovo_flux_klein9b.safetensors "https://civitai.com/api/download/models/2682771?fileId=2569291&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/pussymix_datass.safetensors "https://civitai.red/api/download/models/2653139?fileId=2540956&token=Your CIVITAI  KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/loras/mombod-f2k9b-final-v2.safetensors "https://civitai.red/api/download/models/3023676?fileId=Your CIVITAI KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/unet/pGGUFSNOFSSexNudesAndOther_v14Distilled.gguf "https://civitai.red/api/download/models/3004133?fileId=2884234&token=Your CIVITAI KEY" && \

wget -O /workspace/runpod-slim/ComfyUI/models/unet/pGGUFPornmaster_v4Turbo.gguf "https://civitai.red/api/download/models/3049513?fileId=2928328&token=Your CIVITAI KEY" && \


# 9. MOVER MODELOS GGUFS
mv /workspace/runpod-slim/ComfyUI/models/checkpoints/pGGUF* /workspace/runpod-slim/ComfyUI/models/unet/

# 10. Reinicialização Automática do Processo KILL do ComfyUI
(pkill -f main.py || pkill -f ComfyUI)