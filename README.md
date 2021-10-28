DailyDialog-topic-recommendations
==============================

This repository contains the solution of a test assignment for an internship at Deep Pavlov. The task is to predict the next noun chunks phrase in the dialog.

Project Organization

```
├── Makefile           <- Makefile with commands like `make black` or `make lint`
├── README.md          <- The top-level README for developers using this project.
│
├── data
│   ├── processed      <- The final, canonical data sets for modeling. For DVC
│   └── raw            <- The original, immutable data dump. For DVC
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   │
│   ├── README.md      <- Description of business value and other business staff 
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements       <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip-compile base.in`
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   │
│   ├── modeling       <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
--------

