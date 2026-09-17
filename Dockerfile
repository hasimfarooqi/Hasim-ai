FROM ghcr.io/ggml-org/llama.cpp:server

WORKDIR /app

# Render can provide the model through the image or an attached/persistent volume.
# For the first test, download the model during image build.
ADD https://huggingface.co/ggml-org/Qwen3-0.6B-GGUF/resolve/main/Qwen3-0.6B-Q4_0.gguf?download=true /models/Qwen3-0.6B-Q4_0.gguf

EXPOSE 8080

CMD ["-m", "/models/Qwen3-0.6B-Q4_0.gguf", "--host", "0.0.0.0", "--port", "8080", "-c", "512", "-n", "128"]
