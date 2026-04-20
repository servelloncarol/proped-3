\documentclass[12pt,letterpaper]{article}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{graphicx}
\usepackage{amsmath, amssymb}
\usepackage{float}
\usepackage{url}
\usepackage{multirow}

\title{Visualización y análisis de funciones de dos variables: dominio, curvas de nivel, trazas y tasas de cambio usando MATLAB}
\author{Nora Carolina Servellón}
\date{Abril 2026}

\begin{document}

\maketitle

\tableofcontents
\newpage

\begin{abstract}
En este trabajo se implementan herramientas computacionales en MATLAB para explorar conceptos clave del cálculo de funciones de dos variables: dominio, gráficas de superficies, trazas verticales, curvas de nivel, mapas de contorno, tasa de cambio promedio y dirección de máximo ascenso. Se utilizan funciones de ejemplo como \(f(x,y)=\sqrt{9-x^2-y}\), \(f(x,y)=2x^2+5y^2\) (paraboloide elíptico), \(f(x,y)=x^2-3y^2\) (paraboloide hiperbólico), \(f(x,y)=12-2x-3y\) (plano) y \(f(x,y)=x\sin y\). Se generan visualizaciones en 3D, mapas de contorno con diferentes intervalos y se calculan tasas de cambio promedio simulando desplazamientos sobre el terreno. Los resultados muestran que las curvas de nivel se aproximan cuando la superficie es más empinada, y que la tasa de cambio promedio depende fuertemente de la dirección elegida. El código fuente está disponible en GitHub y las figuras son de elaboración propia. Este proyecto demuestra la utilidad de la programación científica para la enseñanza y comprensión del cálculo multivariable.
\end{abstract}

\section{Introducción}
El cálculo de funciones de varias variables es fundamental en física, ingeniería, economía y muchas otras disciplinas. Sin embargo, la visualización de conceptos como dominio, curvas de nivel, trazas y tasas de cambio puede ser abstracta cuando solo se trabaja con lápiz y papel. El uso de herramientas computacionales, como MATLAB, permite explorar estas ideas de manera interactiva y concreta.\\

Este proyecto se basa en el capítulo 15.1 del libro \textit{Cálculo de varias variables} de Stewart \cite{stewart}, donde se introducen funciones de dos o más variables, su dominio, gráficas, trazas verticales y curvas de nivel. Se propone implementar en MATLAB la visualización de varias funciones clásicas, analizar la relación entre el espaciamiento de las curvas de nivel y la pendiente, y calcular tasas de cambio promedio entre puntos sobre un mapa de contorno. También se aproxima numéricamente la dirección de máximo ascenso mediante el gradiente.\\

La hipótesis es que la visualización computacional facilita la comprensión de que la tasa de cambio depende de la dirección y que las curvas de nivel más juntas indican mayor pendiente. Los experimentos confirman estas propiedades y proporcionan una base para futuros estudios de optimización y derivadas direccionales.

\section{Marco teórico}
\subsection{Funciones de dos variables}
Una función \(f: D \subset \mathbb{R}^2 \to \mathbb{R}\) asigna a cada par \((x,y)\) en su dominio \(D\) un número real \(z = f(x,y)\). El dominio es el conjunto de puntos donde la expresión está definida. 

Por ejemplo, \(f(x,y)=\sqrt{9-x^2-y}\) requiere \(9-x^2-y \ge 0\), es decir, \(y \le 9-x^2\).\\


Un ejemplo importante de función de dos variables es la densidad del agua de mar, denotada \(\rho\), que depende de la salinidad \(S\) (en partes por mil, ppt) y la temperatura \(T\) (en grados Celsius). No existe una fórmula algebraica simple para \(\rho(S,T)\); los valores se determinan experimentalmente y se presentan en tablas \cite{stewart}. La Tabla \ref{tab:densidad} muestra algunos valores típicos.

\begin{table}[H]
\centering
\caption{Densidad del agua de mar \(\rho\) (kg/m³) en función de la temperatura y salinidad.}
\label{tab:densidad}
\begin{tabular}{|c|c|c|c|}
\hline
\multirow{2}{*}{Temperatura (°C)} & \multicolumn{3}{c|}{Salinidad (ppt)} \\
\cline{2-4}
& 32.0 & 32.5 & 33.0 \\
\hline
10 & 1.0246 & 1.0250 & 1.0254 \\
15 & 1.0237 & 1.0240 & 1.0244 \\
20 & 1.0224 & 1.0229 & 1.0232 \\
\hline
\end{tabular}
\end{table}

