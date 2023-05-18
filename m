Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BC0C7EE2A
	for <phone-devel@archiver.kernel.org>; Thu, 18 May 2023 06:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjERGON (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 18 May 2023 02:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjERGOM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 18 May 2023 02:14:12 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189D410C1;
        Wed, 17 May 2023 23:14:10 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QMKRy51Jqz9sTD;
        Thu, 18 May 2023 08:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1684390446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/GLWNRVwIzHLKzbNZAD0zTmp1+3VutrdGm7bHWn/E6g=;
        b=W/wwB22mrS6VEJTbP+54NyJIZcIF+Zv3v4iwKaPn2xFlJMXJ1TSgVe/joHI712b9UwQSaz
        XPS27Fe+JcI1Bv3uOfLvNIlj9kYS1Z9V7w/GsVI4zyL6XwSQ6Gdm4V8JAnlxJl8z9/xM4O
        dzbqoAgS+aBFCxZDRjbFzAQ2Yqb49cxr0z8SgbTHkwjVp7/44qdxu8lEPqPt14OHSggDz0
        pzKhSyqWeTtS7MYTUZ9PvCnqCApURxPrY12hXkU5CYb+2UgYh7S9cUuxj9Zp8jbBA+C2uu
        v93hG4TLIUdq4XH/DjVmYmRxbKF2aoCLwhyZbs4AYASZSBWgIG8lD5T97i3ZcQ==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        amartinz@shiftphones.com, Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v2 1/3] dt-bindings: leds: qcom,spmi-flash-led: add PMI8998
Date:   Thu, 18 May 2023 08:13:26 +0200
Message-Id: <20230518061328.146847-2-me@dylanvanassche.be>
In-Reply-To: <20230518061328.146847-1-me@dylanvanassche.be>
References: <20230518061328.146847-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4QMKRy51Jqz9sTD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document compatible for PMI8998 Torch and Flash LED controller.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index ffacf703d9f9..4b42b6950c88 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led
+          - qcom,pmi8998-flash-led
       - const: qcom,spmi-flash-led
 
   reg:
-- 
2.40.1

