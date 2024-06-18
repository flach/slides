<!--
Looking at a list of major milestones in artificial intelligence (AI) over the last quarter century, it is hard to escape the impression that the rate of innovation in AI is accelerating dramatically if not exponentially: in 1997 IBM’s Deep Blue beats chess world champion Garry Kasparov in a six-game match, in 2011 IBM’s Watson wins against two human experts at the Jeopardy quiz show, in 2016 DeepMind’s AlphaGo beats top Go player Lee Sedol in a five-game match, in 2020 DeepMind’s AlphaFold accurately predicts 3D protein structures, and today generative AI models such as OpenAI’s ChatGPT can generate convincing, human-like text allowing them to pass academic exams and produce executable computer code from text prompts.

However, objectively speaking the above argument is fraught with difficulties, for a wide range of fundamental reasons. One is that, in competitive settings such as the first three, what really matters is not just the observed outcome but a robust estimate of its likelihood: if we re-ran these contests a number of times, what distribution of wins and losses would we expect? Another is that in many cases the intended outcomes are ill-defined: what does it mean to accurately predict protein structures? How do we measure human-likeness of text? Does the AI system convey a degree of confidence with its outputs? Can it explain its reasoning, and take corrections or feedback into account?

As I will show in this talk, this is where data science can help. I will review classical and recent work in producing calibrated probability estimates which directly addresses issues around confidence and distribution of outcomes. In the spirit of Sabine Krolak-Schwerdt, who held a chair in Educational Measurement, I will then explore the links between performance assessment of machines and human evaluation. Taking inspiration from cognitive science and psychometrics will allow us to come up with more meaningful measuring instruments, standards and benchmarks and move away from the overly simplistic league table approach that has been dominant in machine learning and AI for too long. In the foundational subject of AI performance evaluation, it takes the truly interdisciplinary outlook of data scientists to make meaningful and tangible progress.
-->

## AI in the time of ChatGPT

> "In the time of ChatGPT, artificial intelligence had become a marvel of the modern world, a magical creation that seemed almost alive. It was as if the machines had a soul, capable of understanding and empathizing with human emotions. ChatGPT was a symbol of this new era, a mysterious being with a secret language that only the initiated could understand. But amidst the awe and wonder, there were also whispers of fear, for no one knew what the future held in this age of AI."


### AI is on an exponential trajectory...

- 1997 - IBM's Deep Blue defeats Kasparov at chess <!-- .element: class="fragment" -->
- 2011 - IBM's Watson beats Jeopardy champions <!-- .element: class="fragment" -->
- 2016 - DeepMind's AlphaGo beats Lee Sedol at Go <!-- .element: class="fragment" -->
- 2020 - DeepMind's AlphaFold accurately predicts protein structures <!-- .element: class="fragment" -->
- 2022 - Open AI's ChatGPT generates human-like text and executable code from prompts <!-- .element: class="fragment" -->


### ...or is it? 

- If we re-ran these contests, what distribution of wins and losses would we expect?  <!-- .element: class="fragment" -->
- What does accurately predicting protein structures mean?  <!-- .element: class="fragment" -->
- How do we measure human-likeness of text?  <!-- .element: class="fragment" -->
- Does the AI system convey a degree of confidence with its outputs?  <!-- .element: class="fragment" -->
- Can it explain its reasoning, and take corrections or feedback into account?  <!-- .element: class="fragment" -->

These are very familiar questions for a data scientist! <!-- .element: class="fragment" -->


### How data science can help

- Confidence calibration, abstention
- Explanatory reasoning
- Performance evaluation

----

## ChatGPT = genAI + *dialogue model*

![ChatGPT schematic](img/chatGPT.jpg)<!-- .element  height="80%" width="80%" -->

