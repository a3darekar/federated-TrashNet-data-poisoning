# Notebooks

Here, you can find data exploration and preparation code in jupyter notebooks.

- data preparation and poisoning
	- Fetching_Trashnet_Data.ipynb => Fetch TrashNet Dataset, resize, split (into train and dev sets) and build numpy package
	- Poisoning_approaches_exploraion.ipynb => Contains code snippets where we explored various poisoning methods
	- Steganography.ipynb => Contains code snippet to build poisoned copies of dataset with 5, 10, 15, 20, 25 and 30 percent data poisoned with Steganography method.
	- Occlusion.ipynb => Contains code snippet to build poisoned copies of dataset with 5, 10, 15, 20, 25 and 30 percent data poisoned with Occlusion method.
	- Label Flipping.ipynb => Contains code snippet to build poisoned copies of dataset with 5, 10, 15, 20, 25 and 30 percent data poisoned with Label Flipping method.
- experiment_findings
	- This directory contains csv files containing results of experiments with the various poisoning strategies at several poisoning percentage levels
	- It also contains ipython notebooks that plots the performance graphs from this data.
	- Finally, 'Compairing model outcomes' notebook provides comparative analysis of various model performances.