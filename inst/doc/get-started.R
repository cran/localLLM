## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  # Install from CRAN
#  install.packages("localLLM")

## -----------------------------------------------------------------------------
#  library(localLLM)
#  install_localLLM()
#  
#  # Force CPU build even when a GPU is detected
#  install_localLLM(force_cpu = TRUE)
#  
#  # Reinstall after adding a GPU driver (re-runs detection)
#  install_localLLM(force_reinstall = TRUE)

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  response <- quick_llama("What is the capital of France?")
#  cat(response)

## -----------------------------------------------------------------------------
#  response <- quick_llama(
#    'Classify the sentiment of the following tweet into one of two
#     categories: Positive or Negative.
#  
#     Tweet: "This paper is amazing! I really like it."'
#  )
#  
#  cat(response)

## -----------------------------------------------------------------------------
#  # Process multiple prompts at once
#  prompts <- c(
#  
#    "What is 2 + 2?",
#    "Name one planet in our solar system.",
#    "What color is the sky?"
#  )
#  
#  responses <- quick_llama(prompts)
#  print(responses)

## -----------------------------------------------------------------------------
#  # From Hugging Face URL
#  response <- quick_llama(
#    "Explain quantum physics simply",
#    model_path = "https://huggingface.co/unsloth/gemma-3-4b-it-qat-GGUF/resolve/main/gemma-3-4b-it-qat-Q5_K_M.gguf"
#  )
#  
#  # From local file
#  response <- quick_llama(
#    "Explain quantum physics simply",
#    model_path = "/path/to/your/model.gguf"
#  )
#  
#  # From cache (name fragment)
#  response <- quick_llama(
#    "Explain quantum physics simply",
#    model_path = "Llama-3.2"
#  )

## -----------------------------------------------------------------------------
#  # List all cached models
#  cached <- list_cached_models()
#  print(cached)

## -----------------------------------------------------------------------------
#  # Delete a cached model by name
#  file.remove(cached$path[cached$name == "Llama-3.2-3B-Instruct-Q5_K_M.gguf"])

## -----------------------------------------------------------------------------
#  response <- quick_llama(
#    prompt = "Write a haiku about programming",
#    temperature = 0.8,      # Higher = more creative (default: 0)
#    max_tokens = 100,       # Maximum response length
#    seed = 42,              # For reproducibility
#    n_gpu_layers = 999      # Use GPU if available
#  )

