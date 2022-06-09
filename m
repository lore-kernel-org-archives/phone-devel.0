Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B0C433EF
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiFIIhW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbiFIIhW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:37:22 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD8B3F5768
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:37:20 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b7so12811566ljr.6
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/q3p3QUD+g7wxbiE1VAqcdBwPqr1tiKnvsqCuaov6dk=;
        b=WiH5zCIKxxTKnnMSwsih6nVLnnOQdVN0OoKi8Vq3GSkcmXU9xvbsM3IEtCND6E25u7
         /I3gpHBr7llneo44AgfwVvv10V2Hmt0EILgpLCGTYJkGxwchanF+KEAbBlm3gu904/zH
         fkdBZav4WacCrjQKKv96kck60mYX6iE817tdSVwb6niriQ37CtKFSXQOTFDZPPDYzauv
         FIGFEHzNS5mGBuHYprpPrjID3BHxxDT3t6yQcLSymfoXRBqZuJNpsH2hXZaHUQreYV55
         +1nW14k4Y707ZB+0UDfHbYaZqqfndAvwYJniLNU5CfXgCXlb6pvlSQ/SrITRc0OJ9Q/7
         M//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/q3p3QUD+g7wxbiE1VAqcdBwPqr1tiKnvsqCuaov6dk=;
        b=nz3hi3vt8IG4OivY6JUIp7FmQBxcloFaqKQrZyeFoTRR2emFSMwiIk1ZGGxNQtsGSg
         wa/2Vc47fyShGdF9IwZo+iv9FSFUXnM/T8ZBaVABPquGy0NGhyXCQBvsnUOnNbCf5Tol
         YEAsVf7WVdbWUfirDrgvwrrDGcqQps3Tzu4/0KV2ClaWnWDTKgc61/yk4SoRfx9s5Yla
         2o87zNHkXiXCc1ZCB2d9qqR8D5YbKK5vud5RuCmfi94+NWkPhYVqIoyxTCJ0my1dR12o
         x+K872iWnZ0/LReOjbrKUFaqI5zIBIU0c4MlL3IdWoVosj/EWBuyxmzer7FqvYwLBmtr
         fRkw==
X-Gm-Message-State: AOAM531LhSef1/Wlwo+G9ASPfK/htQcCbd1Psu3cTpBvT6boDQsO/2jb
        F24FEIomX5nu0/0osEDeQyV4PA==
X-Google-Smtp-Source: ABdhPJzGHcQie2bpH1jem/M8BRK7qlty0jbsIaMUngQrowNpMmaMAg6R+wH1+02MNArexT1O4RUiFA==
X-Received: by 2002:a2e:9d96:0:b0:257:b72d:9ed4 with SMTP id c22-20020a2e9d96000000b00257b72d9ed4mr1823731ljj.509.1654763839243;
        Thu, 09 Jun 2022 01:37:19 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v28-20020a2e505c000000b00253deeaeb3dsm3585285ljd.131.2022.06.09.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:37:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Fix Janice accelerometer mounting matrix
Date:   Thu,  9 Jun 2022 10:35:16 +0200
Message-Id: <20220609083516.329281-1-linus.walleij@linaro.org>
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
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
index d097d5701894..f80111b89b8b 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
@@ -650,8 +650,8 @@ i2c-gate {
 					accelerometer@8 {
 						compatible = "bosch,bma222";
 						reg = <0x08>;
-						mount-matrix = "0", "1", "0",
-							       "-1", "0", "0",
+						mount-matrix = "0", "-1", "0",
+							       "1", "0", "0",
 							       "0", "0", "1";
 						vddio-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
 						vdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
-- 
2.36.1

