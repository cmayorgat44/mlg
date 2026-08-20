# Bitácora de Progreso del Proyecto — Modelos Lineales Generalizados

**Alumno:** Carlos Guillermo Mayorga Tapia  
**ID:** 00294506  
**Materia:** Modelos Lineales Generalizados (MAT5508 / 10182)  
**Usuario GitHub:** `cmayorgat44`  
**Email:** `mayorgacg@gmail.com`  
**Repositorio GitHub:** https://github.com/cmayorgat44/mlg  

---

## Estado Actual
- **Fase del Proyecto:** Tarea 4 completada (Bioensayos y modelo dosis-respuesta). Se generaron los entregables en formato .qmd, .pdf y .html y se ubicaron correctamente en `tareas/tarea_4/`. Listos para su envío o revisión.

---

## Registro de Actividades y Decisiones

### [2026-08-20] Resolución de Tarea 4
1. **Resolución de Tarea 4 (Bioensayos y modelo dosis-respuesta)**:
   - Se creó y documentó rigurosamente la demostración analítica correspondiente a las funciones de densidad y distribución acumulativa de la familia locación-escala.
   - Los resultados se exportaron exitosamente a `.pdf` y `.html` vía Quarto, respetando la estructura de carpetas especificada en las reglas.

### [2026-08-20] Resolución de Tarea 3

1. **Resolución de Tarea 3 (Métodos básicos para el análisis de datos binarios)**:
   - Se creó `Tarea_3.qmd` respondiendo a los ejercicios de la sección 3 del PDF, combinando desarrollo matemático y computacional.
   - **Ejercicio 3.1**: Modelado analítico de cuatro hipótesis de regresión logística ($H_1, H_2, H_3, H_4$) y cálculo de sus correspondientes grados de libertad para la prueba de devianza. Se incluyó un `data.frame` representativo para los datos observados de forma opcional.
   - **Ejercicio 3.2**: Cálculo computacional de intervalos de confianza para funciones no lineales de parámetros ($\exp(\beta_1 + \beta_3)$ y $\exp(\beta_2 + \beta_5 - \beta_1 - \beta_4)$) empleando el archivo `neuro.txt` y la matriz de covarianzas.
   - **Ejercicio 3.3**: Transcripción de la tabla 2 a R. Ajuste de un modelo de efectos principales y cálculo de inferencias, incluyendo evaluación de bondad de ajuste, predicción probabilística e intervalo de confianza para la razón de momios asociada a la exposición de antibióticos y factores de riesgo en el escenario de cesárea.


### [2026-08-09] Resolución de Tarea 1 y Sincronización

1. **Resolución de Tarea 1 (Máxima Verosimilitud: Distribución Normal)**:
   - Se resolvió con rigor matemático cada uno de los 4 incisos de la sección 1.1 en [Tarea_1.qmd](file:///Users/carlosmayorga/github/anahuac/mlg/tareas/tarea_1/Tarea_1.qmd).
   - **Inciso 1**: Deducción de la verosimilitud y log-verosimilitud para $\mu$ con $\sigma^2$ conocida.
   - **Inciso 2**: Deducción de la función score ($U(\mu)$), de la información de Fisher ($I(\mu)$) y obtención del MLE $\hat{\mu} = \bar{y}$.
   - **Inciso 3**: Demostración de la distribución exacta de $\bar{y} \sim \mathcal{N}(\mu, \sigma^2/n)$ y del estadístico LRS $-2r(\mu) \sim \chi^2_1$.
   - **Inciso 4**: Extensión a regresión normal lineal con covariables y ligadura identidad ($\mu_i = \mathbf{x}_i^\top \boldsymbol{\beta}$), calculando el vector score $S(\boldsymbol{\beta})$ y la matriz de información de Fisher $I(\boldsymbol{\beta}) = \frac{1}{\sigma^2} \mathbf{X}^\top \mathbf{X}$ en notación matricial y de sumatoria.

2. **Compilación y Entrega**:
   - Se generaron los archivos [Tarea_1.html](file:///Users/carlosmayorga/github/anahuac/mlg/tareas/tarea_1/Tarea_1.html) y [Tarea_1.pdf](file:///Users/carlosmayorga/github/anahuac/mlg/tareas/tarea_1/Tarea_1.pdf) vía Quarto.
   - Se visualizó la presentación en Safari.

3. **Sincronización Git**:
   - Se ejecutó el generador de grafos de contexto (`scripts/generate_context_graph.R`).
   - Se guardó el estado de trabajo y se hizo commit/push de los entregables a GitHub.
