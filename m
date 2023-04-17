Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64A6C77B70
	for <phone-devel@archiver.kernel.org>; Mon, 17 Apr 2023 07:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjDQH5s (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Apr 2023 03:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbjDQH5Z (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Apr 2023 03:57:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED1E49D3
        for <phone-devel@vger.kernel.org>; Mon, 17 Apr 2023 00:57:06 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec816d64afso5633221e87.1
        for <phone-devel@vger.kernel.org>; Mon, 17 Apr 2023 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681718225; x=1684310225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMUEh/ZbY+Q5YzbGhGubujsLejZ3OA/iNA1BCjs6Wyg=;
        b=xyzvb5rxb7VWJkys5iaMa61hMq/pNYjPDO8veK1AYbllIbTCFNDceVaRsQfPIH1qDo
         T9yvGGjZQsrWNSOr1WQ2VijIf653fEw6xZgjFCp7tPYHyJVJk7p2EEIO6WhFY7zvSu3D
         C8Wk0A8GUbYvF5zzAO5BoZEI0GrB1NznB81Hyz3yxR7MFV61XeFqSUoxgDcf2VBVGlYq
         oWHFrTHy9M9LzprRiRkbNUXKQbwbMZuq705BOR037epMsU+Ws8eByi1xkApBUL9etF23
         X4hJV1sSSGrZOM4/q4NC3yiyU3KFFr/hpSe3VE0+GeL3uMScNaw9DgueK15GaxVztwi+
         U8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718225; x=1684310225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMUEh/ZbY+Q5YzbGhGubujsLejZ3OA/iNA1BCjs6Wyg=;
        b=NO4aGQCBwtwGJBlxglU8tekCglK03zlXo6BP0j5mKWiJJL1wqTOEn9sqnBQ6Siupux
         Z8xn69rmKmRORuoExzPuQVYTVLcBQIiRSQVmANyCa3OYMiw/c4qzJkhkjqyFmdf01+I/
         X5fuz+kaoykdMzxf05N3+ClDYWXPaEJwhmJAi6ZioX4+JjLQp/AB9ig7x40a34JjQCX5
         i1JqoEsltevO18ZtSrtq+sRCaJrR8+bervrJkhl3tLTN2jUmntgWv3OL1LzVtcstXxME
         EMYY2oNUhfOAV46iWoRsHrqBiJy5lxixtrrew7z4Bs8tYGtaxvAjlXQcxIc61rH8Przq
         G5UQ==
X-Gm-Message-State: AAQBX9cDw2X0nWful5SsQqj5WUDuhDgVdubhhn0C2iBP7OrQZCmS27tk
        18AI5WoQNagMXYKHCLPdWTX0S8+SsM/AiolL4WU=
X-Google-Smtp-Source: AKy350bJN5s7Jax1bde3gC1uFvIooYoiXM8Jl9McTSd6ajOEsEbc8d2PyUgACeCL12qXNQ4Omh5UBA==
X-Received: by 2002:a19:5517:0:b0:4ec:8cc2:b6ee with SMTP id n23-20020a195517000000b004ec8cc2b6eemr1464624lfe.28.1681718224978;
        Mon, 17 Apr 2023 00:57:04 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id h24-20020a197018000000b004edc16dbdfasm599724lfc.119.2023.04.17.00.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 00:57:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Disable charging on HREF boards
Date:   Mon, 17 Apr 2023 09:56:59 +0200
Message-Id: <20230417075659.3162603-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The HREF boards are usually used without battery and not
using active charging. Disable it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-href-ab8500.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/ste-href-ab8500.dtsi b/arch/arm/boot/dts/ste-href-ab8500.dtsi
index 9fa024900d53..e1de9d389a01 100644
--- a/arch/arm/boot/dts/ste-href-ab8500.dtsi
+++ b/arch/arm/boot/dts/ste-href-ab8500.dtsi
@@ -418,6 +418,24 @@ default_cfg {
 						};
 					};
 				};
+				/*
+				 * Charging is not working on the HREF unless an actual battery is
+				 * mounted, most HREFs have a DC cable in to the "battery power"
+				 * which means this will only be cofusing. So do not enable charging
+				 * of the HREFs.
+				 */
+				ab8500_fg {
+					status = "disabled";
+				};
+				ab8500_btemp {
+					status = "disabled";
+				};
+				ab8500_charger {
+					status = "disabled";
+				};
+				ab8500_chargalg {
+					status = "disabled";
+				};
 			};
 		};
 	};
-- 
2.39.2

