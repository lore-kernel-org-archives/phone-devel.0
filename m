Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A78AE743FA
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbjI2Iii (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjI2Iig (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:38:36 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EB61AE
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:38:34 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1846971366b.2
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695976712; x=1696581512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOWusuB+PJKjWg0I1/CANfiCcxqSyq9YW+0X1DGwXrU=;
        b=u6lLL8ECo0kIt9x8I4vz7H4uB1KlrBw2gHITC2PUnkyZau8rWGm93FdXsyCPksI7d1
         2r4KSTj8qkKnr8AKdxDP+jEaz6OHjO4Mpaov+aKwA9XfrlAevfLQz796BrAPUc740pKQ
         oDIa6U2x9s/GIHqcxYRUaD7WEgZrty0ytB3LIATJYGcZaHAiKUM1VJRIAhXUEe5OM51J
         qUVDGhCZBDWDmHclGZhTPcLknRw5EOjSGJO6BftM0yoi5NZGlaRB3aihZJ4vV2Vmfyia
         8dSGqPoWCVXZZ1jEVhM7exmoRojreMlS+pfaHCMIYBSzsh0nn5SU2LEqr4Tiw84QF4CI
         iYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695976712; x=1696581512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOWusuB+PJKjWg0I1/CANfiCcxqSyq9YW+0X1DGwXrU=;
        b=fGvM7y/kueCx+7UPjJ2xeNWhiRzMCg+zTgXQRP6hBW5vAz/qdRBXSwnNMmZemOl10Q
         ffD1XSI8Mj8kfmuMJwkUvsVTOzSXZNvenb4gMUSH94ZtQcp/4+ysxJyNJiT82/qXn3lT
         ifKvaajxWLlEz8rYJ5N3o5SLuj+WgQYnjh/h3IVcjkLDaxKFSphBpgWkG9J878FQn7Zo
         cW/X24IlcnlX9ScKooulZYhpQqRSiOR/psXW9TPGo/zMiKCT1Ez4YjNDCm4LRjt1oFop
         0u9JSlKU8CjboOOGdoBElU/AARoi2kf1pHNnUFOhOz7q+5dW5Qb3U3mQovEOPeILaz0g
         lREw==
X-Gm-Message-State: AOJu0YwL42E7kwxYd01MhEQNZSl8jfxaSUKJb9qttA06KkcorPb0FsAu
        r7IfLZ+LPP1JaUhNli/WLJXmzg==
X-Google-Smtp-Source: AGHT+IEWR92YMVGrUJ5RbQ/heh37u0ZBG1Ma86v3zGzQBjc8vLO3PtSXU3sJrxy1LVODE3qkkrxcVA==
X-Received: by 2002:a17:906:30ca:b0:9b2:794d:62d3 with SMTP id b10-20020a17090630ca00b009b2794d62d3mr2952442ejb.14.1695976712440;
        Fri, 29 Sep 2023 01:38:32 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id qk8-20020a170906d9c800b009ad89697c86sm12208965ejb.144.2023.09.29.01.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:38:31 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 10:38:19 +0200
Subject: [PATCH 1/3] media: venus: core: Set up secure memory ranges for
 SC7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-sc7280-venus-pas-v1-1-9c6738cf157a@fairphone.com>
References: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
In-Reply-To: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Not all SC7280 devices ship with ChromeOS firmware. Other devices need
PAS for image authentication. That requires the predefined virtual
address ranges to be passed via scm calls. Define them to enable Venus
on non-CrOS SC7280 devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 054b8e74ba4f..5c6baa0f4d45 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -881,6 +881,10 @@ static const struct venus_resources sc7280_res = {
 	.vmem_size = 0,
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
 };
 

-- 
2.42.0

