Curso: Estimación por Máxima Verosimilitud y Modelos Lineales Generalizados
Basado en el material del curso MAT5508 (Modelos Lineales Generalizados), con explicaciones adicionales, ejemplos extra y contexto para no dejar nada suelto.


Cómo usar este curso
Está dividido en dos módulos, que corresponden a los dos capítulos que compartiste. Cada módulo empieza con la intuición (sin fórmulas), luego construye las fórmulas pieza por pieza, y termina con varios ejemplos resueltos — los que ya venían en tus diapositivas, más algunos adicionales para reforzar. Cada vez que aparece una fórmula nueva, hay una tabla o lista que explica qué es cada símbolo y para qué sirve.


MÓDULO 0 — Antes de empezar: el vocabulario mínimo
Antes de entrar a máxima verosimilitud, conviene dejar claros algunos conceptos que el curso da por sabidos.

Variable aleatoria. Es, informalmente, el resultado de un experimento que no puedes predecir con certeza pero cuyo comportamiento a largo plazo sí puedes describir (ej. el número de caras al lanzar una moneda 10 veces).

Parámetro. Es un número fijo (pero desconocido) que determina cómo se comporta una distribución. Por ejemplo, en una moneda "cargada", el parámetro $\theta$ es la probabilidad de que caiga águila. Distintos valores de $\theta$ generan distribuciones distintas (una moneda con $\theta=0.5$ se comporta diferente a una con $\theta=0.9$).

Densidad / función de probabilidad, $f(y;\theta)$. Es la fórmula matemática que, dado un valor del parámetro $\theta$, te dice qué tan probable es cada resultado posible $y$. Es la pieza que ya conoces de un curso de probabilidad (la fórmula de la binomial, de la Poisson, de la normal, etc.), solo que aquí la vamos a mirar "al revés": en vez de fijar $\theta$ y preguntar qué tan probable es cada $y$, vamos a fijar el dato $y$ que ya observamos y preguntar qué tan plausible es cada $\theta$ posible.

Estimar. Dar un valor concreto (calculado a partir de los datos) que sirva como "mejor apuesta" del valor real, pero desconocido, del parámetro.

Notación del "gorrito" ($\hat\theta$). En estadística, poner un circunflejo/gorrito sobre una letra griega significa "esta es la estimación de ese parámetro, calculada a partir de los datos" — no el valor verdadero (que nunca conocemos), sino nuestro mejor cálculo.

Derivadas y máximos. Recordatorio de cálculo que se usa todo el módulo 1: si una función $h(x)$ tiene un máximo en $x=x_0$, entonces la primera derivada $h'(x_0)=0$ (la pendiente es plana ahí) y la segunda derivada $h''(x_0)<0$ (la curva se dobla hacia abajo, como una montaña, no hacia arriba, como un valle). Esto es exactamente lo que se usa para encontrar el "mejor" valor de un parámetro.


MÓDULO 1 — Estimación por máxima verosimilitud
1.1 La pregunta que resuelve este módulo
Tienes datos. No conoces el parámetro que los generó. ¿Cómo eliges, de manera objetiva y con buenas propiedades matemáticas, un valor de ese parámetro?

La respuesta de máxima verosimilitud es: elige el valor del parámetro que hace más probable haber visto exactamente los datos que viste.

Analogía útil: imagina que encuentras una moneda en el suelo y la lanzas 10 veces, obteniendo 9 águilas. Si alguien te pregunta "¿crees que esta moneda tiene $\theta=0.5$ (justa) o $\theta=0.9$ (muy cargada a águila)?", tu intuición te dice que $\theta=0.9$ es mucho más consistente con lo que viste. Máxima verosimilitud es la versión formal, matemática, de esa intuición.
1.2 La función de verosimilitud, pieza por pieza
$$L(\theta; y) = c \cdot \Pr(Y=y;\theta)$$

Símbolo
Qué es
$Y$
La variable aleatoria (el proceso que genera los datos, antes de observarlos)
$y$
El dato que ya observaste (un número fijo, no aleatorio, una vez que el experimento ya ocurrió)
$\theta$
El parámetro desconocido que queremos estimar
$\Pr(Y=y;\theta)$
La probabilidad de haber observado $y$, si el parámetro fuera $\theta$
$c$
Una constante positiva que no depende de $\theta$ (se puede elegir para simplificar cuentas; no afecta dónde está el máximo)
$L(\theta;y)$
La función de verosimilitud: la misma fórmula de probabilidad, pero vista como función de $\theta$


El punto clave que confunde a casi todos al inicio: $f(y;\theta)$ y $L(\theta;y)$ tienen exactamente la misma fórmula algebraica. Lo único que cambia es la perspectiva: en $f(y;\theta)$, $\theta$ está fijo y $y$ varía (así se enseña en un curso de probabilidad: "dado que la moneda tiene $\theta=0.5$, ¿qué tan probable es ver 6 águilas de 10?"). En $L(\theta;y)$, $y$ está fijo (ya lo observaste) y $\theta$ varía ("ya vi 6 águilas de 10, ¿qué tan verosímil es que $\theta=0.5$? ¿Y que $\theta=0.7$?").
1.3 Log-verosimilitud, score e información
Trabajar directamente con $L(\theta)$ es incómodo porque casi siempre es un producto de muchos términos (uno por cada observación), y derivar productos es tedioso. La solución: tomar logaritmo.

$$\ell(\theta) = \log L(\theta)$$

Como el logaritmo es una función monótona creciente (si $a>b$ entonces $\log a > \log b$), maximizar $\ell(\theta)$ da exactamente el mismo resultado que maximizar $L(\theta)$ — solo que ahora los productos se vuelven sumas, mucho más fáciles de derivar.

De $\ell(\theta)$ se definen dos funciones que vas a usar constantemente:

$$S(\theta) = \ell'(\theta) \qquad\qquad I(\theta) = -\ell''(\theta)$$

Nombre
Fórmula
Qué mide
Intuición
Score (función de puntuación)
$S(\theta)=\ell'(\theta)$
La pendiente de la log-verosimilitud en cada punto
Te dice "de qué lado" está el máximo: si $S(\theta)>0$, subiendo $\theta$ mejora la verosimilitud; si $S(\theta)<0$, hay que bajar $\theta$. En el máximo, $S(\hat\theta)=0$
Información observada
$I(\theta)=-\ell''(\theta)$
Qué tan curvada (cóncava) es la log-verosimilitud
Una curva muy puntiaguda cerca del máximo significa que los datos son muy informativos: valores de $\theta$ ligeramente distintos al óptimo quedan muy penalizados. Una curva plana significa que hay mucha incertidumbre
Información esperada
$\mathcal{I}(\theta)=E{I(\theta)}$
El promedio de $I(\theta)$ sobre todos los datos posibles
Es una versión "teórica" de la información, útil cuando se quiere una propiedad que no dependa de los datos específicos observados


