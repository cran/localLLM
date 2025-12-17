## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  models <- list_ollama_models()
#  print(models)

## -----------------------------------------------------------------------------
#  model <- model_load("ollama:llama3.2")

## -----------------------------------------------------------------------------
#  model <- model_load("ollama:deepseek-r1:8b")

## -----------------------------------------------------------------------------
#  # Use at least 8 characters of the SHA256 hash
#  model <- model_load("ollama:6340dc32")

## -----------------------------------------------------------------------------
#  # Lists all models and prompts for selection
#  model <- model_load("ollama")

## -----------------------------------------------------------------------------
#  # Use Ollama model with quick_llama
#  response <- quick_llama(
#    "Explain quantum computing in simple terms",
#    model_path = "ollama:llama3.2"
#  )
#  cat(response)

## -----------------------------------------------------------------------------
#  # See what's available
#  available <- list_ollama_models()
#  
#  if (nrow(available) > 0) {
#    cat("Found", nrow(available), "Ollama models:\n")
#    print(available[, c("name", "size")])
#  } else {
#    cat("No Ollama models found. Install some with: ollama pull llama3.2\n")
#  }

## -----------------------------------------------------------------------------
#  # Load by exact name
#  model <- model_load("ollama:llama3.2")
#  
#  # Create context and generate
#  ctx <- context_create(model, n_ctx = 4096)
#  
#  messages <- list(
#    list(role = "user", content = "What is machine learning?")
#  )
#  prompt <- apply_chat_template(model, messages)
#  response <- generate(ctx, prompt, max_tokens = 200)
#  cat(response)

## -----------------------------------------------------------------------------
#  # Compare Ollama models
#  models <- list(
#    list(
#      id = "llama3.2",
#      model_path = "ollama:llama3.2",
#      n_gpu_layers = 999
#    ),
#    list(
#      id = "deepseek",
#      model_path = "ollama:deepseek-r1:8b",
#      n_gpu_layers = 999
#    )
#  )
#  
#  # Run comparison
#  results <- explore(
#    models = models,
#    prompts = my_prompts,
#    engine = "parallel"
#  )

## -----------------------------------------------------------------------------
#  model <- model_load("ollama:nonexistent")

## -----------------------------------------------------------------------------
#  models <- list_ollama_models()

## -----------------------------------------------------------------------------
#  model <- model_load("ollama:llama")

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  # 1. Check what's available
#  available <- list_ollama_models()
#  print(available)
#  
#  # 2. Load a model
#  model <- model_load("ollama:llama3.2", n_gpu_layers = 999)
#  
#  # 3. Create context
#  ctx <- context_create(model, n_ctx = 4096)
#  
#  # 4. Generate text
#  messages <- list(
#    list(role = "system", content = "You are a helpful assistant."),
#    list(role = "user", content = "Write a haiku about coding.")
#  )
#  
#  prompt <- apply_chat_template(model, messages)
#  response <- generate(ctx, prompt, max_tokens = 50, temperature = 0.7)
#  
#  cat(response)