[from https://blog.bytebytego.com/p/ep-44-how-does-ChatGPT-work](https://blog.bytebytego.com/p/ep-44-how-does-ChatGPT-work)


### Training the dialogue model

![ChatGPT finetuing](img/finetuning.jpg)<!-- .element  height="80%" width="80%" -->

[from https://openai.com/blog/ChatGPT](https://openai.com/blog/ChatGPT)


### What others say

> Sometimes I think it's as if aliens had landed and people haven't realized because they speak very good English.

[Geoffrey Hinton in an interview with MIT Technology Review](https://www.technologyreview.com/2023/05/02/1072528/geoffrey-hinton-google-why-scared-ai/)


### The ultimate bullshit machine

> For the bullshitter [all] bets are off: he is neither on the side of the true nor on the side of the false. His eye is not on the facts at all, as the eyes of the honest man and of the liar are, except insofar as they may be pertinent to his interest in getting away with what he says. He does not care whether the things he says describe reality correctly. 

[Harry Frankfurt, On Bullshit. Princeton University Press, 2005.](https://press.princeton.edu/books/hardcover/9780691122946/on-bullshit)


### Mansplaining-as-a-Service

![https://pullpatch.com/products/ladies-mansplaining-is-short-for-man-explaining-removable-patch](img/mansplaining.jpg)<!-- .element align="right" height="35%" width="35%" -->

"If someone perceives my responses as mansplaining, I apologize and encourage them to provide specific feedback on how I can improve and be more respectful in my interactions." (ChatGPT)


### Capturing the essence of human language

> I think we have to view this as a -- potentially surprising -- scientific discovery: that somehow in a neural net like ChatGPT's it's possible to capture the essence of what human brains manage to do in generating language.

[Stephen Wolfram: What Is ChatGPT Doing ... and Why Does It Work?](https://writings.stephenwolfram.com/2023/02/what-is-ChatGPT-doing-and-why-does-it-work/)


### The ultimate psychedelic

Putting linguistic elements together in surprising and potentially novel ways is the essence of language. 

"hallucination" or "confabulation" is actually built in and happens *always*.

The following are two very different things: 
- "Generate an existing and meaningful URL"; 
- "Generate *something that looks like* an existing and meaningful URL".

----

## We need to talk about (over)confidence


### What is overconfidence? 

![Overconfidence](img/overconfidence.jpg) <!-- .element align="right" height="40%" width="40%" -->

An overconfident classifier thinks it's better at separating classes than it actually is. 

Hence we need to make predicted probabilities less extreme by pushing them toward the centre. <!-- .element: class="fragment" -->


### Why does it matter? 

Optimal decisions can **only** be made with calibrated probabilities. 
- Example: If we trained on balanced classes but want to deploy with 4 times as many positives compared to negatives, we lower the decision threshold to 0.2. <!-- .element: class="fragment" -->
- With a poor probability estimator such as naive Bayes, decision thresholds have to be learned. <!-- .element: class="fragment" -->


### What to do about overconfidence

![Betacal](img/betacal.jpg) <!-- .element height="50%" width="50%" -->

[Classifier calibration survey](https://link.springer.com/article/10.1007/s10994-023-06336-7) <!-- .element: class="fragment" -->


### Computer says 'I Don't Know'

![Little Britain](img/LB.jpg) <!-- .element align="right" height="200px" -->

[Background Check: A general technique to build more reliable and versatile classifiers (ICDM 2016)](https://reframe.github.io/background_check/)

----

## XAI in a nutshell

![XAI plot](img/XAIplot.jpg)
<!-- .element  height="300" width="300" -->
- in black: decision boundary and weight vector
- in *red*: feature vector of instance
- in **blue**: recourse/counterfactual


### XAI with probabilities

![from LIME github repo](img/LIMEprobs.png)
<!-- element class="red-border" -->
[(from LIME github repo)](https://github.com/marcotcr/lime)



### Log-linear models
LIME assumes a linear relationship between features and predicted probabilities. 

*Log-linear* models assume instead that the log-odds (aka logits) are linear in the features. 

Probabilities are obtained via softmax, which is the inverse of the logit function. 



### From probabilities <br>to log-odds
| Term                    | Expression                                                    | Value                       |
| ----------------------- | ------------------------------------------------------------- | --------------------------- |
| *Posterior probability* | $\mathrm{softmax}(x) = \frac{1}{1+e^{-x}} = \hat{p}$          | $0.52$                      |
| *Posterior odds*        | $e^x=\frac{\hat{p}}{1-\hat{p}}$                               | $\frac{0.52}{0.48} = 1.083$ |
| *Log-odds*              | $x = \ln \frac{\hat{p}}{1-\hat{p}} = \mathrm{logit}(\hat{p})$ | $-0.65+0.73 = 0.08$         |



### Additive vs. multiplicative feature attributions
| Additive term $\delta$ in logit | Multiplicative term $e^{\delta}$ in odds | $\hat{p}=0.5$ becomes |
| ------------------------------- | ---------------------------------------- | --------------------- |
| 0.1                             | 1.11                                     | 0.52                  |
| 0.4                             | 1.49                                     | 0.60                  |
| 0.7                             | 2.01                                     | 0.67                  |
| 1.0                             | 2.72                                     | 0.73                  |
| 2.0                             | 7.39                                     | 0.88                  |
| 5.0                             | 148                                      | 0.99                  |



### ...which is highly non-linear
![Sigmoid](img/Sigmoid.png)
<!-- .element  height="500" width="500" -->



### LIME on logits
1. If the model to be explained produces scores in $(-\infty,\infty)$ (e.g., SVM) then work with those. 
2. If the model produces probabilities then convert those to logits first.
3. Train the linear surrogate model to locally replicate the model's scores or logits. 
4. Interpret the weights as factors multiplying the odds. 



### Ban the boundary!
There is nothing particularly special about $\hat{p}=0.5$. Hence the notion of an **absolute** counterfactual is somewhat misleading. 

So a *relative* counterfactual can be defined as 
> The recourse to be applied to the feature vector in order to change the predicted
~~class~~ **probability by $p_{\delta}$**.


### Relative counterfactual
![XAIplot2.jpg](img/XAIplot2.jpg)
<!--Increase $\hat{p}$ by $0.2$. -->

----

## Performance measurement

- Starts with informally described goals: accuracy, fairness, interpretability. 
- Translated into precise objectives, e.g. in terms of confusion matrix. 
- Requires some kind of measurement protocol, e.g. cross-validation. 
- Still a long way away from what we really want: assessment of unobservables, causal explanations.


### Performance evaluation in AI

Perhaps surprisingly, a definitive account of key measurement concepts such as scales, units, and dimensions is still missing. 
- *Stevens' typology* (nominal, ordinal, interval, ratio) is well-known but limited: e.g., it doesn't cover scales bounded from both sides (probabilities!). 
- In physics, quantities are understood to have an associated *dimension*, but 
	- these can cancel (angles, percentages); 
	- dimensionless quantities are required for transcendental functions (e.g., logs). 


### Performance evaluation in AI (2)

Compounding these issues, performance evaluation in AI (particularly machine learning) is often formulaic and simplistic. 

Including every performance indicator you can think of may make the **big table** look impressive, but doesn't necessarily exude confidence that you know what you're doing. 

Indicators such as accuracy (for classification), AUC (for ranking), Brier score (for probability estimation) should really be thought of as different 'dimensions' as in physics, reflecting the *use case*.


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

[Silva Filho et al. Classifier calibration: a survey on how to assess and improve predicted class probabilities. MLj 112, 2023.](https://link.springer.com/article/10.1007/s10994-023-06336-7)


### From ROC plots to PR plots

![ROC curve](img/fig1-left.png) <!-- .element height="40%" width="40%" -->
![PR curve](img/fig1-right.png) <!-- .element height="40%" width="40%" -->

There is a point-to-point correspondence between ROC space and precision-recall space. 


### Why PR plots aren't great

- **non-universal baselines** - random performance gives horizontal line which depends on class distribution.
- **non-linear interpolation** - iso-$F_{\beta}$ lines are hyperbolic.
- **Pareto front** is well-defined but non-convex.
- **uninterpretable area** - because of incoherence of taking arithmetic mean of precision values *and* unachievable region. 
- **no calibration**. 


### From PR plots to PR**Gain** plots

![PR curve](img/fig2-left.png) <!-- .element height="40%" width="40%" -->
![PRG curve](img/fig2-right.png) <!-- .element height="40%" width="40%" -->

[Flach and Kull. Precision-recall-gain curves: PR analysis done right. NeurIPS 2015.](http://people.cs.bris.ac.uk/~flach/PRGcurves)


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

## Concluding remarks

There are many ways in which data scientists can help to make AI better. I highlighted three: 

- Dealing with overconfidence, and knowing when to say "I don't know".
- Producing explanations in a statistically well-founded way.
- Taking performance measurement seriously.


### Open problems

- Confidence and abstention for large language models. 
- Explanatory and causal inference in performance measurement. 
- A measurement framework that explains why *$p \cdot \log p$* makes sense but $p + \log p$ doesn't. 


### Acknowledgements

Many thanks to collaborators Yu Chen, Tom Diethe, Jose Hernandez-Orallo, Meelis Kull, Miquel Perello-Nieto, Ricardo Prudencio, Raul Santos-Rodriguez, Telmo Silva Filho, Kacper Sokol, Hao Song, and many others. 
