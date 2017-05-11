<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 6
   Review Assignment

   Harpe Gaming Products Style Sheet
   Author: Rob Walczak
   Date:   03/20/2017

   Filename:         games.xsl
   Supporting Files: 
-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:df="http://example.com/dateformats">
     
   <xsl:include href="hgfunctions1.xsl" />
     
   <xsl:param name="questionID" select="'@qid'" />
   <xsl:variable name="currentGame" select="/FAQs/FAQ[@qid=$questionID]" />
   <xsl:variable name="externalReviews" select="document('game_reviews1.xml')/reviews/review[@qid=$questionID]" />
   <xsl:variable name="externalReviewers" select="document('reviewers1.xml')/reviewers" />
   
   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

   <xsl:template match="/">
      <html>
         <head>
            <title><xsl:value-of select="$currentGame/title" /></title>
            <link href="hgstyles1.css" rel="stylesheet" type="text/css" />
         </head>

         <body>
            <div id="wrap">
               <header>
                  <h1>Flight On Time</h1>
               </header>
              <div class="infoWrap">
               <section id="gameSummary">
                  <xsl:apply-templates select="$currentGame" />
               </section>
              </div>
               <footer>.</footer>
             </div>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="FAQ">
      
      <xsl:apply-templates select="$externalReviews"/>

      <h1><xsl:value-of select="question" /></h1>
      

      <table id="summaryTable">
         

      </table>
      <div id="summaryDescription">
        <xsl:copy-of select="summary/*" />
      </div>      
   </xsl:template>
   
</xsl:stylesheet>