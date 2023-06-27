Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FC5EB64DD
	for <phone-devel@archiver.kernel.org>; Tue, 27 Jun 2023 08:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjF0I2N (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Jun 2023 04:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbjF0I2M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Jun 2023 04:28:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5F610FC
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 01:28:07 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98df3dea907so397280566b.3
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687854485; x=1690446485;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+jGyPJUsAec/GfPFSuCJmeN3rQ+TNohutGT8qxCXVg=;
        b=HcSTZvOSEcAXaOKp9YVH/yNUU70rbrHD3A1to1lFUA4f+Uu2nM3pX37euQn+Nuffho
         C2w4BR7nwK4mDM6K88E1aotiyjCafUDwVXcbXsLWbD503MGUrc/vkRIQDak7dbIJrHXr
         7juRSdQmc4CGKMwLqFgOrsVPFOVx8E3I2oSyM1CyG8EhieVUtFhy0GDXSBt+kbxk/PbW
         nflIsT7F+qEmTvZuWaTuj5K01gTG3vn7zc2WoifYNw1BT4rKCLSc1+zWV+NGdeK3dnfY
         rhb8YmwJVOUARjwdr7MO/NBQEiYHMZF7HR1g2vpCAkwwjnuaTAQemFvh1xgak+HvLTLw
         k96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854485; x=1690446485;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+jGyPJUsAec/GfPFSuCJmeN3rQ+TNohutGT8qxCXVg=;
        b=LhfnikcEO/9cTI+cBN76UXEFlCnor5jDPULeKtCC/o25ZVNyF36eLkd1LokGbpdIKe
         +peY9UxjWGoLcHE7U4568mBz2rDQqSqAM8Sdk4c5++2VdLII8qx2iPtV9eIITVkfsNfu
         IAA3vFxEsglaBgDCGO4o5a95fpbS+IVWA4cI5b0h9vi7OwqqEpNKa5d0Y963oE2LAB9I
         j/K4R+t2wnoL3UxDpf9LDHVspBbUd1Y+atP5JMCX84coZaby4y82GXO6U+QPsVzUda9F
         Xu83yro/6UT002txo99UdSMWeLOfagCgTXhuHDoibblXMa9dBMv3OAqh84dA+h4PAtQB
         T/eA==
X-Gm-Message-State: AC+VfDzfjRnmGUYGvoyfzEWdT8nZTIWFLV7ubSD4puU9vA4Ps1yJGxOu
        ksTbL3w0IklDQYU5IoRKC25OAA==
X-Google-Smtp-Source: ACHHUZ6UlBBar2ZuwqiwxNCzLnOWv+SRfpL0ik13OsxLNgHvMSPebKx4b24hAXHarPIUB/bZCD6CUg==
X-Received: by 2002:a17:907:6d1f:b0:991:d336:9b32 with SMTP id sa31-20020a1709076d1f00b00991d3369b32mr3944411ejc.35.1687854485574;
        Tue, 27 Jun 2023 01:28:05 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b009894b476310sm4253038ejb.163.2023.06.27.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:28:05 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v5 0/5] Fix some issues in QCOM UFS bindings
Date:   Tue, 27 Jun 2023 10:28:00 +0200
Message-Id: <20221209-dt-binding-ufs-v5-0-c9a58c0a53f5@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCdmmQC/33PSw7CIBAG4KsY1mJgoEVceQ/jgjLQkig1UJsY0
 7s7cWlqV/NI/m8yb1ZDSaGy0+7NSphTTWOmodnvmB9c7gNPSDMDASBBWI4T71LGlHv+jJUDmth
 qY02MwCjUuRp4V1z2A8Xy83aj5ZDqNJbX98gsqVz+erPkgh+xERBFkNSco0vlMYw5HPx4Z1fiZ
 tgmgAj0xgndWtsYu0aobUIRoa1F+ko5ofwaobcJTYTUPmArokLZ/RLLsnwAKuwKR34BAAA=
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

This series aims to solve the dtbs_check errors from the qcom ufs
bindings. It has changed in scope a bit since v1, so it may be a bit all
over the place.

Please note, that I have not tested the sm8450.dtsi patch since I don't
have any hardware there. Testing would be appreciated.

Dt validation will fail without patch 1/5 from [0] so this depends on
that patch at least for the check.

[0] https://lore.kernel.org/linux-arm-msm/20230623113009.2512206-2-abel.vesa@linaro.org/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v5:
- Convert sm8450.dtsi to use qcom,ice property, so stop modifying schema
  for sm8450 and only add qcom,ice property.
- Move reg-names names to top-level with only minItems/maxItems in the
  'if'
- Link to v4: https://lore.kernel.org/r/20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com

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

Luca Weiss (4):
      dt-bindings: ufs: qcom: Add reg-names property for ICE
      dt-bindings: ufs: qcom: Add ICE to sm8450 example
      dt-bindings: crypto: ice: Document sm8450 inline crypto engine
      arm64: dts: qcom: sm8450: Use standalone ICE node for UFS

 .../bindings/crypto/qcom,inline-crypto-engine.yaml |  1 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 44 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 22 ++++++-----
 3 files changed, 58 insertions(+), 9 deletions(-)
---
base-commit: 13fb735ae68e5ac065b9867e2fd1d775c337ea15
change-id: 20221209-dt-binding-ufs-2d7f64797ff2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

