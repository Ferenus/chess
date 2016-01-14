package com.danielstradowski.controller;

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

import java.util.*;

@Controller
@RequestMapping("/")
public class GameController {

    private static final Map<String, String> board;
    static
    {
        board = new HashMap<String, String>();
        board.put("A1", "♖");board.put("B1", "♘");board.put("C1", "♗");board.put("D1", "♕");board.put("E1", "♔");board.put("F1", "♗");board.put("G1", "♘");board.put("H1", "♖");
        board.put("A2", "♙");board.put("B2", "♙");board.put("C2", "♙");board.put("D2", "♙");board.put("E2", "♙");board.put("F2", "♙");board.put("G2", "♙");board.put("H2", "♙");
        board.put("A3", "");board.put("B3", "");board.put("C3", "");board.put("D3", "");board.put("E3", "");board.put("F3", "");board.put("G3", "");board.put("H3", "");
        board.put("A4", "");board.put("B4", "");board.put("C4", "");board.put("D4", "");board.put("E4", "");board.put("F4", "");board.put("G4", "");board.put("H4", "");
        board.put("A5", "");board.put("B5", "");board.put("C5", "");board.put("D5", "");board.put("E5", "");board.put("F5", "");board.put("G5", "");board.put("H5", "");
        board.put("A6", "");board.put("B6", "");board.put("C6", "");board.put("D6", "");board.put("E6", "");board.put("F6", "");board.put("G6", "");board.put("H6", "");
        board.put("A7", "♟");board.put("B7", "♟");board.put("C7", "♟");board.put("D7", "♟");board.put("E7", "♟");board.put("F7", "♟");board.put("G7", "♟");board.put("H7", "♟");
        board.put("A8", "♜");board.put("B8", "♞");board.put("C8", "♝");board.put("D8", "♛");board.put("E8", "♚");board.put("F8", "♝");board.put("G8", "♞");board.put("H8", "♜");
    }
    private static List<OutputMessage> msgList = new ArrayList<>();
    private static String selection;
    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(method = RequestMethod.GET)
    public String viewApplication(Model model) {
        List<OutputMessage> copy = new ArrayList<>(msgList);
        Collections.reverse(copy);
        model.addAttribute("msgList", copy);
        model.addAttribute("selection", selection);
        JSONObject mapAsJson = new JSONObject(board);
        model.addAttribute("board", mapAsJson.toString());
        return "index";
    }

    @MessageMapping("/chat")
    @SendTo("/topic/message")
    public OutputMessage sendMessage(Message message) {
        OutputMessage outputMessage = new OutputMessage(message, new Date());
        if (msgList != null) {
            msgList.add(outputMessage);
        } else {
            msgList = Arrays.asList(outputMessage);
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
}