¿Por qué la segunda derivada mide "informatividad"? Piensa en dos escenarios: (a) lanzas una moneda 10 veces y ves 9 águilas; (b) lanzas la misma moneda 10,000 veces y ves 9,000 águilas. En ambos casos $\hat\theta=0.9$, pero en el escenario (b) estás mucho más seguro de que $\theta$ está realmente cerca de 0.9 — un valor como $\theta=0.85$ ya te parece poco creíble. Esa "seguridad" se traduce en que la curva de $\ell(\theta)$ es mucho más puntiaguda en el escenario (b). $I(\theta)$ captura exactamente esa diferencia.
1.4 Verosimilitud relativa
$$R(\theta) = \frac{L(\theta)}{L(\hat\theta)} \qquad\qquad r(\theta) = \log R(\theta) = \ell(\theta)-\ell(\hat\theta)$$

Símbolo
Qué es
$\hat\theta$
El estimador de máxima verosimilitud (el valor que maximiza $L$)
$R(\theta)$
Qué tan verosímil es un valor cualquiera de $\theta$, relativo al mejor valor posible
$r(\theta)$
Lo mismo, en escala logarítmica


Como $\hat\theta$ es el máximo, siempre $R(\theta)\le 1$ y $r(\theta)\le 0$, con igualdad solo cuando $\theta=\hat\theta$. Estas funciones son útiles porque no dependen de la constante $c$ que elegiste arbitrariamente al definir $L(\theta)$ — se cancela en el cociente.
1.5 Ejemplo resuelto 1: la binomial (cucarachas)
(Este es el ejemplo de tus diapositivas — lo repasamos con cada paso explicado.)

Contexto: 10 cucarachas se exponen a un insecticida durante 15 minutos. "Éxito" = el insecto sobrevive, con probabilidad $\theta$ desconocida. Observamos $y=6$ sobrevivientes.

Paso 1 — identificar la distribución. Si cada insecto sobrevive independientemente con probabilidad $\theta$, el número total de sobrevivientes $Y$ sigue una distribución binomial:

$$\Pr(Y=y;\theta) = \binom{n}{y}\theta^y(1-\theta)^{n-y}$$

Paso 2 — construir la verosimilitud. Elegimos $c=1/\binom{n}{y}$ (la parte que no depende de $\theta$) para simplificar:

$$L(\theta) = \theta^y(1-\theta)^{n-y}$$

Paso 3 — tomar logaritmo:

$$\ell(\theta) = y\log\theta + (n-y)\log(1-\theta)$$

Con $n=10$, $y=6$: $\ell(\theta) = 6\log\theta + 4\log(1-\theta)$.

Paso 4 — derivar (score) e igualar a cero:

$$S(\theta) = \frac{y}{\theta} - \frac{n-y}{1-\theta} = 0 \quad\Longrightarrow\quad \hat\theta = \frac{y}{n} = \frac{6}{10}=0.6$$

Paso 5 — confirmar que es máximo (no mínimo) con la información:

$$I(\theta) = \frac{y}{\theta^2}+\frac{n-y}{(1-\theta)^2}$$

Evaluando en $\hat\theta=0.6$: $I(0.6)=41.67 > 0$, lo que confirma que es un máximo (recuerda: $I(\theta)=-\ell''(\theta)$, así que $I>0$ significa $\ell''<0$, es decir, la curva se dobla "hacia abajo" como una montaña).

Interpretación: el estimador de máxima verosimilitud resultó ser, simplemente, la proporción observada de éxitos. Esto no es casualidad — para la binomial siempre pasa — pero el punto de repasar el procedimiento completo es que funciona igual para distribuciones donde la fórmula final no es tan obvia (como verás en el ejemplo Poisson).

Prueba de hipótesis y CI para este ejemplo (usando las herramientas de la sección 1.7): probando $H_0:\theta=0.20$, la razón de verosimilitudes da un estadístico de $7.64$, con significancia $\Pr(\chi^2_1>7.64)=0.006$ — se rechaza $H_0$ con evidencia fuerte. El intervalo de confianza al 95% basado en razón de verosimilitudes es $(0.300, 0.854)$, y el basado en Wald es $(0.296, 0.904)$ — muy parecidos en este caso.
1.6 El algoritmo de Newton-Raphson
En el ejemplo anterior pudimos despejar $\hat\theta$ a mano. Muchas veces no se puede (la ecuación $S(\theta)=0$ no tiene solución algebraica simple), y hay que resolverla numéricamente.

Idea de cálculo (recordatorio): el método de Newton-Raphson encuentra raíces de cualquier función $g(x)=0$ aproximando $g$ localmente con una recta tangente y usando esa recta para dar un "salto" hacia la raíz, repitiendo el proceso hasta converger.

Aplicado a encontrar el máximo de $\ell(\theta)$ (es decir, la raíz de $S(\theta)=0$), la fórmula de actualización es:

$$\theta^{(i+1)} = \theta^{(i)} + I^{-1}(\theta^{(i)}),S(\theta^{(i)})$$

Símbolo
Qué es
$\theta^{(i)}$
El valor de $\theta$ en la iteración actual
$S(\theta^{(i)})$
La pendiente de la log-verosimilitud evaluada ahí (te dice hacia dónde moverte)
$I(\theta^{(i)})$
La curvatura evaluada ahí (te dice qué tan grande debe ser el paso: si la curva es muy puntiaguda, un paso chico ya te acerca mucho)
$I^{-1}(\theta^{(i)})S(\theta^{(i)})$
El "salto" que se le suma al valor actual


Se repite la fórmula hasta que $|\theta^{(i+1)}-\theta^{(i)}|$ sea menor que una tolerancia fija (por ejemplo $10^{-5}$). En tus diapositivas, el ejemplo de las cucarachas resuelto por este método converge de $\theta^{(0)}=0.1$ a $\hat\theta=0.6$ en unas 7 iteraciones.

Por qué importa este algoritmo para el resto del curso: casi ningún modelo lineal generalizado real (fuera de la regresión normal con liga identidad) tiene una fórmula cerrada para $\hat\beta$. En la práctica, cuando ajustas una regresión logística o de Poisson en R con glm(), por debajo el programa está corriendo una versión (vectorial/matricial) de este mismo algoritmo.
1.7 Cantidades pivotales: la base de pruebas e intervalos
Una cantidad pivotal es una función de los datos y del parámetro cuya distribución (aproximada) no depende del valor desconocido de ese parámetro. Esto es justo lo que necesitas para construir pruebas de hipótesis e intervalos de confianza: puedes calcular probabilidades sin saber el valor real de $\theta$.

