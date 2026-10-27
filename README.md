# 🎂 Invitaciones de cumpleaños

App muy simple para confirmar asistencia a un cumpleaños, con código único por invitado.

## Cómo funciona

1. **`admin.html`** — Agregas invitados por nombre. A cada uno se le genera un **código único** (ej. `K7M2PX`).
2. Pulsas **"Copiar invitación"**: se copia un mensaje listo para pegar en WhatsApp con el enlace y el código.
3. El invitado abre el enlace (**`index.html?codigo=XXXXXX`**), ve su nombre y confirma si asiste, con cuántos acompañantes y un mensaje opcional.
4. En el panel admin ves en tiempo real quién confirmó, quién no, y el total de personas.

## Requisitos

- Docker Desktop corriendo
- Supabase CLI (`brew install supabase/tap/supabase`)
- Node (para servir los archivos)

## Arrancar

```bash
# 1. Base de datos local
supabase start

# 2. Servir la app
npx serve . -p 3000
```

- Panel admin: http://localhost:3000/admin.html
- Invitación: http://localhost:3000/?codigo=XXXXXX

> `config.js` contiene la URL y la clave anon de Supabase local. Si reinstalas Supabase,
> verifica los valores con `supabase status`.

## Base de datos

Una sola tabla `invitados` (ver `supabase/migrations/`):

| Columna | Descripción |
|---|---|
| `nombre` | Nombre del invitado |
| `codigo` | Código único de 6 caracteres |
| `estado` | `pendiente`, `confirmado` o `no_asiste` |
| `acompanantes` | Cuántas personas trae además de él/ella |
| `mensaje` | Mensaje opcional del invitado |

## Nota

Esto corre **local**: los invitados solo podrán abrir el enlace si la app está publicada
en internet (ej. Supabase cloud + cualquier hosting estático). Para la fiesta real,
crea un proyecto en [supabase.com](https://supabase.com), corre la migración ahí y
actualiza `config.js` con la URL y anon key del proyecto.