Por ejemplo, si \(S = 32\) ppt y \(T = 10^\circ\)C, entonces \(\rho(32,10) = 1.0246\) kg/m³. Este tipo de funciones son fundamentales en oceanografía para estudiar corrientes oceánicas y se miden con instrumentos especializados, como se muestra en las Figuras \ref{fig:conveyor} y \ref{fig:ctd}.

\begin{figure}[H]
\centering
\begin{minipage}{0.45\textwidth}
    \centering
    \includegraphics[width=\textwidth]{img/convenyor.jpg}
    \caption{La “cinta transportadora oceánica”, un sistema de corrientes profundas influenciado por la densidad del agua.}
    \label{fig:conveyor}
\end{minipage}
\hfill
\begin{minipage}{0.45\textwidth}
    \centering
    \includegraphics[width=\textwidth]{img/cdt.jpg}
    \caption{Instrumento CTD (Conductivity-Temperature-Depth) utilizado para medir temperatura, salinidad y presión en el océano.}
    \label{fig:ctd}
\end{minipage}
\end{figure}

\subsection{Gráfica y trazas}
La gráfica de \(f\) es la superficie \(z = f(x,y)\) en \(\mathbb{R}^3\). Las \textbf{trazas verticales} son las curvas que resultan de intersectar la superficie con planos verticales \(x = a\) (dando \(z = f(a,y)\)) o \(y = b\) (dando \(z = f(x,b)\)). Estas trazas ayudan a entender la forma de la superficie.

\subsection{Curvas de nivel y mapas de contorno}
Una \textbf{curva de nivel} es el conjunto de puntos \((x,y)\) en el plano donde \(f(x,y) = c\), para una constante \(c\). Es la proyección de la intersección de la superficie con el plano horizontal \(z=c\). Un \textbf{mapa de contorno} muestra varias curvas de nivel para valores de \(c\) igualmente espaciados (contour interval). Cuando las curvas están muy juntas, la superficie es empinada; si están separadas, es plana.

\subsection{Tasa de cambio promedio}
Dados dos puntos \(P\) y \(Q\) en el dominio, la tasa de cambio promedio de \(f\) desde \(P\) hasta \(Q\) es:
\[
\frac{\Delta \text{altitud}}{\Delta \text{horizontal}} = \frac{f(Q) - f(P)}{\|Q - P\|}
\]
Esta tasa depende de la dirección. A lo largo de una curva de nivel, la tasa es cero. La dirección de máximo ascenso es aquella en la que esta tasa es máxima; aproximadamente, es la que lleva al punto más cercano en la siguiente curva de nivel.

\subsection{Gradiente numérico}
El gradiente \(\nabla f = (f_x, f_y)\) apunta en la dirección de máximo ascenso. Se puede aproximar numéricamente con diferencias finitas:
\[
f_x(x,y) \approx \frac{f(x+h,y) - f(x-h,y)}{2h}, \quad f_y(x,y) \approx \frac{f(x,y+h) - f(x,y-h)}{2h}
\]
\\

\section{Experimentos}
Se implementaron en MATLAB las siguientes funciones y visualizaciones. Todas las figuras fueron generadas con código propio (ver anexo).

\subsection{Dominio de una función}
Para \(f(x,y)=\sqrt{9-x^2-y}\), se graficó la región del plano donde \(y \le 9-x^2\) (Figura \ref{fig:dominio}). Se observa que el dominio es una parábola hacia abajo, y el rango de \(f\) es \([0,\infty)\).

\begin{figure}[H]
\centering
\includegraphics[width=0.45\textwidth]{img/dominio.eps}
\caption{Dominio de \(f(x,y)=\sqrt{9-x^2-y}\) (sombreado).}
\label{fig:dominio}
\end{figure}

\subsection{Superficies y trazas verticales}
Se graficaron tres superficies representativas:
\begin{itemize}
\item Paraboloide elíptico: \(f(x,y)=2x^2+5y^2\) (Figura \ref{fig:parab}).
\item Paraboloide hiperbólico (silla de montar): \(f(x,y)=x^2-3y^2\) (Figura \ref{fig:parab}).
\item Plano: \(f(x,y)=12-2x-3y\) (Figura \ref{fig:plano}).
\end{itemize}
Además, para \(f(x,y)=x\sin y\) se mostraron las trazas verticales en planos \(x=1\) (curva seno) y \(y=\pi/2\) (línea recta), confirmando lo descrito en el texto (Figura \ref{fig:trazas}).

\begin{figure}[H]
\centering
\includegraphics[width=0.45\textwidth]{img/paraboloide.eps}
\includegraphics[width=0.45\textwidth]{img/hiperbolico.eps}
\caption{Izquierda: \(f(x,y)=2x^2+5y^2\). Derecha: \(f(x,y)=x^2-3y^2\).}
\label{fig:parab}
\end{figure}

