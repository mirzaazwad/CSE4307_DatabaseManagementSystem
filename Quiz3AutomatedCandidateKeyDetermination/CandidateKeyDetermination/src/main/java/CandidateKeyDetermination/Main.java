package CandidateKeyDetermination;

import java.util.List;
import java.util.Set;

public class Main {
    public static void main(String[] args)
    {
        CandidateKey ck=new CandidateKey("input.txt");
        ck.outputCandidateKeys("output.txt");
    }
}
