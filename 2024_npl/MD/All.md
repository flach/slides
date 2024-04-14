## AI is on an exponential trajectory...

- 1997 - IBM's Deep Blue defeats Kasparov at chess <!-- .element: class="fragment" -->
- 2011 - IBM's Watson beats Jeopardy champions <!-- .element: class="fragment" -->
- 2016 - DeepMind's AlphaGo beats Lee Sedol at Go <!-- .element: class="fragment" -->
- 2020 - DeepMind's AlphaFold accurately predicts protein structures <!-- .element: class="fragment" -->
- 2022 - Open AI's ChatGPT generates human-like text and executable code from prompts <!-- .element: class="fragment" -->


### ...or is it? 

- If we re-ran these contests, what *distribution of wins and losses* would we expect? 
- What does *accurately predicts protein structures* mean? 
- How do we measure *human-likeness of text*? 
- Does the AI system convey a *degree of confidence* with its outputs? 
- Can it *explain its reasoning*, and take corrections or feedback into account? 


### Performance evaluation in AI

- Starts with informally described goals: accuracy, fairness, interpretability. 
- Translated into precise objectives, e.g. in terms of confusion matrix. 
- Requires some kind of measurement protocol, e.g. cross-validation. 
- Still a long way away from what we really want: assessment of unobservables, causal explanations. 


### Performance evaluation in AI (2)

Perhaps surprisingly, a definitive account of key measurement concepts such as scales, units, and dimensions is still missing. 

*Stevens' typology* (nominal, ordinal, interval, ratio) is well-known but limited: e.g., it doesn't cover scales bounded from both sides (probabilities!). 

In physics, quantities are understood to have an associated *dimension*, but these can cancel (angles, percentages) and don't allow for transcendental functions (logs). 


### Performance evaluation in AI (3)

These issues notwithstanding, performance evaluation in AI (particularly machine learing) is often formulaic and simplistic. 

Including every performance indicator you can think of may make the **big table** look impressive, but doesn't necessarily exude confidence that you know what you're doing. 

Indicators such as accuracy (for classification), AUC (for ranking), Brier score (for probability estimation) should really be thought of as different 'dimensions' as in physics. What is your use case?


### How physicists do measurement