Hay tres cantidades pivotales estándar, las tres aproximadamente $\chi^2_1$ (chi-cuadrada con 1 grado de libertad) para muestras suficientemente grandes:

$$-2r(\theta) \sim \chi^2_{(1)} \qquad\qquad \frac{S(\theta)^2}{I(\theta)} \sim \chi^2_{(1)} \qquad\qquad (\hat\theta-\theta)^2 I(\theta) \sim \chi^2_{(1)}$$

Nombre
Fórmula
Basada en
Razón de verosimilitudes (LR)
$-2r(\theta)=-2{\ell(\theta)-\ell(\hat\theta)}$
Qué tan lejos está la log-verosimilitud de $\theta$ respecto a su máximo
Score (o Rao)
$S(\theta)^2/I(\theta)$
Qué tan lejos de cero está la pendiente en $\theta$, ponderada por la curvatura
Wald
$(\hat\theta-\theta)^2 I(\theta)$
Qué tan lejos está la estimación $\hat\theta$ del valor hipotético $\theta$, ponderada por la información


¿Por qué $\chi^2_1$? Sin entrar en la demostración completa (que usa una expansión de Taylor de $\ell(\theta)$ alrededor de $\hat\theta$), la idea es que cerca del máximo, la log-verosimilitud se parece mucho a una parábola (por la expansión de Taylor de segundo orden). Bajo esa aproximación, $\hat\theta$ se comporta como una variable normal, y el cuadrado de una variable normal estandarizada sigue exactamente una distribución $\chi^2_1$. Esa es la razón profunda detrás de las tres fórmulas de arriba: todas son, en esencia, "distancia al cuadrado, ponderada por la curvatura", solo que medida de tres formas ligeramente distintas.
Pruebas de hipótesis
Para probar $H_0:\theta=\theta_0$ vs. $H_1:\theta\ne\theta_0$:

Prueba de razón de verosimilitudes: estadístico $-2{\ell(\theta_0)-\ell(\hat\theta)}$, comparado contra $\chi^2_1$.
Prueba de Wald: estadístico $(\hat\theta-\theta_0)^2 I(\hat\theta)$ (nota: aquí se evalúa la información en $\hat\theta$, no en $\theta_0$), comparado contra $\chi^2_1$. Equivalente a la versión con raíz cuadrada, $(\hat\theta-\theta_0)\sqrt{I(\hat\theta)}$, comparada contra una normal estándar — esta es la forma que ves en casi cualquier salida de software estadístico ("z-value" o "t-value").
Intervalos de confianza
Basado en razón de verosimilitudes: el conjunto de valores $\theta$ tales que $-2r(\theta) < \chi^2_1(1-\alpha)$. No siempre tiene fórmula cerrada — a veces hay que encontrar las raíces numéricamente (con Newton-Raphson, de nuevo).
Basado en Wald:

$$\left(\hat\theta - 1.96, I^{-1/2}(\hat\theta),\ \ \hat\theta + 1.96, I^{-1/2}(\hat\theta)\right)$$

Este es el clásico "estimador $\pm\ 1.96 \times$ error estándar" que seguramente ya conoces. El "error estándar" es, precisamente, $I^{-1/2}(\hat\theta)$ — la raíz cuadrada del inverso de la información.

¿Cuál usar? Cuando $\ell(\theta)$ se parece mucho a una parábola cerca del máximo (lo cual pasa con muestras grandes, o con distribuciones "bien portadas" como la normal), los tres métodos dan resultados casi idénticos. Cuando la curva está sesgada (asimétrica), especialmente con muestras chicas o parámetros cerca de los límites de su rango (como $\theta$ cerca de 0 o 1 en una binomial), la razón de verosimilitudes suele dar intervalos más confiables — Wald tiende a fallar ahí porque asume una simetría que no existe.
1.8 Ejemplo resuelto 2: Poisson (caídas de adultos mayores)
Contexto: se sigue a 10 residentes de un asilo durante un año, registrando cuántas caídas sufre cada uno. El promedio observado es $\bar y=2$ caídas.

Modelo: $Y_i\sim\text{Poisson}(\theta)$ independientes, con función de probabilidad

$$\Pr(Y_i=y_i) = \frac{\theta^{y_i}e^{-\theta}}{y_i!}$$

Verosimilitud conjunta (para $n$ observaciones, eligiendo $c$ para simplificar):

$$L(\theta) = \prod_{i=1}^n \theta^{y_i}e^{-\theta} = \theta^{n\bar y}e^{-n\theta}$$

Log-verosimilitud, score e información:

$$\ell(\theta) = n\bar y\log\theta - n\theta \qquad S(\theta)=\frac{n\bar y}{\theta}-n \qquad I(\theta) = \frac{n\bar y}{\theta^2}$$

Resolviendo $S(\theta)=0$: $\hat\theta = \bar y$. De nuevo, el resultado es intuitivo (el promedio observado es la mejor estimación de la tasa promedio de caídas), pero el aparato formal es el que permite construir, de manera automática, pruebas e intervalos.

Intervalo de confianza (Wald, 95%):

$$\bar y \pm 1.96\sqrt{\bar y/n}$$

Con $n=10$: $(1.12, 2.88)$. Con $n=100$ (mismo promedio $\bar y=2$): $(1.72,2.28)$ — mucho más angosto, porque con más datos hay más información y por lo tanto menos incertidumbre. Esto ilustra en números concretos algo que ya mencionamos arriba de forma abstracta: más datos → curva de verosimilitud más puntiaguda → intervalos más angostos.

Ejemplo histórico adicional (para fijar la intuición de la Poisson): un ejemplo clásico en la enseñanza de la distribución Poisson es el conteo de muertes anuales por coces de caballo en el ejército prusiano del siglo XIX, estudiado por Ladislaus Bortkiewicz — un caso donde eventos raros e independientes, contados sobre unidades de tiempo o exposición constantes, se ajustan naturalmente a este modelo. La misma lógica aplica hoy a conteos como visitas a un museo, número de reclamaciones de seguros, o número de errores de manufactura por lote — cualquier situación de "conteo de eventos raros en una ventana fija".
1.9 Sesgo de la verosimilitud y reparametrización
El problema: cuando el resultado observado está cerca de los extremos posibles (por ejemplo, 9 de 10 cucarachas sobreviven, en vez de 6 de 10), la curva $r(\theta)$ deja de parecerse a una parábola simétrica — se vuelve muy asimétrica ("sesgada"). En esos casos, los intervalos de Wald (que sí asumen simetría) se vuelven poco confiables: pueden no cubrir el valor real de $\theta$ con la frecuencia que dicen cubrir.

