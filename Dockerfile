# Use the official TensorFlow image with GPU support
FROM tensorflow/tensorflow:2.17.0-gpu

# Set environment variables for Python and CUDA
ENV PYTHONUNBUFFERED=1
ENV CUDA_VISIBLE_DEVICES=0Va 

# Install other Python packages
RUN apt-get update && \
    apt-get install -y python3-pip graphviz
    
RUN pip install --upgrade pip && \
    pip install numpy matplotlib scikit-learn opencv-python tensorflow-datasets seaborn

RUN pip install pydot graphviz


RUN pip install tensorflow[and-cuda]==2.17.0
RUN pip install keras==3.4.1

RUN pip install keras-cv
ENV KERAS_BACKEND=tensorflow

# Set the working directory in the container
WORKDIR /app

# Run a default command (this can be changed when running the container)
CMD ["nvidia-smi"]