- Physical quantities have an associated **dimension** [(Fourier, 1822)](https://books.google.co.uk/books?id=No8IAAAAMAAJ&pg=PA128#v=onepage&q&f=false).
- In order to be compared and added or subtracted, quantities need to be *commensurable* (have the same dimension).
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions.
  - E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Buckingham's $\Pi$-theorem

> A physically meaningful equation involving $n$ dimensioned variables can be rewritten in terms of $p=n-k$ dimensionless parameters $\pi_1, \pi_2, \ldots, \pi_p$ where $k$ is the number of physical dimensions involved. 

- Laws of physics don't depend on specific units
- Can often be used to derive the physics equation from the dimensions
- [Pendulum example (Wikipedia)](https://en.wikipedia.org/wiki/Buckingham_%cf%80_theorem#The_simple_pendulum)


### Dimensional coherence

> Construct a square whose circumference equals its area. 

Most people would solve $4x = x^2 \rightarrow x=4$. <!-- .element: class="fragment" -->

However, $4$ is now a dimensioned quantity -- four of what? <!-- .element: class="fragment" -->

A dimensionally correct analysis would introduce a unit of length $u$: <!-- .element: class="fragment" -->

$$4(x/u)=(x/u)^2 \rightarrow x=4u$$<!-- .element: class="fragment" -->


### Dimensionless quantities

Standard treatment is that dimensions can cancel. 
- E.g., angle is a ratio of lengths, hence dimensionless; but it has units (radians, degrees).
	- Sometimes units also cancel, e.g. ABV has unit ml ethanol per 100 ml liquid (percentage).<!-- .element: class="fragment" -->
- Trigonometric functions are ratios of lengths as well, but $\cos \theta > \theta$ doesn't seem to make much sense. <!-- .element: class="fragment" -->
	- Perhaps there are different kinds of length?<!-- .element: class="fragment" -->


### Transcendental functions

Transcendental functions ($\exp$, $\log$, $\sin$ etc.) require dimensionless and *unitless* quantities.

- E.g., pH $= -\log [H^+]$ where $[H^+]$ has dimension $mol \cdot L^{-1}$ should be thought of as $-\log ([H_+]/h)$ where $h$ is the unit of molar concentration.

$\log(10 kg) = \log(10) + \log(kg)$ doesn't make sense.

----

## ML measurement in practice

Measurements are relevant in machine learning and AI for at least two reasons:
- *Features* often are measurements on some scale, which dictates admissible statistics and operations.
  - E.g., taking the expectation assumes a linear scale.
- *Performance metrics* are also measurements, and hence the same applies. 

<!--[This project](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai) looked at foundational issues, of which there are many! -->


### ROC plots 101

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


## How to build on this in machine learning and AI?

- Both perspectives (levels of measurement and dimensional analysis) have interesting features but appear overly focused on establishing a 'true' scale type or dimension for a measurement.
  - Machine learning needs something more *flexible*.
  - In particular, a better treatment of "dimensionless" quantities which are everywhere you look!
    - relative frequencies, probabilities, evaluation metrics...


### The computer science perspective

- *Abstract data types* can be adapted to the situation.
  - provide relevant *meta-data* about measurements
  - link to useful *operations*.
- In particular, **higher-order functional languages** such as Haskell allow reasoning with and about types.
  - This provides a formal language and logic for measurement meta-data.
- The challenge is to develop a generally agreed ["Systeme international"](https://en.wikipedia.org/wiki/International_System_of_Units) of ML measurements.


### Example: Shannon entropy

[![xpecBits Haskell code](img/xpecBits.png)  <!-- .element height="80%" width="80%" -->](https://replit.com/@flach/ThoughtfulWarlikeRuntimelibrary)


### Example: Scoring rules

[![Scoring rules](img/genEntropy.png)  <!-- .element height="70%" width="70%" -->](https://replit.com/@flach/KeyBewitchedRoute)


### You can't always measure what you want...

- Psychologists have long understood that people's abilities (and the difficulty of a task) are *not directly observable* and need to be estimated.
  - **Item-response theory**, factor analysis
- We can adapt those *latent variable models* to machine learning, to estimate **ability** of classifiers as well as **difficulty** of instances and datasets.


### IRT from a machine learning perspective

![IRT](img/IRT1.png) <!-- .element height="80%" width="80%" -->

- $\theta_i$: ability of participant $i$
- $\delta_j$, $a_j$: difficulty & discrimination of item $j$
- $x_{ij}$: binary response (correct/incorrect)


### Beta-IRT

![Beta-IRT](img/BIRT1.png) <!-- .element height="80%" width="80%" -->

- continuous responses $p_{ij}$
- abilities & difficulties $\in [0,1]$


### Beta-IRT: flexible Item Characteristic Curves

![Beta-IRT ICC](img/BIRT2.png) <!-- .element height="80%" width="80%" -->

- discrimination $a_j$ can be negative, indicating an item that confuses high-ability participants!  <!-- .element: class="fragment" -->


### Idea 1:  Identifying noisy examples

![BIRT for noisy examples](img/BIRT3.png) <!-- .element height="65%" width="65%" -->

- [Chen, Y., Prudencio, R.B., Diethe, T. and Flach, P., 2019. $\beta^3$-IRT: A New Item Response Model and its Applications. AISTATS 2019.](http://proceedings.mlr.press/v89/chen19b.html)


### Idea 2:  Adaptive testing

Use a trained IRT model to evaluate a new classifier on a small number of datasets.

1. Start with initial guess of classifier ability.
2. Choose next dataset using an *item selection criterion*.
3. Evaluate classifier and update ability estimation.
4. Repeat until stopping criterion is achieved.


### CAT results

![CAT](img/CAT.png)  <!-- .element height="50%" width="50%" -->

- [Song, H. and Flach, P., 2020. Efficient and Robust Model Benchmarks with Item Response Theory and Adaptive Testing. Int J Interactive Multimedia and AI 2021.](https://ijimai.org/journal/bibcite/reference/2901)

----

## Artificial Intelligence, Measured for Safety


### blah

----

## Outlook

Ultimately, empirical ML needs to make *causal* statements:

> Algorithm A outperformed algorithm B **because** the classes were highly imbalanced.

- I.e., with re-balanced classes (counterfactual intervention) the difference in performance would disappear.    <!-- .element: class="fragment" -->
  - NB. In empirical ML we can actually carry out interventions, which makes causal inference a whole lot easier!   <!-- .element: class="fragment" -->


## Concluding remarks

Proper treatment of performance evaluation in machine learning and AI requires a sophisticated **measurement framework** with the following components:
- *Coherent types and meta-data* for the observable performance indicators;
- *Latent-variable models* for the unobservable performance indicators of interest;
- *Causal models* to allow for counterfactual reasoning.


### Acknowledgements

Part of this work was funded through a project with the Alan Turing Institute; papers, code and videos can be accessed [here](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai#recent-updates).

Many thanks to Hao Song, the Research Associate on the project; and collaborators Yu Chen, Tom Diethe, Jose Hernandez-Orallo, Conor Houghton, Meelis Kull, Paul-Gauthier Noe, Miquel Perello-Nieto, Ricardo Prudencio, Raul Santos-Rodriguez, Telmo Silva Filho, Kacper Sokol,  and many others.  <!-- .element: class="fragment" -->
