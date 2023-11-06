## Introduction

I'm primarily a machine learner, but also work in AI and data science. 

I don't know much about IR, but have thought long and hard about performance and calibration of ML classifiers. 

I think some of these ideas extend to IR, but would be very interested to hear your feedback. 

Disclaimer: I am not a statistician!  <!-- .element: class="fragment" -->


### Audience participation!

Q1: Why is $F_1$ the *harmonic* mean of precision and recall?

1. It's a choice, it could equally well have been an arithmetic or geometric mean. <!-- .element: class="fragment" -->
2. It corresponds to averaging the mistakes a classifier makes. <!-- .element: class="fragment" -->
3. Another reason. <!-- .element: class="fragment" -->


### More audience participation!

Q2: When is $F_1$ preferred over accuracy-based measures (micro/macro-accuracy)?

1. When we have many more negatives than positives. <!-- .element: class="fragment" -->
1. When true negatives don't add value. <!-- .element: class="fragment" -->
1. Another reason. <!-- .element: class="fragment" -->


### Last one, I promise :-)

Q3: If we use $F_{1/2}$, then...

1. Precision gets twice the weight of recall. <!-- .element: class="fragment" -->
1. Precision gets four times the weight of recall. <!-- .element: class="fragment" -->
1. Neither. <!-- .element: class="fragment" -->


### $F_{1}$-score

Common definition: $F_1 = \frac{2prec\cdot rec}{prec+rec}$.

As harmonic mean: $\frac{1}{F_1} = \left(\frac{1}{rec} + \frac{1}{prec}\right)/2$. <!-- .element: class="fragment" -->

Peter's preferred definition: $$F_{1} = \frac{TP}{TP + {\color{red}{\frac{FN+FP}{2}}}} = \frac{2TP}{2TP + FN+FP}$$ <!-- .element: class="fragment" -->


### $F_1$-score

$\frac{1}{F_1} = \left(\frac{1}{rec} + \frac{1}{prec}\right)/2$

$F_{1} = \frac{2TP}{2TP + FN+FP}$

Aka accuracy over a *modified* confusion matrix:

$$
\begin{array}{lccc}
\hline
           & \text{Pred}\ + & \text{Pred}\ - &     \\\\ \hline
\text{Actual}\ + & TP            & FN            & Pos \\\\
\text{Actual}\ - & FP            & {\color{red}{TP}}            & Neg{\color{red}{-TN+TP}} \\\\
           & \ldots          & \ldots          & \ldots  \\\\ \hline
\end{array}
$$


### $F_{\beta}$-score

$1/F_{\beta} = \frac{\beta^2}{\beta^2+1} 1/rec + \frac{1}{\beta^2+1} 1/prec$

$F_{\beta} = \frac{(\beta^2+1) TP}{(\beta^2+1) TP + \beta^2 FN + FP}$

Aka accuracy over a *modified* confusion matrix:

$$
\begin{array}{lccc}
\hline
           & \text{Pred}\ + & \text{Pred}\ - &     \\\\ \hline
\text{Actual}\ + & {\color{red}{\beta^2}} TP            & {\color{red}{\beta^2}} FN            & {\color{red}{\beta^2}} Pos \\\\
\text{Actual}\ - & FP            & {\color{red}{TP}}            & Neg{\color{red}{-TN+TP}} \\\\
           & \ldots          & \ldots          & \ldots  \\\\ \hline
\end{array}
$$


### Refresher: Scales and Means

Most means $M(x,y)$ are *quasi-arithmetic*:
there exists a **change of scale** $g: \mathbb{R} \rightarrow \mathbb{R}$ such that
$M(x,y) = g^{-1}(AM(g(x),g(y)))$.

Mean | $M(x,y)$ | $g(x)$
---|---|---
Arithmetic | $(x+y)/2$ | $x$
Harmonic | $2/(1/x+1/y)$ | $1/x$
Geometric | $\sqrt{xy}$ | $\ln x$
Quadratic | $\sqrt{(x^2+y^2)/2}$ | $x^2$
Generalised | $\sqrt[p]{(x^p+y^p)/2}$ | $x^p$


### Comparing means

![Isometrics plot](img/means.png)  <!-- .element height="60%" width="60%" -->

Towards `max` (`min`) the mean emphasises large (small) values.


### Outline of the talk

