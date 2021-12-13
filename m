Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260BAC433EF
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbhLMI12 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbhLMI1V (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:21 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F126FC061201
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:20 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g14so48571244edb.8
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=08eze2rwaywXTp2V8JYK1oiE8AMhHag/TyEXoCIH5q0=;
        b=kcvJIzHE/o7DaQiSYPzQcfis9udNFJUaquN22C4LbSVsynLTOQmcheO/5kXgxH3B7x
         PHHzUvuaDLFz16+uxW24Ckgqf2eqdlPOyYXWfRpj4lwsPYPCW9D7yHqteTPRqyMCFohU
         s1m0pF7vdm86vX1OvcV1asOpQd71GyRGKr2G+f4niAFsA8RvdhJg4f0MBuZWlsj8GPAQ
         j0UXikHsLZ6Sf2UM1SCXIuwbmb9UKbofOVU4XpkNYmHIPL35BcdKrkga59uPuZufo8JQ
         MBF3mq4tn15ENHPV8qs4V070o3jjqCCFll8KrBM3+rHxNASAUgdH8EqQiBKwOF5gn5Uo
         e6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=08eze2rwaywXTp2V8JYK1oiE8AMhHag/TyEXoCIH5q0=;
        b=TQxj8GVksoCWEedlSUfqzYikqaj/Qvak8MdaTETRbH7oC5yYrPiBcMMZkQ9aedNQpO
         goeAfvpfZ5SM8Ub5FIdtTuALl/d9OcWOMA92cF/9jmZBy+pKxmJy/4sjg8SkpxnVR+8N
         mqIXmcmFPezEbzb7jE2+XZ1vhlMiscwLRqdHp/cA9H7UIT1Ze5ozFD0m1nXkWyYYy8pU
         7ALIRFWhk6tfZyZUexyHl5MylWxiMT4vsCbDcFBDT41DgdRGixZkHUmiZY7mCLqV76Bq
         1X8JcdqfsLBRtlphOTbh7FRXuc2my1Fx2OplO2wXOR230cPSkskwmQV9eyea45wKG2tP
         pzag==
X-Gm-Message-State: AOAM5326h71IEcHm0IuFO6ysBw4CsNC5MJsn0WwB3EshvRoN9R6oH85C
        XKXfhhIjyYhDHlkZg8A28piCKw==
X-Google-Smtp-Source: ABdhPJzwJ9FrHxEIsZ8+/PDH6AbBUqNo+x5J+H+Oo6+4kQ5HkpGeQXt4H8IUlmFNYAIxfog//cgNiw==
X-Received: by 2002:a17:906:7954:: with SMTP id l20mr41211739ejo.143.1639384039575;
        Mon, 13 Dec 2021 00:27:19 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:19 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] dt-bindings: arm: msm: Don't mark LLCC interrupt as required
Date:   Mon, 13 Dec 2021 09:26:09 +0100
Message-Id: <20211213082614.22651-9-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Newer SoCs like SM6350 or SM8250 don't provide an interrupt for LLCC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index e12fc7999356..03882aac8d2d 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -45,7 +45,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - interrupts
 
 additionalProperties: false
 
-- 
2.34.1

