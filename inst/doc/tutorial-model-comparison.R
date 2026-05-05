## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  # Load sample dataset
#  data("ag_news_sample", package = "localLLM")
#  
#  # Define models to compare
#  models <- list(
#    list(
#      id = "gemma4b",
#      model_path = "https://huggingface.co/unsloth/gemma-3-4b-it-qat-GGUF/resolve/main/gemma-3-4b-it-qat-Q5_K_M.gguf",
#      n_gpu_layers = 999,
#      n_seq_max = 8L,
#      generation = list(max_tokens = 15, seed = 92092)
#    ),
#    list(
#      id = "llama3b",
#      model_path = "Llama-3.2-3B-Instruct-Q5_K_M.gguf",
#      n_gpu_layers = 999,
#      n_seq_max = 8L,
#      generation = list(max_tokens = 15, seed = 92092)
#    )
#  )

## -----------------------------------------------------------------------------
#  template_builder <- list(
#    sample_id = seq_len(nrow(ag_news_sample)), # identifiers, not used in the prompt
#    "Annotation Task" = "Classify the target text into exactly one of following categories: World|Sports|Business|Sci/Tech.",
#    "Examples" = list(
#      list(
#        text = "Australia's Fairfax Eyes Role In Media Shake-Up",
#        label = "Business"
#      )
#    ),
#    "Target Text" = sprintf("%s\n%s", ag_news_sample$title, ag_news_sample$description),
#    "Output Format" = '"World|Sports|Business|Sci/Tech"',
#    "Reminder" = "Your entire response should only be one word and nothing else."
#  )

## -----------------------------------------------------------------------------
#  # Run batch annotation across all models
#  annotations <- explore(
#    models = models,
#    prompts = template_builder,
#    batch_size = 25,
#    engine = "parallel",
#    clean = TRUE
#  )

## -----------------------------------------------------------------------------
#  # Long format: one row per model-sample pair
#  head(annotations$annotations)

## -----------------------------------------------------------------------------
#  # Wide format: one row per sample, models as columns
#  head(annotations$matrix)

## -----------------------------------------------------------------------------
#  report <- validate(annotations, gold = ag_news_sample$class)

## -----------------------------------------------------------------------------
#  # Confusion matrix: gemma4b vs gold labels
#  print(report$confusion$vs_gold$gemma4b)

## -----------------------------------------------------------------------------
#  # Pairwise confusion: gemma4b vs llama3b
#  print(report$confusion$pairwise$`gemma4b vs llama3b`)

## -----------------------------------------------------------------------------
#  # Cohen's Kappa (pairwise agreement)
#  # Returns a data frame with columns: model_a, model_b, kappa, observed, expected
#  print(report$reliability$cohen)

## -----------------------------------------------------------------------------
#  # Krippendorff's Alpha (overall agreement)
#  # Returns a list with: alpha, per_item, category_proportions
#  print(report$reliability$krippendorff$alpha)

## -----------------------------------------------------------------------------
#  # Pre-formatted prompts
#  my_prompts <- sprintf(
#    "Classify into World/Sports/Business/Sci/Tech: %s",
#    ag_news_sample$title
#  )
#  
#  result <- explore(
#    models = models,
#    prompts = my_prompts,
#    batch_size = 20,
#    engine = "parallel",
#    clean = TRUE
#  )

## -----------------------------------------------------------------------------
#  custom_prompts <- function(spec) {
#    data.frame(
#      sample_id = seq_len(nrow(ag_news_sample)),
#      prompt = sprintf(
#        "[%s] Classify into World/Sports/Business/Sci/Tech.\nTitle: %s\nDescription: %s\nAnswer:",
#        spec$id,
#        ag_news_sample$title,
#        ag_news_sample$description
#      ),
#      stringsAsFactors = FALSE
#    )
#  }
#  
#  result <- explore(
#    models = models,
#    prompts = custom_prompts,
#    batch_size = 12,
#    engine = "parallel",
#    clean = TRUE
#  )

## -----------------------------------------------------------------------------
#  models <- list(
#    list(
#      id = "gemma4b",
#      model_path = "gemma-model.gguf",
#      prompts = template_builder_for_gemma  # Model-specific
#    ),
#    list(
#      id = "llama3b",
#      model_path = "llama-model.gguf",
#      prompts = template_builder_for_llama  # Different template
#    )
#  )

## -----------------------------------------------------------------------------
#  # Compute confusion matrices directly
#  matrices <- compute_confusion_matrices(
#    annotations = annotations$annotations,
#    gold = ag_news_sample$class
#  )
#  
#  # Access individual matrices
#  print(matrices$vs_gold$gemma4b)
#  print(matrices$pairwise$`gemma4b vs llama3b`)

## -----------------------------------------------------------------------------
#  # Compute reliability metrics
#  reliability <- intercoder_reliability(annotations$annotations)
#  
#  print(reliability$cohen)       # Cohen's Kappa (data frame with model pairs)
#  print(reliability$krippendorff) # Krippendorff's Alpha

## -----------------------------------------------------------------------------
#  library(localLLM)
#  
#  # 1. Load data
#  data("ag_news_sample", package = "localLLM")
#  
#  # 2. Set up Hugging Face token if needed
#  set_hf_token("hf_your_token_here")
#  
#  # 3. Define models
#  models <- list(
#    list(
#      id = "gemma4b",
#      model_path = "https://huggingface.co/unsloth/gemma-3-4b-it-qat-GGUF/resolve/main/gemma-3-4b-it-qat-Q5_K_M.gguf",
#      n_gpu_layers = 999,
#      n_seq_max = 8L,
#      generation = list(max_tokens = 15, seed = 92092)
#    ),
#    list(
#      id = "llama3b",
#      model_path = "Llama-3.2-3B-Instruct-Q5_K_M.gguf",
#      n_gpu_layers = 999,
#      n_seq_max = 8L,
#      generation = list(max_tokens = 15, seed = 92092)
#    )
#  )
#  
#  # 4. Create prompts
#  template_builder <- list(
#    sample_id = seq_len(nrow(ag_news_sample)),
#    "Annotation Task" = "Classify into: World|Sports|Business|Sci/Tech",
#    "Target Text" = ag_news_sample$title,
#    "Output Format" = "One word only"
#  )
#  
#  # 5. Run comparison
#  annotations <- explore(
#    models = models,
#    prompts = template_builder,
#    batch_size = 25,
#    engine = "parallel",
#    clean = TRUE
#  )
#  
#  # 6. Validate
#  report <- validate(annotations, gold = ag_news_sample$class)
#  
#  # 7. Review results
#  print(report$confusion$vs_gold$gemma4b)
#  print(report$reliability$krippendorff$alpha)

