var documenterSearchIndex = {"docs":
[{"location":"quickstart/#","page":"Quick Start","title":"Quick Start","text":"coming soon","category":"page"},{"location":"introduction/#Introduction-1","page":"Introduction","title":"Introduction","text":"","category":"section"},{"location":"introduction/#Time-Domain-Analysis-1","page":"Introduction","title":"Time-Domain Analysis","text":"","category":"section"},{"location":"introduction/#","page":"Introduction","title":"Introduction","text":"The time-domain analysis contains the following analysis methods:","category":"page"},{"location":"introduction/#","page":"Introduction","title":"Introduction","text":"Mean: This is the mean value of the RR intervals. It is calculated by summing all NN intervals and then dividing by their number. Read more\nSDNN: This is the standard deviation of the NN intervals. Read more\nRMSSD: This is the root mean square of the differences between successive NN intervals. Read more\nSDSD: This is the standard deviation of the differences between successive NN intervals. Read more\nNN20/NN50: This is the number of pairs of successive NN intervals that differ by more than 20ms/50ms. Read more\npNN20/pNN50: This is the percentage of pairs of successive NN intervals that differ by more than 20ms/50ms. Read more\nrRR: The relative RR intervals are calculated using the equation for i=2...n rrunderseti=frac2*(RRunderseti-RRunderseti-1)RRunderseti-RRunderseti-1 where n is the number of RR intervals.\nThe HRV is measured by the median of the euclidean distances of the relative RR intervals to the average of the relative RR intervals. Read more","category":"page"},{"location":"introduction/#Frequency-Domain-Analysis-1","page":"Introduction","title":"Frequency-Domain Analysis","text":"","category":"section"},{"location":"introduction/#","page":"Introduction","title":"Introduction","text":"Frequency domain analysis uses a Lomb Scargle Transformation to determine the power spectral density of each frequency domain. The frequency bands are defined as follows:","category":"page"},{"location":"introduction/#","page":"Introduction","title":"Introduction","text":"VLF: very low frequency, from 0.003 to 0.04 Hz\nLF: low frequency, from 0.04 to 0.15\nHF: high frequency, from 0.15 to 0.4\nLF/HF: The ratio of LF and HF\nTotal Power: The sum of VLF, LF and HF","category":"page"},{"location":"introduction/#","page":"Introduction","title":"Introduction","text":"Read more","category":"page"},{"location":"introduction/#Nonlinear-Analysis-1","page":"Introduction","title":"Nonlinear Analysis","text":"","category":"section"},{"location":"introduction/#","page":"Introduction","title":"Introduction","text":"Approximate entropy:\nSample entropy:\nHurst exponent:\nRényi entropy:","category":"page"},{"location":"LICENSE/#","page":"License","title":"License","text":"Copyright (c) 2020 Jasmin Walter <jasmin.walter@mni.thm.de>","category":"page"},{"location":"LICENSE/#","page":"License","title":"License","text":"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:","category":"page"},{"location":"LICENSE/#","page":"License","title":"License","text":"The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.","category":"page"},{"location":"LICENSE/#","page":"License","title":"License","text":"THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.","category":"page"},{"location":"installation/#","page":"Installation","title":"Installation","text":"coming soon","category":"page"},{"location":"#API-1","page":"API","title":"API","text":"","category":"section"},{"location":"#Data-import-1","page":"API","title":"Data import","text":"","category":"section"},{"location":"#","page":"API","title":"API","text":"The following functions are used to import data. They return the read data in an array.","category":"page"},{"location":"#","page":"API","title":"API","text":"infile","category":"page"},{"location":"#HRV.infile","page":"API","title":"HRV.infile","text":"infile(file)\n\nThis function reads the data from a txt or csv file.\n\nArguments:\n\nfile: is the path of the input file\n\n\n\n\n\ninfile(record,annotator)\n\nThis function reads the data from a wbdb file.\n\nArguments:\n\nrecord: is the name of the record\nannotator: is the annotator of the record\n\n\n\n\n\n","category":"function"},{"location":"#Analysis-1","page":"API","title":"Analysis","text":"","category":"section"},{"location":"#","page":"API","title":"API","text":"The following functions are used to analyze the data using time series, frequency or nonlinear methods. Each of them returns a NamedTuple containing the results of the analysis.","category":"page"},{"location":"#","page":"API","title":"API","text":"time_domain\nfrequency\nnonlinear","category":"page"},{"location":"#HRV.time_domain","page":"API","title":"HRV.time_domain","text":"time_domain(n)\n\nArguments:\n\nn: the array that contains the NN-inetrvals\n\nResults:\n\nmean: the mean value\nsdnn: the standard deviation\nrmssd: the root mean square of successive differences\nsdsd: the standard deviation of successive differences\nnn50: the number of successive NN intervals with an interval smaller than 50 ms\npnn50: the percentage of successive NN intervals with an interval smaller than 50 ms\nnn20: the number of successive NN intervals with an interval smaller than 20 ms\npnn20: the percentage of successive NN intervals with an interval smaller than 20 ms\nrRR: the percentage of relative RR intervals\n\n\n\n\n\n","category":"function"},{"location":"#HRV.frequency","page":"API","title":"HRV.frequency","text":"frequency(n)\n\nArguments:\n\nn: the array that contains the NN-inetrvals\n\nResults:\n\nvlf: the very low-frequency power\nlf: the low-frequency power\nhf: the high-frequency power\nlfhfratio: the lf/hf ratio\ntp: the total power\n\n\n\n\n\n","category":"function"},{"location":"#HRV.nonlinear","page":"API","title":"HRV.nonlinear","text":"nonlinear(n,m=2,r=6)\n\nArguments:\n\nn: the array that contains the NN-inetrvals\nm: the embedding dimension, default=2\nr: the tolerance, default=6\n\nResults:\n\napen: the approximate entropy\nsampen: the sample entropy\nhurst: the hurst exponent\nrenyi0, renyi1, renyi2: the Rényi entropy of order 0,1 and 2\n\n\n\n\n\n","category":"function"}]
}
