# Bitácora de Progreso del Proyecto — Modelos Lineales Generalizados

**Alumno:** Carlos Guillermo Mayorga Tapia  
**ID:** 00294506  
**Materia:** Modelos Lineales Generalizados (MAT5508 / 10182)  
**Usuario GitHub:** `cmayorgat44`  
**Email:** `mayorgacg@gmail.com`  
**Repositorio GitHub:** https://github.com/cmayorgat44/mlg  

---

## Estado Actual
- **Fase del Proyecto:** Tarea 1 completada (ejercicios 1 a 4 de distribución normal y máxima verosimilitud). Compilada a HTML y PDF, y sincronizada con el repositorio de GitHub. Listos para continuar con la Tarea 3 mañana.

---

## Registro de Actividades y Decisiones

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
