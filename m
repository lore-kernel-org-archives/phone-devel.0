Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DEFC43334
	for <phone-devel@archiver.kernel.org>; Sat, 11 Jun 2022 20:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbiFKUo5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 11 Jun 2022 16:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbiFKUo4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 11 Jun 2022 16:44:56 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A251248D2
        for <phone-devel@vger.kernel.org>; Sat, 11 Jun 2022 13:44:55 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g2so2470872ljk.5
        for <phone-devel@vger.kernel.org>; Sat, 11 Jun 2022 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARRjqGuHw8KBGzaKw8hZYLuPPeLXCH7E1YWu5OIQ+ME=;
        b=CWiJVYJW7UMjYAAukjKKf20onfW9WLgPbkS30sptiwsAXH2tTjDrExd/yBrA5kU1eL
         vF+GjONw7+DwVuF8a8zPXlcYIUwXpDN9KXgrznXW7/ud+7M8ivcHwLtJtXMDOV29+7sM
         MYTQdUXtV7/nojlRtWkdNDVeiRRI1ovlNxDdzLq6k40cjvBicJGYE9A2JVt3qLR45SLC
         TRhKPE1t00pSweVIld09UA8Zi5o0m61X9wWgTbthWtDTvlsCZwweR22lDBCHKuyUWuJc
         B6YBRyGIFwRszdyzE7YdXbGuQv89Ebpzq8oTJvYccVBCg0co0aP/lDOyJTiLCPHjvFPd
         Yjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARRjqGuHw8KBGzaKw8hZYLuPPeLXCH7E1YWu5OIQ+ME=;
        b=Nvhszw/7XBZzj5o9F5pHEDbwfflnW48JTo/2lagBcaRePgGxyqGiGfwKqi0c8ITojQ
         SOjtNgBzZPUAL2YsVxfwaorDBFa4rmyvxdsAy8S45HA6Rz6S6OOHMJ6jYl2Hd2/7jViy
         p+t/Rme1qryUbauwwhOq3yLvdnAiLTevYefCkSg/xikVZmheOQKNiTqa/BnNbQKjE+2u
         Aqe8ZgFHpeQdx/CqYn0GkprYj4Otv+kqazMlT3yT33KsUASNW4W3vMynJfrVBZisAqlm
         eMIwO29fjbUaE925eVoIGFymJ1ZF72+w50blNAHqOBeV+9dIWU66rHHZSvPYtnjXhIb8
         XL2Q==
X-Gm-Message-State: AOAM531itJ04UbhlM3EO15h2dswnO91WKXngYFZmzK5Pz8v2IgnUNrp0
        MQ8FL+mj5TjOJoK9uBw2CLwgCQ==
X-Google-Smtp-Source: ABdhPJzFVXdbooZYjUp6lg+xrPxmqFLGnF5DrHbyNHaFbEQINNVSDUPiC2ItLkc6T8CzR/o6QsAwSw==
X-Received: by 2002:a2e:9b8d:0:b0:255:89aa:f236 with SMTP id z13-20020a2e9b8d000000b0025589aaf236mr20158065lji.80.1654980293834;
        Sat, 11 Jun 2022 13:44:53 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id f22-20020a2e3816000000b002557115af75sm436763lja.118.2022.06.11.13.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 13:44:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Fix Codina accelerometer mounting matrix
Date:   Sat, 11 Jun 2022 22:42:49 +0200
Message-Id: <20220611204249.472250-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This was fixed wrong so fix it again. Now verified by using
iio-sensor-proxy monitor-sensor test program.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
index d90533fea637..b2aaa19cd656 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
@@ -602,8 +602,8 @@ lisd3dh@19 {
 				reg = <0x19>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
 				vddio-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
-				mount-matrix = "0", "-1", "0",
-					       "1", "0", "0",
+				mount-matrix = "0", "1", "0",
+					       "-1", "0", "0",
 					       "0", "0", "1";
 			};
 		};
-- 
2.36.1

