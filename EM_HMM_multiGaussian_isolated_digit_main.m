function EM_HMM_multiGaussian_isolated_digit_main()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lee-Min Lee, Hoang-Hiep Le
% EE Department, Dayeh University
% version 1 (2017-08-31)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is the main function. Please run this first.

main_dr_wav2mfcc_e_d_a;
generate_selected_TI_isolated_digits_testing_list_mat;
generate_selected_TI_isolated_digits_training_list_mat;
% generate_trainingfile_list;
% generate_testingfile_list;
training_file_list_name = 'trainingfile_list.mat';
testing_file_list_name = 'testingfile_list.mat';

DIM = 39; % dimension of a feature vector
num_of_model = 11; % number of models: digit '0', digit '1',... digit '9'
num_of_state_start = 13; 
num_of_state_end = 13;
accuracy_rate = zeros(1,num_of_state_end);

for num_of_state = num_of_state_start : num_of_state_end; 
    % notice: number of state does not including START and END node in HMM
    HMM = EM_HMMtraining_multiGaussian(training_file_list_name, DIM, num_of_model, num_of_state);  % training phase
    accuracy_rate(num_of_state) = HMMtesting(HMM, testing_file_list_name);                       % testing phase
    fprintf('num_of_state: %d, accuracy_rate: %f\n',num_of_state, accuracy_rate(num_of_state));
    save accuracy_rate;    
end
end
