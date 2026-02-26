## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  # Load the default model
#  model <- model_load("Llama-3.2-3B-Instruct-Q5_K_M.gguf")
#  
#  # Or load from a URL (downloaded and cached automatically)
#  model <- model_load(
#    "https://huggingface.co/unsloth/gemma-3-4b-it-qat-GGUF/resolve/main/gemma-3-4b-it-qat-Q5_K_M.gguf"
#  )
#  
#  # With GPU acceleration (offload layers to GPU)
#  model <- model_load(
#    "Llama-3.2-3B-Instruct-Q5_K_M.gguf",
#    n_gpu_layers = 999  # Offload as many layers as possible
#  )

## -----------------------------------------------------------------------------
#  # Create a context with default settings
#  ctx <- context_create(model)
#  
#  # Create a context with custom settings
#  ctx <- context_create(
#    model,
#    n_ctx = 4096,      # Context window size (tokens)
#    n_threads = 8,     # CPU threads for generation
#    n_seq_max = 1      # Maximum parallel sequences
#  )

## -----------------------------------------------------------------------------
#  # Define a conversation as a list of messages
#  messages <- list(
#    list(role = "system", content = "You are a helpful R programming assistant."),
#    list(role = "user", content = "How do I read a CSV file?")
#  )
#  
#  # Apply the model's chat template
#  formatted_prompt <- apply_chat_template(model, messages)
#  cat(formatted_prompt)

## -----------------------------------------------------------------------------
#  messages <- list(
#    list(role = "system", content = "You are a helpful assistant."),
#    list(role = "user", content = "What is R?"),
#    list(role = "assistant", content = "R is a programming language for statistical computing."),
#    list(role = "user", content = "How do I install packages?")
#  )
#  
#  formatted_prompt <- apply_chat_template(model, messages)

## -----------------------------------------------------------------------------
#  # Basic generation
#  output <- generate(ctx, formatted_prompt)
#  cat(output)

## -----------------------------------------------------------------------------
#  output <- generate(
#    ctx,
#    formatted_prompt,
#    max_tokens = 200,        # Maximum tokens to generate
#    temperature = 0.0,       # Creativity (0 = deterministic)
#    top_k = 40,              # Consider top K tokens
#    top_p = 1.0,             # Nucleus sampling threshold
#    repeat_last_n = 0,       # Tokens to consider for repetition penalty
#    penalty_repeat = 1.0,    # Repetition penalty (>1 discourages)
#    seed = 1234              # Random seed for reproducibility
#  )

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  # 1. Load model with GPU acceleration
#  model <- model_load(
#    "Llama-3.2-3B-Instruct-Q5_K_M.gguf",
#    n_gpu_layers = 999
#  )
#  
#  # 2. Create context with appropriate size
#  ctx <- context_create(model, n_ctx = 4096)
#  
#  # 3. Define conversation
#  messages <- list(
#    list(
#      role = "system",
#      content = "You are a helpful R programming assistant who provides concise code examples."
#    ),
#    list(
#      role = "user",
#      content = "How do I create a bar plot in ggplot2?"
#    )
#  )
#  
#  # 4. Format prompt
#  formatted_prompt <- apply_chat_template(model, messages)
#  
#  # 5. Generate response
#  output <- generate(
#    ctx,
#    formatted_prompt,
#    max_tokens = 300,
#    temperature = 0,
#    seed = 42
#  )
#  
#  cat(output)

## -----------------------------------------------------------------------------
#  # Convert text to tokens
#  tokens <- tokenize(model, "Hello, world!")
#  print(tokens)

## -----------------------------------------------------------------------------
#  # Convert tokens back to text
#  text <- detokenize(model, tokens)
#  print(text)

## -----------------------------------------------------------------------------
#  # Good: Load once, use many times
#  model <- model_load("model.gguf")
#  ctx <- context_create(model)
#  
#  for (prompt in prompts) {
#    result <- generate(ctx, prompt)
#  }
#  
#  # Bad: Loading in a loop
#  for (prompt in prompts) {
#    model <- model_load("model.gguf")  # Slow!
#    ctx <- context_create(model)
#    result <- generate(ctx, prompt)
#  }

## -----------------------------------------------------------------------------
#  # For short Q&A
#  ctx <- context_create(model, n_ctx = 512)
#  
#  # For longer conversations
#  ctx <- context_create(model, n_ctx = 4096)
#  
#  # For document analysis
#  ctx <- context_create(model, n_ctx = 8192)

## -----------------------------------------------------------------------------
#  # Check your hardware
#  hw <- hardware_profile()
#  print(hw$gpu$name)
#  
#  # Enable GPU
#  model <- model_load("model.gguf", n_gpu_layers = 999)

