classdef str
    properties
        val
    end
    methods
        % constructor
        function obj = str(varargin)
            assert(nargin < 2);
            if nargin == 1
                obj.val = getChar(varargin{1});
            else
                obj.val = '';
            end
        end
        function display(obj)
            obj.val
        end
        function torf = eq(obj1, obj2)
            torf = strcmp(getChar(obj1), getChar(obj2));
        end
        function torf = ne(obj1, obj2)
            torf = ~strcmp(getChar(obj1), getChar(obj2));
        end
        function output_str = plus(obj1, obj2)
            output_str = str([getChar(obj1) getChar(obj2)]);
        end
        function output_str = mtimes(obj1, obj2)
            assert(isnumeric(obj2));
            assert(length(obj2) == 1);
            assert(int8(obj2) >= 0);
            output_str = str();
            for i = 1:int8(obj2)
                output_str = output_str + obj1;
            end
        end
        %% These has bugs, so these are curretly commented out.
        % 'abc'[2] -> 'c' (should be 'b' by this function)
        % function output_str = subsindex(obj, ind)
        %     output_str = str(obj.val(ind));
        % end
        % 'aaa'[1:2] -> 'aa'
        % function output_str = subsref(obj, ind)
        %     output_str = str(obj.val(ind.subs{1}));
        % end
        function torf = in(obj1, obj2)
            res = str(obj2).find(obj1.val);
            if res < 0
                torf = false;
            else
                torf = true;
            end
        end
        function ind = find(obj1, obj2)
            res = strfind(obj1.val, getChar(obj2));
            if length(res) == 0
                ind = -1;
            else
                ind = res(1);
            end
        end
        function ind = rfind(obj1, obj2)
            res = strfind(obj1.val, getChar(obj2));
            if length(res) == 0
                ind = -1;
            else
                ind = res(end);
            end
        end
        function output_str = join(obj, targ_obj)
            output_str = getChar(targ_obj{1});
            for i = 2:size(targ_obj, 2)
                output_str = [output_str obj.val getChar(targ_obj{i})];
            end
            output_str = str(output_str);
        end
        function output_str = replace(obj, oldStr, newStr)
            output_str = strrep(obj.val, getChar(oldStr), getChar(newStr));
            output_str = str(output_str);
        end
        function output_str = lstrip(obj, to_be_removed)
            assert(nargin < 3);
            base_ind = zeros(1, length(obj.val));
            if nargin == 1
                base_ind = isspace(obj.val);
            else
                to_be_removed = getChar(to_be_removed);
                for i = 1:length(to_be_removed)
                    base_ind = base_ind | (obj.val == to_be_removed(i));
                end
            end
            output_str = str();
            for i = 1:length(base_ind)
                if ~base_ind(i)
                    output_str = str(obj.val((i):length(obj.val)));
                    break;
                end
            end
        end
        function output_str = rstrip(obj, to_be_removed)
            assert(nargin < 3);
            targ_str = str(fliplr(obj.val));
            if nargin == 1
                targ_str = targ_str.lstrip();
            else
                targ_str = targ_str.lstrip(to_be_removed);
            end
            output_str = str(fliplr(targ_str.val));
        end
        function output_str = strip(obj, to_be_removed)
            assert(nargin < 3);
            if nargin == 1
                output_str = str(strtrim(obj.val));
            else
                output_str = obj.rstrip(to_be_removed).lstrip(to_be_removed);
            end
        end
        function output_str = split(obj, delimiter)
            assert(nargin < 3);
            if nargin == 1
                output_str = strsplit(obj.val);
            else
                output_str = strsplit(obj.val, delimiter);
            end
            for i = 1:length(output_str)
                output_str{i} = str(output_str{i});
            end
        end
        function output_str = upper(obj)
            output_str = str(upper(obj.val));
        end
        function output_str = lower(obj)
            output_str = str(lower(obj.val));
        end
        function output_num = count(obj1, obj2)
            res = strfind(obj1.val, getChar(obj2));
            output_num = length(res);
        end
        function torf = startswith(obj1, obj2)
            torf = strncmp(obj1.val, getChar(obj2), len(obj2));
        end
        function torf = endswith(obj1, obj2)
            torf = strncmp(fliplr(obj1.val), fliplr(getChar(obj2)), len(obj2));
        end
        function output_str = toString(obj)
            output_str = obj.val;
        end
    end
end
