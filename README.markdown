# cl-libmitie

The low level binding of [MITIE](https://github.com/mit-nlp/MITIE).

[MITIE](https://github.com/mit-nlp/MITIE) stands for **MIT Information Extraction**. It provides free (even for commercial use) [state-of-the-art](https://github.com/mit-nlp/MITIE/wiki/Evaluation) information extraction tools. The current release includes tools for performing [named entity extraction](http://blog.dlib.net/2014/04/mitie-completely-free-and-state-of-art.html) and [binary relation detection](http://blog.dlib.net/2014/07/mitie-v02-released-now-includes-python.html) as well as tools for training custom extractors and relation detectors.

## Installation

You need to build [MITIE](https://github.com/mit-nlp/MITIE), clone this project into Quicklisp's local projects' path and then `ql:quickload` it.

## Author

* David Gu (macdavid313@gmail.com)

## Copyright

Copyright (c) 2017 David Gu (macdavid313@gmail.com)

## License

License is inherited from the original project, which is the Boost Software License - Version 1.0 License:

>  NO EVENT SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
