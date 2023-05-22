Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D17C77B73
	for <phone-devel@archiver.kernel.org>; Mon, 22 May 2023 15:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbjEVPJJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 22 May 2023 11:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbjEVPJI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 22 May 2023 11:09:08 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC9AB9;
        Mon, 22 May 2023 08:09:06 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 451501FF9E;
        Mon, 22 May 2023 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1684768145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iWg6tUK8rF4RDk5jgaVyVG5icXVQbNcchuqSgYn7re4=;
        b=NNVT0ZdCD+P1Tq3cFm233FKsb5TiJw5I4lNSEL9perpxXW6RX3xFJTzd8qUIGPV4RlHhpA
        uiowfBiCqbsEiqErS+rXqVMILW74wcAIkMBYZGjI2GbpYizRVKEAvIw74VJo8DhdvCzezG
        Oc4cfLl3zXWdfsL5tYAnGLhBE06mnmM=
Received: from alley.suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
        by relay2.suse.de (Postfix) with ESMTP id 3BC422C141;
        Mon, 22 May 2023 15:09:04 +0000 (UTC)
From:   Petr Mladek <pmladek@suse.com>
To:     John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Jonathan Corbet <corbet@lwn.net>, phone-devel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
        linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Subject: [PATCH] vsprintf/doc: Document format flags including field width and precision
Date:   Mon, 22 May 2023 17:08:53 +0200
Message-Id: <20230522150853.30417-1-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <CSSLOC8WDIPE.1WO9BXZQA7A12@otso>
References: <CSSLOC8WDIPE.1WO9BXZQA7A12@otso>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The kernel implementation of vsprintf() tries to be as compatible with
the user space variant as possible. Though it does not implement all
features. On the other hand, it adds some special pointer printing
modifiers.

Most differences are described in Documentation/core-api/printk-formats.rst
Add the missing documentation of the supported flag characters
'#', '0', '-', ' ', '+' together with field width and precision modifiers.

Suggested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
What about something like this, please?

 Documentation/core-api/printk-formats.rst | 69 +++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index dfe7e75a71de..79655b319658 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -8,6 +8,75 @@ How to get printk format specifiers right
 :Author: Andrew Murray <amurray@mpc-data.co.uk>
 
 
+Flag characters
+===============
+
+The character '%' might be followed by the following flags that modify
+the output:
+
+	- '#' - prepend '0', '0x', or 'OX for 'o', 'x', 'X' number conversions
+	- '0' - zero pad number conversions on the field boundary
+	- '-' - left adjust on the field boundary, blank pad on the right
+	- ' ' - prepend space on positive numbers
+	- '+' - prepend + for positive numbers when using signed formats
+
+Examples::
+
+	|%x|	|1a|
+	|%#x|	|0x1a|
+	|%d|	|26|
+	|% d|	| 26|
+	|%+d|	|+26|
+
+
+Field width
+===========
+
+A field width may be defined when '%' is optionally followed by the above flag
+characters and:
+
+	- 'number' - the decimal number defines the field width
+	- '*' the field width is defined by an extra parameter
+
+Values are never truncated when the filed width is not big enough.
+Spaces are used by default when a padding is needed.
+
+Examples::
+
+	|%6d|	|    26|
+	|%-6d|	|26    |
+	|%06d|	|000026|
+
+	printk("Dynamic table: |%*d|%*s|\n", id_width, id, max_name_len, name);
+
+The filed width value might have special meaning for some pointer formats.
+For example, it limits the size of the bitmap handled by %*pb format.
+
+
+
+Field precision:
+================
+
+A field width may be defined when '%' is optionally followed by the above flag
+characters:
+
+	- '.number' - the decimal number defines the field precision
+	- '.*' the field precision is defined by an extra parameter
+
+The precision defines:
+
+	- number of digits after the decimal point in float number conversions
+	- minimal number of digits in integer conversions
+	- maximum number of characters in string conversions
+
+Examples::
+
+	|%.3f|	|12.300|
+	|%.6d|	|    26|
+	|%.6s|	|Hi, th|
+
+	printk("Dynamic precision: %.*f\n", precision, value);
+
 Integer types
 =============
 
-- 
2.35.3