La solución: en vez de hacer inferencia directamente sobre $\theta$ (que vive en un rango acotado, como $(0,1)$ para una probabilidad), se transforma $\theta$ con una función biyectiva $g$ que lo mapea a toda la recta real, $\eta=g(\theta)$, se hace toda la inferencia (estimación, prueba, intervalo) sobre $\eta$, y al final se regresa a la escala original aplicando $g^{-1}$.

Ejemplos de transformaciones $g$ mencionados en el curso:

Transformación
Fórmula
Uso típico
Logit
$g(\theta)=\log{\theta/(1-\theta)}$
Probabilidades, proporciones
Probit
$g(\theta)=\Phi^{-1}(\theta)$ (inversa de la normal acumulada)
Alternativa al logit
Log-log complementario
$g(\theta)=\log{-\log\theta}$ o $\log{-\log(1-\theta)}$
Cuando la asimetría va en una dirección particular


Por qué esto es importante para el módulo 2: esta idea — no trabajar directamente con el parámetro de interés, sino con una transformación suya que "se comporta mejor" — es exactamente la semilla conceptual de la función de ligadura en los modelos lineales generalizados. Ahí, en vez de modelar la media $\mu$ directamente como una combinación lineal, se modela $g(\mu)$. Es la misma idea, aplicada ahora a una media en vez de a un parámetro escalar general.

Como resumen (Tabla 1 de tus diapositivas), hay dos "enfoques" completamente equivalentes para construir el intervalo de confianza: uno trabajando en la escala de $\theta$ directamente, y otro trabajando en la escala transformada $\eta=g(\theta)$ y luego regresando con $g^{-1}$. Ambos deberían dar (aproximadamente) el mismo resultado cuando $\ell$ no está sesgada; cuando sí lo está, el segundo enfoque suele ser más confiable.
1.10 Cuando el parámetro es un vector
Todo lo anterior se generaliza de manera directa cuando en vez de un solo parámetro $\theta$ tienes un vector $\boldsymbol\theta=(\theta_1,\ldots,\theta_p)$ — por ejemplo, en una regresión, todos los coeficientes $\beta_0,\beta_1,\ldots,\beta_{p-1}$ a la vez.

Objeto escalar
Versión vectorial
Qué cambia
$S(\theta)=\ell'(\theta)$, un número
$S(\boldsymbol\theta) = \partial\ell/\partial\boldsymbol\theta$, un vector $p\times 1$ (el gradiente)
Ahora hay una derivada parcial por cada parámetro
$I(\theta)=-\ell''(\theta)$, un número
$I(\boldsymbol\theta) = -\partial^2\ell/\partial\boldsymbol\theta^2$, una matriz $p\times p$ (el negativo del Hessiano)
Contiene no solo la curvatura de cada parámetro por separado, sino también cómo se relacionan entre sí (las derivadas cruzadas)
$\theta^{(i+1)}=\theta^{(i)}+I^{-1}(\theta^{(i)})S(\theta^{(i)})$
$\boldsymbol\theta^{(i+1)}=\boldsymbol\theta^{(i)}+I^{-1}(\boldsymbol\theta^{(i)})S(\boldsymbol\theta^{(i)})$
Ahora $I^{-1}$ es una inversa de matriz, no un simple recíproco


Parámetros de interés vs. parámetros molestos (nuisance parameters). En la práctica casi nunca te interesan todos los componentes de $\boldsymbol\theta$ por igual. Por ejemplo, en una regresión normal, te importa mucho el coeficiente $\beta$ que mide el efecto de una variable, pero la varianza $\sigma^2$ del error usualmente es solo un estorbo necesario para las cuentas, no el objeto de interés. Se separa entonces $\boldsymbol\theta=(\boldsymbol\alpha,\boldsymbol\beta)$, donde $\boldsymbol\alpha$ son los parámetros molestos y $\boldsymbol\beta$ los de interés.

La matriz de información se divide en bloques:

$$I(\boldsymbol\alpha,\boldsymbol\beta) = \begin{bmatrix} I_{\alpha\alpha} & I_{\alpha\beta} \ I_{\beta\alpha} & I_{\beta\beta}\end{bmatrix}$$

Bloque
Tamaño
Qué mide
$I_{\alpha\alpha}$
$p\times p$
Curvatura respecto a los parámetros molestos entre sí
$I_{\beta\beta}$
$q\times q$
Curvatura respecto a los parámetros de interés entre sí
$I_{\alpha\beta}$, $I_{\beta\alpha}$
$p\times q$, $q\times p$
Cómo se "mezcla" la curvatura entre los dos grupos


Para hacer inferencia solo sobre $\boldsymbol\beta$, "limpiando" el efecto de $\boldsymbol\alpha$, se usa la matriz de información ajustada:

$$I^{\beta\beta}(\hat{\boldsymbol\alpha}\beta,\boldsymbol\beta) = \left[I{\beta\beta} - I_{\beta\alpha}I_{\alpha\alpha}^{-1}I_{\alpha\beta}\right]^{-1}$$

Intuición de esta fórmula (sin álgebra matricial pesada): si $\boldsymbol\alpha$ y $\boldsymbol\beta$ fueran completamente independientes en su efecto sobre la verosimilitud, los bloques cruzados $I_{\alpha\beta}$ serían cero, y esta fórmula se reduciría simplemente a $I_{\beta\beta}^{-1}$ — no habría ningún ajuste que hacer. El término $I_{\beta\alpha}I_{\alpha\alpha}^{-1}I_{\alpha\beta}$ es exactamente el "descuento" que hay que hacerle a $I_{\beta\beta}$ para reflejar que parte de la información sobre $\boldsymbol\beta$ ya se "gastó" en tener que estimar $\boldsymbol\alpha$ al mismo tiempo. Esta misma idea — separar información en la parte que "sabe" del parámetro de interés y la parte que se pierde por tener que estimar parámetros molestos junto con él — reaparece constantemente en estadística aplicada (por ejemplo, es la razón detrás de por qué los grados de libertad de un modelo se reducen según cuántos parámetros estimas).
1.11 Estadísticos suficientes
Idea central: cuando tienes una muestra completa $\mathbf{y}=(y_1,\ldots,y_n)$, a veces puedes resumirla en un solo número (o unos pocos números) sin perder ninguna información relevante para estimar $\theta$. Ese resumen se llama estadístico suficiente.

