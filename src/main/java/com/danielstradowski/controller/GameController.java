package com.danielstradowski.controller;

import com.danielstradowski.dto.Color;
import com.danielstradowski.dto.Message;
import com.danielstradowski.dto.Move;
import com.danielstradowski.dto.OutputMessage;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.*;

@Controller
@RequestMapping("/game")
public class GameController {

    private static final HashMap<String, String> board;

    static {
        board = new HashMap<>();
        restart(board);
    }

    private static List<OutputMessage> msgList = new ArrayList<>();
    private static String selection;
    private static Map<String, String> game = new HashMap<>();
    private Logger logger = LoggerFactory.getLogger(getClass());

    private static HashMap restart(HashMap<String, String> board){
        board.put("A1", "♖");
        board.put("B1", "♘");
        board.put("C1", "♗");
        board.put("D1", "♕");
        board.put("E1", "♔");
        board.put("F1", "♗");
        board.put("G1", "♘");
        board.put("H1", "♖");
        board.put("A2", "♙");
        board.put("B2", "♙");
        board.put("C2", "♙");
        board.put("D2", "♙");
        board.put("E2", "♙");
        board.put("F2", "♙");
        board.put("G2", "♙");
        board.put("H2", "♙");
        board.put("A3", "");
        board.put("B3", "");
        board.put("C3", "");
        board.put("D3", "");
        board.put("E3", "");
        board.put("F3", "");
        board.put("G3", "");
        board.put("H3", "");
        board.put("A4", "");
        board.put("B4", "");
        board.put("C4", "");
        board.put("D4", "");
        board.put("E4", "");
        board.put("F4", "");
        board.put("G4", "");
        board.put("H4", "");
        board.put("A5", "");
        board.put("B5", "");
        board.put("C5", "");
        board.put("D5", "");
        board.put("E5", "");
        board.put("F5", "");
        board.put("G5", "");
        board.put("H5", "");
        board.put("A6", "");
        board.put("B6", "");
        board.put("C6", "");
        board.put("D6", "");
        board.put("E6", "");
        board.put("F6", "");
        board.put("G6", "");
        board.put("H6", "");
        board.put("A7", "♟");
        board.put("B7", "♟");
        board.put("C7", "♟");
        board.put("D7", "♟");
        board.put("E7", "♟");
        board.put("F7", "♟");
        board.put("G7", "♟");
        board.put("H7", "♟");
        board.put("A8", "♜");
        board.put("B8", "♞");
        board.put("C8", "♝");
        board.put("D8", "♛");
        board.put("E8", "♚");
        board.put("F8", "♝");
        board.put("G8", "♞");
        board.put("H8", "♜");
        return board;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String viewApplication(Model model) {
        String sessionId = RequestContextHolder.currentRequestAttributes().getSessionId();
        if (!game.isEmpty()) {
            String key = (String) game.keySet().toArray()[0];
            String value = game.get(key);
            if (sessionId.equals(key)) {
                model.addAttribute("color", "white");
            } else if (sessionId.equals(value)){
                model.addAttribute("color", "black");
            } else if (key==null){
                model.addAttribute("color", "white");
                game.remove(null);
                game.put(sessionId, value);
            } else if (value==null) {
                model.addAttribute("color", "black");
                game.put(key, sessionId);
            }
        }
        List<OutputMessage> copy = new ArrayList<>(msgList);
        Collections.reverse(copy);
        model.addAttribute("msgList", copy);
        model.addAttribute("selection", selection);
        JSONObject mapAsJson = new JSONObject(board);
        model.addAttribute("board", mapAsJson.toString());
        model.addAttribute("sessionId", sessionId);
        return "index";
    }

    @MessageMapping("/chat")
    @SendTo("/topic/message")
    public OutputMessage sendMessage(Message message) {
        OutputMessage outputMessage = new OutputMessage(message, new Date());
        if (msgList != null) {
            msgList.add(outputMessage);
        } else {
            msgList = Collections.singletonList(outputMessage);
        }
        logger.info("Message sent");
        return outputMessage;
    }

    @MessageMapping("/move")
    @SendTo("/topic/move")
    public Move sendMove(Move move) {
        logger.info("Move sent");
        board.put(move.getStart(), "");
        board.put(move.getEnd(), move.getChessPiece());
        return move;
    }

    @MessageMapping("/selection")
    @SendTo("/topic/selection")
    public Message sendSelection(Message selection) {
        logger.info("Selection sent");
        GameController.selection = selection.getMessage();
        return selection;
    }

    @MessageMapping("/color")
    @SendTo("/topic/color")
    public Color chooseColor(Color color) {
        logger.info("Color chosen");
        int gameSize = game.size();
        if (color.getColor().equals("white")) {
            if (gameSize == 0) {
                game.put(color.getSessionId(), null);
            }
        } else if (color.getColor().equals("black")) {
            if (gameSize == 0) {
                game.put(null, color.getSessionId());
            }
        }
        return gameSize==0?color:null;
    }

    @MessageMapping("/restart")
    @SendTo("/topic/restart")
    public String restart() {
        logger.info("Game restarted");
        restart(board);
        return new JSONObject(board).toString();
    }
}
