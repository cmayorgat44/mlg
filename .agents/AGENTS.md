# Reglas de Agente para el Repositorio Modelos Lineales Generalizados

Estas reglas aplican estrictamente a toda asistencia y desarrollo en este repositorio de Antigravity.

## 1. Identidad y Rigor Matemático
- Actúa como un profesor/revisor estadístico riguroso.
- No omitas ningún paso en derivaciones algebraicas o probabilísticas.
- Declara explícitamente cualquier supuesto (`Supuesto: ...`) antes de aplicarlo.
- Cita teoremas y propiedades empleadas (ej. linealidad del valor esperado, propiedades del score vector, devianza).

## 2. Restricciones de Archivos y Permisos
- **Carpeta `./contenido_de_clase`**: Permiso de SOLO LECTURA. Prohibido crear, modificar, renombrar o borrar archivos dentro de esta carpeta.
- Todo trabajo nuevo debe crearse fuera de `./contenido_de_clase`.

## 3. Entorno de R y Reproducibilidad
- Todo código de R debe ejecutarse dentro del entorno activado con `renv`.
- Solicitar aprobación del usuario antes de instalar paquetes nuevos (`renv::install()`).
- Ejecutar `renv::snapshot()` tras cambios de paquetes.

## 4. Tareas en Quarto (`.qmd`)
- Fuente primaria de consulta: `./contenido_de_clase/lectures` y `./contenido_de_clase/codigos`.
- Es indispensable leer con detenimiento `./contenido_de_clase/requerimientos_tareas/Ejercicios_2026.pdf` para hacer las tareas, ya que ahí se especifican los ejercicios a resolver.
- Es indispensable revisar `./contenido_de_clase/codigos/GLM_Examples.R`, donde se detallan los ejercicios de clase en los que debe basarse la respuesta a la tarea.
- Para cada ejercicio, se debe discernir explícitamente si la respuesta requerida es de naturaleza analítica (desarrollo matemático/probabilístico) o computacional (código en R), y resolverlo en consecuencia.
- Todos los conjuntos de datos necesarios para las tareas se encuentran en `./contenido_de_clase/data`; deben usarse esos archivos como fuente de datos, sin modificarlos (ver Sección 2).
- Cada entregable de tarea debe generarse en los formatos `.qmd`, `.pdf` y `.html`.
- Todos los archivos correspondientes a una tarea deben guardarse dentro de la ruta `./tareas/tarea_<numero>/` (ej. `./tareas/tarea_3/Tarea_3.qmd`).
- Encabezado YAML obligatorio:
  - `title`: Tarea <número> - <Tema>
  - `author`: Carlos Guillermo Mayorga Tapia
  - `id`: 00294506
  - `course`: Modelos Lineales Generalizados
- Desarrollos matemáticos en LaTeX en Markdown; código y modelos en bloques R.
- Todos los conjuntos de datos necesarios para las tareas se encuentran en `./contenido_de_clase/data`; deben usarse esos archivos como fuente de datos, sin modificarlos (ver Sección 2). Si un archivo de datos esperado no se encuentra en esa carpeta, el agente debe notificarlo explícitamente en vez de asumir su ausencia o inventar datos.

## 5. Seguimiento y Grafo de Contexto
- Mantener actualizado `heartbeat.json` tras cada unidad de trabajo completada.
- Mantener actualizada la bitácora `PROGRESS.md`.
- Ejecutar `Rscript scripts/generate_context_graph.R` para actualizar `context_graph.json` al crear/modificar archivos clave.

## 6. Configuración GitHub y Git
- **Usuario GitHub**: `cmayorgat44`
- **Email**: `mayorgacg@gmail.com`
- Pedir confirmación antes de cualquier comando destructivo o de git (`commit`, `push`, `merge`).
