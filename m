Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF2EEB64DC
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jun 2023 08:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjFZIQQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jun 2023 04:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjFZIQP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jun 2023 04:16:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF96E5B
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 01:16:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98df6bc0048so221048166b.1
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 01:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687767372; x=1690359372;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Sg+rowk7YQU6D26avMM2mnTp+7zQM/aUn4xJJRcqRM=;
        b=dKr01c4FoPF8wLyp9qSzRl0nQcO6m6Fzqrvg5gka0E1P6yYCeJcrdJAp586ToDLyhc
         KaoAQWkB37G7NReFfsd0sTvjNXsWJmhfnn1nJKG0Sejc3Vunbx+Q5GyhQtzEy7LarALq
         XYkmCB399ETp566QbnveCJocLqaHNQp2wt1HL61sC13mFMKNKHZ2V890SOvmizL8VKDJ
         G/IKVt/DsF7Jj3PkiQzVO4Jk8N6CHGu6tPyYqIvTLjKhzxQ3+oZ3FSTf23DATTyCOyIb
         aCnk96PrtkjWMU0TLuN+4o2jradG15rB/53RpXYtSkgWGJVD1TZKU+N5fyCLE9Vze6MX
         UCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767372; x=1690359372;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Sg+rowk7YQU6D26avMM2mnTp+7zQM/aUn4xJJRcqRM=;
        b=YKFU6iElv+xzXoIh6YYJUT5sLQARD9mUho656gHR3Nw1I+HNF3EXYtDEONoIRoVjKL
         nXA61YVFPKNiGqy01kgdpBWfMBxPzie19zfCJu2hfxEJAw8VBMQtQpt3eE6LEW6ZO0wj
         RT6tFCiAGSt3Po4xreS0tdL3HOuTt8U6ecDWsprohb3c7KUjmBGAjeFZfuha5rjpDF55
         XkPDhGrxH2iIHeq7ugUzYeBpUnHGeZIYAMJSawnHzK9YRKugYn0Oo8uch+SdAlqM2eBR
         etDd08rgAhdQ2IsCVNHPS/yfX2ruyQTckqDLW/3pYIYaW4hwCARHk3f4NJdY80vQFxGV
         UqzQ==
X-Gm-Message-State: AC+VfDyAMGHNrAwGELH7rKX2lEYZ+Na/E+nWKqu3QOgF677ddsYIQSdP
        iUxGlnJITWzMooe3uGJGZOn7og==
X-Google-Smtp-Source: ACHHUZ62fcn+7hGabVvX7AxeAb93qPTLNUwwA6J2CTmKTpGrsdx0ACTblLudngYrWsV9MryleNJjWg==
X-Received: by 2002:a17:907:3187:b0:96f:c0b0:f137 with SMTP id xe7-20020a170907318700b0096fc0b0f137mr23857596ejb.16.1687767371958;
        Mon, 26 Jun 2023 01:16:11 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b0094f07545d40sm2935617ejb.220.2023.06.26.01.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:16:11 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v4 0/3] Fix some issues in QCOM UFS bindings
Date:   Mon, 26 Jun 2023 10:15:56 +0200
Message-Id: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxJmWQC/33PyQrCMBAG4FeRnB1Jp0uMJ99DPKRZ2kBNJGkDU
 vruDh5Fe5oF/m+YlWWbvM3sclhZssVnHwMNzfHA9KjCYMEbmhlyxAq5BDND74PxYYDFZUAjXNc
 IKZxDRqFeZQt9UkGPFAvLNNFy9HmO6fU5Uioqt79eqYDD2bQcHbcVNVenfHqOMdiTjg92J67gP
 oFEGC0UbzopWyF/EfU+URPRSGnoq1rxWn8T27a9ASKRJKQ7AQAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Eric Biggers <ebiggers@google.com>,
        Iskren Chernev <me@iskren.info>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series has been pending for quite some time, please somebody pick
this up. Also has plenty of reviews by now (3-4 for each patch which
should be plenty).

Validation will fail without patch 1/5 from [0] so this depends on that
patch at least for the check.

[0] https://lore.kernel.org/linux-arm-msm/20230623113009.2512206-2-abel.vesa@linaro.org/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v4:
- Pick up tags
- Rebase on linux-next (again)
- Link to v3: https://lore.kernel.org/r/20221209-dt-binding-ufs-v3-0-499dff23a03c@fairphone.com

Changes in v3:
- Drop applied patch
- Pick up sm6115 patch from v5 https://lore.kernel.org/all/20221030094258.486428-2-iskren.chernev@gmail.com/
- Rebase on linux-next
- Link to v2: https://lore.kernel.org/r/20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com

Changes in v2:
- Add new patch adding reg-names to sm6115 & rebase series on top of sm6115
  addition
- Fix binding example after sm8450 move, split this patch from original patch
  since it became too big
- Move reg-names definition to top-level
- Link to v1: https://lore.kernel.org/r/20221209-dt-binding-ufs-v1-0-8d502f0e18d5@fairphone.com

---
Iskren Chernev (1):
      dt-bindings: ufs: qcom: Add sm6115 binding

Luca Weiss (2):
      dt-bindings: ufs: qcom: Add reg-names property for ICE
      dt-bindings: ufs: qcom: Fix sm8450 bindings

 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 61 ++++++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)
---
base-commit: 3178cc4b7c9de986d63383cb59ee6570347002db
change-id: 20221209-dt-binding-ufs-2d7f64797ff2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

