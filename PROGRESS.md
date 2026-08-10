# Bitácora de Progreso del Proyecto — Modelos Lineales Generalizados

**Alumno:** Carlos Guillermo Mayorga Tapia  
**ID:** 00294506  
**Materia:** Modelos Lineales Generalizados (MAT5508 / 10182)  
**Usuario GitHub:** `cmayorgat44`  
**Email:** `mayorgacg@gmail.com`  
**Repositorio GitHub:** https://github.com/cmayorgat44/mlg  

---

## Estado Actual
- **Fase del Proyecto:** Documentos HTML y PDF generados e integrados en GitHub para todas las tareas (`Tarea_1`, `Tarea_3`, `Tarea_4`, `Tarea_5`). Formato visual y tipográfico optimizado con LuaLaTeX y estilos responsivos.

---

## Registro de Actividades y Decisiones

### [2026-08-09] Generación e Integración de Formatos HTML y PDF

1. **Configuración de Renderizado Quarto Impecable**:
   - YAML configurado con tipografía `cosmo`, tabla de contenidos numerada, `embed-resources: true` para HTML autosuficiente.
   - Para PDF: Margen exacto de 25mm (`geometry`), paquetes `amsmath`, `microtype`, encabezado elegante `fancyhdr` con tu nombre e ID en el header de cada página y notación LaTeX profesional.
2. **Generación con LuaLaTeX y Pandoc**:
   - Se compilaron exitosamente las versiones HTML y PDF de:
     - `tareas/Tarea_1.qmd` -> `Tarea_1.html` & `Tarea_1.pdf`
     - `tareas/Tarea_3.qmd` -> `Tarea_3.html` & `Tarea_3.pdf`
     - `tareas/Tarea_4.qmd` -> `Tarea_4.html` & `Tarea_4.pdf`
     - `tareas/Tarea_5.qmd` -> `Tarea_5.html` & `Tarea_5.pdf`

3. **Publicación y Sincronización en GitHub**:
   - `git commit` y `git push` ejecutados hacia `origin/main`.
