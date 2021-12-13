Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D97C4332F
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhLMI1Q (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhLMI1N (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:13 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF08C061751
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:13 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o20so49770868eds.10
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cDtUj/hlSiO5g1FDUhurbeKUU4tNZcuIesr1T0TKlmc=;
        b=JKOAHe8dnpkJ+TQT5DUqrc58eXknAEVGELeBHJ/rxL00PXNiwSzVa9h9GvHAYUTF49
         bRyiRu6vfvaAQgbyzP4izYuA8ktOFudGnHGQi2DVZ6f/Ovnh2A5LOhwo7WgQSOIlPZjX
         B7e1CoewgPSIauAhJHo9BtEIgHuxVQeKY+MmgsL86+AlLfk67MVSNQyPTe1K51YmNpa2
         emQY1aEd0W6tsi1wZXQuHoqPZigOTFurJoeJ3/R2+m6gWooxdLnsld2kaYRp7Cdl5Rdw
         yPCYxnvVo9Wi7OIhs8LqE3yI+EFkSwa9REgXkqKDgM4ztv9qQ/Qm0tWchpYL8qTHKwpF
         h6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cDtUj/hlSiO5g1FDUhurbeKUU4tNZcuIesr1T0TKlmc=;
        b=7kDZa2/lCAC+bA6w7j/20KSffEIqdY9kvXk/zVGq9zwlxBIwCQBBCA9E4h8ru9cHLg
         YnA9a8A2O3/glVfD4leahOr0ByEokFkG98VxbUdKREAzI5T3kzk34XFnY4Q6Bk8ywiIl
         x6KON126V5j76xw0H7EvHHs9MucGU+nIzK3U+vlTElGw/uY+wBsd9iT2n+mNZ18X/4Ze
         fafDCcZ7QJBUCOwSskr6fdNjPjDNTcyiDvZr7G8ulNkLoaUzxN06qg0j6YT/Reu+K8rW
         AOKS/nY6SeGcGFDNGlne2gJ5Mx0mOkvlw5o2zNzoCa4GFt6J0yq8E6z20uUYQ41PfQYh
         8jcA==
X-Gm-Message-State: AOAM53127TaoHCJ3IqrQ5yNqSkody+mojMfIfa2UXTyAKGY/kuhqzJpi
        BzzjMLGZWTLCVC8EFLoHalYYMw==
X-Google-Smtp-Source: ABdhPJw5onQbiuMOz/yLVf54mM8clTCXpShvsuZoDLU01mffQrGmnABnLtacCGAMfHCbMBCbL4J5EQ==
X-Received: by 2002:a05:6402:1450:: with SMTP id d16mr62634702edx.144.1639384032013;
        Mon, 13 Dec 2021 00:27:12 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:11 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] dt-bindings: arm: msm: Add LLCC for SM6350
Date:   Mon, 13 Dec 2021 09:26:02 +0100
Message-Id: <20211213082614.22651-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add LLCC compatible for SM6350 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Please note, that this patch is a resend that wasn't picked up when
sent to the lists in August 2021.

 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 62fcbd883392..e12fc7999356 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
       - qcom,sdm845-llcc
+      - qcom,sm6350-llcc
       - qcom,sm8150-llcc
       - qcom,sm8250-llcc
 
-- 
2.34.1

