## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  library(localLLM)
#  install_localLLM()

## -----------------------------------------------------------------------------
#  # Force reinstall
#  install_localLLM(force = TRUE)
#  
#  # Verify installation
#  lib_is_installed()

## -----------------------------------------------------------------------------
#  cache_root <- tools::R_user_dir("localLLM", which = "cache")
#  models_dir <- file.path(cache_root, "models")
#  unlink(models_dir, recursive = TRUE, force = TRUE)

## -----------------------------------------------------------------------------
#  # Download with browser or wget, then:
#  model <- model_load("/path/to/downloaded/model.gguf")

## -----------------------------------------------------------------------------
#  cached <- list_cached_models()
#  print(cached)

## -----------------------------------------------------------------------------
#  # Get token from https://huggingface.co/settings/tokens
#  set_hf_token("hf_your_token_here")
#  
#  # Now download should work
#  model <- model_load("https://huggingface.co/private/model.gguf")

## -----------------------------------------------------------------------------
#  hw <- hardware_profile()
#  cat("Available RAM:", hw$ram_gb, "GB\n")

## -----------------------------------------------------------------------------
#  ctx <- context_create(model, n_ctx = 512)  # Smaller context

## -----------------------------------------------------------------------------
#  # Instead of n_ctx = 32768, try:
#  ctx <- context_create(model, n_ctx = 4096)

## -----------------------------------------------------------------------------
#  hw <- hardware_profile()
#  print(hw$gpu)

## -----------------------------------------------------------------------------
#  # Offload fewer layers to GPU
#  model <- model_load("model.gguf", n_gpu_layers = 20)

## -----------------------------------------------------------------------------
#  messages <- list(
#    list(role = "user", content = "Your question")
#  )
#  prompt <- apply_chat_template(model, messages)
#  result <- generate(ctx, prompt)

## -----------------------------------------------------------------------------
#  result <- generate(ctx, prompt, clean = TRUE)
#  # or
#  result <- quick_llama("prompt", clean = TRUE)

## -----------------------------------------------------------------------------
#  result <- quick_llama("prompt", max_tokens = 500)

## -----------------------------------------------------------------------------
#  result <- quick_llama("prompt", seed = 42)

## -----------------------------------------------------------------------------
#  model <- model_load("model.gguf", n_gpu_layers = 999)

## -----------------------------------------------------------------------------
#  ctx <- context_create(model, n_ctx = 512)

## -----------------------------------------------------------------------------
#  results <- quick_llama(c("prompt1", "prompt2", "prompt3"))

## -----------------------------------------------------------------------------
#  ctx <- context_create(
#    model,
#    n_ctx = 2048,
#    n_seq_max = 10  # Allow 10 parallel sequences
#  )

## -----------------------------------------------------------------------------
#  # List available Ollama models
#  list_ollama_models()
#  
#  # Load via Ollama reference
#  model <- model_load("ollama:model-name")

## -----------------------------------------------------------------------------
#  # Check installation status
#  lib_is_installed()
#  
#  # Check hardware
#  hardware_profile()
#  
#  # List cached models
#  list_cached_models()
#  
#  # List Ollama models
#  list_ollama_models()
#  
#  # Clear model cache
#  cache_dir <- file.path(tools::R_user_dir("localLLM", "cache"), "models")
#  unlink(cache_dir, recursive = TRUE)
#  
#  # Force reinstall backend
#  install_localLLM(force = TRUE)

