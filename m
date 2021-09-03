Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D49C433FE
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 17:09:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ADD6610E5
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 17:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbhICRKO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Sep 2021 13:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350052AbhICRKN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Sep 2021 13:10:13 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6240C061757;
        Fri,  3 Sep 2021 10:09:13 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 18so6389pfh.9;
        Fri, 03 Sep 2021 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/HakU/xQi0Td8dZebodYGzBlv2Woc251Vz2DFo4gw0=;
        b=R0szjMUgdcaZC1u5B5l1wheNMw75oYaa8aQM3RQvVxuWKCeji/V89NkHW4Hf9sE81K
         Y4xCOx0cxYaR1Q6zsZ0tz473ii8act3nCj88Fl5uIELWYNQc+rWU4yRJYGvMGaElEAve
         7d2aPrcxshfCydxwTKgtIRGGyWGWshD7gsUUKRc3Cu2i/0e+l+JLMAz5YQSUUSnk6K12
         FU9XDegTQ5OXy5KopfK/AiuDuuPB7v1STfwMEeF3+wWrwRsuiFJpt+imT3H71UV94xPu
         nXL+17GEYjQB1VU4EYyLg+ITFGXQxMavHxhiv7EYKSbptLKFeCJEu2mj4h5sBcJmPKbG
         gusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/HakU/xQi0Td8dZebodYGzBlv2Woc251Vz2DFo4gw0=;
        b=S0FWlAkURNzh99NaYTOeIiKRjUNJxNRaRs3nKGCXRRSgrf3fiL1/M8avwTpAjg3km/
         ND9scR5hwOYlAQznxn9hWHwqgFHxF4HJdH/pAMqW6lYwUlEUDrtWCt1fkKTNP1gBAtGa
         ydg25NlyFNFhBWoqbHIIeatNuD2g+8FuWKvsgaXX9hWnDcrFjjXZmYo9YoKcX3LD00+a
         s1OGKvkQTHgwvpTGJU16USi9h1rmNm0TUCBZc6xfB2zgY9gaXWcgWysVqty+SUK1yxMH
         yVaplI6lbHa/XmEae5HxQClP+QICA0CGZx44Gj8lqwfjGGpSUQDq1q5ss5Su84N/FyXe
         Y4DA==
X-Gm-Message-State: AOAM5316xBmHL2aqWl6X8nG5JeZZkIehBBJhpWebnRtZrj1Jo0Qig/NG
        4gCWPsF3ew00LbuV/M7kXp/P18sq3PXv7mQZ
X-Google-Smtp-Source: ABdhPJwIPT/yqSso0VyHNAgKuWvtrktY8i6wrUfZxtuUdW1xOtXlZ5N3g4qva1pp4kWi7FVHiB0LNQ==
X-Received: by 2002:a62:65c7:0:b029:3c3:4eff:1b26 with SMTP id z190-20020a6265c70000b02903c34eff1b26mr4166742pfb.48.1630688953260;
        Fri, 03 Sep 2021 10:09:13 -0700 (PDT)
Received: from skynet-linux.local ([122.171.5.147])
        by smtp.googlemail.com with ESMTPSA id 130sm5905361pfy.175.2021.09.03.10.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:09:12 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Date:   Fri,  3 Sep 2021 22:38:42 +0530
Message-Id: <20210903170844.35694-2-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903170844.35694-1-sireeshkodali1@gmail.com>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

SoCs based on the MSM8953 platform use the 14nm DSI PHY driver

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 72a00cce0147..d2cb19cf71d6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,8 @@ properties:
     oneOf:
       - const: qcom,dsi-phy-14nm
       - const: qcom,dsi-phy-14nm-660
+      - const: qcom,dsi-phy-14nm-8953
+
 
   reg:
     items:
-- 
2.33.0