Formalmente, un estadístico $T(\mathbf{Y})$ es suficiente para $\theta$ si la densidad conjunta se puede factorizar como

$$f(\mathbf{y};\theta) = f_1(T(\mathbf{y});\theta)\cdot f_2(\mathbf{y}\mid T(\mathbf{y});\theta)$$

donde la segunda pieza, $f_2$, no depende de $\theta$. Es decir: toda la dependencia de $\theta$ en los datos completos está "contenida" en $T(\mathbf{y})$; el resto de la información en la muestra (más allá de $T$) no aporta nada extra sobre $\theta$.

Teorema de factorización. Este mismo criterio se puede escribir en términos de la verosimilitud: $T(\mathbf{Y})$ es suficiente para $\theta$ si y solo si existen funciones $m_1$ y $m_2$ tales que

$$L(\theta;\mathbf{y}) = m_1(T(\mathbf{y}),\theta)\cdot m_2(\mathbf{y})$$

(la demostración no se cubre en el curso, pero el resultado es la herramienta práctica: basta con mirar la fórmula de $L(\theta)$ y ver si se puede separar en una parte que depende de $\theta$ solo a través de algún resumen $T(\mathbf{y})$, y otra parte que no depende de $\theta$ en absoluto.)

Ejemplos concretos:

Poisson: vimos que $\ell(\theta)=n\bar y\log\theta - n\theta$ depende de los datos solo a través de $\bar y$. Por lo tanto, $\bar y$ (o, equivalentemente, la suma $\sum y_i$) es el estadístico suficiente — no necesitas guardar los 10 valores individuales de caídas por residente, basta con su suma o promedio.
Binomial/Bernoulli: de igual forma, el número total de éxitos $y=\sum y_i$ es suficiente — no importa en qué orden ocurrieron los éxitos y fracasos, solo cuántos hubo en total.
Regresión con ligadura canónica (esto se ve formalmente hasta el módulo 2, pero se menciona aquí): $X^\top\mathbf{y}$ resulta ser un estadístico suficiente para el vector $\boldsymbol\beta$.

Por qué importa en la práctica: el principio de suficiencia formaliza matemáticamente algo que los programas estadísticos hacen todo el tiempo sin que te des cuenta — muchas rutinas de estimación solo necesitan calcular ciertas sumas o promedios de los datos (no cada dato individual) para producir el estimador óptimo. También es la base teórica de por qué, en muchos modelos, "colapsar" los datos en tablas de frecuencias no pierde información para la estimación.


MÓDULO 2 — La familia exponencial y los modelos lineales generalizados
2.1 Por qué generalizar el modelo lineal
Recordemos el modelo de regresión lineal ordinario:

$$y_i = x_i^\top\beta + \varepsilon_i, \qquad \varepsilon_i \overset{iid}{\sim} N(0,\sigma^2)$$

Esto asume que $y_i$ es normal, con varianza constante, y que la media se modela directamente como combinación lineal de las covariables. En la práctica, muchísimos datos no cumplen ninguno de esos dos supuestos:

Datos binarios (vivo/muerto, sí/no): no pueden ser normales — solo toman dos valores.
Conteos (número de accidentes, número de visitas): no pueden ser normales — son enteros no negativos, y su varianza casi nunca es constante (típicamente crece con la media).
Proporciones y tasas: están acotadas entre 0 y 1 (o entre 0 e infinito para tasas), así que una combinación lineal sin restricciones puede predecir valores imposibles (como una probabilidad de 1.3).

El modelo lineal generalizado (GLM) resuelve esto en dos frentes a la vez, y ambos frentes usan directamente lo que ya construimos en el módulo 1.
2.2 La familia exponencial: una plantilla algebraica común
La observación clave: normal, Poisson, binomial, gamma, exponencial, binomial negativa — todas estas distribuciones, que parecen muy distintas entre sí, se pueden escribir con la misma forma algebraica general:

$$f(y_i;\theta_i,\phi) = \exp\left{\frac{y_i\theta_i - b(\theta_i)}{a_i(\phi)} + c(y_i;\phi)\right}$$

Símbolo
Nombre
Qué es / para qué sirve
$\theta_i$
Parámetro canónico (o parámetro natural)
Determina la "posición" de la distribución; distinto para cada observación si las covariables cambian
$\phi$
Parámetro de dispersión / escala
Determina qué tan dispersos están los datos; el mismo para todas las observaciones $i=1,\ldots,n$
$a_i(\phi)$
Función de dispersión
Frecuentemente de la forma $a_i(\phi)=\phi/w_i$, donde $w_i$ es un peso conocido (por ejemplo, el tamaño de muestra en una binomial)
$b(\theta_i)$
Función de "normalización" (a veces llamada función cumulante)
De aquí salen automáticamente la media y la varianza (ver 2.3) — es la pieza más importante de toda la plantilla
$c(y_i;\phi)$
Función residual
Todo lo que no depende de $\theta$; agrupa constantes de normalización


Por qué esta plantilla es tan útil: una vez que identificas $a$, $b$ y $c$ para una distribución específica, se pueden derivar automáticamente (sin volver a hacer cálculo desde cero) la media, la varianza y muchas otras propiedades — como se muestra a continuación.
2.3 De la plantilla salen la media y la varianza gratis
Tomemos la log-verosimilitud de una sola observación de la familia exponencial:

$$\ell(\theta,\phi;y) = \frac{y\theta-b(\theta)}{a(\phi)}+c(y;\phi)$$

Score e información (derivando respecto a $\theta$):

