function sigma123 = importSigma123_file(filename, dataLines)
%IMPORTFILE Import data from a text file
%  SIGMA123 = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the numeric data.
%
%  SIGMA123 = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  sigma123 = importfile("/Users/nadavwetzler/Dropbox/Public/DataSet/Strain3D/Dunham_dolomite.txt", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 11-Sep-2021 14:43:21

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 3);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["s1s2s3", "VarName2", "VarName3"];
opts.VariableTypes = ["double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
sigma123 = readtable(filename, opts);

%% Convert to output type
sigma123 = table2array(sigma123);
end