\begin{figure}[H]
\centering
\includegraphics[width=0.6\textwidth]{img/plano.eps}
\caption{Plano \(f(x,y)=5-x-y\) con interceptos.}
\label{fig:plano}
\end{figure}

\begin{figure}[H]
\centering
\includegraphics[width=0.7\textwidth]{img/trazas.eps}
\caption{Trazas verticales de \(f(x,y)=x\sin y\) para \(x=1\) (curva seno) y \(y=\pi/2\) (línea).}
\label{fig:trazas}
\end{figure}

\subsection{Mapas de contorno y espaciamiento}
Se generaron mapas de contorno para las funciones anteriores. En el paraboloide elíptico (Figura \ref{fig:cont_parab}), las curvas de nivel son elipses que se acercan al alejarse del origen, indicando mayor pendiente. En el hiperbólico (Figura \ref{fig:cont_hip}), las curvas son hipérbolas y las líneas \(x=\pm\sqrt{3}y\) para \(c=0\). En el plano (Figura \ref{fig:cont_plano}), las curvas de nivel son líneas rectas paralelas igualmente espaciadas.

\begin{figure}[H]
\centering
\includegraphics[width=0.45\textwidth]{img/contorno_parab.eps}
\includegraphics[width=0.45\textwidth]{img/contorno_hip.eps}
\caption{Mapas de contorno (izquierda: \(2x^2+5y^2\); derecha: \(x^2-3y^2\)).}
\label{fig:cont_parab}
\end{figure}

\begin{figure}[H]
\centering
\includegraphics[width=0.6\textwidth]{img/contorno_plano.eps}
\caption{Curvas de nivel del plano \(f(x,y)=12-2x-3y\).}
\label{fig:cont_plano}
\end{figure}

\subsection{Tasa de cambio promedio y gradiente numérico}
Sobre el mapa de contorno del plano \(f(x,y)=12-2x-3y\), se seleccionaron tres puntos: \(A=(0,0)\), \(B=(1,0)\) y \(C=(0,1)\). Las tasas de cambio promedio se calcularon con MATLAB:
\begin{align*}
\text{Tasa}(A\to B) &= \frac{f(1,0)-f(0,0)}{\|B-A\|} = \frac{10-12}{1} = -2 \\
\text{Tasa}(A\to C) &= \frac{f(0,1)-f(0,0)}{1} = \frac{9-12}{1} = -3
\end{align*}
La tasa es cero si nos movemos a lo largo de la curva de nivel \(c=12\) (punto \(D=(1,1)\)). El gradiente numérico en \(A\) resultó \(\nabla f \approx (-2, -3)\), que apunta en la dirección de máximo descenso; la dirección de máximo ascenso es \((2,3)\) normalizada. La Figura \ref{fig:ascenso} muestra el campo de gradiente sobre las curvas de nivel del paraboloide elíptico, indicando la dirección de máximo ascenso.

\begin{figure}[H]
\centering
\includegraphics[width=0.6\textwidth]{img/ascenso.eps}
\caption{Dirección de máximo ascenso (flechas) sobre el mapa de contorno de \(f(x,y)=2x^2+5y^2\).}
\label{fig:ascenso}
\end{figure}


\section{Conclusiones}
\begin{itemize}
\item La implementación en MATLAB permite visualizar de manera clara el dominio, las superficies y las curvas de nivel de funciones de dos variables, facilitando la comprensión de conceptos abstractos.
\item Se confirma que el espaciamiento de las curvas de nivel es inversamente proporcional a la pendiente: más juntas indican mayor pendiente.
\item La tasa de cambio promedio depende fuertemente de la dirección; es máxima en la dirección del gradiente y nula a lo largo de una curva de nivel.
\item Las herramientas computacionales son un complemento poderoso para la enseñanza del cálculo multivariable, permitiendo experimentar con funciones y parámetros.
\item El código desarrollado es reusable y puede extenderse para estudiar derivadas direccionales, optimización y campos vectoriales.
\end{itemize}

\begin{thebibliography}{9}
\bibitem{stewart}
  J. Stewart, \emph{Cálculo de varias variables}, 7ª ed., Cengage Learning, 2012, Capítulo 15.1.
\bibitem{matlab}
  MathWorks, \emph{MATLAB Documentation}, disponible en \url{https://www.mathworks.com/MATLAB Drive/untitled.m}.
\end{thebibliography}



\section*{Anexo: Código MATLAB}
El código completo está disponible en GitHub: \url{https://github.com/servelloncarol/proped-3}. A continuación se muestra un extracto de las funciones principales.


\end{document}
