
#%%
import subprocess
from tensorflow.python.client import device_lib

def nvidia_gpus():
    try:
        # Run the nvidia-smi command
        nvidia_smi_output = subprocess.check_output(['nvidia-smi']).decode()
        return nvidia_smi_output
    except Exception as e:
        return f"An error occurred: {e}"

# Print the NVIDIA GPU details
print(nvidia_gpus())
# %%


# local devices available to tensorflow
print(device_lib.list_local_devices())