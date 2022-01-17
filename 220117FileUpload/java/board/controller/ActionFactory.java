package board.controller;

import board.controller.action.Action;
import board.controller.action.AddReplyAction;
import board.controller.action.BoardDeleteAction;
import board.controller.action.BoardNoneCntAction;
import board.controller.action.BoardPassChkAction;
import board.controller.action.BoardPassFormAction;
import board.controller.action.BoardUpdateAction;
import board.controller.action.BoardUpdateFAction;
import board.controller.action.BoardVAction;
import board.controller.action.BoardWFormAction;
import board.controller.action.BoardWriteAction;
import board.controller.action.DeleteRAction;
import board.controller.action.EditMAction;
import board.controller.action.EditMFormAction;
import board.controller.action.IdCheckAction;
import board.controller.action.IndexAction;
import board.controller.action.JoinAction;
import board.controller.action.JoinFormAction;
import board.controller.action.LoginAction;
import board.controller.action.LogoutAction;
import board.controller.action.MainAction;

public class ActionFactory {
	private ActionFactory() {}
	private static ActionFactory itc = new ActionFactory();
	public static ActionFactory getInstance() {return itc;}
	
	public Action getAction(String cmd) {
		Action ac = null;
		if(cmd.equals("index")) {ac = new IndexAction();
		}else if(cmd.equals("login")) {ac = new LoginAction();
		}else if(cmd.equals("main")) {ac = new MainAction();
		}else if(cmd.equals("joinForm")) {ac = new JoinFormAction();
		}else if(cmd.equals("idCheck")) {ac = new IdCheckAction();
		}else if(cmd.equals("join")) {ac = new JoinAction();
		}else if(cmd.equals("editMForm")) {ac = new EditMFormAction();
		}else if(cmd.equals("editM")) {ac = new EditMAction();
		}else if(cmd.equals("logout")) {ac = new LogoutAction();
		}else if(cmd.equals("boardV")) {ac = new BoardVAction();
		}else if(cmd.equals("boardWriteForm")) {ac = new BoardWFormAction();
		}else if(cmd.equals("boardWrite")) {ac = new BoardWriteAction();
		}else if(cmd.equals("boardPassForm")) {ac = new BoardPassFormAction();
		}else if(cmd.equals("boardPassChk")) {ac = new BoardPassChkAction();
		}else if(cmd.equals("boardUpdateF")) {ac = new BoardUpdateFAction();
		}else if(cmd.equals("boardDelete")) {ac = new BoardDeleteAction();
		}else if(cmd.equals("boardUpdate")) {ac = new BoardUpdateAction();
		}else if(cmd.equals("boardNoneCnt")) {ac = new BoardNoneCntAction();
		}else if(cmd.equals("addReply")) {ac = new AddReplyAction();
		}else if(cmd.equals("deleteR")) {ac = new DeleteRAction();
		}
		return ac;
	}
}
