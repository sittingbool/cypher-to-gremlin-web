package com.cowabo.web.controller;

import org.opencypher.gremlin.translation.CypherAst;
import org.opencypher.gremlin.translation.groovy.GroovyPredicate;
import org.opencypher.gremlin.translation.translator.Translator;
import org.opencypher.gremlin.translation.translator.TranslatorFlavor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class WelcomeController {

    private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

    @GetMapping("/")
    public String index(Model model) {
        logger.debug("Welcome to cowabo.com...");
        return "index";
    }

    @RequestMapping(value = "/cypher-to-gremlin", method = RequestMethod.POST,
            produces = "application/json; charset=utf-8")
    @ResponseBody
    public String translate(@RequestParam("query") String cypher) {
        CypherAst ast = CypherAst.parse(cypher);
        Translator<String, GroovyPredicate> translator = Translator.builder()
                .gremlinGroovy()
                .build(TranslatorFlavor.cosmosDb());
        String gremlin = ast.buildTranslation(translator);

        return "{\"result\": \"" + gremlin + "\"}";
    }
}
