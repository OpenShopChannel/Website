/*
 * Copyright (c) 2021-2025 Open Shop Channel
 *
 * This program is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this
 * program. If not, see <https://www.gnu.org/licenses/>.
 */

package org.oscwii.website.config;

import freemarker.core.HTMLOutputFormat;
import freemarker.template.TemplateException;
import no.api.freemarker.java8.Java8ObjectWrapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import java.io.IOException;

import static freemarker.template.Configuration.FORCE_AUTO_ESCAPING_POLICY;
import static freemarker.template.Configuration.VERSION_2_3_32;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer
{
    @Bean
    public FreeMarkerConfigurer freemarkerConfig() throws TemplateException, IOException
    {
        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setTemplateLoaderPath("classpath:templates/");

        Java8ObjectWrapper objectWrapper = new Java8ObjectWrapper(VERSION_2_3_32);
        objectWrapper.setExposeFields(true);

        freeMarkerConfigurer.afterPropertiesSet();
        freeMarkerConfigurer.getConfiguration().setObjectWrapper(objectWrapper);
        freeMarkerConfigurer.getConfiguration().setOutputFormat(HTMLOutputFormat.INSTANCE);
        freeMarkerConfigurer.getConfiguration().setAutoEscapingPolicy(FORCE_AUTO_ESCAPING_POLICY);
        freeMarkerConfigurer.getConfiguration().setSharedVariable("statics", objectWrapper.getStaticModels());
        return freeMarkerConfigurer;
    }

    @Bean
    public FreeMarkerViewResolver freeMarkerViewResolver()
    {
        FreeMarkerViewResolver viewResolver = new FreeMarkerViewResolver();
        viewResolver.setCache(true);
        viewResolver.setSuffix(".ftl");
        viewResolver.setContentType("text/html; charset=UTF-8");
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry)
    {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }
}
