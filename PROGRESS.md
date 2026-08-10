# Bitácora de Progreso del Proyecto — Modelos Lineales Generalizados

**Alumno:** Carlos Guillermo Mayorga Tapia  
**ID:** 00294506  
**Materia:** Modelos Lineales Generalizados (MAT5508 / 10182)  
**Usuario GitHub:** `cmayorgat44`  
**Email:** `mayorgacg@gmail.com`  

---

## Estado Actual
- **Fase del Proyecto:** Infraestructura y reglas de Git configuradas (`.gitignore`, nomenclatura `Tarea_<numero>.qmd`, `renv`). Proyecto listo para vinculación con GitHub.

---

## Registro de Actividades y Decisiones

### [2026-08-09] Configuración Git y Estructura de Tareas por Sección

1. **Definición de `.gitignore` Estándar**:
   - Se creó `.gitignore` excluyendo temporales de R (`.Rhistory`, `.RData`, `.Rproj.user`), el directorio local de librerías de renv (`renv/library/`, `renv/staging/`), archivos de renderizado y cache de Quarto (`.quarto/`, `*_files/`, `*_cache/`, `*.html`) y basura del sistema operativo (`.DS_Store`).

2. **Reorganización de Entregables (`Tarea_<numero>.qmd`)**:
   - Ajuste de nomenclatura en `contrato_agente.md` para agrupar los entregables por sección del documento `Ejercicios_2026.pdf`:
     - `tareas/Tarea_1.qmd`: Estimación por Máxima Verosimilitud (Sección 1).
     - `tareas/Tarea_3.qmd`: Métodos Básicos para Datos Binarios (Sección 3).
     - `tareas/Tarea_4.qmd`: Bioensayos y Modelo Dosis-Respuesta (Sección 4).
     - `tareas/Tarea_5.qmd`: Modelos Log-Lineales (Sección 5).

3. **Grafo de Contexto y Heartbeat**:
   - Grafo de contexto actualizado en `context_graph.json` reflejando las nuevas tareas unificadas y `.gitignore`.
   - `heartbeat.json` actualizado.

---

## Guía para Cargar al Repositorio de GitHub

De acuerdo con la **Sección 8 del Contrato de Agente**, cualquier comando destructivo o de git requiere confirmación explícita. Los pasos para inicializar y subir este proyecto a tu cuenta de GitHub (`cmayorgat44`) son:

### Comandos de Git a Ejecutar (Requieren Aprobación):
1. Configuración local del usuario de Git:
   ```bash
   git config user.name "cmayorgat44"
   git config user.email "mayorgacg@gmail.com"
   ```
2. Inicialización del repositorio y rama principal:
   ```bash
   git init -b main
   ```
3. Agregar archivos respetando `.gitignore`:
   ```bash
   git add .
   ```
4. Crear commit inicial:
   ```bash
   git commit -m "Initial commit: Proyecto MLG, contrato de agente, renv, tareas Quarto y tracking"
   ```
5. Vincular repositorio remoto en GitHub:
   ```bash
   git remote add origin https://github.com/cmayorgat44/mlg.git
   git push -u origin main
   ```
