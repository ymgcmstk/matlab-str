classdef strTest < matlab.unittest.TestCase

    methods (Test)
        %% Test Function
        function testEq(testCase)
            str1 = str('a');
            str2 = str('a');
            str3 = str('b');
            testCase.verifyTrue(str1 == str2);
            testCase.verifyFalse(str1 == str3);
            testCase.verifyTrue(str1 == str2.val);
            testCase.verifyFalse(str1 == str3.val);
            testCase.verifyTrue(str1.val == str2);
            testCase.verifyFalse(str1.val == str3);
        end
        function testNe(testCase)
            str1 = str('a');
            str2 = str('a');
            str3 = str('b');
            testCase.verifyFalse(str1 ~= str2);
            testCase.verifyTrue(str1 ~= str3);
            testCase.verifyFalse(str1 ~= str2.val);
            testCase.verifyTrue(str1 ~= str3.val);
            testCase.verifyFalse(str1.val ~= str2);
            testCase.verifyTrue(str1.val ~= str3);
        end
        function testPlus(testCase)
            str1 = str('a');
            str2 = str('b');
            str_in1 = str1 + str2;
            str_in2 = str1 + str2.val;
            str_in3 = str1.val + str2;
            str_out = str('ab');
            testCase.verifyEqual(str_in1, str_out);
            testCase.verifyEqual(str_in2, str_out);
            testCase.verifyEqual(str_in3, str_out);
        end
        function testMtimes(testCase)
            str1 = str('a');
            str_in = str1 * 3;
            str_out = str('aaa');
            testCase.verifyEqual(str_in, str_out);
        end
        % function testSubsindex(testCase)
        %     str1 = str('abc');
        %     str_in = str1(2);
        %     str_out = str('b');
        %     testCase.verifyEqual(str_in, str_out);
        % end
        function testIn(testCase)
            str1 = str('abc');
            str2 = str('a');
            str3 = str('ab');
            str4 = str('d');
            str5 = str('ad');
            testCase.verifyTrue(str2.in(str1));
            testCase.verifyTrue(str3.in(str1));
            testCase.verifyTrue(str2.in(str1.val));
            testCase.verifyTrue(str3.in(str1.val));
            testCase.verifyFalse(str4.in(str1));
            testCase.verifyFalse(str5.in(str1));
            testCase.verifyFalse(str4.in(str1.val));
            testCase.verifyFalse(str5.in(str1.val));
        end
        function testFind(testCase)
            str1 = str('abcabc');
            str2 = str('bc');
            str3 = str('bcd');
            testCase.verifyEqual(str1.find(str2), 2);
            testCase.verifyEqual(str1.find(str2.val), 2);
            testCase.verifyEqual(str1.find(str3), -1);
            testCase.verifyEqual(str1.find(str3.val), -1);
        end
        function testRfind(testCase)
            str1 = str('abcabc');
            str2 = str('bc');
            str3 = str('bcd');
            testCase.verifyEqual(str1.rfind(str2), 5);
            testCase.verifyEqual(str1.rfind(str2.val), 5);
            testCase.verifyEqual(str1.rfind(str3), -1);
            testCase.verifyEqual(str1.rfind(str3.val), -1);
        end
        function testJoin(testCase)
            str1 = str(',');
            str2 = str(',,');
            str_cell1 = {str('a'), str('b'), str('c')};
            str_cell2 = {str('a').val, str('b').val, str('c').val};
            str_in11 = str1.join(str_cell1);
            str_in12 = str1.join(str_cell2);
            str_in21 = str2.join(str_cell1);
            str_in22 = str2.join(str_cell2);
            str_out1 = str('a,b,c');
            str_out2 = str('a,,b,,c');
            testCase.verifyEqual(str_in11, str_out1);
            testCase.verifyEqual(str_in12, str_out1);
            testCase.verifyEqual(str_in21, str_out2);
            testCase.verifyEqual(str_in22, str_out2);
        end
        function testReplace(testCase)
            str1 = str('012abcdefabc');
            str2 = str('a');
            str3 = str('ab');
            str4 = str('XXX');
            str_out1 = str('012XXXbcdefXXXbc');
            str_out2 = str('012XXXcdefXXXc');
            testCase.verifyEqual(str1.replace(str2, str4), str_out1);
            testCase.verifyEqual(str1.replace(str2.val, str4), str_out1);
            testCase.verifyEqual(str1.replace(str2.val, str4.val), str_out1);
            testCase.verifyEqual(str1.replace(str3, str4), str_out2);
            testCase.verifyEqual(str1.replace(str3.val, str4), str_out2);
            testCase.verifyEqual(str1.replace(str3.val, str4.val), str_out2);
        end
        function testLstrip(testCase)
            str1 = str('  abc  ');
            str2 = str(' ab');
            str_out1 = str('abc  ');
            str_out2 = str('c  ');
            testCase.verifyEqual(str1.lstrip(), str_out1);
            testCase.verifyEqual(str1.lstrip(str2), str_out2);
            testCase.verifyEqual(str1.lstrip(str2.val), str_out2);
        end
        function testRstrip(testCase)
            str1 = str('  abc  ');
            str2 = str('bc ');
            str_out1 = str('  abc');
            str_out2 = str('  a');
            testCase.verifyEqual(str1.rstrip(), str_out1);
            testCase.verifyEqual(str1.rstrip(str2), str_out2);
            testCase.verifyEqual(str1.rstrip(str2.val), str_out2);
        end
        function testStrip(testCase)
            str1 = str('  abc  ');
            str2 = str('ac ');
            str_out1 = str('abc');
            str_out2 = str('b');
            testCase.verifyEqual(str1.strip(), str_out1);
            testCase.verifyEqual(str1.strip(str2), str_out2);
            testCase.verifyEqual(str1.strip(str2.val), str_out2);
        end
        function testSplit(testCase)
            str1 = str('a b c');
            str2 = str('a,b,c');
            str3 = str('a,,b,,c');
            str_out = {str('a'), str('b'), str('c')};
            testCase.verifyTrue(areCellsEqual(str1.split(), str_out));
            testCase.verifyTrue(areCellsEqual(str2.split(','), str_out));
            testCase.verifyTrue(areCellsEqual(str3.split(',,'), str_out));
        end
        function testUpper(testCase)
            str_in = str('aBc');
            str_out = str('ABC');
            testCase.verifyEqual(str_in.upper(), str_out);
        end
        function testLower(testCase)
            str_in = str('aBc');
            str_out = str('abc');
            testCase.verifyEqual(str_in.lower(), str_out);
        end
        function testCount(testCase)
            str1 = str('aBcaBc');
            str2 = str('a');
            str3 = str('aB');
            testCase.verifyEqual(str1.count(str2), 2);
            testCase.verifyEqual(str1.count(str2.val), 2);
            testCase.verifyEqual(str1.count(str3), 2);
            testCase.verifyEqual(str1.count(str3.val), 2);
        end
        function testStartswith(testCase)
            str1 = str('aBcaBc');
            str2 = str('a');
            str3 = str('aB');
            str4 = str('ab');
            testCase.verifyTrue(str1.startswith(str2));
            testCase.verifyTrue(str1.startswith(str2.val));
            testCase.verifyTrue(str1.startswith(str3));
            testCase.verifyTrue(str1.startswith(str3.val));
            testCase.verifyFalse(str1.startswith(str4));
            testCase.verifyFalse(str1.startswith(str4.val));
        end
        function testEndswith(testCase)
            str1 = str('aBcaBc');
            str2 = str('c');
            str3 = str('Bc');
            str4 = str('bc');
            testCase.verifyTrue(str1.endswith(str2));
            testCase.verifyTrue(str1.endswith(str2.val));
            testCase.verifyTrue(str1.endswith(str3));
            testCase.verifyTrue(str1.endswith(str3.val));
            testCase.verifyFalse(str1.endswith(str4));
            testCase.verifyFalse(str1.endswith(str4.val));
        end
    end
end

function torf = areCellsEqual(cell1, cell2)
    if length(cell1) ~= length(cell2)
        torf = false;
        return
    end
    for i = 1:length(cell1)
        if cell1{i} ~= cell2{i}
            torf = false;
            return
        end
    end
    torf = true;
end