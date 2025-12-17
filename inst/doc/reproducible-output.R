## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  # Run the same query twice
#  response1 <- quick_llama("What is the capital of France?")
#  response2 <- quick_llama("What is the capital of France?")
#  
#  # Results are identical
#  identical(response1, response2)

## -----------------------------------------------------------------------------
#  # Stochastic generation with seed control
#  response1 <- quick_llama(
#    "Write a haiku about data science",
#    temperature = 0.9,
#    seed = 92092
#  )
#  
#  response2 <- quick_llama(
#    "Write a haiku about data science",
#    temperature = 0.9,
#    seed = 92092
#  )
#  
#  # Still reproducible with matching seeds
#  identical(response1, response2)

## -----------------------------------------------------------------------------
#  # Different seeds produce different outputs
#  response3 <- quick_llama(
#    "Write a haiku about data science",
#    temperature = 0.9,
#    seed = 12345
#  )
#  
#  identical(response1, response3)

## -----------------------------------------------------------------------------
#  result <- quick_llama("What is machine learning?")
#  
#  # Access the hashes
#  hashes <- attr(result, "hashes")
#  print(hashes)

## -----------------------------------------------------------------------------
#  res <- explore(
#    models = models,
#    prompts = template_builder,
#    hash = TRUE
#  )
#  
#  # View hashes for each model
#  hash_df <- attr(res, "hashes")
#  print(hash_df)

## -----------------------------------------------------------------------------
#  # Start documentation
#  document_start(path = "analysis-log.txt")
#  
#  # Run your analysis
#  result1 <- quick_llama("Classify this text: 'Great product!'")
#  result2 <- explore(models = models, prompts = prompts)
#  
#  # End documentation
#  document_end()

## -----------------------------------------------------------------------------
#  result <- quick_llama(
#    "Analyze this text",
#    temperature = 0,
#    seed = 42  # Explicit for documentation
#  )

## -----------------------------------------------------------------------------
#  # Check hardware profile
#  hw <- hardware_profile()
#  print(hw)

## -----------------------------------------------------------------------------
#  document_start(path = "my_analysis_log.txt")
#  
#  # All your analysis code here
#  # ...
#  
#  document_end()

## -----------------------------------------------------------------------------
#  result <- quick_llama("Your prompt here", seed = 42)
#  
#  # Report these in your paper/documentation
#  cat("Input hash:", attr(result, "hashes")$input, "\n")
#  cat("Output hash:", attr(result, "hashes")$output, "\n")

## -----------------------------------------------------------------------------
#  # List cached models with metadata
#  cached <- list_cached_models()
#  print(cached[, c("name", "size_bytes", "modified")])

