/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
    public Thread time;
    public volatile boolean running = true;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        time = new Thread(() -> {
                while(running){
                    Date current=new Date();
                    context.setAttribute("date",current.toString());
                    try {
                        Thread.sleep(1000); // update every second
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
        });
        
        context.setAttribute("header","ICS2608 / 2CSC / BUENAFE, Anton - ILANO, Dwayne Anthony - PANGAN, Marc Stephen");
        context.setAttribute("footer","MP3");
}

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
