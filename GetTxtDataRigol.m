function scale = GetTxtDataRigol(filename)

% filename = 'Newfile01.txt';

% Define costant key words
Keyvaluescale = 'Scale';
Keyvaluedelimitator = '/';

% Opens and gets current file chars
fileid = fopen(filename, 'r+');
if fileid == -1
  error('Author:Function:OpenFile', 'Cannot open file: %s', filename);
end
tempstr = fscanf(fileid,"%c");

%% First part, for MEASUREMENTS values and prefix change

% if ~isempty(Keywords)
%     % Gets meas key word indexes
%     for ii = 1 : length(Keywords)
%         indexmeas(ii) = strfind(tempstr, Keywords(ii));
%     end
%     indexvaluecur = strfind(tempstr, Keyvaluecur);
% 
%     % gets meas values, puts them in a 3d matrix, converts them by their prefix
%     for jj = 1 : length(Keywords)
%         if jj ~= length(Keywords)
%             cellmeas(jj) = extractBetween(tempstr,indexvaluecur(jj),indexmeas(jj+1));
%         else
%             cellmeas(jj) = extractBetween(tempstr,indexvaluecur(jj),tempstr(end));
%         end
%         cellmeas{jj} = strrep(cellmeas{jj},'Cur Low signal','0');
%         cellmeas{jj} = strrep(cellmeas{jj},'Cur No edges','0');
%         meas(jj) = sip2num(cellmeas{jj});
%     end
% else
%     meas = 0;
% end
%% Second part, for scale values and prefix change

% Gets scale key word indexes
indexvaluescale = strfind(tempstr, Keyvaluescale);
indexvaluedelimitator = strfind(tempstr, Keyvaluedelimitator);

% gets scale values, puts them in a 3d matrix, converts them by their prefix
for ll = 1 : 2
    cellscale(ll) = extractBetween(tempstr,indexvaluescale(ll),indexvaluedelimitator(ll));
    scale(ll) = sip2num(cellscale{ll});
end

% Closes file
fclose('all');

end