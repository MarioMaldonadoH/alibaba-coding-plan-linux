---
name: alibaba-linux
description: Configura y lanza Claude Code en entornos Linux/WSL utilizando los modelos de Alibaba Cloud Coding Plan (qwen3.5-plus, kimi-k2.5, MiniMax-M2.5) mediante alias y variables de entorno.
---

# Alibaba Cloud Coding Plan Linux Configuration Skill

Esta skill automatiza la configuracion de la herramienta oficial `claude-code` de Anthropic en entornos Linux (incluyendo WSL) para que utilice los modelos de Alibaba Cloud Model Studio Coding Plan.

## Requisitos Previos

- **Node.js**: Version 18 o superior instalado en el entorno Linux.
- **npm/npx**: Disponibles en el PATH.
- **Claude Code**: Acceso a internet para ejecutarlo via `npx`.
- **Alibaba Cloud Account**: Suscripcion activa a Coding Plan.
- **API Key**: Clave exclusiva de Coding Plan (formato `sk-sp-xxxxx`).

## Configuracion de Modelos

Esta configuracion mapea los roles de Claude a los siguientes modelos de Alibaba Cloud:

| Rol de Claude | Modelo Alibaba | Vision | Proposito |
| :--- | :--- | :--- | :--- |
| **Opus** (Reasoning) | `qwen3.5-plus` | Si | Razonamiento complejo y analisis visual. |
| **Sonnet** (Coding) | `kimi-k2.5` | Si | Programacion y edicion con soporte visual. |
| **Haiku** (Fast) | `MiniMax-M2.5` | No* | Tareas rapidas. |

> *MiniMax-M2.5 requiere skill adicional para procesamiento de imagenes.

## Instrucciones de Uso

La skill incluye un script de automatizacion en `resources/setup_alibaba_linux.sh`.

### Pasos para Configurar:

1.  Copia el script a tu entorno Linux.
2.  Edita el archivo y reemplaza `{{API_KEY}}` con tu API Key de Coding Plan.
3.  Ejecuta el script para anadir el alias `alibaba` a tu `~/.bashrc`.
4.  Reinicia tu terminal o ejecuta `source ~/.bashrc`.

### Uso del Comando:

Una vez configurado, simplemente escribe:
```bash
alibaba
```

## Detalles del Alias

El comando configura las siguientes variables de entorno criticas:
- `ANTHROPIC_BASE_URL`: `https://coding-intl.dashscope.aliyuncs.com/apps/anthropic`
- `ANTHROPIC_AUTH_TOKEN`: Tu API Key de Coding Plan.
- `API_TIMEOUT_MS`: `3000000` (para evitar desconexiones en modelos pesados).
- Modelos por defecto mapeados a la familia Alibaba Cloud.

## Cambio de Modelos en Sesion

```
/model qwen3-coder-next
/model kimi-k2.5
/model MiniMax-M2.5
```

## Extension de Capacidades

### Web Search (Firecrawl MCP)
```bash
claude mcp add firecrawl -e FIRECRAWL_API_KEY=YOUR_KEY -- npx -y firecrawl-mcp
```

### Skill de Vision para MiniMax-M2.5
Crear en `.claude/skills/image-analyzer/SKILL.md`:
```markdown
---
name: image-analyzer
description: Analiza imagenes usando qwen3.5-plus
model: qwen3.5-plus
---
qwen3.5-plus tiene capacidades visuales. Usa este modelo para entender imagenes.
```

## Cuotas del Plan

| Plan | Precio | Requests/5h | Requests/semana | Requests/mes |
| :--- | :--- | :--- | :--- | :--- |
| **Lite** | $3 (primer mes) | 1,200 | 9,000 | 18,000 |
| **Pro** | $15 (primer mes) | 6,000 | 45,000 | 90,000 |

> [!IMPORTANT]
> Asegurate de que tu entorno Linux tenga acceso a los servidores de Alibaba Cloud y que tu API Key de Coding Plan sea valida.
>
> **Uso permitido**: Solo para herramientas de coding interactivas.
> **Uso prohibido**: Scripts automatizados, backends de aplicaciones.

## Referencias

- [Coding Plan Overview](https://www.alibabacloud.com/help/en/model-studio/coding-plan)
- [Getting Started](https://www.alibabacloud.com/help/en/model-studio/coding-plan-quickstart)
- [Claude Code Setup](https://www.alibabacloud.com/help/en/model-studio/claude-code-coding-plan)
