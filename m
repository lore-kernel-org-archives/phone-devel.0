Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098B0C25B4E
	for <phone-devel@archiver.kernel.org>; Tue, 24 Jan 2023 18:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbjAXSdJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 24 Jan 2023 13:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbjAXSdJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 24 Jan 2023 13:33:09 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CD015C90
        for <phone-devel@vger.kernel.org>; Tue, 24 Jan 2023 10:33:07 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d3so15576583plr.10
        for <phone-devel@vger.kernel.org>; Tue, 24 Jan 2023 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UsWJpCZ2MiktbEP0bUIDKCE2SHIVUBqnn1o3x0TI6io=;
        b=YdDsRg3YLjc2/9zOKTNbV5dW2fAzUhZvv6N+sLI9WR5porWWWVLGOEESxfGtJsv1YD
         HaPdnonpHJoF0mAOOMa37SYLyxHngir9M3NRQUyUTrS6/p62LBXn4Sz9s5kwj2Wn/riK
         R4bv7Eov+1LdOHJD2Dk91oVBGILUFR+00vVuGfo4Z2VQHFRCkexBf1zUVHuJSOqeQ5Ls
         wVs7S8RB7VyqkuJ5qNOxP1F0jjKmYLqRe2vW1gEWU8YX9mhl3oWHcWTE1Z0CkaAfuP4b
         HaRrPVY/puZJZIm08vTO3rGM4ksLeJOaprTeNfhuBgU+NbEs6tdye9YVNAvhE4Ctdtwb
         Sl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsWJpCZ2MiktbEP0bUIDKCE2SHIVUBqnn1o3x0TI6io=;
        b=t1dGEOLwdj5ynV3EvOJt6CWkOPKVXkaH8xQonLLmZw6u58c6EL9hAby7zcyL1+bUb4
         i0plr8UR9TeoCFlxGPMee+DRnpdJeh+thaR5Xf4lDjq11F+7saKptG+XNinbI5S2EKAr
         tX4Bq6YeVGZjarlQili06g2InoZ35zJsov0sD0SwSOwg8zl/SwiKG6XJYNuEm4KViMWB
         0WsJj8t9ogzhR2V1TQUGe1tJRjdCFxeqGYX2x+YodvQQCWFNIcf0nQGU2tIb2XyBz6LQ
         xzPppVNyLbO8kjRULojP3Tb+erm4wBW/vWipF2HK0EpApTLZw6eUn0Etpj6q9Marynsx
         +CJA==
X-Gm-Message-State: AFqh2krTLLnvOEykv7h4cxFC+8Rf0cx1CCF9b4/6Kag8nDCEktEVND1R
        OpmDlC37nXYSmNpO7WaNC2norw==
X-Google-Smtp-Source: AMrXdXuriSuX4HGqunHblAH+Z5NPF9OltDIuJkqmRr3gtJB9j7vPP67/BJL9BAlupctMwtOKvTuCJQ==
X-Received: by 2002:a17:903:2306:b0:193:3540:c54d with SMTP id d6-20020a170903230600b001933540c54dmr39612857plh.26.1674585186710;
        Tue, 24 Jan 2023 10:33:06 -0800 (PST)
Received: from localhost.localdomain ([122.171.17.192])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902ec8700b001943d58268csm1997229plg.55.2023.01.24.10.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:33:06 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        phone-devel <phone-devel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: Add reserved memory region
Date:   Wed, 25 Jan 2023 00:02:57 +0530
Message-Id: <20230124183257.1525376-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Put cont splash memory region under the reserved-memory as
confirmed by the downstream code for Tianma variant as well.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
This change should probably go in sdm845-xiaomi-beryllium-common but
I don't have EBBG variant's downstream code nor the device to test.

 .../boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index 8e176111e599..47cbf725b0e3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -7,6 +7,14 @@
 / {
 	model = "Xiaomi Pocophone F1 (Tianma)";
 	compatible = "xiaomi,beryllium", "qcom,sdm845";
+
+	reserved-memory {
+		/* Cont splash region set up by the bootloader */
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+	};
 };
 
 &display_panel {
-- 
2.25.1

