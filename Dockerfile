FROM ghcr.io/ggml-org/llama.cpp:server

RUN mkdir -p /models && \
    curl -L --fail --retry 3 \
    -o /models/Qwen3-0.6B-Q3_K_M.gguf \
    https://huggingface.co/Qwen/Qwen3-0.6B-GGUF/resolve/main/Qwen3-0.6B-Q3_K_M.gguf

COPY qwen3-nothink.jinja /app/qwen3-nothink.jinja

EXPOSE 10000

CMD ["-m","/models/Qwen3-0.6B-Q3_K_M.gguf","--host","0.0.0.0","--port","10000","--jinja","--chat-template-file","/app/qwen3-nothink.jinja","--reasoning","off","-c","128","-n","96","--temp","0.7","--top-p","0.8","--top-k","20","--min-p","0","--repeat-penalty","1.05","--presence-penalty","0.5","-np","1"]
