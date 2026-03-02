#!/bin/bash
# ================================================================
# Claude Code - Linux/WSL Setup Script (Alibaba Cloud Coding Plan)
# ================================================================

# User configuration
API_KEY="{{API_KEY}}"

if [ "$API_KEY" == "{{API_KEY}}" ]; then
    echo "Error: Debes editar este script y poner tu API Key de Alibaba Cloud Coding Plan en la variable API_KEY."
    echo "Obten tu API Key desde: https://bailian.console.aliyun.com/"
    echo "Formato esperado: sk-sp-xxxxx"
    exit 1
fi

# Remove old alias if exists
sed -i '/alias alibaba=/d' ~/.bashrc

# Create the new alias with Alibaba Cloud Coding Plan configuration
# Model mapping:
#   Opus (Reasoning) -> qwen3.5-plus (Vision capable)
#   Sonnet (Coding) -> kimi-k2.5 (Vision capable)
#   Haiku (Fast) -> MiniMax-M2.5 (Text only)

ALIAS_CMD="alias alibaba='ANTHROPIC_BASE_URL=https://coding-intl.dashscope.aliyuncs.com/apps/anthropic ANTHROPIC_AUTH_TOKEN=$API_KEY API_TIMEOUT_MS=3000000 ANTHROPIC_MODEL=qwen3.5-plus ANTHROPIC_DEFAULT_OPUS_MODEL=qwen3.5-plus ANTHROPIC_DEFAULT_SONNET_MODEL=kimi-k2.5 ANTHROPIC_DEFAULT_HAIKU_MODEL=MiniMax-M2.5 npx @anthropic-ai/claude-code'"

echo "$ALIAS_CMD" >> ~/.bashrc

echo "===================================================="
echo "  Alibaba Cloud Coding Plan Linux Configuration"
echo "===================================================="
echo ""
echo "Se ha anadido el alias 'alibaba' a tu ~/.bashrc."
echo ""
echo "Modelos configurados:"
echo "  - Opus  (Reasoning): qwen3.5-plus    [Vision: YES]"
echo "  - Sonnet (Coding):   kimi-k2.5       [Vision: YES]"
echo "  - Haiku  (Fast):     MiniMax-M2.5    [Vision: NO]"
echo ""
echo "Para activarlo ahora mismo, ejecuta:"
echo "  source ~/.bashrc"
echo ""
echo "Luego podras usar Claude Code con Alibaba Cloud escribiendo:"
echo "  alibaba"
echo ""
echo "===================================================="