$$S(\theta)=\frac{\partial\ell}{\partial\theta}=\frac{y-b'(\theta)}{a(\phi)} \qquad\qquad I(\theta) = -\frac{\partial^2\ell}{\partial\theta^2}=\frac{b''(\theta)}{a(\phi)}$$

Ahora usamos dos propiedades generales, muy básicas, de cualquier función de verosimilitud (válidas bajo condiciones de regularidad estándar, que no se profundizan en el curso mas que mencionar que existen):

$E{S(\theta)}=0$. Esto es cierto siempre, para cualquier distribución, no solo la familia exponencial — es una consecuencia de que $\int f(y;\theta),dy=1$ para todo $\theta$ (la densidad siempre integra a 1, sin importar el parámetro), y de derivar esa igualdad respecto a $\theta$.
$E{-\ell''(\theta)} = E{(\ell'(\theta))^2}$, es decir, la información esperada es igual a la varianza del score. Esta es otra identidad general (se obtiene derivando la propiedad anterior una vez más).

Aplicando la propiedad 1 a la familia exponencial:

$$E{S(\theta)}=0 \quad\Longrightarrow\quad E\left{\frac{Y-b'(\theta)}{a(\phi)}\right}=0 \quad\Longrightarrow\quad E(Y) = b'(\theta)$$

$$\boxed{\mu = b'(\theta)}$$

Aplicando la propiedad 2:

$$E{S(\theta)^2} = E\left{\frac{b''(\theta)}{a(\phi)}\right} \quad\Longrightarrow\quad \frac{\text{var}(Y)}{a(\phi)^2} = \frac{b''(\theta)}{a(\phi)}$$

$$\boxed{\text{var}(Y) = b''(\theta),a(\phi)}$$

Lo que esto significa en la práctica: una vez que escribes la densidad de una distribución en la forma de la familia exponencial e identificas $b(\theta)$, obtienes la media derivando una vez y la varianza derivando dos veces — sin tener que hacer ninguna integral. Es una fórmula "de fábrica" que funciona igual para normal, Poisson, binomial, gamma, etc.

Función de varianza $V(\mu)$. La pieza $b''(\theta)$, vista como función de la media $\mu$ (en vez de $\theta$), se llama función de varianza:

$$\text{var}(Y) = V(\mu),a(\phi)$$

Esta función es clave porque describe la relación entre la media y la dispersión — algo que en el modelo normal ordinario simplemente no existe (ahí la varianza es constante, sin importar la media), pero que en la mayoría de los demás miembros de la familia exponencial sí es central. Por ejemplo, como veremos, en la Poisson $V(\mu)=\mu$: entre mayor sea el conteo esperado, mayor su variabilidad — algo intuitivo (esperar en promedio 100 clientes por día tiene naturalmente más variación absoluta que esperar 2).
2.4 Especificando un GLM: los tres componentes
$$g(\mu_i) = \eta_i = x_i^\top\beta$$

Componente
Qué es
Ejemplos
Componente aleatorio
La distribución de $Y_i$, un miembro de la familia exponencial
Normal, Poisson, binomial, gamma...
Componente sistemático (predictor lineal)
$\eta_i=x_i^\top\beta$, la combinación lineal de covariables y coeficientes
Igual que en regresión lineal ordinaria
Función de ligadura $g$
La función que conecta la media $\mu_i=E(Y_i)$ con el predictor lineal $\eta_i$
Identidad, log, logit...


Condición sobre $g$: debe ser monótona (siempre creciente o siempre decreciente) y diferenciable. Esto garantiza que se pueda "deshacer" — que exista $g^{-1}$ — y que las derivadas necesarias para estimar $\beta$ (por Newton-Raphson, igual que en el módulo 1, pero ahora en versión vectorial) estén bien definidas.

Por qué modelar $g(\mu_i)$ y no $\mu_i$ directamente. Dos razones prácticas:

Restricciones de rango. Si $\mu_i$ debe ser positivo (como una tasa Poisson) o estar entre 0 y 1 (como una probabilidad), pero $x_i^\top\beta$ puede tomar cualquier valor real, entonces modelar $\mu_i$ directamente puede producir predicciones imposibles. Modelar $g(\mu_i)=\eta_i$ con una $g$ elegida adecuadamente (log, logit) resuelve esto automáticamente: por más que $\eta_i$ varíe libremente, $g^{-1}(\eta_i)$ siempre cae en el rango correcto.
Relación media-varianza. Como vimos, en la mayoría de miembros de la familia exponencial la varianza depende de la media. Elegir bien la ligadura ayuda a que el modelo capture esa relación de forma razonable (por ejemplo, la ligadura log para Poisson hace que un cambio de una unidad en una covariable corresponda a un cambio multiplicativo, no aditivo, en la tasa esperada — algo mucho más natural para conteos).
2.5 Ligadura canónica
Existe una elección especial de $g$: hacer que el parámetro canónico de la distribución coincida exactamente con el predictor lineal,

$$\theta_i = \eta_i = x_i^\top\beta$$

A esto se le llama ligadura canónica. Cuando se usa, la log-verosimilitud para toda la muestra toma una forma particularmente simple:

$$\ell(\beta,\phi;\mathbf{y}) = \sum_{i=1}^n\frac{y_ix_i^\top\beta - b(x_i^\top\beta)}{a_i(\phi)}+c(y_i;\phi) = \sum_{j=1}^p\beta_j\left(\sum_{i=1}^n\frac{y_ix_{ij}}{a_i(\phi)}\right) - \sum_{i=1}^n\frac{b(x_i^\top\beta)}{a_i(\phi)} + \sum_{i=1}^n c(y_i;\phi)$$

Lo que hay que notar de esta expresión: si $\phi$ es conocida, la log-verosimilitud depende de los datos solo a través de las combinaciones $\sum_i y_ix_{ij}$ para cada $j$ — es decir, a través de $X^\top\mathbf{y}$. Esto significa (por el teorema de factorización del módulo 1) que $X^\top\mathbf{y}$ es un estadístico suficiente para $\beta$: toda la información relevante de los $n$ datos individuales para estimar los coeficientes de regresión está contenida en ese resumen matricial.

¿Se debe usar siempre la ligadura canónica? No necesariamente. Tiene ventajas estadísticas (buenas propiedades de suficiencia, algoritmos de estimación algo más simples, ciertas garantías de concavidad de la verosimilitud que facilitan la convergencia numérica), pero la elección de ligadura en la práctica debería basarse, sobre todo, en qué tan bien ajusta el modelo a los datos y en la interpretabilidad del contexto — no solo en la conveniencia matemática. Dicho esto, en los casos más comunes (normal, Poisson, binomial) la ligadura canónica resulta ser también la más natural e interpretable, como veremos.
2.6 Los tres casos clásicos, derivados paso a paso
2.6.1 Distribución normal
Partimos de la densidad normal usual y la reacomodamos algebraicamente hasta que quede en la forma de la familia exponencial:

$$f(y;\mu,\sigma^2) = \frac{1}{\sqrt{2\pi\sigma^2}}\exp\left{-\frac{(y-\mu)^2}{2\sigma^2}\right} = \exp\left{\frac{y\mu-\mu^2/2}{\sigma^2} - \frac{y^2}{2\sigma^2}-\frac{\log(2\pi\sigma^2)}{2}\right}$$

Comparando término a término con la plantilla general:

Elemento
Valor para la normal
$\theta$
$\mu$
$\phi$
$\sigma^2$
$a(\phi)$
$\phi$
$b(\theta)$
$\theta^2/2$
Media: $b'(\theta)$
$\theta=\mu$ ✓ (coincide con lo que ya sabíamos)
Varianza: $b''(\theta)a(\phi)$
$1\cdot\sigma^2=\sigma^2$ ✓
Función de varianza $V(\mu)$
$1$ (constante — la varianza no depende de la media)
Ligadura canónica
$\eta=\theta=\mu$, es decir, la identidad


Esto confirma, con la maquinaria general, algo que probablemente ya sabías intuitivamente: la regresión lineal ordinaria es "el GLM normal con ligadura identidad", y es el único de los tres casos clásicos donde la varianza no depende de la media.
2.6.2 Distribución Poisson
$$f(y;\lambda) = \frac{\lambda^y e^{-\lambda}}{y!} = \exp{y\log\lambda - \lambda - \log y!}$$

Elemento
Valor para la Poisson
$\theta$
$\log\lambda$
$\phi$
$1$ (fijo, no hay parámetro de dispersión libre)
$a(\phi)$
$1$
$b(\theta)$
$e^\theta=\lambda$
Media: $b'(\theta)$
$e^\theta=\lambda=\mu$
Varianza: $b''(\theta)a(\phi)$
$e^\theta\cdot 1=\mu$
Función de varianza $V(\mu)$
$\mu$ (la varianza crece con la media, en proporción exacta 1 a 1)
Ligadura canónica
$\eta=\theta=\log\mu$, es decir, el logaritmo


Por qué la ligadura log tiene sentido aquí, más allá de ser la canónica: una tasa o conteo esperado $\mu_i$ siempre debe ser positivo. Si modelas $\log\mu_i=x_i^\top\beta$, entonces $\mu_i=e^{x_i^\top\beta}$ es automáticamente positivo sin importar qué valores tome $x_i^\top\beta$. Además, la interpretación de los coeficientes se vuelve multiplicativa: un incremento de una unidad en una covariable $x_j$ multiplica la tasa esperada por $e^{\beta_j}$ (en vez de sumarle $\beta_j$), lo cual suele ser más razonable para conteos (por ejemplo, "cada año adicional de antigüedad multiplica por 1.1 el número esperado de reclamaciones" es más natural que "le suma 3 reclamaciones").

Nota práctica (el offset). En regresión de Poisson es muy común que las unidades observadas no tengan la misma "exposición" — por ejemplo, distintas escuelas con distinto número de estudiantes, o distintos periodos de seguimiento con distinta duración. Para eso se agrega un término llamado offset: en vez de modelar $\log\mu_i = x_i^\top\beta$, se modela $\log\mu_i = \log(\text{exposición}_i) + x_i^\top\beta$, de forma que el modelo en realidad describe una tasa (eventos por unidad de exposición) y no un conteo bruto. Esto no cambia nada de la teoría que acabamos de ver — es simplemente fijar uno de los "coeficientes" en 1 de antemano.
2.6.3 Distribución binomial
Partiendo de $V\sim\text{Bin}(n,\pi)$ y trabajando con la proporción $Y=V/n$ (para que quede en términos de una sola observación "promedio"):

$$f(y;\pi) = \exp\left{\frac{y\log{\pi/(1-\pi)}+n\log(1-\pi)}{n^{-1}} + \log\binom{n}{ny}\right}$$

Elemento
Valor para la binomial
$\theta$
$\log{\pi/(1-\pi)}$ (el logit de $\pi$)
$\phi$
$1$; $w=n$
$a(\phi)$
$\phi/w=1/n$
$b(\theta)$
$\log(1+e^\theta) = -\log(1-\pi)$
Media: $b'(\theta)$
$e^\theta/(1+e^\theta) = \pi = \mu$
Varianza: $b''(\theta)a(\phi)$
$\pi(1-\pi)/n = \mu(1-\mu)/n$
Función de varianza $V(\mu)$
$\mu(1-\mu)$ (máxima en $\mu=0.5$, mínima cerca de 0 o 1)
Ligadura canónica
$\eta=\theta=\log{\mu/(1-\mu)}$, es decir, el logit


Por qué la función de varianza $\mu(1-\mu)$ tiene sentido: si $\pi$ está cerca de 0 o de 1 (casi todos los ensayos dan el mismo resultado), hay muy poca variabilidad — casi no hay incertidumbre sobre el resultado de cada ensayo. Si $\pi=0.5$ (máxima incertidumbre posible por ensayo, como una moneda justa), la variabilidad es máxima. Esta forma de "joroba" (máxima en el centro, mínima en los extremos) es característica de cualquier variable binaria o proporción, y es un supuesto importante que distingue la regresión logística de simplemente "hacer una regresión lineal normal sobre datos de 0 y 1" (lo cual violaría justo este supuesto de varianza no constante).

Por qué el logit tiene sentido más allá de ser canónico: una probabilidad debe estar entre 0 y 1. El logit $\log{\pi/(1-\pi)}$ mapea ese intervalo acotado a toda la recta real; su inversa, la función logística $\pi=e^\eta/(1+e^\eta)$, siempre regresa un valor entre 0 y 1 sin importar qué tan grande o chico sea $\eta$. Esto es exactamente análogo a por qué usamos el log en Poisson: la ligadura garantiza que las predicciones del modelo siempre caigan en el rango físicamente posible.
2.7 Tabla resumen (las tres distribuciones lado a lado)


Normal
Poisson
Binomial
$\theta$ (parámetro canónico)
$\mu$
$\log\lambda$
$\log{\pi/(1-\pi)}$
$\phi$
$\sigma^2$
$1$
$1/n$
$a(\phi)$
$\phi$
$1$
$\phi$
$b(\theta)$
$\theta^2/2$
$e^\theta$
$\log(1+e^\theta)$
$c(y;\phi)$
$-\tfrac12{y^2/\phi+\log(2\pi\phi)}$
$-\log y!$
$\log\binom{n}{ny}$
Media $b'(\theta)$
$\mu$
$\lambda$
$\pi$
Varianza $b''(\theta)a(\phi)$
$\sigma^2$
$\mu$
$\mu(1-\mu)/n$
Función de varianza $V(\mu)$
$1$
$\mu$
$\mu(1-\mu)$
Ligadura canónica
Identidad
Log
Logit


Cómo leer esta tabla en una frase: la regresión lineal, la regresión de Poisson y la regresión logística no son tres técnicas separadas que aprendiste por coincidencia en distintos cursos — son la misma receta matemática (familia exponencial + predictor lineal + función de ligadura), aplicada tres veces cambiando solo qué fila de esta tabla usas.
2.8 Un miembro adicional, para no dejar nada suelto: la distribución gamma
Tus diapositivas se enfocan en normal, Poisson y binomial (que son, de hecho, el foco declarado del curso), pero vale la pena mencionar brevemente un cuarto caso clásico de la familia exponencial que verás mencionado en cualquier libro de texto de GLM (Dobson, McCullagh & Nelder, Agresti, todos en tu bibliografía): la distribución gamma, usada típicamente para variables continuas positivas y asimétricas (tiempos de espera, montos de reclamaciones de seguros, costos). A diferencia de la normal, en la gamma la varianza sí depende de la media: $V(\mu)=\mu^2$, es decir, la desviación estándar es proporcional a la media (coeficiente de variación constante) — un patrón muy común en datos de montos monetarios, donde observaciones más grandes también tienden a ser más variables en términos absolutos. Su ligadura canónica es el recíproco, $g(\mu)=1/\mu$, aunque en la práctica también se usa mucho la ligadura log por facilidad de interpretación. Se menciona aquí solo para que veas que la plantilla de la sección 2.2 no se agota en tres ejemplos — es un patrón general que cubre una familia mucho más amplia de distribuciones, incluyendo la binomial negativa y la exponencial que se mencionan en el temario del curso para el módulo de datos sobredispersos.
2.9 Lo que sigue (mencionado como pendiente en tus diapositivas): IRLS
Tus diapositivas marcan el tema de mínimos cuadrados ponderados iterativamente (Iteratively Reweighted Least Squares, IRLS) como pendiente, para verse más adelante junto con el módulo de datos sobredispersos. Vale la pena adelantar la idea en una frase, para que sepas dónde va a encajar cuando lo veas: IRLS es, precisamente, la versión vectorial de Newton-Raphson (sección 1.6 y 1.10) aplicada a la log-verosimilitud de un GLM (sección 2.5) — en cada iteración se resuelve un problema de mínimos cuadrados ponderado (donde los pesos cambian de una iteración a otra, de ahí el nombre), y esa secuencia de soluciones converge al estimador de máxima verosimilitud $\hat\beta$. Es decir: todo lo que viste en el módulo 1 sobre cómo encontrar $\hat\theta$ numéricamente reaparece aquí, solo que ahora el "$\theta$" es todo el vector de coeficientes de regresión $\beta$, y la estructura de familia exponencial + ligadura del módulo 2 es justo lo que permite escribir ese algoritmo de forma unificada para cualquier distribución de la familia exponencial y cualquier ligadura válida.
2.10 Ejemplo integrador: armando un GLM desde cero
Para cerrar, un ejemplo que junta todas las piezas del módulo 2 en un solo flujo, con un contexto ficticio pero realista.

Contexto: una aseguradora quiere modelar el número de reclamaciones que presenta cada asegurado en un año, en función de su edad y de si tiene historial de reclamaciones previas.

Paso 1 — elegir el componente aleatorio. El número de reclamaciones es un conteo no negativo → Poisson es un punto de partida razonable (con la salvedad, que se explora más adelante en el curso bajo "datos sobredispersos", de que en la práctica la varianza observada en datos de reclamaciones suele ser mayor que la media, violando $V(\mu)=\mu$ — pero como primer modelo, Poisson es el estándar).

Paso 2 — elegir el predictor lineal. $\eta_i = \beta_0 + \beta_1,\text{edad}_i + \beta_2,\text{historial}_i$.

Paso 3 — elegir la ligadura. Log (la canónica para Poisson), para garantizar que la tasa esperada de reclamaciones $\mu_i=e^{\eta_i}$ sea siempre positiva:

$$\log\mu_i = \beta_0+\beta_1,\text{edad}_i+\beta_2,\text{historial}_i$$

Paso 4 — interpretar (antes de ajustar nada). Gracias a la ligadura log, $e^{\beta_1}$ se interpreta como "el factor multiplicativo en la tasa esperada de reclamaciones por cada año adicional de edad, manteniendo fijo el historial". Si $\hat\beta_1=0.03$, entonces $e^{0.03}\approx 1.03$: cada año adicional de edad se asocia con un 3% más de reclamaciones esperadas.

Paso 5 — estimar. Con datos reales, $\hat\beta$ se encontraría maximizando la log-verosimilitud conjunta de todas las observaciones (la versión con $n$ términos de la sección 2.5), usando el algoritmo IRLS mencionado en 2.9 — que, como vimos, es solo Newton-Raphson vectorial aplicado a esta $\ell(\beta)$ específica.

Paso 6 — inferencia. Una vez estimado $\hat\beta$, se pueden construir pruebas e intervalos de confianza para cada coeficiente exactamente con las herramientas del módulo 1 (razón de verosimilitudes, Wald), solo que ahora usando la matriz de información $p\times p$ en vez del escalar $I(\theta)$.

Este ejemplo —aunque con datos inventados— resume el flujo completo: todo modelo lineal generalizado real que verás en la segunda mitad del curso (regresión logística para datos binarios, log-lineal para tablas de contingencia, Poisson para conteos) sigue exactamente estos seis pasos.


Glosario rápido (para consulta)
Término
Definición breve
Verosimilitud $L(\theta)$
Qué tan consistentes son los datos observados con cada valor posible de $\theta$
Log-verosimilitud $\ell(\theta)$
Logaritmo de lo anterior; mismo máximo, más fácil de derivar
Score $S(\theta)$
Pendiente de $\ell(\theta)$; cero en el máximo
Información $I(\theta)$
Curvatura de $\ell(\theta)$; mide precisión de la estimación
MLE $\hat\theta$
El valor de $\theta$ que maximiza $L(\theta)$ (o $\ell(\theta)$)
Estadístico suficiente
Resumen de los datos que no pierde información sobre $\theta$
Familia exponencial
Plantilla algebraica común a normal, Poisson, binomial, gamma, etc.
Parámetro canónico $\theta$
El parámetro "natural" de la familia exponencial
Parámetro de dispersión $\phi$
Controla la variabilidad, constante entre observaciones
Función de varianza $V(\mu)$
Cómo depende la varianza de la media
GLM
Modelo con componente aleatorio (familia exponencial) + predictor lineal + función de ligadura
Función de ligadura $g$
Conecta la media con el predictor lineal: $g(\mu)=\eta$
Ligadura canónica
Cuando $\theta=\eta$, es decir, el parámetro natural coincide con el predictor lineal
IRLS
El algoritmo (Newton-Raphson vectorial) usado para ajustar un GLM en la práctica




Fin del curso. Si quieres, en la siguiente sesión podemos hacer ejercicios de práctica (por ejemplo, derivar la familia exponencial para la distribución exponencial simple, o resolver a mano un problema de prueba de hipótesis tipo Wald vs. razón de verosimilitudes) para consolidar antes de avanzar al capítulo 3 de tus diapositivas.
