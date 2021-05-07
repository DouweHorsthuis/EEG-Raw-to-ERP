subject_list = {'1002_first' '1003_first' '1005_first' '1019_first' '1020_first' '1023_first' '1028_first' '1029_first' '1031_first' ,...
    '1032_first' '1034_first' '1037_first' '1046_first' '1047_first' '1048_first' '1055_first' '1060_first' '1063_first' ,...
    '1065_first' '1067_first' '1070_first' '1071_first' '1074_first' '1083_first' '1086_first' '1087_first' '1220_first' ,...
    '1227_first' '1275_first' '10056_first' '10098_first' '10158_first' '10162_first' '10162_first' '10165_first'  ,...
    '10206_first' '10281_first' '10293_first' '10331_first' '10467_first' '10553_first' '10561_first' '10562',...
    '10586_first' '10639_first' '10648_first' '10696_first' '10722_first' '10780_first' '10844_first' '10867',...
    '10951_first' '10956_first' '12004_first' '12006_first' '12038_first' '12168_first' '12177_first' '12188',...
    '12223_first' '12370_first' '12413_first' '12588_first' '12611_first' '12966_first' ,...
    '1002' '1003' '1005' '1019' '1020' '1023' '1028' '1029' '1031' ,...
    '1032' '1034' '1037' '1046' '1047' '1048' '1055' '1060' '1063' ,...
    '1065' '1067' '1070' '1071' '1074' '1083' '1086' '1087' '1220' ,...
    '1227' '1275' '10056' '10098' '10158' '10162' '10162' '10165'  ,...
    '10206' '10281' '10293' '10331' '10467' '10553' '10561' '10562',...
    '10586' '10639' '10648' '10696' '10722' '10780' '10844' '10867',...
    '10951' '10956' '12004' '12006' '12038' '12168' '12177' '12188',...
    '12223' '12370' '12413' '12588' '12611' '12966'};

nsubj = length(subject_list); % number of subjects
home_path  = '\\data.einsteinmed.org\users\Ana and Douwe\AFT project\Data\';

for s=90:nsubj
    fprintf('\n******\nProcessing subject %s\n******\n\n', subject_list{s});
    bad_chan = [];
    % Path to the folder containing the current subject's data
    data_path  = [home_path subject_list{s} '\'];
    EEG = pop_loadset('filename', [subject_list{s} '_exchn.set'], 'filepath', data_path);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
    pop_eegplot( EEG, 1, 1, 1);
    prompt = 'Delete channels? If yes, input them all as strings inside {}. If none hit enter ';
    bad_chan = input(prompt); %
    if isempty(bad_chan) ~=1
    EEG = pop_select( EEG, 'nochannel',bad_chan);
    EEG = pop_saveset( EEG, 'filename',[subject_list{s} '_exchn.set'],'filepath', data_path);
    end
    close all
end