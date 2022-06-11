Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CA1C43334
	for <phone-devel@archiver.kernel.org>; Sat, 11 Jun 2022 20:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiFKUxp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 11 Jun 2022 16:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiFKUxp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 11 Jun 2022 16:53:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A69A3BA5A
        for <phone-devel@vger.kernel.org>; Sat, 11 Jun 2022 13:53:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a29so3436268lfk.2
        for <phone-devel@vger.kernel.org>; Sat, 11 Jun 2022 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BN5CTITZcLsoT2z+wUUPsflcY2fQTPw/6+CF48/PUf0=;
        b=eoy2qs8aBCDm7L9K8HCLYzHRfhSZ5HGZ0i6fSLd09wVGceCX1e64St4VFP3cPuwOBb
         Pv3I5PrFJlSBo2otxtNQAuQwdeFXLjS5akOb+DBbZDsm9+Z9/EYlDtlhsoABhNGBmlbP
         7MA7AawttT7/f+OCBB1LaN3o69JJTVjEdZ/k5+jfsU76Jmq5yciEOvopBRj0tzpnspmG
         AC0HSQN2XgCWORKg13aHY7tEHCc6ohv/cfCchtatrUGZ+TMvz9iIZxV+syNxZ31vSn3k
         so+aKsXwIMuxPtEK0F9v2QrYXaBOrzGggfBKsVnb+cQ92ROUjuuLMq7IYwBc0zewYfun
         PKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BN5CTITZcLsoT2z+wUUPsflcY2fQTPw/6+CF48/PUf0=;
        b=Rj8sBkbQKrKbY0oCoL8e5jsHzhX5fGTM8HYeV+stSR8OeXQVd1vV+MvIL7uAC+qxlF
         5AnNXsvZ+0lWzZT2+hxv2YJtNb6sWugiE8ZqX/PCYBbcdIjlauJ7vtN6HloXuMAu+lI2
         vm8LUymUeW6pBgnsBSf1Vko2tBMI6r999kH8GUtmMn+zF4G2zhDaBmZlpQUJPy+P8Y97
         E0oSAcs0RWTuEscr206yRKEzmPhdcyyVPFeMkd2ADABYSto1bKtW93bKBEsvpbHue9wG
         NmMW2seov+cmLmqqT7MAH9B0IUq0jPeqkYWJZGJ1SGG3A8UqUxrhxRMyK4Oo9IOpO/KK
         FYkQ==
X-Gm-Message-State: AOAM531wTcVhcdFuOK7+Tpok5NAJOlVlAMpDY3QLQT4QXyYw9g1V9tA2
        oPOy+5oJA5sWc6xQn3SkhV7Dug==
X-Google-Smtp-Source: ABdhPJzdb7dQ9m2KdNev100hBBQBMMwvVXdfTwXwP75rS/LJjYTAufCyBxwMbcFc56OciXJOL+PeIA==
X-Received: by 2002:a05:6512:11e4:b0:479:5d64:f3a0 with SMTP id p4-20020a05651211e400b004795d64f3a0mr16171258lfs.354.1654980821593;
        Sat, 11 Jun 2022 13:53:41 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z10-20020a0565120c0a00b00477cc59e376sm375740lfu.161.2022.06.11.13.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 13:53:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Fix Gavini accelerometer mounting matrix
Date:   Sat, 11 Jun 2022 22:51:38 +0200
Message-Id: <20220611205138.491513-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This was fixed wrong so fix it. Now verified by using
iio-sensor-proxy monitor-sensor test program.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
index 53062d50e455..806da3fc33cd 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
@@ -527,8 +527,8 @@ i2c-gate {
 					accelerometer@18 {
 						compatible = "bosch,bma222e";
 						reg = <0x18>;
-						mount-matrix = "0", "1", "0",
-							       "-1", "0", "0",
+						mount-matrix = "0", "-1", "0",
+							       "1", "0", "0",
 							       "0", "0", "1";
 						vddio-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
 						vdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
-- 
2.36.1

