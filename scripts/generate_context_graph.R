# Script para generar el Grafo de Contexto del Repositorio
# MLG - Modelos Lineales Generalizados

suppressPackageStartupMessages({
  if (requireNamespace("jsonlite", quietly = TRUE)) {
    library(jsonlite)
  }
})

generate_context_graph <- function() {
  nodes <- list(
    list(id = "contrato_agente", type = "contract", path = "contrato_agente.md", label = "Contrato de Agente"),
    list(id = "agents_rules", type = "rules", path = ".agents/AGENTS.md", label = "Reglas de Agente"),
    list(id = "progress_log", type = "log", path = "PROGRESS.md", label = "Bitácora de Progreso"),
    list(id = "heartbeat_log", type = "log", path = "heartbeat.json", label = "Heartbeat Log"),
    list(id = "gitignore", type = "config", path = ".gitignore", label = "Git Ignore"),
    list(id = "ejercicios_pdf", type = "homework_source", path = "contenido_de_clase/requerimientos_tareas/Ejercicios_2026.pdf", label = "Ejercicios 2026 PDF"),
    list(id = "lectures_dir", type = "knowledge_source", path = "contenido_de_clase/lectures", label = "Lecturas de Clase"),
    list(id = "codigos_dir", type = "knowledge_source", path = "contenido_de_clase/codigos", label = "Códigos de Clase"),
    list(id = "data_dir", type = "data_source", path = "contenido_de_clase/data", label = "Datos de Clase"),
    list(id = "apuntes_dir", type = "notes", path = "apuntes", label = "Apuntes del Curso")
  )
  
  tarea_files <- list.files("tareas", pattern = "^Tarea_[0-9]+\\.qmd$", full.names = TRUE)
  for (tf in tarea_files) {
    bname <- basename(tf)
    tid <- paste0("tarea_", gsub("\\.qmd$", "", bname))
    nodes <- append(nodes, list(list(id = tid, type = "tarea_qmd", path = tf, label = bname)))
  }
  
  edges <- list(
    list(source = "contrato_agente", target = "agents_rules", relation = "governs"),
    list(source = "contrato_agente", target = "heartbeat_log", relation = "mandates"),
    list(source = "contrato_agente", target = "progress_log", relation = "mandates"),
    list(source = "ejercicios_pdf", target = "lectures_dir", relation = "resolved_using"),
    list(source = "ejercicios_pdf", target = "codigos_dir", relation = "resolved_using")
  )
  
  for (tf in tarea_files) {
    bname <- basename(tf)
    tid <- paste0("tarea_", gsub("\\.qmd$", "", bname))
    edges <- append(edges, list(
      list(source = tid, target = "ejercicios_pdf", relation = "solves"),
      list(source = tid, target = "lectures_dir", relation = "references"),
      list(source = tid, target = "data_dir", relation = "uses_data")
    ))
  }
  
  graph <- list(
    generated_at = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ"),
    nodes = nodes,
    edges = edges
  )
  
  json_output <- jsonlite::toJSON(graph, auto_unbox = TRUE, pretty = TRUE)
  writeLines(json_output, "context_graph.json")
  cat("Grafo de contexto actualizado con éxito en context_graph.json\n")
}

generate_context_graph()
