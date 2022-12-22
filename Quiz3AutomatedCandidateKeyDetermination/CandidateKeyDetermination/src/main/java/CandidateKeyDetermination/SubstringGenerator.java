package CandidateKeyDetermination;

import java.util.ArrayList;
import java.util.List;

public class SubstringGenerator {
    public static List<String>getAllSubStrings(String input)
    {
        List<String>answer=new ArrayList<String>();
        answer=SubstringGenerator.getAllSubStrings(input,0,0,answer);
        return answer;
    }

    private static List<String> getAllSubStrings(String input, int start, int end, List<String>answer)
    {
        if (end == input.length())
            return answer;
        else if (start > end)
            getAllSubStrings(input, 0, end + 1,answer);
        else {
            String result="";
            for (int i = start; i <= end; i++)
                result=result+String.valueOf(input.charAt(i));
            answer.add(result);
            getAllSubStrings(input, start + 1, end,answer);
        }
        return answer;
    }
}
