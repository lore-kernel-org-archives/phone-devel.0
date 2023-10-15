Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD66CDB484
	for <phone-devel@archiver.kernel.org>; Sun, 15 Oct 2023 21:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjJOVMF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 15 Oct 2023 17:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbjJOVME (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:04 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3C4DC
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 14:12:02 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40651a726acso35820295e9.1
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404320; x=1698009120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP0+gS+a1flrzX1mvrP/DkuvCGlYGfyvWtEP75LeBBM=;
        b=WqZVAhmisB2gW/uwFwZ1ScSRSfYgJywJgIDHDBSmnzrwhsiKsD/jzuzaFidc3ho1gT
         EKfDd2zIervGiPqNnK2nUHFtmZOX8pTFdbO7PpTlfIK6J7rs2uqGITyWJGtlBFnWpJmk
         iJt56mOr1aQQIIqAoeW5LntR1t+M6NNjmzlQyfJwQIruWr129v3VcS6FPp1FWEVdQTN6
         Kt2e7G6NcZsSrSXmdtk9iCUBjudWUgWbe7lnYNsJ9WJguk8IBkBw+nO7AmazhsSiVsRX
         LEPr9i/dxoBekuMUeg1bPONTRsEWTZsMTt6iW/5nuiUyl3rq/G+o6sPo+5lH9GUTe/fz
         c1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404320; x=1698009120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP0+gS+a1flrzX1mvrP/DkuvCGlYGfyvWtEP75LeBBM=;
        b=wD2e1QFQ20K6Mvqqn9SXQUh2Q5qBo1jZrFZZVlSUeConrRUGqifi0Q7U7rxr3ZJeQE
         9JknoCmIkbuAHpMQUNnSxu4EQ1M7gH+I9xb653HDvwaziUuMfDlnAO8cOI7Jec1+WyJS
         5qWx/P7pao1939qO2UKYQqXT7Qt4PJ4Lil/Z6XgE/u4RswrqkoMAUgS5oQBPSUTq1XkF
         21lv9NkQ0s+e56aoMilZcJdVsTWryLjE4/ZOy5F2pIVsvxtj7sA6tjzOEeUuT2LIJPpZ
         RAPmD5T41ySjK8jeJGC8Ed18T5bLFqAXjkx+uTnBII+/YqpfNKFczoeNaP9AMmevyDZN
         6AUw==
X-Gm-Message-State: AOJu0Yy2mZfWRpEwbhaHsmJWQykhKQbW4p63iBK8z4vd6UfRorbImcNd
        zmoR+ZNiHgbtNIOy9fwg4B8MVg==
X-Google-Smtp-Source: AGHT+IF24tTLuoUnIGfRI13o7XyLfy+Tj2m+c1SfgAtpjLWn6WVV6NhpPgdqIsXnKT8QjDfPvWKORA==
X-Received: by 2002:adf:e50f:0:b0:32d:aed9:413d with SMTP id j15-20020adfe50f000000b0032daed9413dmr1403995wrm.16.1697404320547;
        Sun, 15 Oct 2023 14:12:00 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:12:00 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:50 +0100
Subject: [PATCH v2 2/7] Input: synaptics-rmi4 - handle duplicate/unknown
 PDT entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-2-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=/ncxkYBOHJ0GuwBcZcMHJFqIgTv8HA9Y09NBC9ADCPA=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0LmuCrFxbhGXD/m6virX/1k0QUmlb42HlWb7ogOB8
 8xCq890lLIwCHIwyIopsoifWGbZtPayvcb2BRdg5rAygQxh4OIUgIlcqmX4X26rP816mvkKX9Er
 dvlXuV6ZVTx7+3uzZHHNqu19Kxu7NRl+Mf3/u4xr7uF1OasTvjP3sbtzvPDLsvlQXWC9TJChdFf
 2PQA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Some third party rmi4-compatible ICs don't expose their PDT entries
very well. Add a few checks to skip duplicate entries as well as entries
for unsupported functions.

This is required to support some phones with third party displays.

Validated on a stock OnePlus 6T (original parts):
manufacturer: Synaptics, product: S3706B, fw id: 2852315

Co-developed-by: methanal <baclofen@tuta.io>
Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_driver.c | 47 +++++++++++++++++++++++++++++++++++------
 drivers/input/rmi4/rmi_driver.h |  6 ++++++
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 258d5fe3d395..cd3e4e77ab9b 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -493,12 +493,44 @@ static void rmi_driver_copy_pdt_to_fd(const struct pdt_entry *pdt,
 	fd->function_version = pdt->function_version;
 }
 
+static bool rmi_pdt_entry_is_valid(struct rmi_device *rmi_dev,
+				  struct pdt_scan_state *state, u8 fn)
+{
+	int i;
+
+	switch (fn) {
+	case 0x01:
+	case 0x03:
+	case 0x11:
+	case 0x12:
+	case 0x30:
+	case 0x34:
+	case 0x3a:
+	case 0x54:
+	case 0x55:
+		break;
+
+	default:
+		rmi_dbg(RMI_DEBUG_CORE, &rmi_dev->dev,
+			"PDT has unknown function number %#02x\n", fn);
+		return false;
+	}
+
+	for (i = 0; i < state->pdt_count; i++) {
+		if (state->pdts[i] == fn)
+			return false;
+	}
+
+	state->pdts[state->pdt_count++] = fn;
+	return true;
+}
+
 #define RMI_SCAN_CONTINUE	0
 #define RMI_SCAN_DONE		1
 
 static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 			     int page,
-			     int *empty_pages,
+			     struct pdt_scan_state *state,
 			     void *ctx,
 			     int (*callback)(struct rmi_device *rmi_dev,
 					     void *ctx,
@@ -521,6 +553,9 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 		if (RMI4_END_OF_PDT(pdt_entry.function_number))
 			break;
 
+		if (!rmi_pdt_entry_is_valid(rmi_dev, state, pdt_entry.function_number))
+			continue;
+
 		retval = callback(rmi_dev, ctx, &pdt_entry);
 		if (retval != RMI_SCAN_CONTINUE)
 			return retval;
@@ -531,11 +566,11 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 	 * or more is found, stop scanning.
 	 */
 	if (addr == pdt_start)
-		++*empty_pages;
+		++state->empty_pages;
 	else
-		*empty_pages = 0;
+		state->empty_pages = 0;
 
-	return (data->bootloader_mode || *empty_pages >= 2) ?
+	return (data->bootloader_mode || state->empty_pages >= 2) ?
 					RMI_SCAN_DONE : RMI_SCAN_CONTINUE;
 }
 
@@ -544,11 +579,11 @@ int rmi_scan_pdt(struct rmi_device *rmi_dev, void *ctx,
 		 void *ctx, const struct pdt_entry *entry))
 {
 	int page;
-	int empty_pages = 0;
+	struct pdt_scan_state state = {0, 0, {0}};
 	int retval = RMI_SCAN_DONE;
 
 	for (page = 0; page <= RMI4_MAX_PAGE; page++) {
-		retval = rmi_scan_pdt_page(rmi_dev, page, &empty_pages,
+		retval = rmi_scan_pdt_page(rmi_dev, page, &state,
 					   ctx, callback);
 		if (retval != RMI_SCAN_CONTINUE)
 			break;
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 1c6c6086c0e5..e1a5412f2f8f 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -46,6 +46,12 @@ struct pdt_entry {
 	u8 function_number;
 };
 
+struct pdt_scan_state {
+	u8 empty_pages;
+	u8 pdt_count;
+	u8 pdts[254];
+};
+
 #define RMI_REG_DESC_PRESENSE_BITS	(32 * BITS_PER_BYTE)
 #define RMI_REG_DESC_SUBPACKET_BITS	(37 * BITS_PER_BYTE)
 

-- 
2.42.0

