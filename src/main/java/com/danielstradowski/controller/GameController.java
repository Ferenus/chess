package com.danielstradowski.controller;

import java.util.*;

import com.danielstradowski.dto.Message;
import com.danielstradowski.dto.Move;
import com.danielstradowski.dto.OutputMessage;
import org.slf4j.*;
import org.springframework.messaging.handler.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class GameController {

    private static String[][] chessboard = new String[8][8];
    private static List<OutputMessage> msgList = new ArrayList<>();
    private static String selection;
    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(method = RequestMethod.GET)
    public String viewApplication(Model model) {
        List<OutputMessage> copy = new ArrayList<>(msgList);
        Collections.reverse(copy);
        model.addAttribute("msgList", copy);
        model.addAttribute("selection", selection);
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
