FROM ghcr.io/ggml-org/llama.cpp:server

RUN mkdir -p /models && \
    curl -L --fail --retry 3 \
    -o /models/Qwen3-0.6B-Q2_K.gguf \
    https://huggingface.co/tensorblock/Qwen_Qwen3-0.6B-GGUF/resolve/main/Qwen3-0.6B-Q2_K.gguf

COPY qwen3-nothink.jinja /app/qwen3-nothink.jinja

EXPOSE 10000

CMD ["-m","/models/Qwen3-0.6B-Q2_K.gguf","--host","0.0.0.0","--port","10000","--jinja","--chat-template-file","/app/qwen3-nothink.jinja","--reasoning","off","--reasoning-budget","0","-c","256","-n","128","--temp","0.7","--top-p","0.8","--top-k","20","--min-p","0"]
