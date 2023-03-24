% force_tendon = zeros(size(lt)); % vector stores force produced by tendon
% for i = 1: length(lt)
%     tend_tens = 0; % for when lt < l_see
% 
%     if lt(i) >= l_see0
%         tend_tens = ((l_t - l_see0)^2)*k_see;
%     end
%     force_tendon(i) = tend_tens; % add value to vector
% end

% 
% function [f_see] = get_passive_force_series(lt)
% 
% % Inputs
% % lt: normalized length of tendon (series elastic element)
% 
% % Output
% % f_see: passive force when muscle fibre longer than resting length (due to
% % series element)
% 
% slack_length = 1  % resting length of tendon
% contract = lt >= slack_length;   % 1 if true, else 0
% normalize_tendon_force = contract.*(10*(lt - slack_length) + 240*(lt - slack_length).^2)
% end
