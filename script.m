% Specify the name of the .mat file
matFileName = 'matlab3.mat';

% Load the .mat file
loadedData = load(matFileName);

% Get a list of variable names in the loaded data
variableNames = fieldnames(loadedData);

% Display the list of variable names
disp('Variables in the .mat file:');
disp(variableNames);

% Example: Accessing a specific variable
if isfield(loadedData, 'out')
    
    yourVariable = loadedData.out.executionProfile.Sections;
   
else
    disp('Variable "yourVariableName" not found in the .mat file.');
    end
Validnum = [];
for i = 1:length(loadedData.out.executionProfile.Sections)
   if loadedData.out.executionProfile.Sections(1,i).NumCalls>50 && strcmp(loadedData.out.executionProfile.Sections(1,i).Name(1:3),'SwC')
        Validnum = [Validnum,loadedData.out.executionProfile.Sections(1,i).Number];  % Appen
       %disp(loadedData.out.executionProfile.Sections(1,i).Number)
   end
end
disp(Validnum)

for i=1:length(Validnum)   
fprintf('The component %s has the id number %d  and the maximumticks %d \n',loadedData.out.executionProfile.Sections(1,Validnum(1,i)).Name,Validnum(1,i),loadedData.out.executionProfile.Sections(1,Validnum(1,i)).MaximumExecutionTimeInTicks)

end


