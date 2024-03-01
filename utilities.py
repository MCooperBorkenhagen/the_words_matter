import numpy as np

def L2(A, B):
    assert A.shape == B.shape, "Arrays A, B must have the same shape."
    diff = A - B
    distances = np.sqrt(np.sum(diff**2, axis=1))
    return distances


def remove_cols(arr):
    """
    Eliminates any column in the array where all elements are zero.

    Parameters:
    - arr: numpy array of any shape with 2 dimensions

    Returns:
    - numpy array with columns where all elements are zero removed
    """
    # Check for columns where all elements are zero
    non_zero_columns = ~np.all(arr == 0, axis=0)
    
    return arr[:, non_zero_columns]


