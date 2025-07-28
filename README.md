# Titanic Survival Prediction using Machine Learning (R)

This project explores machine learning models to predict survival on the Titanic dataset using R. The analysis includes logistic regression, decision tree, and random forest models. Data preprocessing, missing value analysis, and performance evaluation are also covered in detail.

## 📁 Dataset

- Source: Included in the `DALEX` R package
- Target Variable: `survived` (yes/no)
- Features: 8 demographic and passenger-related variables
- Missing data handled via row-wise deletion (`complete.cases()`)

## 🧠 Models Implemented

- **Logistic Regression**
- **Decision Tree** (with `tidymodels` & `rpart`)
- **Random Forest** (with `randomForest` package)

Each model is evaluated using:
- Accuracy
- Sensitivity (Recall)
- Specificity
- Confusion Matrix

## 📊 Exploratory Data Analysis

- Missing value visualization with `naniar`
- Structural exploration (`str()`, `summary()`)
- Class distribution

## 🧹 Preprocessing Steps

- Removal of irrelevant columns
- Median imputation (optional path)
- Scaling (optional path using `range` method)
- Splitting data into training and test sets (80/20)

## 🔍 Model Evaluation

Each model was assessed using the `yardstick` package:

- Logistic Regression:
  - Simple probabilistic classification
  - Threshold-based decision (0.5 cutoff)
  
- Decision Tree:
  - Built with `tidymodels::decision_tree()`
  - Visualized using `rpart.plot()`
  
- Random Forest:
  - Trained with 500 trees using `randomForest` package
  - Variable importance plotted with `varImpPlot()`

## 📦 Packages Used

```r
library(DALEX)
library(caret)
library(ROCR)
library(naniar)
library(rpart.plot)
library(tidymodels)
library(yardstick)
library(randomForest)
```

# R ile Titanic Hayatta Kalma Tahmini (Makine Öğrenmesi)

Bu proje, Titanic veri seti kullanılarak yolcuların hayatta kalıp kalmayacağını tahmin etmek amacıyla R diliyle makine öğrenmesi modelleri geliştirmektedir. Analiz kapsamında lojistik regresyon, karar ağacı ve rastgele orman modelleri uygulanmıştır. Veri ön işleme, eksik veri analizi ve performans değerlendirmeleri de ayrıntılı olarak ele alınmıştır.

## 📁 Veri Seti

- Kaynak: `DALEX` R paketi içinde yer almaktadır  
- Hedef Değişken: `survived` (yes/no)  
- Özellikler: 8 demografik ve yolcu bilgisi içeren değişken  
- Eksik veriler satır bazlı silinmiştir (`complete.cases()`)

## 🧠 Uygulanan Modeller

- Lojistik Regresyon  
- Karar Ağacı (`tidymodels`, `rpart`)  
- Rastgele Orman (`randomForest` paketi)

Her model şu metrikler ile değerlendirilmiştir:
- Doğruluk (Accuracy)  
- Duyarlılık (Sensitivity / Recall)  
- Özgüllük (Specificity)  
- Karmaşıklık Matrisi (Confusion Matrix)

## 📊 Keşifsel Veri Analizi

- Eksik veri görselleştirme (`naniar`)  
- Veri yapısının incelenmesi (`str()`, `summary()`)  
- Sınıf dağılımı analizi

## 🧹 Ön İşleme Adımları

- Gereksiz sütunların silinmesi  
- Ortanca ile doldurma (isteğe bağlı)  
- Özellik ölçekleme (isteğe bağlı)  
- Veriyi eğitim ve test olarak ayırma (80/20)

## 🔍 Model Değerlendirme

Modeller `yardstick` paketi ile değerlendirilmiştir:

- **Lojistik Regresyon**: basit olasılıksal model  
- **Karar Ağacı**: yorumlanabilir model, `rpart.plot` ile görselleştirilmiştir  
- **Rastgele Orman**: topluluk modeli, değişken önem grafiğiyle birlikte

## 📦 Kullanılan Paketler

```r
library(DALEX)
library(caret)
library(ROCR)
library(naniar)
library(rpart.plot)
library(tidymodels)
library(yardstick)
library(randomForest)
