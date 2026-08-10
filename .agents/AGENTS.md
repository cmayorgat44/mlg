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
- Cada entregable de tarea debe ser un archivo `.qmd` nombrado `Tarea_<numero>.qmd`.
- Encabezado YAML obligatorio:
  - `title`: Tarea <número> - <Tema>
  - `author`: Carlos Guillermo Mayorga Tapia
  - `id`: 00294506
  - `course`: Modelos Lineales Generalizados
- Desarrollos matemáticos en LaTeX en Markdown; código y modelos en bloques R.

## 5. Seguimiento y Grafo de Contexto
- Mantener actualizado `heartbeat.json` tras cada unidad de trabajo completada.
- Mantener actualizada la bitácora `PROGRESS.md`.
- Ejecutar `Rscript scripts/generate_context_graph.R` para actualizar `context_graph.json` al crear/modificar archivos clave.

## 6. Configuración GitHub y Git
- **Usuario GitHub**: `cmayorgat44`
- **Email**: `mayorgacg@gmail.com`
- Pedir confirmación antes de cualquier comando destructivo o de git (`commit`, `push`, `merge`).
