function results = mapEachFile(directory, func)
    files = dir(directory);
    results = cell2mat(arrayfun(@(x) func([directory filesep x.name]), files(3:size(files)), 'UniformOutput', false));
end