1. [Precision-recall curves considered harmful](#/2)
2. [Work *in progress* on PRG curves](#/3)
3. [More sophisticated measurement models](#/3)

----

## ROC plots 101

![Empirical ROC curve](img/PRG2-fig-ExROC.png) <!-- .element height="40%" width="40%" -->
![Parametric ROC curve](img/PRG2-fig-ROC1.png) <!-- .element height="40%" width="40%" -->

Shows how true and false positive rate co-vary with decision threshold.


### Why ROC plots are great

- **universal baselines** - ascending diagonal gives expected performance of baseline (random) model.
- **linear interpolation** - points on connecting line segments achieve same performance under specific class trade-offs.
- **Pareto front** - linear interpolation gives ROC convex hull (ROCCH).
- **area under curve** - meaningful measure of ranking performance *and* expected accuracy. 
- **calibration** - ROCCH segments can be converted into meaningful probabilities. 


### Linear interpolation

Any point on a straight line between thresholds (or classifiers) A and B can be achieved by making a suitably biased random choice between them. 

If that line has slope $Neg/Pos$ (or 1) then all points on the line achieve the same micro-accuracy (or macro-accuracy).

This can be generalised to other trade-offs between classes (e.g., misclassification costs). 


### Area under ROC curve (AUROC)

This estimates the probability that a randomly selected positive is *ranked* before a randomly selected negative. 

It is also linearly related to expected *classification performance* if thresholds are set to make a particular proportion of positive predictions (pred pos *rate*).

$$\int_0^1 acc\ d\ rate = \pi(1-\pi)(2AUROC-1)+1/2$$

[Hernandez-Orallo, Flach, Ferri. JMLR 13(91), 2012.](https://www.jmlr.org/papers/v13/hernandez-orallo12a.html)


### Calibration

Slopes of ROCCH segments are empirical likelihood ratios associated with score intervals, and can be used to obtain calibrated probabilities (isotonic regression). 

If a perfectly calibrated classifier assigns score ${\color{red}c}$ to an instance, then the instance is on the decision boundary for 
$acc_{\color{red}c} = 2{\color{red}c}\pi tpr + 2{\color{red}c}(1-\pi) fpr$. 

[Song et al. Classifier Calibration: How to assess and improve predicted class probabilities: a survey. arXiv](https://arxiv.org/abs/2112.10327)


### From ROC plots to PR plots

![ROC curve](img/fig1-left.png) <!-- .element height="40%" width="40%" -->
![PR curve](img/fig1-right.png) <!-- .element height="40%" width="40%" -->

There is a point-to-point correspondence between ROC space and PR space. 


### Why PR plots aren't great

- **non-universal baselines** - random performance gives horizontal line which depends on class distribution.
- **non-linear interpolation** - iso-$F_{\beta}$ lines are hyperbolic.
- **Pareto front** is well-defined but non-convex.
- **uninterpretable area** - because of incoherence of taking arithmetic mean of precision values *and* unachievable region. 
- **no calibration**. 


### From PR plots to PR**Gain** plots

![PR curve](img/fig2-left.png) <!-- .element height="40%" width="40%" -->
![PRG curve](img/fig2-right.png) <!-- .element height="40%" width="40%" -->

[Flach and Kull. Precision-recall-gain curves: PR analysis done right. NIPS 2015.](http://people.cs.bris.ac.uk/~flach/PRGcurves)


### Why PRG plots are great

- **baseline** - descending diagonal gives expected performance of *always-positive* classifier <br>
($rec=1, prec=\pi, F_1=\frac{2\pi}{\pi+1}$).
- **linear interpolation** is restored. 
- **Pareto front** is once again convex.
- **interpretable area** - AUPRG is related to expected $F_1$ when operating points are chosen in a particular way. 
- **calibration** - scores can be converted into values of $\beta$ such that the instance is on the $F_{\beta}$ decision boundary. 


### How did we do it?

1. Take reciprocals:
$prec = TP/(TP+FP) \rightarrow 1/prec = 1+FP/TP$
$rec  = TP/(TP+FN) \rightarrow 1/rec  = 1+FN/TP$
2. Clip $[1,\infty]$ to $[1,1/\pi]$ to exlude overly small values of precision/recall. <!-- .element: class="fragment" -->
3. Map $[1,1/\pi]$ back to unit interval:
$$
\begin{align}
precG &= \frac{prec-\pi}{(1-\pi)prec} = 1 - \frac{\pi}{1-\pi} FP/TP \\\\
recG  &= \frac{rec-\pi}{(1-\pi)rec} = 1 - \frac{\pi}{1-\pi} FN/TP \\\\
\end{align}
$$  <!-- .element: class="fragment" -->


### PRG can rank models differently from PR

![from ROC via PR to PRG](img/PRG.png)

Solid line has higher AUROC and AUPRG but lower AUPR than dashed line.


### Calibrated scores from PRG curves

![ROC curve](img/fig3-left.png) <!-- .element height="40%" width="40%" -->
![PR curve](img/fig3-right.png) <!-- .element height="40%" width="40%" -->

Left: scores calibrated for $acc_{c}$. 

Right: scores calibrated for $F_{\beta}$.

----

## Work *in progress* on PRG curves

$AUPRG = \frac{\pi}{1-\pi}\int \frac{tpr-fpr}{tpr^3}\ d\ tpr$

![instance weights](img/PRG2-fig-AUPRG2.png) <!-- .element height="50%" width="50%" -->


### Weighted ROC curves

![ROC curve](img/PRG2-fig-scratchExwPRG-left.png) <!-- .element height="40%" width="40%" -->
![PR curve](img/PRG2-fig-scratchExwPRG-right.png) <!-- .element height="40%" width="40%" -->

*Instance weights* allow us to translate PRG curves back to weighted ROC curves with the same area. 


### Instance weights

Let $r$ and $s$ be the true positive rates that obtain when thresholding just before or just after a positive example, then its weight is $\frac{\pi}{1-\pi}\frac{1}{rs}$. 

Horizontal movement in ROC space corresponds to changes in precision which is influenced by both positives and negatives, but can nevertheless be precisely characterised in a similar way. 


### Non-destructive truncation

In the NIPS'15 paper we truncated the PR curve so that $\pi\leq rec\leq 1$. 

Before truncating we can pad the ranking at the front with $\frac{\pi}{1-\pi}Pos$ pseudo-instances, all labelled positive. 

This gives rise to adjusted measures, e.g. 
$rec'=\frac{(1-\pi)TP+\pi Pos}{Pos}$ and
$recG'=\frac{TP}{(1-\pi)TP+\pi Pos}$.

----

## More sophisticated measurement models

- What you see is not what you want: estimating task difficulty and model ability
- Understanding *why* performance differences occur


### Latent variable models

- Psychologists have long understood that people's abilities (and the difficulty of a task) are *not directly observable* and need to be estimated.
  - Item-response theory, factor analysis
- We can adapt those models to machine learning, to estimate **ability** of classifiers as well as **difficulty** of instances and datasets.


### Beta-IRT

![Beta-IRT](img/BIRT.png)  <!-- .element height="40%" width="40%" -->
![ICC](img/beta_ICC_discr_a2.png)  <!-- .element height="44%" width="44%" -->

$E[p_{ij}|\delta_j,a_j] = \frac{1}{1+\left(\frac{\delta_i}{\theta_j}\cdot\frac{1-\theta_j}{1-\delta_i} \right)^{a_j}}$


### Adaptive testing

Use a trained IRT model to evaluate a new classifier on a small number of datasets.

1. Start with initial guess of classifier ability.
2. Choose next dataset using an *item selection criterion*.
3. Evaluate classifier and update ability estimation.
4. Repeat until stopping criterion is achieved.


### CAT results

![CAT](img/CAT.png)  <!-- .element height="80%" width="80%" -->


### More here

- [Chen, Silva Filho, Prudencio, Diethe, Flach. $\beta^3$-IRT: A New Item Response Model and its Applications. AISTATS 2019.](http://proceedings.mlr.press/v89/chen19b.html)
- [Song and Flach. Efficient and Robust Model Benchmarks with Item Response Theory and Adaptive Testing. IJ Interactive Multimedia & AI 6(5), 2021.](https://www.turing.ac.uk/sites/default/files/2021-07/efficient_and_robust_paper.pdf)


### Measurement and causality

Ultimately, empirical ML needs to make *causal* statements:

> Algorithm A outperformed algorithm B **because** the classes were highly imbalanced.

- I.e., if the classes were re-balanced (counterfactual intervention) the difference in performance would disappear.    <!-- .element: class="fragment" -->
  - In empirical ML we usually can carry out interventions
  (aka ablation study).   <!-- .element: class="fragment" -->

----

## To conclude

Perhaps surprisingly, a definitive account of key measurement concepts such as scales, units, and dimensions is still missing. 

*Stevens' typology* (nominal, ordinal, interval, ratio) is well-known but limited: e.g., it doesn't cover scales bounded from both sides (probabilities!). 

In physics, quantities are understood to have an associated *dimension*, but these can cancel (angles, percentages) and don't allow for transcendental functions (logs). 


### To conclude (2)

These issues notwithstanding, performance evaluation in ML and IR is often formulaic and simplistic. 

Including every performance indicator you can think of may make the **big table** look impressive, but doesn't necessarily exude confidence that you know what you're doing. 

Indicators such as accuracy (for classification), AUC (for ranking), Brier score (for probability estimation) should really be thought of as different 'dimensions' as in physics. What is your use case?


### To conclude (3)

Proper treatment of performance evaluation in machine learning (and AI more generally) requires a sophisticated model with the following components:
- *Measurement scales* for the observable performance indicators;
- *Latent-variable models* for the unobservable performance indicators of interest;
- *Causal models* to allow for counterfactual reasoning.


### Acknowledgements

Part of this work was funded through a [project with the Alan Turing Institute](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai).

Many thanks to Jose Hernandez-Orallo, Kacper Sokol, Meelis Kull, Tom Diethe, Yu Chen, Ricardo Prudencio, Telmo Filho, Miquel Perello-Nieto, Hao Song, Su Whan Baek, and many others.  <!-- .element: class="fragment" -->
