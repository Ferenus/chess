package be.g00glen00b.controller;

import java.util.*;

import org.slf4j.*;
import org.springframework.messaging.handler.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import be.g00glen00b.dto.*;

@Controller
@RequestMapping("/")
public class ChatController {

    private static String[][] chessboard = new String[8][8];
    private static List<OutputMessage> msgList = new ArrayList<>();
    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(method = RequestMethod.GET)
    public String viewApplication(Model model) {
        List<OutputMessage> copy = new ArrayList<>(msgList);
        Collections.reverse(copy);
        model.addAttribute("msgList", copy);
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

    @MessageMapping("/game")
    @SendTo("/topic/move")
    public Move sendMove(Move move) {
        logger.info("Move sent");
        return move;
    }
}
