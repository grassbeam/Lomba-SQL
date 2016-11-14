package backend;

import java.util.Timer;
import java.util.TimerTask;

import oraclehomeworkautograder.AnswerModel;
import oraclehomeworkautograder.MainGrader;

public class SubmissionWatcher extends Thread {
	
	
	public void run()
	{
		
		while (true)
		{
			String top;
			try {
				top = FileWatcher.submissionQueue.take();
				MainGrader grade = new MainGrader (top);
				AnswerModel answer = grade.grade();
				grade.updateScoreboard(answer);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

}
