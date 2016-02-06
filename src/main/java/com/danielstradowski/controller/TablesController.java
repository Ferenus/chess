package com.danielstradowski.controller;

import com.danielstradowski.dto.Game;
import com.danielstradowski.dto.Move;
import com.danielstradowski.dto.OutputMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/tables")
public class TablesController {

    private static List<Game> games = new ArrayList<>();
    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(method = RequestMethod.GET)
    public String viewApplication(Model model) {
        return "tables";
    }

    @MessageMapping("/newgame")
    @SendTo("/topic/newgame")
    public String sendMove(String id) {
        logger.info("Move sent");
        games.add(new Game());
        return id;
    }

}
