Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF92AC46CA1
	for <phone-devel@archiver.kernel.org>; Fri, 13 Oct 2023 13:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjJMN4s (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Oct 2023 09:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjJMN4q (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Oct 2023 09:56:46 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5611BE
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 06:56:42 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9bda758748eso75039566b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697205401; x=1697810201; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFlDh2veCoYGtweA/suIrNJN5h1cgFkvvCUfEXmQbkY=;
        b=g9h3R8o7mLledtHrOdZekoiuEsrRPCH8TKNZ2CeG1kJZglolMXQNS+bNaERVslNkSk
         5+oWsBa9PeldBYZPkrsPRH+wXwUYj6RXygb+oi8PLZGpF1XXAdPSGZg7qr0jSCnw/fTi
         mlERjGSdXvhuqhCmShzbEfJcjd2Pkyjc5M9GOfcww/PD2q9h48X/gUDP0kBnRNYSFCJY
         qGTw4N9BddiJO5DIXkGay1HRM+R4B8B9leXdi+MWFjiRjSy18GYBMGWA5ptS1Yn//S24
         ygua53JTwx+Ou1rGRXW6ojirLB/e5D1w+98YbYbjHHwjFvk1814c65yMHzIebLVSF9L9
         A9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697205401; x=1697810201;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFlDh2veCoYGtweA/suIrNJN5h1cgFkvvCUfEXmQbkY=;
        b=TSZ3+U+sxXvD95pv0IEh1dHz9zY+5LOPzQsB7B6ek9vkV/LpLmydm/X7HI3pTiRAZK
         5X6diaX5za3EE9vG9ogu+F5kxmsg2g5ciwqsQDkacKxf14oAbxMctU/KvzQlEdpsbbiv
         NU3/mDL9iC6hMMVhdOoWNd+Wa+88t4pGarwalb6gGWwuyiceh+BVXMOJpXqHLAh00GzV
         YrEhwaegycwnoYo8iL3EkAQ0YvrlzsRx/Dh08jiXZzBMPL/1PjbdmIEEiv6b3ygC16BU
         BbWEFfP9Eo3pbaOId4D9Da1RwkQn7t4Gat3Squ+a0ylYaEzoANIgMcHYa9h3UFKzcB3b
         952Q==
X-Gm-Message-State: AOJu0YxinSmlbhNUABLGlqICc7BpRh7zNhxeTHvL2yjdAVo7cv1hNpuF
        vvj4gP2Jkt623mQznl7FMRpVVo4tw6bZEveuRQq9dw==
X-Google-Smtp-Source: AGHT+IGCfaLV0dvw2Wye2KJWcfr3tAYEYcKYP8aDY0KLyDMq9dvsech9YulGhUztvUdwKOco42zbvw==
X-Received: by 2002:a17:907:a08a:b0:9bd:cab6:a34d with SMTP id hu10-20020a170907a08a00b009bdcab6a34dmr1171556ejc.31.1697205401106;
        Fri, 13 Oct 2023 06:56:41 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j16-20020a170906051000b0099bcf1c07c6sm12462745eja.138.2023.10.13.06.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 06:56:40 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 13 Oct 2023 15:56:40 +0200
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Print error when retimer
 setup fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231013-glink-altmode-ret-v1-1-77941537a35b@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAJdMKWUC/x3MwQpAQBRG4VfRXbvlmiheRRaDHzcMzUhK3t1k+
 S3OeSjAKwLVyUMelwbdXYSkCfWzdRNYh2jKs9xIJoanVd3Cdj23fQB7nGwqEZS9wHYFxe7wGPX
 +n037vh+1bt8fYwAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

It can be useful to know with which return value the retimer_set call
failed, so include this info in the dev_err print.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 9569d999391d..136713e1155e 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -168,7 +168,7 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 
 	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
 	if (ret)
-		dev_err(altmode->dev, "failed to setup retimer to DP\n");
+		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
 }
 
 static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,

---
base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
change-id: 20231013-glink-altmode-ret-3911e6c1eab5

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

