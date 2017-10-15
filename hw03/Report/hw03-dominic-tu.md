hw03-dominic-tu.rmd
================
Dominic Tu
10/11/2017

Ranking of teams
================

<pre class="knitr r"><span class="hl kwd">library</span><span class="hl std">(readr)</span>
<span class="hl kwd">library</span><span class="hl std">(dplyr)</span>
<span class="hl kwd">library</span><span class="hl std">(ggplot2)</span>
<span class="hl kwd">library</span><span class="hl std">(knitr)</span>
<span class="hl kwd">render_html</span><span class="hl std">()</span>
</pre>

Basic Rankings
--------------

<pre class="knitr r"><span class="hl std">teams</span>
<span class="hl kwd">ggplot</span><span class="hl std">(teams,</span>
       <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl kwd">reorder</span><span class="hl std">(team, salary),</span>
           <span class="hl kwc">y</span> <span class="hl std">= salary))</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_bar</span><span class="hl std">(</span><span class="hl kwc">stat</span> <span class="hl std">=</span> <span class="hl str">&quot;identity&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">coord_flip</span><span class="hl std">()</span> <span class="hl opt">+</span>
  <span class="hl kwd">ggtitle</span><span class="hl std">(</span><span class="hl str">&quot;NBA Teams ranked by Total Salary&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">labs</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl str">&quot;Team&quot;</span><span class="hl std">,</span> <span class="hl kwc">y</span> <span class="hl std">=</span> <span class="hl str">&quot;Salary (in millions)&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_hline</span><span class="hl std">(</span><span class="hl kwc">data</span> <span class="hl std">= teams,</span> <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">yintercept</span> <span class="hl std">=</span> <span class="hl kwd">mean</span><span class="hl std">(salary)),</span> <span class="hl kwc">color</span> <span class="hl std">=</span> <span class="hl str">'red'</span><span class="hl std">,</span> <span class="hl kwc">alpha</span> <span class="hl std">=</span> <span class="hl num">.4</span><span class="hl std">,</span> <span class="hl kwc">size</span>  <span class="hl std">=</span> <span class="hl num">1</span><span class="hl std">)</span>
</pre>

<img src="hw03-dominic-tu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-145-1.png" class="plot" />

<pre class="knitr r"><span class="hl kwd">ggplot</span><span class="hl std">(teams,</span>
       <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl kwd">reorder</span><span class="hl std">(team, points),</span>
           <span class="hl kwc">y</span> <span class="hl std">= points))</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_bar</span><span class="hl std">(</span><span class="hl kwc">stat</span> <span class="hl std">=</span> <span class="hl str">&quot;identity&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">coord_flip</span><span class="hl std">()</span> <span class="hl opt">+</span>
  <span class="hl kwd">ggtitle</span><span class="hl std">(</span><span class="hl str">&quot;NBA Teams ranked by Total Points&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">labs</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl str">&quot;Team&quot;</span><span class="hl std">,</span> <span class="hl kwc">y</span> <span class="hl std">=</span> <span class="hl str">&quot;Total Points&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_hline</span><span class="hl std">(</span><span class="hl kwc">data</span> <span class="hl std">= teams,</span> <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">yintercept</span> <span class="hl std">=</span> <span class="hl kwd">mean</span><span class="hl std">(points)),</span> <span class="hl kwc">color</span> <span class="hl std">=</span> <span class="hl str">'red'</span><span class="hl std">,</span> <span class="hl kwc">alpha</span> <span class="hl std">=</span> <span class="hl num">.4</span><span class="hl std">,</span> <span class="hl kwc">size</span> <span class="hl std">=</span> <span class="hl num">1</span><span class="hl std">)</span>
</pre>

<img src="hw03-dominic-tu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-145-2.png" class="plot" />

<pre class="knitr r"><span class="hl kwd">ggplot</span><span class="hl std">(teams,</span>
       <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl kwd">reorder</span><span class="hl std">(team, efficiency),</span>
           <span class="hl kwc">y</span> <span class="hl std">= efficiency))</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_bar</span><span class="hl std">(</span><span class="hl kwc">stat</span> <span class="hl std">=</span> <span class="hl str">&quot;identity&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">coord_flip</span><span class="hl std">()</span> <span class="hl opt">+</span>
  <span class="hl kwd">ggtitle</span><span class="hl std">(</span><span class="hl str">&quot;NBA Teams ranked by Total Efficiency&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">labs</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl str">&quot;Team&quot;</span><span class="hl std">,</span> <span class="hl kwc">y</span> <span class="hl std">=</span> <span class="hl str">&quot;Total Efficiency&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_hline</span><span class="hl std">(</span><span class="hl kwc">data</span> <span class="hl std">= teams,</span> <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">yintercept</span> <span class="hl std">=</span> <span class="hl kwd">mean</span><span class="hl std">(efficiency)),</span> <span class="hl kwc">color</span> <span class="hl std">=</span> <span class="hl str">'red'</span><span class="hl std">,</span> <span class="hl kwc">alpha</span> <span class="hl std">=</span> <span class="hl num">.4</span><span class="hl std">,</span> <span class="hl kwc">size</span> <span class="hl std">=</span> <span class="hl num">1</span><span class="hl std">)</span>
</pre>

<img src="hw03-dominic-tu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-145-3.png" class="plot" />

PCA
---

<pre class="knitr r"><span class="hl std">pca</span> <span class="hl kwb">=</span> <span class="hl kwd">prcomp</span><span class="hl std">(</span><span class="hl kwd">select</span><span class="hl std">(teams, points3, points2, free_throws,</span>
                    <span class="hl std">off_rebounds,def_rebounds,  assists, steals,</span>
                    <span class="hl std">blocks, turnovers, fouls),</span> <span class="hl kwc">scale.</span> <span class="hl std">=</span> <span class="hl num">TRUE</span><span class="hl std">)</span>
<span class="hl std">eigenvalue</span> <span class="hl kwb">=</span> <span class="hl std">pca</span><span class="hl opt">$</span><span class="hl std">sdev</span><span class="hl opt">^</span><span class="hl num">2</span>
<span class="hl std">df_eigs</span> <span class="hl kwb">=</span> <span class="hl kwd">data.frame</span><span class="hl std">(eigenvalue,</span>
                     <span class="hl kwc">prop</span> <span class="hl std">=</span> <span class="hl kwd">round</span><span class="hl std">(eigenvalue</span><span class="hl opt">/</span><span class="hl kwd">sum</span><span class="hl std">(eigenvalue),</span> <span class="hl num">4</span><span class="hl std">),</span>
                     <span class="hl kwc">cumprop</span> <span class="hl std">=</span> <span class="hl kwd">round</span><span class="hl std">(</span><span class="hl kwd">cumsum</span><span class="hl std">(eigenvalue</span><span class="hl opt">/</span><span class="hl num">10</span><span class="hl std">),</span> <span class="hl num">4</span><span class="hl std">))</span>

<span class="hl kwd">ggplot</span><span class="hl std">(teams,</span> <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">= pca</span><span class="hl opt">$</span><span class="hl std">x[ ,</span> <span class="hl num">1</span><span class="hl std">],</span> <span class="hl kwc">y</span> <span class="hl std">= pca</span><span class="hl opt">$</span><span class="hl std">x[ ,</span> <span class="hl num">2</span><span class="hl std">],</span> <span class="hl kwc">label</span> <span class="hl std">= team))</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_text</span><span class="hl std">(</span><span class="hl kwc">size</span> <span class="hl std">=</span> <span class="hl num">3.5</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_hline</span><span class="hl std">(</span><span class="hl kwc">yintercept</span> <span class="hl std">=</span> <span class="hl num">0</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_vline</span><span class="hl std">(</span><span class="hl kwc">xintercept</span> <span class="hl std">=</span> <span class="hl num">0</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">ggtitle</span><span class="hl std">(</span><span class="hl str">&quot;PCA plot (PC1 and PC2)&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">labs</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl str">&quot;PC1&quot;</span><span class="hl std">,</span> <span class="hl kwc">y</span> <span class="hl std">=</span> <span class="hl str">&quot;PC2&quot;</span><span class="hl std">)</span>
</pre>

<img src="hw03-dominic-tu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-146-1.png" class="plot" />

<pre class="knitr r"><span class="hl std">s1</span> <span class="hl kwb">=</span> <span class="hl num">100</span><span class="hl opt">*</span><span class="hl std">((pca</span><span class="hl opt">$</span><span class="hl std">x[ ,</span><span class="hl num">1</span><span class="hl std">]</span> <span class="hl opt">-</span> <span class="hl kwd">min</span><span class="hl std">(pca</span><span class="hl opt">$</span><span class="hl std">x[ ,</span><span class="hl num">1</span><span class="hl std">]))</span> <span class="hl opt">/</span> <span class="hl std">(</span><span class="hl kwd">max</span><span class="hl std">(pca</span><span class="hl opt">$</span><span class="hl std">x[ ,</span><span class="hl num">1</span><span class="hl std">])</span> <span class="hl opt">-</span> <span class="hl kwd">min</span><span class="hl std">(pca</span><span class="hl opt">$</span><span class="hl std">x[ ,</span><span class="hl num">1</span><span class="hl std">])))</span>
<span class="hl std">teams</span> <span class="hl kwb">=</span> <span class="hl kwd">mutate</span><span class="hl std">(teams,</span> <span class="hl kwc">PC1</span> <span class="hl std">= s1)</span>
<span class="hl std">teams</span>

<span class="hl kwd">ggplot</span><span class="hl std">(teams,</span> <span class="hl kwd">aes</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl kwd">reorder</span><span class="hl std">(team, s1),</span> <span class="hl kwc">y</span> <span class="hl std">= s1))</span> <span class="hl opt">+</span>
  <span class="hl kwd">geom_bar</span><span class="hl std">(</span><span class="hl kwc">stat</span> <span class="hl std">=</span> <span class="hl str">&quot;identity&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">coord_flip</span><span class="hl std">()</span> <span class="hl opt">+</span>
  <span class="hl kwd">labs</span><span class="hl std">(</span><span class="hl kwc">x</span> <span class="hl std">=</span> <span class="hl str">&quot;Team&quot;</span><span class="hl std">,</span> <span class="hl kwc">y</span> <span class="hl std">=</span> <span class="hl str">&quot;First PC (scaled from 0 to 100&quot;</span><span class="hl std">)</span> <span class="hl opt">+</span>
  <span class="hl kwd">ggtitle</span><span class="hl std">(</span><span class="hl str">&quot;NBA Teams ranked by scaled PC1&quot;</span><span class="hl std">)</span>
</pre>

<img src="hw03-dominic-tu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-146-2.png" class="plot" />

-   The PCA1 ranking shows that the Golden State Warriors show the more variation with (PCA1 = 100), and Sacramento Kings show the least amount of variation with (PCA1 = 0)

------------------------------------------------------------------------

comments and reflection
=======================

> I think the hardest part was learning PCA on our own. It was brand new to me. Relative path was quite easy once you learn how to use it. This assignment took me about 5 hours
